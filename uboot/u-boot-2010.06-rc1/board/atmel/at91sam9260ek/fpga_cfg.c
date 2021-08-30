#include "fpga_cfg.h"
void delay(unsigned long temp)
{
	unsigned long i;
	for(i=0;i<temp;i++);
}

void    reset_fpga()
{
	//30 PIO_SODR,34 PIO_CODR
	(*((volatile unsigned long *) 0xFFFFF600))=(1<<29);			    //PIOBER  reset
	(*((volatile unsigned long *) 0xFFFFF610))=(1<<29);			    //PIOB_OER



	*((volatile unsigned long *) 0xFFFFF630)=(1<<29);	  	//reset=0;
	delay(100);
	*((volatile unsigned long *) 0xFFFFF634)=(1<<29);		//reset=1;
}

void	set_ncfg(unsigned char temp)
{
	if(temp==0)			//30 PIO_SODR,34 PIO_CODR
		(*((volatile unsigned long *) 0xFFFFF434))=(1<<23);
	else
		(*((volatile unsigned long *) 0xFFFFF430))=(1<<23);		
}

void	set_data0(unsigned char temp)
{
	if(temp==0)			//30 PIO_SODR,34 PIO_CODR
		(*((volatile unsigned long *) 0xFFFFF434))=(1<<24);
	else
		(*((volatile unsigned long *) 0xFFFFF430))=(1<<24);		
}

void	set_dclk(unsigned char temp)
{
	if(temp==0)			//30 PIO_SODR,34 PIO_CODR
		(*((volatile unsigned long *) 0xFFFFF434))=(1<<25);
	else
		(*((volatile unsigned long *) 0xFFFFF430))=(1<<25);		
}

unsigned char get_nstatus()
{
	unsigned long temp=(*((volatile unsigned long *) 0xFFFFF43c));			//PDSR 3c  26pin	
	if(temp&(1<<26))
		return 1;
    else	
		return 0;
}

unsigned char get_cfgdone()
{
	unsigned long temp=(*((volatile unsigned long *) 0xFFFFF43c));			//PDSR 3c  26pin	
	if(temp&(1<<27))
		return 1;
    else	
		return 0;
}

//fpga_reset--pb29
void 	fpga_pin_init()
{
	(*((volatile unsigned long *) 0xFFFFF400))=0x0f800000;			//PIOAER
	(*((volatile unsigned long *) 0xFFFFF410))=0x03800000;			//PIOA_OER
	(*((volatile unsigned long *) 0xFFFFF464))=0x03800000;			//PUER 64												
	AT91PS_PIO pIO=(AT91PS_PIO)(0xfffff600);
	pIO->lPIO_PER=0x0000000f|1<<29;	//IO enable
	pIO->lPIO_OER=0x0000000e|1<<29;	//output enable
	pIO->lPIO_PPUER=0x0000000f;	//pull up enable
	pIO->lPIO_SODR=0x0000000a;																//30 PIO_SODR,34 PIO_CODR
	printf("fpga_pin_init_new\r\n");
/*
	(*((volatile unsigned long *) 0xFFFFF600))=(1<<29);			    //PIOBER  reset
	(*((volatile unsigned long *) 0xFFFFF610))=(1<<29);			    //PIOB_OER
*/
}

unsigned char fpga_load(unsigned long addr,unsigned long length)
{
	unsigned long i,j,temp;
	volatile unsigned long *p=(volatile unsigned long *)addr;
	set_ncfg(1);
	set_dclk(0);
	delay(10);
	set_ncfg(0);
	delay(10);
	while(get_nstatus());
	set_ncfg(1);
	while(!get_nstatus());	
	delay(10);
	for(i=0;i<length;i++)
	{
		temp=p[i];
		for(j=0;j<32;j++)
		{
			set_data0((temp>>j)&1);
			//delay(0);
			(*((volatile unsigned long *) 0xFFFFF430))=(1<<25);
			//set_dclk(1);
			//delay(0);
			//set_dclk(0);
			(*((volatile unsigned long *) 0xFFFFF434))=(1<<25);
		}		
	}
/*	for(j=0;j<500;j++)
	{
		delay(10);
		set_dclk(1);
		delay(10);
		set_dclk(0);
	}*/
	reset_fpga();
	return(get_cfgdone());
}

unsigned short spi_send(unsigned short temp)
{
	
	AT91PS_PIO pIO=(AT91PS_PIO)(0xfffff600);
	int i=0,j=0,time_d=20;
	int CS=3;
	int CLK=2;
	int MOSI=1;
	int MISO=0;
	unsigned short iot=0x0,value=0;;		//
	//pIO->PIO_SODR=iot;		//CS,CK,MOSI,MISO
	//iot&=~(1<<CS);	
	//iot&=~(1<<CLK);	
	pIO->lPIO_CODR=1<<CS|1<<CLK;//iot;       	//CS=0;CLK=0;
	for(i=0;i<16;i++)
	{
		if(temp&(1<<(15-i)))	
		{
			//send 1			
			pIO->lPIO_SODR=1<<MOSI;		
		}	
		else
		{	//send 0
			pIO->lPIO_CODR=1<<MOSI;		
		}
		if(pIO->lPIO_PDSR==1'b1)
			iot|=1<<(15-i);//receive 1
		//CLK=1;
		for(j=0;j<time_d;j++)
			value=pIO->lPIO_PSR;
		pIO->lPIO_SODR=1<<CLK;	
		//CLK=0;
		for(j=0;j<time_d+20;j++)
			value=pIO->lPIO_PSR;
		pIO->lPIO_CODR=1<<CLK;
	}
	
	pIO->PIO_SODR=1<<CS;

	/*
	while((spi1_rg->SPI_SR&AT91C_SPI_TXEMPTY)==0);
	spi1_rg->SPI_TDR=temp;
	while((spi1_rg->SPI_SR&AT91C_SPI_TXEMPTY)==0);
	return(spi1_rg->SPI_RDR);
	*/
}

void	fpga_write(unsigned long addr,unsigned short temp)
{
	unsigned short send_temp;	
	send_temp=addr&0xfff|(8<<12);
	spi_send(send_temp);
	send_temp=(addr>>12)&0xfff|(9<<12);
	spi_send(send_temp);
	send_temp=(temp)&0xff|(10<<12);
	spi_send(send_temp);
   	send_temp=(temp>>8)&0xff|(11<<12);
	spi_send(send_temp);
}

unsigned short fpga_read(unsigned long addr)
{
	unsigned short send_temp;	
	send_temp=addr&0xfff|(0<<12);
	spi_send(send_temp);
	send_temp=(addr>>12)&0xfff|(1<<12);
	spi_send(send_temp);
	send_temp=(2<<12);
	spi_send(send_temp);
   	send_temp=(3<<12);
	send_temp=spi_send(0x22);
	return(send_temp);
} 














