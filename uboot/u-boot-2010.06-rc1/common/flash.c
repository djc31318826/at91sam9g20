/*
 * (C) Copyright 2001
 * Stefan Roese, esd gmbh germany, stefan.roese@esd-electronics.com
 *
 * See file CREDITS for list of people who contributed to this
 * project.
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License as
 * published by the Free Software Foundation; either version 2 of
 * the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston,
 * MA 02111-1307 USA
 */

#include <common.h>
//#include <ppc4xx.h>
//#include <asm/processor.h>
#include <flash.h>
//#include <configs/at91sam9260ek.h>

#define CFG_MAX_FLASH_BANKS	1	/* max number of memory banks		*/
#define CFG_MAX_FLASH_SECT	512	/* max number of sectors on one chip	*/

#define CFG_FLASH_ERASE_TOUT	120000	/* Timeout for Flash Erase (in ms)	*/
#define CFG_FLASH_WRITE_TOUT	5000	/* Timeout for Flash Write (in ms)	*/

#define CFG_FLASH_WORD_SIZE	unsigned short	/* flash word size (width)	*/
#define CFG_FLASH_ADDR0		0x5555	/* 1st address for flash config cycles	*/
#define CFG_FLASH_ADDR1		0x2AAA	/* 2nd address for flash config cycles	*/
/*
 * The following defines are added for buggy IOP480 byte interface.
 * All other boards should use the standard values (CPCI405 etc.)
 */
#define CFG_FLASH_READ0		0x0000	/* 0 is standard			*/
#define CFG_FLASH_READ1		0x0001	/* 1 is standard			*/
#define CFG_FLASH_READ2		0x0002	/* 2 is standard			*/

//*#define PHYS_FLASH_1			0x10000000
//#define PHYS_FLASH_SIZE			0x800000  	
//#define CFG_FLASH_BASE			PHYS_FLASH_1
//#define CFG_MAX_FLASH_BANKS		1
//#define CFG_MAX_FLASH_SECT		128
//#define CFG_FLASH_ERASE_TOUT		(2*CFG_HZ) 
//#define CFG_FLASH_WRITE_TOUT		(1*CFG_HZ) */


flash_info_t	flash_info[CFG_MAX_FLASH_BANKS]; /* info for FLASH chips	*/

/*-----------------------------------------------------------------------
 * Functions
 */
static int write_word (flash_info_t *info, ulong dest, ulong data);
/*
unsigned long flash_init (void)
{
	



	return 4*1024*1024*2;
}
*/
#if	0
ulong flash_init (void)
{
    int i;
   
    CFG_FLASH_WORD_SIZE value;
    flash_info_t *info;
    for (i = 0; i < CFG_MAX_FLASH_BANKS; i++)
    {
     	flash_info[i].flash_id=FLASH_UNKNOWN;
    }  
    info=(flash_info_t *)(&flash_info[0]);
    
     //进入读ID状态，读MAN ID和device id
     CFG_FLASH_ADDR0=(CFG_FLASH_WORD_SIZE)(0x00AA);
     CFG_FLASH_ADDR1=(CFG_FLASH_WORD_SIZE)(0x0055);
     CFG_FLASH_ADDR0=(CFG_FLASH_WORD_SIZE)(0x0090);
     
     value=CFG_FLASH_READ0;   //read Manufacturer ID
     
     if(value==(CFG_FLASH_WORD_SIZE)SST_MANUFACT)
      info->flash_id = FLASH_MAN_SST;
     else
      { 
       panic("NOT expected FLASH FOUND!\n");return 0;
      }
     value=READ_ADDR1;   //read device ID
   
     if(value==(CFG_FLASH_WORD_SIZE)SST_ID_xF1601)
      {
       	info->flash_id += FLASH_SST39VF6401B;
        info->sector_count = 128;   //128block
        info->size = 0x00800000; // 8M=128*64K
      }
     else
      { 
         panic("NOT expected FLASH FOUND!\n");return 0;  
      }
      
     //建立sector起始地址表。
    if ((info->flash_id & FLASH_VENDMASK) == FLASH_MAN_SST )
    {
      for (i = 0; i < info->sector_count; i++)
     info->start[i] = CFG_FLASH_BASE + (i * 0x00010000);
    }
    
     //设置sector保护信息，对于SST生产的FLASH，全部设为0。
    for (i = 0; i < info->sector_count; i++) 
    {
     if((info->flash_id & FLASH_VENDMASK) == FLASH_MAN_SST)
       info->protect[i] = 0;
    }
    
     //结束读ID状态：
    *((CFG_FLASH_WORD_SIZE *)&info->start[0])= (CFG_FLASH_WORD_SIZE)0x00F0;
    
    //设置保护，将u-boot镜像和环境参数所在的block的proctect标志置1
    /*
    flash_protect (FLAG_PROTECT_SET,
            CFG_FLASH_BASE,
            CFG_FLASH_BASE + monitor_flash_len - 1,
            &flash_info[0]);
   
    flash_protect (FLAG_PROTECT_SET,
            CFG_ENV_ADDR,
            CFG_ENV_ADDR + CFG_ENV_SIZE - 1, &flash_info[0]);
	*/
}
#endif
/*-----------------------------------------------------------------------
 */
