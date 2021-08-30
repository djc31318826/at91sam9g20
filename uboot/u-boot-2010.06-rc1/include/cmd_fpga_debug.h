#ifndef	CMD_FPGA_DEBUG_H
#define 	CMD_FPGA_DEBUG_H
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
#define	smp_sel   		0x28
#define	smp_start 		0x2a
#define	smp_rd_addr_update	0x22
#define	smp_rd_addr_tmp		0x20
#define	fw_cfgh			0x08
#define	fw_cfgl		        0x0a
#define	rd_smp_datal		0x24
#define	rd_smp_datah		0x26
#define	SMP_DEPTH		8192			




#endif
