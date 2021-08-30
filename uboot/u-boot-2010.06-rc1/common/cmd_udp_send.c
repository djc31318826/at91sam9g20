#include "configs/at91sam9260ek.h"

#include <common.h>
#include "command.h"

#include <asm/arch/at91sam9260.h>
#include <net.h>
//NetSendUDPPacket(uchar *ether, IPaddr_t dest, int dport, int sport, int len)

int do_send ( cmd_tbl_t *cmdtp, int flag, int argc, char *argv[])
{
	//
	uchar send_data[1000];
	NetSendUDPPacket(1000,0xC0A80100+3,778,78,1000);//
	return 0;
}

U_BOOT_CMD(
 send,  3,   1,     do_send,
 "send 0\n",
 "send \n"
);




