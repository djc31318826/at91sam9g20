/* ----------------------------------------------------------------------------
 *         ATMEL Microcontroller Software Support 
 * ----------------------------------------------------------------------------
 * Copyright (c) 2008, Atmel Corporation
 *
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * - Redistributions of source code must retain the above copyright notice,
 * this list of conditions and the disclaimer below.
 *
 * Atmel's name may not be used to endorse or promote products derived from
 * this software without specific prior written permission.
 *
 * DISCLAIMER: THIS SOFTWARE IS PROVIDED BY ATMEL "AS IS" AND ANY EXPRESS OR
 * IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT ARE
 * DISCLAIMED. IN NO EVENT SHALL ATMEL BE LIABLE FOR ANY DIRECT, INDIRECT,
 * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA,
 * OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
 * LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
 * NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
 * EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 * ----------------------------------------------------------------------------
 */

//------------------------------------------------------------------------------
/// \unit
///
/// !Purpose
///
/// Provides the low-level initialization function that gets called on chip
/// startup.
///
/// !Usage
///
/// LowLevelInit() is called in #board_cstartup.S#.
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
//         Headers
//------------------------------------------------------------------------------

#include "board.h"
#include "board_memories.h"
#include <pmc/pmc.h>

//------------------------------------------------------------------------------
//         Internal definitions
//------------------------------------------------------------------------------
/*
    Constants: Clock and PLL settings

        BOARD_OSCOUNT - Startup time of main oscillator (in number of slow clock
                        ticks). 
        BOARD_USBDIV - USB PLL divisor value to obtain a 48MHz clock.
        BOARD_CKGR_PLL - PLL frequency range.
        BOARD_PLLCOUNT - PLL startup time (in number of slow clock ticks).
        BOARD_MUL - PLL MUL value.
        BOARD_DIV - PLL DIV value.
        BOARD_PRESCALER - Master clock prescaler value.
*/
#define BOARD_OSCOUNT           (AT91C_CKGR_OSCOUNT & (64 << 8))
#define BOARD_CKGR_PLLA         (AT91C_CKGR_SRCA | AT91C_CKGR_OUTA_0)
#define BOARD_PLLACOUNT         (0x3F << 8)
#define BOARD_MULA              (AT91C_CKGR_MULA & (0x2A << 16))
#define BOARD_DIVA              (AT91C_CKGR_DIVA & 1)
//#define BOARD_PRESCALER         0x00000204//(0x00001300) PRES=2,MDIV=4,PDIV=1 
#define BOARD_PRESCALER         (0x00001300) //PRES=0,MDIV=3,PDIV=1
#define BOARD_USBDIV            AT91C_CKGR_USBDIV_1
#define BOARD_CKGR_PLLB         AT91C_CKGR_OUTB_0
#define BOARD_PLLBCOUNT         BOARD_PLLACOUNT
#define BOARD_MULB              (25 << 16)
#define BOARD_DIVB              5

//------------------------------------------------------------------------------
//         Internal functions
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
/// Default spurious interrupt handler. Infinite loop.
//------------------------------------------------------------------------------
void defaultSpuriousHandler( void )
{
    while (1);
}

//------------------------------------------------------------------------------
/// Default handler for fast interrupt requests. Infinite loop.
//------------------------------------------------------------------------------
void defaultFiqHandler( void )
{
    while (1);
}

//------------------------------------------------------------------------------
/// Default handler for standard interrupt requests. Infinite loop.
//------------------------------------------------------------------------------
void defaultIrqHandler( void )
{
    while (1);
}