/*
static void flash_get_offsets (ulong base, flash_info_t *info)
{
	int i;
	short n;
	// set up sector start address table 
	if (((info->flash_id & FLASH_VENDMASK) == FLASH_MAN_SST) ||
	    ((info->flash_id & FLASH_TYPEMASK) == FLASH_AM640U)) {
	    for (i = 0; i < info->sector_count; i++)
		info->start[i] = base + (i * 0x00010000);
	} else if (((info->flash_id & FLASH_TYPEMASK) == FLASH_AMDL322B) ||
		   ((info->flash_id & FLASH_TYPEMASK) == FLASH_AMDL323B) ||
		   ((info->flash_id & FLASH_TYPEMASK) == FLASH_AM320B) ||
		   ((info->flash_id & FLASH_TYPEMASK) == FLASH_AMDL324B)) {
		// set sector offsets for bottom boot block type	
		for (i=0; i<8; ++i) {		//8 x 8k boot sectors	
			info->start[i] = base;
			base += 8 << 10;
		}
		while (i < info->sector_count) {	// 64k regular sectors	
			info->start[i] = base;
			base += 64 << 10;
			++i;
		}
	} else if (((info->flash_id & FLASH_TYPEMASK) == FLASH_AMDL322T) ||
		   ((info->flash_id & FLASH_TYPEMASK) == FLASH_AMDL323T) ||
		   ((info->flash_id & FLASH_TYPEMASK) == FLASH_AM320T) ||
		   ((info->flash_id & FLASH_TYPEMASK) == FLASH_AMDL324T)) {
		//set sector offsets for top boot block type		
		base += info->size;
		i = info->sector_count;
		for (n=0; n<8; ++n) {		//  8 x 8k boot sectors	
			base -= 8 << 10;
			--i;
			info->start[i] = base;
		}
		while (i > 0) {			//64k regular sectors	
			base -= 64 << 10;
			--i;
			info->start[i] = base;
		}
	} else {
	    if (info->flash_id & FLASH_BTYPE) {
		// set sector offsets for bottom boot block type	
		info->start[0] = base + 0x00000000;
		info->start[1] = base + 0x00004000;
		info->start[2] = base + 0x00006000;
		info->start[3] = base + 0x00008000;
		for (i = 4; i < info->sector_count; i++) {
			info->start[i] = base + (i * 0x00010000) - 0x00030000;
		}
	    } else {
		//set sector offsets for top boot block type		
		i = info->sector_count - 1;
		info->start[i--] = base + info->size - 0x00004000;
		info->start[i--] = base + info->size - 0x00006000;
		info->start[i--] = base + info->size - 0x00008000;
		for (; i >= 0; i--) {
			info->start[i] = base + i * 0x00010000;
		}
	    }
	}
}
*/
/*-----------------------------------------------------------------------
 */
