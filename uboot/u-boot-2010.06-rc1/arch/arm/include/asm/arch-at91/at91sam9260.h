/*
 * [origin: Linux kernel include/asm-arm/arch-at91/at91sam9260.h]
 *
 * (C) 2006 Andrew Victor
 *
 * Common definitions.
 * Based on AT91SAM9260 datasheet revision A (Preliminary).
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 */

#ifndef AT91SAM9260_H
#define AT91SAM9260_H

/*
 * Peripheral identifiers/interrupts.
 */
#define AT91_ID_FIQ		0	/* Advanced Interrupt Controller (FIQ) */
#define AT91_ID_SYS		1	/* System Peripherals */
#define AT91SAM9260_ID_PIOA	2	/* Parallel IO Controller A */
#define AT91SAM9260_ID_PIOB	3	/* Parallel IO Controller B */
#define AT91SAM9260_ID_PIOC	4	/* Parallel IO Controller C */
#define AT91SAM9260_ID_ADC	5	/* Analog-to-Digital Converter */
#define AT91SAM9260_ID_US0	6	/* USART 0 */
#define AT91SAM9260_ID_US1	7	/* USART 1 */
#define AT91SAM9260_ID_US2	8	/* USART 2 */
#define AT91SAM9260_ID_MCI	9	/* Multimedia Card Interface */
#define AT91SAM9260_ID_UDP	10	/* USB Device Port */
#define AT91SAM9260_ID_TWI	11	/* Two-Wire Interface */
#define AT91SAM9260_ID_SPI0	12	/* Serial Peripheral Interface 0 */
#define AT91SAM9260_ID_SPI1	13	/* Serial Peripheral Interface 1 */
#define AT91SAM9260_ID_SSC	14	/* Serial Synchronous Controller */
#define AT91SAM9260_ID_TC0	17	/* Timer Counter 0 */
#define AT91SAM9260_ID_TC1	18	/* Timer Counter 1 */
#define AT91SAM9260_ID_TC2	19	/* Timer Counter 2 */
#define AT91SAM9260_ID_UHP	20	/* USB Host port */
#define AT91SAM9260_ID_EMAC	21	/* Ethernet */
#define AT91SAM9260_ID_ISI	22	/* Image Sensor Interface */
#define AT91SAM9260_ID_US3	23	/* USART 3 */
#define AT91SAM9260_ID_US4	24	/* USART 4 */
#define AT91SAM9260_ID_US5	25	/* USART 5 */
#define AT91SAM9260_ID_TC3	26	/* Timer Counter 3 */
#define AT91SAM9260_ID_TC4	27	/* Timer Counter 4 */
#define AT91SAM9260_ID_TC5	28	/* Timer Counter 5 */
#define AT91SAM9260_ID_IRQ0	29	/* Advanced Interrupt Controller (IRQ0) */
#define AT91SAM9260_ID_IRQ1	30	/* Advanced Interrupt Controller (IRQ1) */
#define AT91SAM9260_ID_IRQ2	31	/* Advanced Interrupt Controller (IRQ2) */

#define AT91_EMAC_BASE		0xfffc4000
#define AT91_SDRAMC_BASE	0xffffea00
#define AT91_SMC_BASE		0xffffec00
#define AT91_MATRIX_BASE	0xffffee00
#define AT91_PIO_BASE		0xfffff400
#define AT91_PMC_BASE		0xfffffc00
#define AT91_RSTC_BASE		0xfffffd00
#define AT91_RTT_BASE		0xfffffd20
#define AT91_PIT_BASE		0xfffffd30
#define AT91_WDT_BASE		0xfffffd40
#define AT91_GPR_BASE		0xfffffd50

#ifdef CONFIG_AT91_LEGACY

/*
 * User Peripheral physical base addresses.
 */
