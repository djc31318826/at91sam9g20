/*
 *  Copyright (C) 2005 SAN People
 *  Copyright (C) 2008 Atmel
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */

#include <linux/types.h>
#include <linux/init.h>
#include <linux/mm.h>
#include <linux/module.h>
#include <linux/platform_device.h>
#include <linux/spi/spi.h>
#include <linux/spi/at73c213.h>
#include <linux/clk.h>

#include <mach/hardware.h>
#include <asm/setup.h>
#include <asm/mach-types.h>
#include <asm/irq.h>

#include <asm/mach/arch.h>
#include <asm/mach/map.h>
#include <asm/mach/irq.h>

#include <mach/board.h>
#include <mach/gpio.h>
#include <linux/gpio_keys.h>
#include <linux/input.h>
#include <mach/at91sam9_smc.h>

#include "sam9_smc.h"
#include "generic.h"


static void __init ek_map_io(void)
{
	/* Initialize processor: 18.432 MHz crystal */
	at91sam9260_initialize(18432000);

	/* DGBU on ttyS0. (Rx & Tx only) */
	at91_register_uart(0, 0, 0);

	/* USART0 on ttyS1. (Rx, Tx, CTS, RTS, DTR, DSR, DCD, RI) */
	at91_register_uart(AT91SAM9260_ID_US0, 1, ATMEL_UART_CTS | ATMEL_UART_RTS
			   | ATMEL_UART_DTR | ATMEL_UART_DSR | ATMEL_UART_DCD
			   | ATMEL_UART_RI);

	/* USART1 on ttyS2. (Rx, Tx, RTS, CTS) */
	at91_register_uart(AT91SAM9260_ID_US1, 2, ATMEL_UART_CTS | ATMEL_UART_RTS);

	/* set serial console to ttyS0 (ie, DBGU) */
	at91_set_serial_console(0);
}

static void __init ek_init_irq(void)
{
	at91sam9260_init_interrupts(NULL);
}


/*
 * USB Host port
 */
static struct at91_usbh_data __initdata ek_usbh_data = {
	.ports		= 2,
};

/*
 * USB Device port
 */
static struct at91_udc_data __initdata ek_udc_data = {
	.vbus_pin	= AT91_PIN_PC5,
	.pullup_pin	= 0,		/* pull-up driven by UDC */
};


/*
 * Audio
 */
#if defined(CONFIG_SND_AT91_SOC_SAM9G20_WM8731) || defined(CONFIG_SND_AT91_SOC_SAM9G20_WM8731_MODULE)
static void __init wm8731_set_clk(void)
{
	struct clk *pck0;
	struct clk *pllb;

	pck0 = clk_get(NULL, "pck0");
	pllb = clk_get(NULL, "pllb");

	/* WM8731 MCK Clock */
	at91_set_B_periph(AT91_PIN_PC1, 0);	/* PCK0 */

	clk_set_parent(pck0, pllb);
	clk_set_rate(pck0, 12000000);
	clk_enable(pck0);
}
#else
static void __init wm8731_set_clk(void) {}
#endif


/*
 * SPI devices.
 */
static struct spi_board_info ek_spi_devices[] = {
#if !defined(CONFIG_MMC_AT91)
	{	/* DataFlash chip */
		.modalias	= "mtd_dataflash",
		.chip_select	= 1,
		.max_speed_hz	= 15 * 1000 * 1000,
		.bus_num	= 0,
	},
#if defined(CONFIG_MTD_AT91_DATAFLASH_CARD)
	{	/* DataFlash card */
		.modalias	= "mtd_dataflash",
		.chip_select	= 0,
		.max_speed_hz	= 15 * 1000 * 1000,
		.bus_num	= 0,
	},
#endif
#endif
};


/*
 * MACB Ethernet device
 */
static struct at91_eth_data __initdata ek_macb_data = {
	.phy_irq_pin	= AT91_PIN_PA7,
	.is_rmii	= 1,
};


/*
 * NAND flash
 */
static struct mtd_partition __initdata ek_nand_partition[] = {
	{
		.name   = "Bootstrap",
		.offset = 0,
		.size   = SZ_4M,
	},
	{
		.name	= "Partition 1",
		.offset	= MTDPART_OFS_NXTBLK,
		.size	= 60 * SZ_1M,
	},
	{
		.name	= "Partition 2",
		.offset	= MTDPART_OFS_NXTBLK,
		.size	= MTDPART_SIZ_FULL,
	},
};

static struct mtd_partition * __init nand_partitions(int size, int *num_partitions)
{
	*num_partitions = ARRAY_SIZE(ek_nand_partition);
	return ek_nand_partition;
}

/* det_pin is not connected */
static struct atmel_nand_data __initdata ek_nand_data = {
	.ale		= 21,
	.cle		= 22,
	.rdy_pin	= AT91_PIN_PC13,
	.enable_pin	= AT91_PIN_PC14,
	.partition_info	= nand_partitions,
#if defined(CONFIG_MTD_NAND_ATMEL_BUSWIDTH_16)
	.bus_width_16	= 1,
#else
	.bus_width_16	= 0,
#endif
};
/*
static struct sam9_smc_config __initdata ek_nand_smc_config = {
	.ncs_read_setup		= 0,
	.nrd_setup		= 2,
	.ncs_write_setup	= 0,
	.nwe_setup		= 2,

	.ncs_read_pulse		= 4,
	.nrd_pulse		= 4,
	.ncs_write_pulse	= 4,
	.nwe_pulse		= 4,

	.read_cycle		= 7,
	.write_cycle		= 7,

	.mode			= AT91_SMC_READMODE | AT91_SMC_WRITEMODE | AT91_SMC_EXNWMODE_DISABLE,
	.tdf_cycles		= 3,
};
*/
//ffffec30: 00020002 100c100c 00100010 00011003
//
//used befor 201205
/*
static struct sam9_smc_config __initdata ek_nand_smc_config = {
	.ncs_read_setup		= 2,
	.nrd_setup		= 2,
	.ncs_write_setup	= 2,
	.nwe_setup		= 2,

	.ncs_read_pulse		= 0x10,
	.nrd_pulse		= 0xc,
	.ncs_write_pulse	= 0x10,
	.nwe_pulse		= 0xc,

	.read_cycle		= 0x10,
	.write_cycle		= 0x10,

	.mode			= AT91_SMC_READMODE | AT91_SMC_WRITEMODE | AT91_SMC_EXNWMODE_DISABLE,
	.tdf_cycles		= 3,
};
*/