void flash_print_info  (flash_info_t *info)
{
	int i;
	int k;
	int size;
	int erased;
	volatile unsigned long *flash;
//printf("%x\r\n",info->flash_id);
	if (info->flash_id == FLASH_UNKNOWN) {
		printf ("missing or unknown FLASH type\n");
		return;
	}

//for(i=0;i<512;i++)
//	printf("@3-flash_info[%d]=%x\r\n",i,flash_info[0].start[i]);

	switch (info->flash_id & FLASH_VENDMASK) {
	case FLASH_MAN_AMD:	printf ("AMD ");		break;
	case FLASH_MAN_SPANSION:printf ("SAPNSION ");		break;
	case FLASH_MAN_SST:	printf ("SST ");		break;
	case FLASH_MAN_EXCEL:	printf ("Excel Semiconductor "); break;
	default:		printf ("Unknown Vendor ");	break;
	}

	switch (info->flash_id & FLASH_TYPEMASK) {
	case FLASH_AM400B:	printf ("AM29LV400B (4 Mbit, bottom boot sect)\n");
				break;
	case FLASH_AM400T:	printf ("AM29LV400T (4 Mbit, top boot sector)\n");
				break;
	case FLASH_AM800B:	printf ("AM29LV800B (8 Mbit, bottom boot sect)\n");
				break;
	case FLASH_AM800T:	printf ("AM29LV800T (8 Mbit, top boot sector)\n");
				break;
	case FLASH_AM160B:	printf ("AM29LV160B (16 Mbit, bottom boot sect)\n");
				break;
	case FLASH_AM160T:	printf ("AM29LV160T (16 Mbit, top boot sector)\n");
				break;
	case FLASH_AM320T:	printf ("AM29LV320T (32 M, top sector)\n");
				break;
	case FLASH_AM320B:	printf ("AM29LV320B (32 M, bottom sector)\n");
				break;
	case FLASH_AMDL322T:	printf ("AM29DL322T (32 M, top sector)\n");
				break;
	case FLASH_AMDL322B:	printf ("AM29DL322B (32 M, bottom sector)\n");
				break;
	case FLASH_AMDL323T:	printf ("AM29DL323T (32 M, top sector)\n");
				break;
	case FLASH_AMDL323B:	printf ("AM29DL323B (32 M, bottom sector)\n");
				break;
	case FLASH_AM640U:	printf ("AM29LV640D (64 M, uniform sector)\n");
				break;
	case FLASH_SST800A:	printf ("SST39LF/VF800 (8 Mbit, uniform sector size)\n");
				break;
	case FLASH_SST160A:	printf ("SST39LF/VF160 (16 Mbit, uniform sector size)\n");
				break;
	case FLASH_SST320:	printf ("SST39LF/VF320 (32 Mbit, uniform sector size)\n");
				break;
	case FLASH_SST640:	printf ("SST39LF/VF640 (64 Mbit, uniform sector size)\n");
				break;
	case SPANSION_ID_29GL512N:printf ("S29GL512N (512 Mbit, uniform sector size)\n");
				break;
	default:		printf ("Unknown Chip Type\n");
				break;
	}

	printf ("  Size: %ld MB in %d Sectors\n",
		info->size >> 20, info->sector_count);

	printf ("  Sector Start Addresses:");
	for (i=0; i<info->sector_count; ++i) {
#ifdef CFG_FLASH_EMPTY_INFO
		/*
		 * Check if whole sector is erased
		 */
		if (i != (info->sector_count-1))
		  size = info->start[i+1] - info->start[i];
		else
		  size = info->start[0] + info->size - info->start[i];
		erased = 1;
		flash = (volatile unsigned long *)info->start[i];
		size = size >> 2;        /* divide by 4 for longword access */
		for (k=0; k<size; k++)
		  {
		    if (*flash++ != 0xffffffff)
		      {
			erased = 0;
			break;
		      }
		  }

		if ((i % 5) == 0)
			printf ("\n   ");
		/* print empty and read-only info */
		printf (" %08lX%s%s",
			info->start[i],
			erased ? " E" : "  ",
			info->protect[i] ? "RO " : "   ");
#else
		if ((i % 5) == 0)
			printf ("\n   ");
		printf (" %08lX%s",
			info->start[i],
			info->protect[i] ? " (RO)" : "     ");
#endif

	}
	printf ("\n");
	return;
}

