#include "configs/at91sam9260ek.h"
#ifdef	CONFIG_CMD_FPGA_DEBUG
#include <common.h>
#include "command.h"
#include "cmd_fpga_debug.h"
#include <asm/arch/at91sam9260.h>
#include <common.h>
extern	AT91PS_SPI spi1_rg;
void delay(unsigned long temp)
{
	unsigned long i;
	for(i=0;i<temp;i++);
}

void    reset_fpga()
{
	//reset is PB2,AS THE DATA[0].
	*((volatile unsigned long *) 0xFFFFF634)=(1<<1);	  	//reset=0;
	delay(100);
	*((volatile unsigned long *) 0xFFFFF630)=(1<<1);		//reset=1;
}

void	set_ncfg(unsigned char temp)
{
	if(temp==0)			//30 PIO_SODR,34 PIO_CODR
		(*((volatile unsigned long *) 0xFFFFF634))=(1<<4);//|(1<<8);
	else
		(*((volatile unsigned long *) 0xFFFFF630))=(1<<4);//|(1<<8);		
}

void	set_data0(unsigned char temp)
{
	if(temp==0)			//30 PIO_SODR,34 PIO_CODR
		(*((volatile unsigned long *) 0xFFFFF634))=(1<<1);
	else
		(*((volatile unsigned long *) 0xFFFFF630))=(1<<1);		
}

void	set_dclk(unsigned char temp)
{
	if(temp==0)			//30 PIO_SODR,34 PIO_CODR
		(*((volatile unsigned long *) 0xFFFFF634))=(1<<2);
	else
		(*((volatile unsigned long *) 0xFFFFF630))=(1<<2);		
}

unsigned char get_nstatus()
{
	unsigned long temp=(*((volatile unsigned long *) 0xFFFFF63c));			//PDSR 3c  26pin	
	if(temp&(1<<6))
		return 1;
    else	
		return 0;
}

unsigned char get_cfgdone()
{
	unsigned long temp=(*((volatile unsigned long *) 0xFFFFF63c));			//PDSR 3c  26pin	
	if(temp&(1<<7))
		return 1;
    else	
		return 0;
}


