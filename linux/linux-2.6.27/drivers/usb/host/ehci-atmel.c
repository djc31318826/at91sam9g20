/*
 * Driver for EHCI UHP on Atmel chips
 *
 *  Copyright (C) 2007 Atmel Corporation,
 *                     Nicolas Ferre <nicolas.ferre@atmel.com>
 *
 *  Based on various ehci-*.c drivers
 * 
 * This file is subject to the terms and conditions of the GNU General Public
 * License.  See the file COPYING in the main directory of this archive for
 * more details.
 */

#include <linux/clk.h>
#include <linux/platform_device.h>

/* interface and function clocks */
static struct clk *iclk, *fclk;
static int clocked;

/*-------------------------------------------------------------------------*/

static void atmel_start_clock(void)
{
	clk_enable(iclk);
	clk_enable(fclk);
	clocked = 1;
}

static void atmel_stop_clock(void)
{
	clk_disable(fclk);
	clk_disable(iclk);
	clocked = 0;
}

static void atmel_start_ehci(struct platform_device *pdev)
{
	//struct usb_hcd *hcd = platform_get_drvdata(pdev);
	//struct ohci_regs __iomem *regs = hcd->regs;

	dev_dbg(&pdev->dev, "start\n");

	/*
	 * Start the USB clocks.
	 */
	atmel_start_clock();

	// TODO: Taken from ohci : needed ?
	/*
	 * The USB host controller must remain in reset.
	 */
	//writel(0, &regs->control);
}

static void atmel_stop_ehci(struct platform_device *pdev)
{
	//struct usb_hcd *hcd = platform_get_drvdata(pdev);
	//struct ohci_regs __iomem *regs = ehci->regs;

	dev_dbg(&pdev->dev, "stop\n");

	// TODO: Taken from ohci : needed ?
	/*
	 * Put the USB host controller into reset.
	 */
	//writel(0, &regs->control);

	/*
	 * Stop the USB clocks.
	 */
	atmel_stop_clock();
}

/*-------------------------------------------------------------------------*/

static int ehci_atmel_setup(struct usb_hcd *hcd)
{
	struct ehci_hcd *ehci = hcd_to_ehci(hcd);
	int retval = 0;

#warning "check if called recursively"
	pr_debug("DEBUG***************** ehci_atmel_setup ****************\n");

	/*
	 * registers start at offset 0x0
	 */
	ehci->caps = hcd->regs;
	ehci->regs = hcd->regs +
		HC_LENGTH(ehci_readl(ehci, &ehci->caps->hc_capbase));
	dbg_hcs_params(ehci, "reset");
	dbg_hcc_params(ehci, "reset");

	/*
	 * cache this readonly data; minimize chip reads
	 */
	ehci->hcs_params = ehci_readl(ehci, &ehci->caps->hcs_params);

	retval = ehci_halt(ehci);
	if (retval)
		return retval;

	/*
	 * data structure init
	 */
	retval = ehci_init(hcd);
	if (retval)
		return retval;

	ehci->sbrn = 0x20;

	ehci_reset(ehci);
	ehci_port_power(ehci, 0);

	return retval;
}

static const struct hc_driver ehci_atmel_hc_driver = {
	.description		= hcd_name,
	.product_desc		= "Atmel EHCI UHP HS",
	.hcd_priv_size		= sizeof(struct ehci_hcd),

	/*
	 * generic hardware linkage
	 */
	.irq			= ehci_irq,
	.flags			= HCD_MEMORY | HCD_USB2,

	/*
	 * basic lifecycle operations
	 */
	.reset			= ehci_atmel_setup,
	.start			= ehci_run,
	.stop			= ehci_stop,
	.shutdown		= ehci_shutdown,

	/*
	 * managing i/o requests and associated device resources
	 */
	.urb_enqueue		= ehci_urb_enqueue,
	.urb_dequeue		= ehci_urb_dequeue,
	.endpoint_disable	= ehci_endpoint_disable,

	/*
	 * scheduling support
	 */
	.get_frame_number	= ehci_get_frame,

	/*
	 * root hub support
	 */
	.hub_status_data	= ehci_hub_status_data,
	.hub_control		= ehci_hub_control,
	.bus_suspend		= ehci_bus_suspend,
	.bus_resume		= ehci_bus_resume,
	.relinquish_port	= ehci_relinquish_port,
	.port_handed_over	= ehci_port_handed_over,
};