/*-----------------------------------------------------------------------
 */


/*-----------------------------------------------------------------------
 */

/*
 * The following code cannot be run from FLASH!
 */
/*
ulong flash_init (void)
{ 
    int i;
    ulong flashbase = CFG_FLASH_BASE;
    puts("in flash_init\r\n");
    for (i = 0; i < CFG_MAX_FLASH_BANKS; i++) {
    	flash_get_size ((vu_long *)flashbase, &flash_info[i]);	
    	}
	puts("out flash_init\r\n");
	return flash_info[0].size;
}
*/

static ulong flash_get_size (vu_long *addr, flash_info_t *info)
{
	unsigned short i;
	short n;
	CFG_FLASH_WORD_SIZE value;
	ulong base = (ulong)addr;
	volatile CFG_FLASH_WORD_SIZE *addr2 = (CFG_FLASH_WORD_SIZE *)addr;
        //puts("in flash_get_size_0\r\n");
	/* Write auto select command: read Manufacturer ID */
	addr2[CFG_FLASH_ADDR0] = (CFG_FLASH_WORD_SIZE)0x00AA00AA;
	addr2[CFG_FLASH_ADDR1] = (CFG_FLASH_WORD_SIZE)0x00550055;
	addr2[CFG_FLASH_ADDR0] = (CFG_FLASH_WORD_SIZE)0x00900090;

	//For S29GL512N value is 0x0001
	value = addr2[CFG_FLASH_READ0];
//printf("%x\r\n",value);
	switch (value) {

	case (CFG_FLASH_WORD_SIZE)SST_MANUFACT:
		info->flash_id = FLASH_MAN_SST;
		break;
	case (CFG_FLASH_WORD_SIZE)EXCEL_MANUFACT:
		info->flash_id = FLASH_MAN_EXCEL;
		break;
	case (CFG_FLASH_WORD_SIZE)SPANSION_MANUFACT:
		info->flash_id =FLASH_MAN_SPANSION;
		break;
	default:
		info->flash_id = FLASH_UNKNOWN;
		info->sector_count = 0;
		info->size = 0;
		return (0);			/* no or unknown flash	*/
	}
//printf("%x\r\n",info->flash_id);
        //For S29GL512N value is 0x227e
	value = addr2[CFG_FLASH_READ1];		/* device ID		*/
//printf("%x\r\n",value);        
	switch (value) {
	case (CFG_FLASH_WORD_SIZE)SST_ID_xF6401:
	case (CFG_FLASH_WORD_SIZE)SST_ID_xF6402:
		info->flash_id += FLASH_SST640;
		info->sector_count = 128;
		info->size = 0x00800000;
		break;				/* => 8 MB		*/
	case (CFG_FLASH_WORD_SIZE)SPANSION_ID_29GL512N:
		info->flash_id +=(SPANSION_ID_29GL512N);
		info->sector_count = 512;
		info->size = 0x04000000;		//64M Byte
		break;
	default:
		info->flash_id = FLASH_UNKNOWN;
		return (0);			/* => no or unknown flash */
	}
//printf("%x\r\n",info->flash_id);
	/* set up sector start address table FLASH_VENDMASK=0xFFFF0000*/
	if (((info->flash_id & FLASH_VENDMASK) == FLASH_MAN_SPANSION) || ((info->flash_id & FLASH_TYPEMASK) == SPANSION_ID_29GL512N)) 
	{
//printf("@get_size\r\n");
	    for (i = 0; i < info->sector_count; i++)
	    {
		info->start[i] = base + (i * 0x00020000);
//printf("info->start[%d]=%x\r\n",i,info->start[i]);
	    }
	}         
	/* check for protected sectors */
	//for (i = 0; i < info->sector_count; i++) {
		/* read sector protection at sector address, (A7 .. A0) = 0x02 */
		/* D0 = 1 if protected */
	//	addr2 = (volatile CFG_FLASH_WORD_SIZE *)(info->start[i]);
	//	if ((info->flash_id & FLASH_VENDMASK) != FLASH_MAN_AMD)
	//	  info->protect[i] = 0;
	//	else
	//	  info->protect[i] = addr2[CFG_FLASH_READ2] & 1;
	//}

	/*
	 * Prevent writes to uninitialized FLASH.
	 */
	//if (info->flash_id != FLASH_UNKNOWN) {
	//	addr2 = (CFG_FLASH_WORD_SIZE *)info->start[0];
	//	*addr2 = (CFG_FLASH_WORD_SIZE)0x00F000F0;	/* reset bank */
	//}
	addr2[CFG_FLASH_ADDR0] = (CFG_FLASH_WORD_SIZE)0x00AA00AA;
	addr2[CFG_FLASH_ADDR1] = (CFG_FLASH_WORD_SIZE)0x00550055;
	addr2[CFG_FLASH_ADDR0] = (CFG_FLASH_WORD_SIZE)0x009000F0;
	return (info->size);
}