//fpga_reset--pb29
/*
void 	fpga_pin_init()
{
	(*((volatile unsigned long *) 0xFFFFF400))=0x0f800000;			//PIOAER
	(*((volatile unsigned long *) 0xFFFFF410))=0x03800000;			//PIOA_OER
	(*((volatile unsigned long *) 0xFFFFF464))=0x03800000;							
								

	(*((volatile unsigned long *) 0xFFFFF600))=(1<<29);			    //PIOBER  reset
	(*((volatile unsigned long *) 0xFFFFF610))=(1<<29);			    //PIOB_OER
}
*/
unsigned char fpga_load(unsigned long addr,unsigned long length)
{
	unsigned long i,j,temp;
	volatile unsigned long *p=(volatile unsigned long *)addr;
	set_ncfg(1);
	set_dclk(0);
	delay(50);
	set_ncfg(0);
//	delay(30);	//250ns--10
	while(get_nstatus());
	set_ncfg(1);
	while(!get_nstatus());	
	delay(200);
	for(i=0;i<length;i++)
	{
		temp=p[i];
		for(j=0;j<32;j++)
		{
			set_data0((temp>>j)&1);
			//delay(0);
			(*((volatile unsigned long *) 0xFFFFF630))=(1<<2)|(1<<8);
			//set_dclk(1);
			//delay(0);
			//set_dclk(0);
			(*((volatile unsigned long *) 0xFFFFF634))=(1<<2)|(1<<8);
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

long send_count=0;
/*
unsigned short spi_send(unsigned short temp)
{
	//puts("in_spi_send0\r\n");	
	while((spi1_rg->SPI_SR&AT91C_SPI_TXEMPTY)==0);
	//puts("in_spi_send1\r\n");	
	spi1_rg->SPI_TDR=temp;
	while((spi1_rg->SPI_SR&AT91C_SPI_TXEMPTY)==0);
	//puts("in_spi_send2\r\n");		
	send_count++;	
	return(spi1_rg->SPI_RDR);
}
*/

unsigned short spi_send(unsigned short temp)
{
	
	AT91PS_PIO pIO=(AT91PS_PIO)(0xfffff600);
	int i=0,j=0,time_d=2;
	int CS=3;
	int CLK=2;
	int MOSI=1;
	int MISO=0;
	unsigned short iot=0x0,value=0;		//
	//pIO->PIO_SODR=iot;		//CS,CK,MOSI,MISO
	//iot&=~(1<<CS);	
	//iot&=~(1<<CLK);	
	pIO->lPIO_CODR=1<<CS|1<<CLK;//iot;       	//CS=0;CLK=0;

//puts("@7\r\n");
	for(i=0;i<16;i++)
	{
		if(temp&(1<<(15-i)))	
		{
		
			pIO->lPIO_SODR=1<<MOSI;		
		}	
		else
		{					
			pIO->lPIO_CODR=1<<MOSI;		
		}
		if((pIO->lPIO_PDSR)&1)
			iot|=1<<(15-i);//receive 1
		pIO->lPIO_SODR=1<<CLK;	
		for(j=0;j<time_d;j++)
			value=pIO->lPIO_PSR;
		pIO->lPIO_CODR=1<<CLK;
	}
	
	pIO->lPIO_SODR=1<<CS;
	return iot;
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

int do_fpga_reset ( cmd_tbl_t *cmdtp, int flag, int argc, char *argv[])
{
	
	reset_fpga();
	return 0;

}

U_BOOT_CMD(
 fpga_reset,  1,   1,     do_fpga_reset,
 "reset the fpga\n",
 "reset the fpga\n"
);

int do_fpga_load ( cmd_tbl_t *cmdtp, int flag, int argc, char *argv[])
{
	unsigned long addr,length;
	//puts("in_fpga_load\r\n");
	//printf("argc=%d\r\n",argc);
	switch(argc)
	{
		case 1:
			
			fpga_load(0x20000000,200*1024);
			break;
		case 2:
			//puts("in argc=2\r\n");
			addr = simple_strtoul(argv[1], NULL, 16);
			fpga_load(addr,200*1024);
			break;
		case 3:
			addr = simple_strtoul(argv[1], NULL, 16);
			length=simple_strtoul(argv[2], NULL, 16);
			fpga_load(addr,length);
			break;		        
		default:
			break;

	}
	/*
	puts(argv[0]);
	if(argc==2)
		puts(argv[1]);
	else	if(argc==3)
	{
		puts(argv[1]);	
		puts(argv[2]);
	}
	printf("\naddr=%d,length=%d\n",addr,length);*/
	return 0;
}

U_BOOT_CMD(
 fpga_load,  3,   1,     do_fpga_load,
 "load fpga0\n",
 "load fpga\n"
);

int do_sd ( cmd_tbl_t *cmdtp, int flag, int argc, char *argv[])
{
	unsigned long addr,length,temp,i;
	//printf("send_count=%d\r\n",send_count);	
	switch(argc)
	{
		case 1:
			//puts("in argc 1\r\n");
			//printf("spi1_rg=%x",spi1_rg);
			for(i=0;i<1;i=i+2)
			{
				temp=fpga_read(0x0+i);
				printf("%8.8x:%4.4x\r\n",i,temp);
			}		
			//puts("in argc 1 done\r\n");
				
			break;
		case 2:
			//puts("in argc=2\r\n");
			addr = simple_strtoul(argv[1], NULL, 16);
			for(i=0;i<1;i=i+2)
			{
				temp=fpga_read(addr+i);
				printf("%8.8x:%4.4x\r\n",addr+i,temp);
			}
			break;
		case 3:
			addr = simple_strtoul(argv[1], NULL, 16);
			length=simple_strtoul(argv[2], NULL, 16);
			for(i=0;i<length*2;i=i+2)
			{
				temp=fpga_read(addr+i);
				printf("%8.8x:%4.4x\r\n",addr+i,temp);
			}
			break;		        
		default:
			break;

	}
	//printf("send_count=%d\r\n",send_count);
	//return 0;	
}

U_BOOT_CMD(
 sd,  3,   1,     do_sd,
 "show fpga's meomry \n",
 "show fpga's meomry \n"
);

int do_sm ( cmd_tbl_t *cmdtp, int flag, int argc, char *argv[])
{
	unsigned long addr,length,temp;	
	switch(argc)
	{
		case 1:
		case 2:		
			break;
		case 3:
			addr = simple_strtoul(argv[1], NULL, 16);
			temp=simple_strtoul(argv[2], NULL, 16);
			fpga_write(addr,temp);
			temp=fpga_read(addr);	
			printf("read_back %8.8x:%4.4x\r\n",addr,temp);
			break;		        
		default:
			break;

	}	
}

U_BOOT_CMD(
 sm,  3,   1,     do_sm,
 "write fpga's meomry \n",
 "write fpga's meomry \n"
);


#endif
