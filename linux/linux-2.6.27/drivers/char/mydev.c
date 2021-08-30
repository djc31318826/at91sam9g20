#ifndef __KERNEL__
#define __KERNEL__
#endif
//#ifndef MODULE
//#define MODULE
//#endif
#define	_DEBUG
#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/version.h>
#include <linux/fs.h>
#include <linux/init.h>
#include <linux/types.h>
#include <asm/uaccess.h>
#include <mach/board.h>
#include <mach/gpio.h>
#define	LENGTH (512*1024)
MODULE_LICENSE("GPL"); 
struct semaphore sem;

char mem[LENGTH];
static int cfg_fpga_ioctl(struct inode *inode,struct file *file,unsigned int cmd,unsigned long arg)
{	
	int i;
#ifdef _DEBUG
	//printk(KERN_ALERT "in ioctl cmd=0x%x,arg=0x%x...\r\n",cmd,arg);
#endif
	//printk(KERN_ALERT "AT91_PIN_PB4=0x%x...\r\n",AT91_PIN_PB4);
	at91_set_gpio_value(cmd,arg);
	
	return 0;
}

static int open(struct inode *inode,struct file *file)
{
	if(down_interruptible(&sem))	
	{
#ifdef _DEBUG
		printk(KERN_ALERT "device is busy!\r\n");
#endif
		return -ERESTARTSYS;
	}
	
	return 0;
}

static int write(struct file *flip,const char __user *buf,size_t size,loff_t *ppos)
{
	long j,k;	
	copy_from_user(mem,buf,size);
//printk(KERN_ALERT "write to fpga\r\n");
	for(j=0;j<size;j++)
	{
		for(k=0;k<8;k++)
		{
			if(mem[j]&(1<<k))
				at91_set_gpio_value(AT91_PIN_PB1,1);	//ioctl(fdev,DATA,1);	
			else
				at91_set_gpio_value(AT91_PIN_PB1,0);
			at91_set_gpio_value(AT91_PIN_PB2,0);
			at91_set_gpio_value(AT91_PIN_PB2,1);
				//ioctl(fdev,DATA,0);
			//ioctl(fdev,DCLK,0);
			//ioctl(fdev,DCLK,1);	
		}
	}
}

static int release(struct inode *inode,struct file *file)
{
#ifdef _DEBUG
	//printk(KERN_ALERT "device is close!\r\n");
#endif
	up(&sem);
	return 0;
}

static struct	file_operations cfg_fpga_fops=
{
	.owner=THIS_MODULE,
	.open=open,
	.write=write,
	.release=release,
	.ioctl=cfg_fpga_ioctl,
};

static int __init mydev_init(void)
{
	int ret,i;
	init_MUTEX(&sem);
#ifdef _DEBUG
	printk(KERN_ALERT "device is init2...\r\n");
#endif
	ret=register_chrdev(100,"cfg_fpga",&cfg_fpga_fops);
//set the direction of gpio
	at91_set_gpio_output(AT91_PIN_PB1, 1);//DATA0
	at91_set_gpio_output(AT91_PIN_PB2, 1);//FDCLK
	at91_set_gpio_output(AT91_PIN_PB4, 1);//NCONFIG
	at91_set_gpio_input(AT91_PIN_PB6, 0);//NSTATUS
	at91_set_gpio_value(AT91_PIN_PB4,1);
	/*
	for(i=0;i<100000;i++)
	{
		at91_set_gpio_value(AT91_PIN_PB8,0);
		ret=100;
		while(ret--);
		at91_set_gpio_value(AT91_PIN_PB8,1);
		ret=100;
		while(ret--);

	}
	*/
	return 0;
}

static void __exit mydev_exit(void)
{
#ifdef _DEBUG
	printk(KERN_ALERT "device is exit...\r\n");
#endif
	at91_set_gpio_value(AT91_PIN_PB4,1);
	unregister_chrdev(100,"cfg_fpga");
}

module_init(mydev_init);
module_exit(mydev_exit);