ulong flash_init (void)
{ 
    int i;
    ulong flashbase = CFG_FLASH_BASE;
    //puts("in flash_init\r\n");
    for (i = 0; i < CFG_MAX_FLASH_BANKS; i++) {
    	flash_get_size ((vu_long *)flashbase, &flash_info[i]);	
    	}
	//puts("out flash_init\r\n");
	return flash_info[0].size;
}
/*-----------------------------------------------------------------------
 */

int	flash_erase (flash_info_t *info, int s_first, int s_last)
{
	volatile CFG_FLASH_WORD_SIZE *addr = (CFG_FLASH_WORD_SIZE *)(info->start[0]);
	volatile CFG_FLASH_WORD_SIZE *addr2;
	int flag, prot, sect, l_sect;
	ulong start, now, last;
	int i;

	if ((s_first < 0) || (s_first > s_last)) {
		if (info->flash_id == FLASH_UNKNOWN) {
			printf ("- missing\n");
		} else {
			printf ("- no sectors to erase\n");
		}
		return 1;
	}

	if (info->flash_id == FLASH_UNKNOWN) {
		printf ("Can't erase unknown flash type - aborted\n");
		return 1;
	}

	prot = 0;
	for (sect=s_first; sect<=s_last; ++sect) {
		if (info->protect[sect]) {
			prot++;
		}
	}

	if (prot) {
		printf ("- Warning: %d protected sectors will not be erased!\n",
			prot);
	} else {
		printf ("\n");
	}

	l_sect = -1;

	/* Disable interrupts which might cause a timeout here */
	flag = disable_interrupts();

	/* Start erase on unprotected sectors */
	for (sect = s_first; sect<=s_last; sect++) {
		if (info->protect[sect] == 0) {	/* not protected */
		    addr2 = (CFG_FLASH_WORD_SIZE *)(info->start[sect]);
		    if ((info->flash_id & FLASH_VENDMASK) == FLASH_MAN_SST) {
			addr[CFG_FLASH_ADDR0] = (CFG_FLASH_WORD_SIZE)0x00AA00AA;
			addr[CFG_FLASH_ADDR1] = (CFG_FLASH_WORD_SIZE)0x00550055;
			addr[CFG_FLASH_ADDR0] = (CFG_FLASH_WORD_SIZE)0x00800080;
			addr[CFG_FLASH_ADDR0] = (CFG_FLASH_WORD_SIZE)0x00AA00AA;
			addr[CFG_FLASH_ADDR1] = (CFG_FLASH_WORD_SIZE)0x00550055;
			addr2[0] = (CFG_FLASH_WORD_SIZE)0x00500050;  /* block erase */
			for (i=0; i<50; i++)
			  udelay(1000);  /* wait 1 ms */
		    } else {
			if (sect == s_first) {
			    addr[CFG_FLASH_ADDR0] = (CFG_FLASH_WORD_SIZE)0x00AA00AA;
			    addr[CFG_FLASH_ADDR1] = (CFG_FLASH_WORD_SIZE)0x00550055;
			    addr[CFG_FLASH_ADDR0] = (CFG_FLASH_WORD_SIZE)0x00800080;
			    addr[CFG_FLASH_ADDR0] = (CFG_FLASH_WORD_SIZE)0x00AA00AA;
			    addr[CFG_FLASH_ADDR1] = (CFG_FLASH_WORD_SIZE)0x00550055;
			}
			addr2[0] = (CFG_FLASH_WORD_SIZE)0x00300030;  /* sector erase */
		    }
		    l_sect = sect;
		}
	}

	/* re-enable interrupts if necessary */
	if (flag)
		enable_interrupts();

	/* wait at least 80us - let's wait 1 ms */
	udelay (1000);

	/*
	 * We wait for the last triggered sector
	 */
	if (l_sect < 0)
		goto DONE;

	start = get_timer (0);
	last  = start;
	addr = (CFG_FLASH_WORD_SIZE *)(info->start[l_sect]);
	while ((addr[0] & (CFG_FLASH_WORD_SIZE)0x00800080) != (CFG_FLASH_WORD_SIZE)0x00800080) {
		if ((now = get_timer(start)) > CFG_FLASH_ERASE_TOUT) {
			printf ("Timeout\n");
			return 1;
		}
		/* show that we're waiting */
		if ((now - last) > 1000) {	/* every second */
			putc ('.');
			last = now;
		}
	}

DONE:
	/* reset to read mode */
	addr = (CFG_FLASH_WORD_SIZE *)info->start[0];
	addr[0] = (CFG_FLASH_WORD_SIZE)0x00F000F0;	/* reset bank */

	printf (" done\n");
	return 0;
}