#define AT91SAM9260_BASE_TCB0		0xfffa0000
#define AT91SAM9260_BASE_TC0		0xfffa0000
#define AT91SAM9260_BASE_TC1		0xfffa0040
#define AT91SAM9260_BASE_TC2		0xfffa0080
#define AT91SAM9260_BASE_UDP		0xfffa4000
#define AT91SAM9260_BASE_MCI		0xfffa8000
#define AT91SAM9260_BASE_TWI		0xfffac000
#define AT91SAM9260_BASE_US0		0xfffb0000
#define AT91SAM9260_BASE_US1		0xfffb4000
#define AT91SAM9260_BASE_US2		0xfffb8000
#define AT91SAM9260_BASE_SSC		0xfffbc000
#define AT91SAM9260_BASE_ISI		0xfffc0000
#define AT91SAM9260_BASE_EMAC		0xfffc4000
#define AT91SAM9260_BASE_SPI0		0xfffc8000
#define AT91SAM9260_BASE_SPI1		0xfffcc000
#define AT91SAM9260_BASE_US3		0xfffd0000
#define AT91SAM9260_BASE_US4		0xfffd4000
#define AT91SAM9260_BASE_US5		0xfffd8000
#define AT91SAM9260_BASE_TCB1		0xfffdc000
#define AT91SAM9260_BASE_TC3		0xfffdc000
#define AT91SAM9260_BASE_TC4		0xfffdc040
#define AT91SAM9260_BASE_TC5		0xfffdc080
#define AT91SAM9260_BASE_ADC		0xfffe0000
#define AT91_BASE_SYS			0xffffe800

/*
 * System Peripherals (offset from AT91_BASE_SYS)
 */
#define AT91_ECC	(0xffffe800 - AT91_BASE_SYS)
#define AT91_SDRAMC	(0xffffea00 - AT91_BASE_SYS)
#define AT91_SMC	(0xffffec00 - AT91_BASE_SYS)
#define AT91_MATRIX	(0xffffee00 - AT91_BASE_SYS)
#define AT91_CCFG	(0xffffef10 - AT91_BASE_SYS)
#define AT91_AIC	(0xfffff000 - AT91_BASE_SYS)
#define AT91_DBGU	(0xfffff200 - AT91_BASE_SYS)
#define AT91_PIOA	(0xfffff400 - AT91_BASE_SYS)
#define AT91_PIOB	(0xfffff600 - AT91_BASE_SYS)
#define AT91_PIOC	(0xfffff800 - AT91_BASE_SYS)
#define AT91_PMC	(0xfffffc00 - AT91_BASE_SYS)
#define AT91_RSTC	(0xfffffd00 - AT91_BASE_SYS)
#define AT91_SHDWC	(0xfffffd10 - AT91_BASE_SYS)
#define AT91_RTT	(0xfffffd20 - AT91_BASE_SYS)
#define AT91_PIT	(0xfffffd30 - AT91_BASE_SYS)
#define AT91_WDT	(0xfffffd40 - AT91_BASE_SYS)
#define AT91_GPBR	(0xfffffd50 - AT91_BASE_SYS)

#define AT91_USART0	AT91SAM9260_BASE_US0
#define AT91_USART1	AT91SAM9260_BASE_US1
#define AT91_USART2	AT91SAM9260_BASE_US2
#define AT91_USART3	AT91SAM9260_BASE_US3
#define AT91_USART4	AT91SAM9260_BASE_US4
#define AT91_USART5	AT91SAM9260_BASE_US5