//------------------------------------------------------------------------------
//         Exported functions
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
/// Performs the low-level initialization of the chip. Initialisation depends
/// on where the application is executed: 
/// - in sdram: it means that sdram has previously been initialized. No further
///             initialization is required.
/// - in sram:  PLL shall be initialized in LowLevelInit. Other initializations 
///             can be done later by the application.
/// - in norflash: LowLevelInit can't be executed in norflash because SMC 
///             settings can't be changed while executing in external flash.
///             LowLevelInit shall be executed in internal sram. It initializes
///             PLL and SMC. 
/// This function also reset the AIC and disable RTT and PIT interrupts
//------------------------------------------------------------------------------
void LowLevelInit(void)
{
    unsigned char i,j;
/*
_start:
@ (*((volatile unsigned long *) 0xFFFFF600))=0x00000100;	//PIOER
@  (*((volatile unsigned long *) 0xFFFFF610))=0x0100;	
	ldr r0,=0xfffff600
        ldr r1,=0x0100
	str r1,[r0]

	ldr r0,=0xfffff610
	str r1,[r0]
@	(*((volatile unsigned long *) 0xFFFFF630))=0x00008000;	   //off
@	(*((volatile unsigned long *) 0xFFFFF634))=0x00008000;	   //on

	ldr r0,=0xfffff630
test:	
	str r1,[r0,#4]		@on
	
	ldr r2,=0x100
1:
	subs r2,r2,#1		
	bne 1b

	str r1,[r0]		@off
	
	ldr r2,=0x100
2:
	subs r2,r2,#1		
	bne 2b
	b test

@	copy from 0x10001000 to 0x200000 the length is 4k	
	ldr r6,=0x201000
	ldr r3,=0x10001000
	ldr r4,=0x200000
1:	ldr r5,[r3],#4
	str r5,[r4],#4
	cmp r4,r6
	bcc 1b
	ldr pc,=0x200000
*/
	(*((volatile unsigned long *) 0xFFFFF600))=0x00000100;	//PIOER
	(*((volatile unsigned long *) 0xFFFFF610))=0x0100;	

	//while(1)
	{	

		
		(*((volatile unsigned long *) 0xFFFFF634))=0x00000100;	   //on
	}
#if !defined(sdram)
    /* Initialize main oscillator
     ****************************/
    AT91C_BASE_PMC->PMC_MOR = BOARD_OSCOUNT | AT91C_CKGR_MOSCEN;
    while (!(AT91C_BASE_PMC->PMC_SR & AT91C_PMC_MOSCS));
//is here
    /* Initialize PLLA at 200MHz (198.656) */
    AT91C_BASE_PMC->PMC_PLLAR = BOARD_CKGR_PLLA
                                | BOARD_PLLACOUNT
                                | BOARD_MULA
                                | BOARD_DIVA;
    while (!(AT91C_BASE_PMC->PMC_SR & AT91C_PMC_LOCKA));

    // Initialize PLLB for USB usage (if not already locked)
    if (!(AT91C_BASE_PMC->PMC_SR & AT91C_PMC_LOCKB)) {
        AT91C_BASE_PMC->PMC_PLLBR = BOARD_USBDIV
                                    | BOARD_CKGR_PLLB
                                    | BOARD_PLLBCOUNT
                                    | BOARD_MULB
                                    | BOARD_DIVB;
        while (!(AT91C_BASE_PMC->PMC_SR & AT91C_PMC_LOCKB));
    }

    /* Wait for the master clock if it was already initialized */
    while (!(AT91C_BASE_PMC->PMC_SR & AT91C_PMC_MCKRDY));
//is here
    /* Switch to fast clock
     **********************/
    /* Switch to main oscillator + prescaler */
   // AT91C_BASE_PMC->PMC_MCKR = BOARD_PRESCALER;
    //while (!(AT91C_BASE_PMC->PMC_SR & AT91C_PMC_MCKRDY));
//is here
//(*((volatile unsigned long *) 0xFFFFF630))=0x00000100;	   //off
    /* Switch to PLL + prescaler */
    AT91C_BASE_PMC->PMC_MCKR |= 1;//AT91C_PMC_CSS_PLLA_CLK;	  
    while (!(AT91C_BASE_PMC->PMC_SR & AT91C_PMC_MCKRDY));
//while(1);
    AT91C_BASE_PMC->PMC_MCKR = BOARD_PRESCALER|1;
    while (!(AT91C_BASE_PMC->PMC_SR & AT91C_PMC_MCKRDY));

    AT91C_BASE_PMC->PMC_MCKR =0x00001302;//0x206;//|= AT91C_PMC_CSS_PLLA_CLK&0xfffffffe;	  
    while (!(AT91C_BASE_PMC->PMC_SR & AT91C_PMC_MCKRDY));

//is not here
(*((volatile unsigned long *) 0xFFFFF630))=0x00000100;	   //off
//while(1);
#endif
//is not here
    /* Initialize AIC
     ****************/
    AT91C_BASE_AIC->AIC_IDCR = 0xFFFFFFFF;
    AT91C_BASE_AIC->AIC_SVR[0] = (unsigned int) defaultFiqHandler;
    for (i = 1; i < 31; i++) {

        AT91C_BASE_AIC->AIC_SVR[i] = (unsigned int) defaultIrqHandler;
    }
    AT91C_BASE_AIC->AIC_SPU = (unsigned int) defaultSpuriousHandler;

    // Unstack nested interrupts
    for (i = 0; i < 8 ; i++) {

        AT91C_BASE_AIC->AIC_EOICR = 0;
    }


    /* Watchdog initialization
     *************************/
    AT91C_BASE_WDTC->WDTC_WDMR = AT91C_WDTC_WDDIS;

    /* Remap
     *******/

    BOARD_RemapRam();

    // Disable RTT and PIT interrupts (potential problem when program A
    // configures RTT, then program B wants to use PIT only, interrupts
    // from the RTT will still occur since they both use AT91C_ID_SYS)
    AT91C_BASE_RTTC->RTTC_RTMR &= ~(AT91C_RTTC_ALMIEN | AT91C_RTTC_RTTINCIEN);
    AT91C_BASE_PITC->PITC_PIMR &= ~AT91C_PITC_PITIEN;
    
#if defined(norflash)
    BOARD_ConfigureNorFlash(BOARD_NORFLASH_DFT_BUS_SIZE);
#endif    
}