static int __init ehci_atmel_drv_probe(struct platform_device *pdev)
{
	struct usb_hcd *hcd;
	const struct hc_driver *driver = &ehci_atmel_hc_driver;
	struct resource *res;
	int irq;
	int retval;

	if (usb_disabled())
		return -ENODEV;

	pr_debug("Initializing Atmel-SoC USB Host Controller\n");

	irq = platform_get_irq(pdev, 0);
	if (irq <= 0) {
		dev_err(&pdev->dev,
			"Found HC with no IRQ. Check %s setup!\n",
			pdev->dev.bus_id);
		retval = -ENODEV;
		goto fail_create_hcd;
	}

	hcd = usb_create_hcd(driver, &pdev->dev, pdev->dev.bus_id);
	if (!hcd) {
		retval = -ENOMEM;
		goto fail_create_hcd;
	}

	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
	if (!res) {
		dev_err(&pdev->dev,
			"Found HC with no register addr. Check %s setup!\n",
			pdev->dev.bus_id);
		retval = -ENODEV;
		goto fail_request_resource;
	}
	hcd->rsrc_start = res->start;
	hcd->rsrc_len = res->end - res->start + 1;

	if (!request_mem_region(hcd->rsrc_start, hcd->rsrc_len,
				driver->description)) {
		dev_dbg(&pdev->dev, "controller already in use\n");
		retval = -EBUSY;
		goto fail_request_resource;
	}

	hcd->regs = ioremap_nocache(hcd->rsrc_start, hcd->rsrc_len);
	if (hcd->regs == NULL) {
		dev_dbg(&pdev->dev, "error mapping memory\n");
		retval = -EFAULT;
		goto fail_ioremap;
	}

	iclk = clk_get(&pdev->dev, "ehci_clk");
	fclk = clk_get(&pdev->dev, "uhpck");
	if (IS_ERR(iclk) || IS_ERR(fclk)) {
		dev_err(&pdev->dev, "Error getting clocks\n");
		retval = -ENOENT;
		goto fail_get_clk;
	}

	atmel_start_ehci(pdev);

	retval = usb_add_hcd(hcd, irq, IRQF_SHARED);
	if (retval)
		goto fail_add_hcd;

	return retval;

fail_add_hcd:
	atmel_stop_ehci(pdev);
fail_get_clk:
	clk_put(fclk);
	clk_put(iclk);
	iounmap(hcd->regs);
fail_ioremap:
	release_mem_region(hcd->rsrc_start, hcd->rsrc_len);
fail_request_resource:
	usb_put_hcd(hcd);
fail_create_hcd:
	dev_err(&pdev->dev, "init %s fail, %d\n",
		pdev->dev.bus_id, retval);

	return retval;
}

static int __exit ehci_atmel_drv_remove(struct platform_device *pdev)
{
	struct usb_hcd *hcd = platform_get_drvdata(pdev);

	usb_remove_hcd(hcd);
	iounmap(hcd->regs);
	release_mem_region(hcd->rsrc_start, hcd->rsrc_len);
	usb_put_hcd(hcd);

	atmel_stop_ehci(pdev);
	clk_put(fclk);
	clk_put(iclk);
	fclk = iclk = NULL;

	return 0;
}

MODULE_ALIAS("platform:atmel-ehci");

static struct platform_driver ehci_atmel_driver = {
	.probe		= ehci_atmel_drv_probe,
	.remove		= __exit_p(ehci_atmel_drv_remove),
	.shutdown	= usb_hcd_platform_shutdown,
	.driver.name	= "atmel-ehci",
};