#endif /* CONFIG_AT91_LEGACY */
typedef volatile unsigned int AT91_REG;// Hardware register definition
/******************add by djc001 @20100710*******************/
typedef struct _AT91S_SPI {
	AT91_REG	 SPI_CR; 	// Control Register
	AT91_REG	 SPI_MR; 	// Mode Register
	AT91_REG	 SPI_RDR; 	// Receive Data Register
	AT91_REG	 SPI_TDR; 	// Transmit Data Register
	AT91_REG	 SPI_SR; 	// Status Register
	AT91_REG	 SPI_IER; 	// Interrupt Enable Register
	AT91_REG	 SPI_IDR; 	// Interrupt Disable Register
	AT91_REG	 SPI_IMR; 	// Interrupt Mask Register
	AT91_REG	 Reserved0[4]; 	// 
	AT91_REG	 SPI_CSR[4]; 	// Chip Select Register
	AT91_REG	 Reserved1[48]; 	// 
	AT91_REG	 SPI_RPR; 	// Receive Pointer Register
	AT91_REG	 SPI_RCR; 	// Receive Counter Register
	AT91_REG	 SPI_TPR; 	// Transmit Pointer Register
	AT91_REG	 SPI_TCR; 	// Transmit Counter Register
	AT91_REG	 SPI_RNPR; 	// Receive Next Pointer Register
	AT91_REG	 SPI_RNCR; 	// Receive Next Counter Register
	AT91_REG	 SPI_TNPR; 	// Transmit Next Pointer Register
	AT91_REG	 SPI_TNCR; 	// Transmit Next Counter Register
	AT91_REG	 SPI_PTCR; 	// PDC Transfer Control Register
	AT91_REG	 SPI_PTSR; 	// PDC Transfer Status Register
} AT91S_SPI, *AT91PS_SPI;

typedef struct _AT91S_PIO {
	AT91_REG	lPIO_PER; 	// PIO Enable Register
	AT91_REG	lPIO_PDR; 	// PIO Disable Register
	AT91_REG	lPIO_PSR; 	// PIO Status Register
	AT91_REG	lReserved0[1]; 	// 
	AT91_REG	lPIO_OER; 	// Output Enable Register
	AT91_REG	lPIO_ODR; 	// Output Disable Registerr
	AT91_REG	lPIO_OSR; 	// Output Status Register
	AT91_REG	lReserved1[1]; 	// 
	AT91_REG	lPIO_IFER; 	// Input Filter Enable Register
	AT91_REG	lPIO_IFDR; 	// Input Filter Disable Register
	AT91_REG	lPIO_IFSR; 	// Input Filter Status Register
	AT91_REG	lReserved2[1]; 	// 
	AT91_REG	lPIO_SODR; 	// Set Output Data Register
	AT91_REG	lPIO_CODR; 	// Clear Output Data Register
	AT91_REG	lPIO_ODSR; 	// Output Data Status Register
	AT91_REG	lPIO_PDSR; 	// Pin Data Status Register
	AT91_REG	lPIO_IER; 	// Interrupt Enable Register
	AT91_REG	lPIO_IDR; 	// Interrupt Disable Register
	AT91_REG	lPIO_IMR; 	// Interrupt Mask Register
	AT91_REG	lPIO_ISR; 	// Interrupt Status Register
	AT91_REG	lPIO_MDER; 	// Multi-driver Enable Register
	AT91_REG	lPIO_MDDR; 	// Multi-driver Disable Register
	AT91_REG	lPIO_MDSR; 	// Multi-driver Status Register
	AT91_REG	lReserved3[1]; 	// 
	AT91_REG	lPIO_PPUDR; 	// Pull-up Disable Register
	AT91_REG	lPIO_PPUER; 	// Pull-up Enable Register
	AT91_REG	lPIO_PPUSR; 	// Pull-up Status Register
	AT91_REG	lReserved4[1]; 	// 
	AT91_REG	lPIO_ASR; 	// Select A Register
	AT91_REG	lPIO_BSR; 	// Select B Register
	AT91_REG	lPIO_ABSR; 	// AB Select Status Register
	AT91_REG	lReserved5[9]; 	// 
	AT91_REG	lPIO_OWER; 	// Output Write Enable Register
	AT91_REG	lPIO_OWDR; 	// Output Write Disable Register
	AT91_REG	lPIO_OWSR; 	// Output Write Status Register
} AT91S_PIO, *AT91PS_PIO;