/*-----------------------------------------------------------------------
 * Copy memory to flash, returns:
 * 0 - OK
 * 1 - write timeout
 * 2 - Flash not erased
 */

int write_buff (flash_info_t *info, uchar *src, ulong addr, ulong cnt)
{
	ulong cp, wp, data;
	int i, l, rc;

	wp = (addr & ~3);	/* get lower word aligned address */

	/*
	 * handle unaligned start bytes
	 */
	if ((l = addr - wp) != 0) {
		data = 0;
		for (i=0, cp=wp; i<l; ++i, ++cp) {
			data = (data << 8) | (*(uchar *)cp);
		}
		for (; i<4 && cnt>0; ++i) {
			data = (data << 8) | *src++;
			--cnt;
			++cp;
		}
		for (; cnt==0 && i<4; ++i, ++cp) {
			data = (data << 8) | (*(uchar *)cp);
		}

		if ((rc = write_word(info, wp, data)) != 0) {
			return (rc);
		}
		wp += 4;
	}

	/*
	 * handle word aligned part
	 */
	while (cnt >= 4) {
		data = 0;
		for (i=0; i<4; ++i) {
			data = (data << 8) | *src++;
		}
		if ((rc = write_word(info, wp, data)) != 0) {
			return (rc);
		}
		wp  += 4;
		cnt -= 4;
	}

	if (cnt == 0) {
		return (0);
	}

	/*
	 * handle unaligned tail bytes
	 */
	data = 0;
	for (i=0, cp=wp; i<4 && cnt>0; ++i, ++cp) {
		data = (data << 8) | *src++;
		--cnt;
	}
	for (; i<4; ++i, ++cp) {
		data = (data << 8) | (*(uchar *)cp);
	}

	return (write_word(info, wp, data));
}