static struct sam9_smc_config __initdata ek_nand_smc_config = {
	.ncs_read_setup		= 2,
	.nrd_setup		= 2,
	.ncs_write_setup	= 4,
	.nwe_setup		= 2,

	.ncs_read_pulse		= 0x10,
	.nrd_pulse		= 0xc,
	.ncs_write_pulse	= 0x10,
	.nwe_pulse		= 0xc,

	.read_cycle		= 0x10,
	.write_cycle		= 0x16,

	.mode			= AT91_SMC_READMODE | AT91_SMC_WRITEMODE | AT91_SMC_EXNWMODE_DISABLE,
	.tdf_cycles		= 3,
};

static void __init ek_add_device_nand(void)
{
	/* setup bus-width (8 or 16) */
	if (ek_nand_data.bus_width_16)
		ek_nand_smc_config.mode |= AT91_SMC_DBW_16;
	else
		ek_nand_smc_config.mode |= AT91_SMC_DBW_8;

	/* configure chip-select 3 (NAND) */
	sam9_smc_configure(3, &ek_nand_smc_config);

	at91_add_device_nand(&ek_nand_data);
}


/*
 * MCI (SD/MMC)
 * wp_pin and vcc_pin are not connected
 */
static struct at91_mmc_data __initdata ek_mmc_data = {
	.slot_b		= 0,//1,
	.wire4		= 1,
	.det_pin	= AT91_PIN_PC2,//AT91_PIN_PC9,
};


/*
 * LEDs
 */
static struct gpio_led ek_leds[] = {
	{	/* "bottom" led, green, userled1 to be defined */
		.name			= "ds1",
		.gpio			= AT91_PIN_PB8,
		.active_low		= 1,
		.default_trigger	= "heartbeat",
	}
	/*
	{	// "power" led, yellow 
		.name			= "ds1",
		.gpio			= AT91_PIN_PA9,
		.default_trigger	= "heartbeat",
	}
	*/
};

/*
 * GPIO Buttons
 */
#if defined(CONFIG_KEYBOARD_GPIO) || defined(CONFIG_KEYBOARD_GPIO_MODULE)
static struct gpio_keys_button ek_buttons[] = {
	{
		.gpio		= AT91_PIN_PA30,
		.code		= BTN_3,
		.desc		= "Button 3",
		.active_low	= 1,
		.wakeup		= 1,
	},
	{
		.gpio		= AT91_PIN_PA31,
		.code		= BTN_4,
		.desc		= "Button 4",
		.active_low	= 1,
		.wakeup		= 1,
	}
};

static struct gpio_keys_platform_data ek_button_data = {
	.buttons	= ek_buttons,
	.nbuttons	= ARRAY_SIZE(ek_buttons),
};

static struct platform_device ek_button_device = {
	.name		= "gpio-keys",
	.id		= -1,
	.num_resources	= 0,
	.dev		= {
		.platform_data	= &ek_button_data,
	}
};

static void __init ek_add_device_buttons(void)
{
	at91_set_gpio_input(AT91_PIN_PA30, 1);	/* btn3 */
	at91_set_deglitch(AT91_PIN_PA30, 1);
	at91_set_gpio_input(AT91_PIN_PA31, 1);	/* btn4 */
	at91_set_deglitch(AT91_PIN_PA31, 1);

	platform_device_register(&ek_button_device);
}
#else
static void __init ek_add_device_buttons(void) {}
#endif

static void __init ek_board_init(void)
{
	/* Serial */
	at91_add_device_serial();
	/* USB Host */
	at91_add_device_usbh(&ek_usbh_data);
	/* USB Device */
	at91_add_device_udc(&ek_udc_data);
	/* SPI */
	at91_add_device_spi(ek_spi_devices, ARRAY_SIZE(ek_spi_devices));
	/* NAND */
	ek_add_device_nand();
	/* Ethernet */
	at91_add_device_eth(&ek_macb_data);
	/* MMC */
	at91_add_device_mmc(0, &ek_mmc_data);
	/* I2C */
	/* set clock for the wolfson */
	wm8731_set_clk();
	/* SSC */
	at91_add_device_ssc(AT91SAM9260_ID_SSC, ATMEL_SSC_TX | ATMEL_SSC_RX);
	/* I2C */
	at91_add_device_i2c(NULL, 0);
	/* LEDs */
	at91_gpio_leds(ek_leds, ARRAY_SIZE(ek_leds));
	/* Push Buttons */
	ek_add_device_buttons();
}

MACHINE_START(AT91SAM9G20EK, "Atmel AT91SAM9G20-EK")
	/* Maintainer: Atmel */
	.phys_io	= AT91_BASE_SYS,
	.io_pg_offst	= (AT91_VA_BASE_SYS >> 18) & 0xfffc,
	.boot_params	= AT91_SDRAM_BASE + 0x100,
	.timer		= &at91sam926x_timer,
	.map_io		= ek_map_io,
	.init_irq	= ek_init_irq,
	.init_machine	= ek_board_init,
MACHINE_END
