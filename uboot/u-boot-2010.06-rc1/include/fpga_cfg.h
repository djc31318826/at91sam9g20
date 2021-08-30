#ifndef	FPGA_CFG_H
#define 	FPGA_CFG_H 1
void delay(unsigned long temp);
void    reset_fpga();
void	set_ncfg(unsigned char temp);
void	set_data0(unsigned char temp);
void	set_dclk(unsigned char temp);
unsigned char get_nstatus();
unsigned char get_cfgdone();
unsigned char fpga_load(unsigned long addr,unsigned long length);
unsigned short spi_send(unsigned short temp);
void	fpga_write(unsigned long addr,unsigned short temp);
unsigned short	fpga_read(unsigned long addr);
#endif