/*-----------------------------------------------------------------------
 * Write a word to Flash, returns:
 * 0 - OK
 * 1 - write timeout
 * 2 - Flash not erased
 */
static int write_word (flash_info_t *info, ulong dest, ulong data)
{
	volatile CFG_FLASH_WORD_SIZE *addr2 = (CFG_FLASH_WORD_SIZE *)(info->start[0]);
	volatile CFG_FLASH_WORD_SIZE *dest2 = (CFG_FLASH_WORD_SIZE *)dest;
	volatile CFG_FLASH_WORD_SIZE *data2 = (CFG_FLASH_WORD_SIZE *)&data;
	ulong start;
	int flag;
	int i;
	unsigned char temp,*p;
//printf("@1");
        start=*((vu_long *)dest) ;
//printf("@2");
	/* Check if Flash is (sufficiently) erased */
	if ((start&data)!= data) {
		//puts("1234");//("dest=%d",dest);
		puts("\r\n");
		printf("mem=%x,dest2=%x,data=%x,start&data=%x\r\n",start,dest2,data,start&data);
		return (2);
	}

	/* Disable interrupts which might cause a timeout here */
	flag = disable_interrupts();
	/*reverse the word*/
//printf("dest2[0]=%d,dest2[1]=%d--",dest2[0],dest2[1]);
{
	p=(unsigned char*)&data;	
	
	temp=p[0];
	p[0]=p[3];
	p[3]=temp;
	temp=p[1];
	p[1]=p[2];
	p[2]=temp;
	
}
//printf("dest2[0]=%d,dest2[1]=%d\r\n",dest2[0],dest2[1]);
	for (i=0; i<4/sizeof(CFG_FLASH_WORD_SIZE); i++)
	  {
	    addr2[CFG_FLASH_ADDR0] = (CFG_FLASH_WORD_SIZE)0x00AA00AA;
	    addr2[CFG_FLASH_ADDR1] = (CFG_FLASH_WORD_SIZE)0x00550055;
	    addr2[CFG_FLASH_ADDR0] = (CFG_FLASH_WORD_SIZE)0x00A000A0;

	    dest2[i] = data2[i];
	    //printf("dest2=%d,i=%d\r\n",dest2,i);	

	    /* re-enable interrupts if necessary */
	    if (flag)
	      enable_interrupts();

	    /* data polling for D7 */
	    start = get_timer (0);
	    
	    while ((dest2[i] & (CFG_FLASH_WORD_SIZE)0x00800080) !=
		   (data2[i] & (CFG_FLASH_WORD_SIZE)0x00800080)) {
	      if (get_timer(start) > CFG_FLASH_WRITE_TOUT) {
		printf("time is out! dest=%8.8x\r\n",dest);		//for test add by d68152 @20110103
		return (1);
	      }
	    }
	  }

	return (0);
}

//add by djc001

flash_info_t *
addr2info (ulong addr)
{
#ifndef CONFIG_SPD823TS
	flash_info_t *info;
	int i;

	for (i=0, info=&flash_info[0]; i<CFG_MAX_FLASH_BANKS; ++i, ++info) {
		if (info->flash_id != FLASH_UNKNOWN &&
		    addr >= info->start[0] &&
		    /* WARNING - The '- 1' is needed if the flash
		     * is at the end of the address space, since
		     * info->start[0] + info->size wraps back to 0.
		     * Please don't change this unless you understand this.
		     */
		    addr <= info->start[0] + info->size - 1) {
			return (info);
		}
	}
#endif /* CONFIG_SPD823TS */

	return (NULL);
}