// -------- SPI_CR : (SPI Offset: 0x0) SPI Control Register -------- 
#define AT91C_SPI_SPIEN       ((unsigned int) 0x1 <<  0) // (SPI) SPI Enable
#define AT91C_SPI_SPIDIS      ((unsigned int) 0x1 <<  1) // (SPI) SPI Disable
#define AT91C_SPI_SWRST       ((unsigned int) 0x1 <<  7) // (SPI) SPI Software reset
#define AT91C_SPI_LASTXFER    ((unsigned int) 0x1 << 24) // (SPI) SPI Last Transfer
// -------- SPI_MR : (SPI Offset: 0x4) SPI Mode Register -------- 
#define AT91C_SPI_MSTR        ((unsigned int) 0x1 <<  0) // (SPI) Master/Slave Mode
#define AT91C_SPI_PS          ((unsigned int) 0x1 <<  1) // (SPI) Peripheral Select
#define 	AT91C_SPI_PS_FIXED                ((unsigned int) 0x0 <<  1) // (SPI) Fixed Peripheral Select
#define 	AT91C_SPI_PS_VARIABLE             ((unsigned int) 0x1 <<  1) // (SPI) Variable Peripheral Select
#define AT91C_SPI_PCSDEC      ((unsigned int) 0x1 <<  2) // (SPI) Chip Select Decode
#define AT91C_SPI_FDIV        ((unsigned int) 0x1 <<  3) // (SPI) Clock Selection
#define AT91C_SPI_MODFDIS     ((unsigned int) 0x1 <<  4) // (SPI) Mode Fault Detection
#define AT91C_SPI_LLB         ((unsigned int) 0x1 <<  7) // (SPI) Clock Selection
#define AT91C_SPI_PCS         ((unsigned int) 0xF << 16) // (SPI) Peripheral Chip Select
#define AT91C_SPI_DLYBCS      ((unsigned int) 0xFF << 24) // (SPI) Delay Between Chip Selects
// -------- SPI_RDR : (SPI Offset: 0x8) Receive Data Register -------- 
#define AT91C_SPI_RD          ((unsigned int) 0xFFFF <<  0) // (SPI) Receive Data
#define AT91C_SPI_RPCS        ((unsigned int) 0xF << 16) // (SPI) Peripheral Chip Select Status
// -------- SPI_TDR : (SPI Offset: 0xc) Transmit Data Register -------- 
#define AT91C_SPI_TD          ((unsigned int) 0xFFFF <<  0) // (SPI) Transmit Data
#define AT91C_SPI_TPCS        ((unsigned int) 0xF << 16) // (SPI) Peripheral Chip Select Status
// -------- SPI_SR : (SPI Offset: 0x10) Status Register -------- 
#define AT91C_SPI_RDRF        ((unsigned int) 0x1 <<  0) // (SPI) Receive Data Register Full
#define AT91C_SPI_TDRE        ((unsigned int) 0x1 <<  1) // (SPI) Transmit Data Register Empty
#define AT91C_SPI_MODF        ((unsigned int) 0x1 <<  2) // (SPI) Mode Fault Error
#define AT91C_SPI_OVRES       ((unsigned int) 0x1 <<  3) // (SPI) Overrun Error Status
#define AT91C_SPI_ENDRX       ((unsigned int) 0x1 <<  4) // (SPI) End of Receiver Transfer
#define AT91C_SPI_ENDTX       ((unsigned int) 0x1 <<  5) // (SPI) End of Receiver Transfer
#define AT91C_SPI_RXBUFF      ((unsigned int) 0x1 <<  6) // (SPI) RXBUFF Interrupt
#define AT91C_SPI_TXBUFE      ((unsigned int) 0x1 <<  7) // (SPI) TXBUFE Interrupt
#define AT91C_SPI_NSSR        ((unsigned int) 0x1 <<  8) // (SPI) NSSR Interrupt
#define AT91C_SPI_TXEMPTY     ((unsigned int) 0x1 <<  9) // (SPI) TXEMPTY Interrupt
#define AT91C_SPI_SPIENS      ((unsigned int) 0x1 << 16) // (SPI) Enable Status
// -------- SPI_IER : (SPI Offset: 0x14) Interrupt Enable Register -------- 
// -------- SPI_IDR : (SPI Offset: 0x18) Interrupt Disable Register -------- 
// -------- SPI_IMR : (SPI Offset: 0x1c) Interrupt Mask Register -------- 
// -------- SPI_CSR : (SPI Offset: 0x30) Chip Select Register -------- 
#define AT91C_SPI_CPOL        ((unsigned int) 0x1 <<  0) // (SPI) Clock Polarity
#define AT91C_SPI_NCPHA       ((unsigned int) 0x1 <<  1) // (SPI) Clock Phase
#define AT91C_SPI_CSAAT       ((unsigned int) 0x1 <<  3) // (SPI) Chip Select Active After Transfer
#define AT91C_SPI_BITS        ((unsigned int) 0xF <<  4) // (SPI) Bits Per Transfer
#define 	AT91C_SPI_BITS_8                    ((unsigned int) 0x0 <<  4) // (SPI) 8 Bits Per transfer
#define 	AT91C_SPI_BITS_9                    ((unsigned int) 0x1 <<  4) // (SPI) 9 Bits Per transfer
#define 	AT91C_SPI_BITS_10                   ((unsigned int) 0x2 <<  4) // (SPI) 10 Bits Per transfer
#define 	AT91C_SPI_BITS_11                   ((unsigned int) 0x3 <<  4) // (SPI) 11 Bits Per transfer
#define 	AT91C_SPI_BITS_12                   ((unsigned int) 0x4 <<  4) // (SPI) 12 Bits Per transfer
#define 	AT91C_SPI_BITS_13                   ((unsigned int) 0x5 <<  4) // (SPI) 13 Bits Per transfer
#define 	AT91C_SPI_BITS_14                   ((unsigned int) 0x6 <<  4) // (SPI) 14 Bits Per transfer
#define 	AT91C_SPI_BITS_15                   ((unsigned int) 0x7 <<  4) // (SPI) 15 Bits Per transfer
#define 	AT91C_SPI_BITS_16                   ((unsigned int) 0x8 <<  4) // (SPI) 16 Bits Per transfer
#define AT91C_SPI_SCBR        ((unsigned int) 0xFF <<  8) // (SPI) Serial Clock Baud Rate
#define AT91C_SPI_DLYBS       ((unsigned int) 0xFF << 16) // (SPI) Delay Before SPCK
#define AT91C_SPI_DLYBCT      ((unsigned int) 0xFF << 24) // (SPI) Delay Between Consecutive Transfers


