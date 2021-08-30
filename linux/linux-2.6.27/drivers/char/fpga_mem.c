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
#define	LENGTH (SZ_64K)
#define SAMPLE_RD_ADDR 0x0026
#define SAMPLE_RD_DATA 0x0028
#define SAMPLE_RD_DATA1 0x002a
#define SAMPLE_RD_DATA2 0x002c
#define SAMPLE_RD_DATA3 0x002e
#define	WR_ADDR 0x24
 
MODULE_LICENSE("GPL"); 
struct semaphore sem;
//#define MEM2V(x)	((x)+AT91_IO_VIRT_BASE - AT91SAM9G20_SRAM0_SIZE - AT91SAM9G20_SRAM1_SIZE-AT91SAM9260_FPGA_MEM_SIZE)
unsigned short mem[LENGTH];
unsigned short rd_data[4096*4];
static int fpga_mem_ioctl(struct inode *inode,struct file *file,unsigned int cmd,unsigned long arg)
{	
	int i,j,blocks,rd_pos,index=0;
	//char flag0,flag1;
	//flag0=ioread16(MEM2V(WR_ADDR))&0x800;
	//flag1=flag0;
	//calc how many 4096 blocks.
	//1s is 390.625k,so it's 95.
/*	
	cmd low16 is the operation code,if cmd low16==1 read (cmd hig16)S data. 
*/		
//printk(KERN_ALERT "cmd=%d\n\r",cmd);
	if((cmd&0xffff)==0)
		rd_pos=0;
	else
		rd_pos=1;
//printk(KERN_ALERT "rd_pos=%d\n\r",rd_pos);
	for(j=0;j<4096;j++)
	{
		iowrite16((rd_pos<<12)+j,MEM2V(SAMPLE_RD_ADDR));	
		rd_data[index++]=ioread16(MEM2V(SAMPLE_RD_DATA));
		rd_data[index++]=ioread16(MEM2V(SAMPLE_RD_DATA1));
		rd_data[index++]=ioread16(MEM2V(SAMPLE_RD_DATA2));
		rd_data[index++]=ioread16(MEM2V(SAMPLE_RD_DATA3));
	}			
	copy_to_user((unsigned short*)arg,rd_data,4096*4*2);
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

static int write(struct file *flip,const unsigned long __user *buf,size_t size,loff_t *ppos)
{
	if(size==4)	
		copy_from_user(mem,buf,size);
	else
	{		
		printk(KERN_ALERT "Write cmd is too large!\r\n");
		return -ENXIO;	
	}
	if(mem[0]>SZ_128K)		
		printk(KERN_ALERT "Write address is %d belong the FPGA memory!\r\n",mem[0]);
//printk(KERN_ALERT "mem[0]=%4.4x,mem[1]=%4.4x\r\n",mem[0],mem[1]);	
	iowrite16(mem[1],MEM2V(mem[0]));
}

static int read(struct file *flip,const unsigned long __user *buf,size_t size,loff_t *ppos)
{
	long i;	
	long pos=*ppos;
	if(pos+size*2>LENGTH*2)
	{
		printk(KERN_ALERT "Read pos is beyond the fpga meomry range,pos=0x%8.8x,size=%8.8x,%d.\r\n",pos,size,-ENXIO);
		return -ENXIO;	
	}	
	for(i=0;i<size*2;i=i+2)
	{
		//printk(KERN_ALERT "@@@@@@@@@@@@@@@@@@@@@!\r\n");
		mem[i/2]=ioread16(MEM2V(pos+i));
		//printk(KERN_ALERT "ioread16[%d]=%4.4x!\r\n",i,ioread16(MEM2V(pos+i)));
	}
	copy_to_user(buf,mem,size*2);
	return size;
}

static loff_t seek(struct file *filp,loff_t offset,int orig)
{
	loff_t ret=0;
	if(offset>=SZ_128K)
		printk(KERN_ALERT "Seek size is too large!\r\n");
	if(orig==0)
		filp->f_pos=(unsigned int)offset;
	ret = filp->f_pos;
	return ret;	
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
	.read=read,
	.llseek = seek,
	.ioctl=fpga_mem_ioctl,
	.release=release,
};

static int __init mydev_init(void)
{
	int ret,i;
	init_MUTEX(&sem);
#ifdef _DEBUG
	printk(KERN_ALERT "device is init2...\r\n");
#endif
	ret=register_chrdev(101,"mem_fpga",&cfg_fpga_fops);
//set the direction of gpio
/*
	at91_set_gpio_output(AT91_PIN_PB1, 1);//DATA0
	at91_set_gpio_output(AT91_PIN_PB2, 1);//FDCLK
	at91_set_gpio_output(AT91_PIN_PB4, 1);//NCONFIG
	at91_set_gpio_input(AT91_PIN_PB6, 0);//NSTATUS
	at91_set_gpio_value(AT91_PIN_PB4,1);
*/
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
	unregister_chrdev(101,"mem_fpga");
}

module_init(mydev_init);
module_exit(mydev_exit);