/*-----------------------------------------------------------------------
 * Copy memory to flash.
 * Make sure all target addresses are within Flash bounds,
 * and no protected sectors are hit.
 * Returns:
 * ERR_OK          0 - OK
 * ERR_TIMOUT      1 - write timeout
 * ERR_NOT_ERASED  2 - Flash not erased
 * ERR_PROTECTED   4 - target range includes protected sectors
 * ERR_INVAL       8 - target address not in Flash memory
 * ERR_ALIGN       16 - target address not aligned on boundary
 *			(only some targets require alignment)
 */
int
flash_write (char *src, ulong addr, ulong cnt)
{
#ifdef CONFIG_SPD823TS
	return (ERR_TIMOUT);	/* any other error codes are possible as well */
#else
	int i;
	ulong         end        = addr + cnt - 1;
	flash_info_t *info_first = addr2info (addr);
	flash_info_t *info_last  = addr2info (end );
	flash_info_t *info;
//printf("\r\naddr=%x,cnt=%d\r\n",addr,cnt);
	if (cnt == 0) {
		return (ERR_OK);
	}

	if (!info_first || !info_last) {
		return (ERR_INVAL);
	}

	for (info = info_first; info <= info_last; ++info) {
		ulong b_end = info->start[0] + info->size;	/* bank end addr */
		short s_end = info->sector_count - 1;
//for(i=0;i<512;i++)
//{
//	printf("info->start[%d]=%x\r\n",i,info->start[i]);	
//}
		for (i=0; i<info->sector_count; ++i) {
			ulong e_addr = (i == s_end) ? b_end : info->start[i + 1];
//printf("b_end=%x,s_end=%x,e_addr=%x,addr=%x,info->start[%d]=%x,info->protect[%d]=%d\r\n",b_end,s_end,e_addr,addr,i,info->start[i],i,info->protect[i]);
			if ((end >= info->start[i]) && (addr < e_addr) &&
			    (info->protect[i] != 0) ) {
printf("@error\r\n");
				return (ERR_PROTECTED);
			}
		}
	}

	/* finally write data to flash */
	for (info = info_first; info <= info_last && cnt>0; ++info) {
		ulong len;

		len = info->start[0] + info->size - addr;
		if (len > cnt)
			len = cnt;
		if ((i = write_buff(info, (uchar *)src, addr, len)) != 0) {
			return (i);
		}
		cnt  -= len;
		addr += len;
		src  += len;
	}
	return (ERR_OK);
#endif /* CONFIG_SPD823TS */
}

/*-----------------------------------------------------------------------
 */

void flash_perror (int err)
{
	switch (err) {
	case ERR_OK:
		break;
	case ERR_TIMOUT:
		puts ("Timeout writing to Flash\n");
		break;
	case ERR_NOT_ERASED:
		puts ("Flash not Erased\n");
		break;
	case ERR_PROTECTED:
		puts ("Can't write to protected Flash sectors\n");
		break;
	case ERR_INVAL:
		puts ("Outside available Flash\n");
		break;
	case ERR_ALIGN:
		puts ("Start and/or end address not on sector boundary\n");
		break;
	case ERR_UNKNOWN_FLASH_VENDOR:
		puts ("Unknown Vendor of Flash\n");
		break;
	case ERR_UNKNOWN_FLASH_TYPE:
		puts ("Unknown Type of Flash\n");
		break;
	case ERR_PROG_ERROR:
		puts ("General Flash Programming Error\n");
		break;
	default:
		printf ("%s[%d] FIXME: rc=%d\n", __FILE__, __LINE__, err);
		break;
	}
}




/*-----------------------------------------------------------------------
 */