/*
 * Internal Memory.
 */
#define AT91SAM9260_ROM_BASE	0x00100000	/* Internal ROM base address */
#define AT91SAM9260_ROM_SIZE	SZ_32K		/* Internal ROM size (32Kb) */

#define AT91SAM9260_SRAM0_BASE	0x00200000	/* Internal SRAM 0 base address */
#define AT91SAM9260_SRAM0_SIZE	SZ_4K		/* Internal SRAM 0 size (4Kb) */
#define AT91SAM9260_SRAM1_BASE	0x00300000	/* Internal SRAM 1 base address */
#define AT91SAM9260_SRAM1_SIZE	SZ_4K		/* Internal SRAM 1 size (4Kb) */

#define AT91SAM9260_UHP_BASE	0x00500000	/* USB Host controller */

#define AT91SAM9XE_FLASH_BASE	0x00200000	/* Internal FLASH base address */
#define AT91SAM9XE_SRAM_BASE	0x00300000	/* Internal SRAM base address */

/*
 * Cpu Name
 */
#if defined(CONFIG_AT91SAM9260)
#define CONFIG_SYS_AT91_CPU_NAME	"AT91SAM9260"
#elif defined(CONFIG_AT91SAM9G20)
#define CONFIG_SYS_AT91_CPU_NAME	"AT91SAM9G20"
#endif

#endif
