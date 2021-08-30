
./bin/boot-at91sam9g20-ek-norflash2sdram.elf:     file format elf32-littlearm

Disassembly of section .prerelocate:

00200000 <defaultSpuriousHandler>:
  200000:	eafffffe 	b	200000 <defaultSpuriousHandler>

00200004 <defaultFiqHandler>:
  200004:	eafffffe 	b	200004 <defaultFiqHandler>

00200008 <defaultIrqHandler>:
  200008:	eafffffe 	b	200008 <defaultIrqHandler>

0020000c <LowLevelInit>:
  20000c:	e92d4010 	push	{r4, lr}
  200010:	e3a03901 	mov	r3, #16384	; 0x4000
  200014:	e2833001 	add	r3, r3, #1	; 0x1
  200018:	e3e02c03 	mvn	r2, #768	; 0x300
  20001c:	e50230df 	str	r3, [r2, #-223]
  200020:	e5123097 	ldr	r3, [r2, #-151]
  200024:	e3130001 	tst	r3, #1	; 0x1
  200028:	e3e01c03 	mvn	r1, #768	; 0x300
  20002c:	0afffffb 	beq	200020 <LowLevelInit+0x14>
  200030:	e3a03212 	mov	r3, #536870913	; 0x20000001
  200034:	e283382a 	add	r3, r3, #2752512	; 0x2a0000
  200038:	e2833c3f 	add	r3, r3, #16128	; 0x3f00
  20003c:	e50130d7 	str	r3, [r1, #-215]
  200040:	e5113097 	ldr	r3, [r1, #-151]
  200044:	e3130002 	tst	r3, #2	; 0x2
  200048:	e3e02c03 	mvn	r2, #768	; 0x300
  20004c:	0afffffb 	beq	200040 <LowLevelInit+0x34>
  200050:	e5123097 	ldr	r3, [r2, #-151]
  200054:	e3130004 	tst	r3, #4	; 0x4
  200058:	1a000006 	bne	200078 <LowLevelInit+0x6c>
  20005c:	e3a03819 	mov	r3, #1638400	; 0x190000
  200060:	e2833c3f 	add	r3, r3, #16128	; 0x3f00
  200064:	e2833251 	add	r3, r3, #268435461	; 0x10000005
  200068:	e50230d3 	str	r3, [r2, #-211]
  20006c:	e5123097 	ldr	r3, [r2, #-151]
  200070:	e3130004 	tst	r3, #4	; 0x4
  200074:	0afffffc 	beq	20006c <LowLevelInit+0x60>
  200078:	e3e01c03 	mvn	r1, #768	; 0x300
  20007c:	e5113097 	ldr	r3, [r1, #-151]
  200080:	e3130008 	tst	r3, #8	; 0x8
  200084:	e3e02c03 	mvn	r2, #768	; 0x300
  200088:	0afffffb 	beq	20007c <LowLevelInit+0x70>
  20008c:	e3a03c13 	mov	r3, #4864	; 0x1300
  200090:	e50230cf 	str	r3, [r2, #-207]
  200094:	e1a01002 	mov	r1, r2
  200098:	e5113097 	ldr	r3, [r1, #-151]
  20009c:	e3130008 	tst	r3, #8	; 0x8
  2000a0:	e3e02c03 	mvn	r2, #768	; 0x300
  2000a4:	0afffffb 	beq	200098 <LowLevelInit+0x8c>
  2000a8:	e51230cf 	ldr	r3, [r2, #-207]
  2000ac:	e3833002 	orr	r3, r3, #2	; 0x2
  2000b0:	e50230cf 	str	r3, [r2, #-207]
  2000b4:	e5123097 	ldr	r3, [r2, #-151]
  2000b8:	e3130008 	tst	r3, #8	; 0x8
  2000bc:	0afffffc 	beq	2000b4 <LowLevelInit+0xa8>
  2000c0:	e59f109c 	ldr	r1, [pc, #156]	; 200164 <LowLevelInit+0x158>
  2000c4:	e3e03c0f 	mvn	r3, #3840	; 0xf00
  2000c8:	e3e02000 	mvn	r2, #0	; 0x0
  2000cc:	e5832025 	str	r2, [r3, #37]
  2000d0:	e59f0090 	ldr	r0, [pc, #144]	; 200168 <LowLevelInit+0x15c>
  2000d4:	e503107f 	str	r1, [r3, #-127]
  2000d8:	e2822002 	add	r2, r2, #2	; 0x2
  2000dc:	e1a03102 	lsl	r3, r2, #2
  2000e0:	e2822001 	add	r2, r2, #1	; 0x1
  2000e4:	e2433d3e 	sub	r3, r3, #3968	; 0xf80
  2000e8:	e352001f 	cmp	r2, #31	; 0x1f
  2000ec:	e5830000 	str	r0, [r3]
  2000f0:	e3e01c0f 	mvn	r1, #3840	; 0xf00
  2000f4:	1afffff8 	bne	2000dc <LowLevelInit+0xd0>
  2000f8:	e59f306c 	ldr	r3, [pc, #108]	; 20016c <LowLevelInit+0x160>
  2000fc:	e5813035 	str	r3, [r1, #53]
  200100:	e3a03000 	mov	r3, #0	; 0x0
  200104:	e1a02003 	mov	r2, r3
  200108:	e2833001 	add	r3, r3, #1	; 0x1
  20010c:	e20330ff 	and	r3, r3, #255	; 0xff
  200110:	e3530008 	cmp	r3, #8	; 0x8
  200114:	e5812031 	str	r2, [r1, #49]
  200118:	1afffffa 	bne	200108 <LowLevelInit+0xfc>
  20011c:	e3e04c02 	mvn	r4, #512	; 0x200
  200120:	e3a03902 	mov	r3, #32768	; 0x8000
  200124:	e50430bb 	str	r3, [r4, #-187]
  200128:	e59f2040 	ldr	r2, [pc, #64]	; 200170 <LowLevelInit+0x164>
  20012c:	e1a0e00f 	mov	lr, pc
  200130:	e12fff12 	bx	r2
  200134:	e51430df 	ldr	r3, [r4, #-223]
  200138:	e3c33803 	bic	r3, r3, #196608	; 0x30000
  20013c:	e50430df 	str	r3, [r4, #-223]
  200140:	e51420cf 	ldr	r2, [r4, #-207]
  200144:	e3c22402 	bic	r2, r2, #33554432	; 0x2000000
  200148:	e3a00010 	mov	r0, #16	; 0x10
  20014c:	e50420cf 	str	r2, [r4, #-207]
  200150:	e59f301c 	ldr	r3, [pc, #28]	; 200174 <LowLevelInit+0x168>
  200154:	e1a0e00f 	mov	lr, pc
  200158:	e12fff13 	bx	r3
  20015c:	e8bd4010 	pop	{r4, lr}
  200160:	e12fff1e 	bx	lr
  200164:	00200004 	.word	0x00200004
  200168:	00200008 	.word	0x00200008
  20016c:	00200000 	.word	0x00200000
  200170:	00200178 	.word	0x00200178
  200174:	00200188 	.word	0x00200188

00200178 <BOARD_RemapRam>:
  200178:	e3a02003 	mov	r2, #3	; 0x3
  20017c:	e3e03c11 	mvn	r3, #4352	; 0x1100
  200180:	e5832001 	str	r2, [r3, #1]
  200184:	e12fff1e 	bx	lr

00200188 <BOARD_ConfigureNorFlash>:
  200188:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
  20018c:	e3a0180a 	mov	r1, #655360	; 0xa0000
  200190:	e1a04000 	mov	r4, r0
  200194:	e59f205c 	ldr	r2, [pc, #92]	; 2001f8 <BOARD_ConfigureNorFlash+0x70>
  200198:	e3a00801 	mov	r0, #65536	; 0x10000
  20019c:	e3e0cc13 	mvn	ip, #4864	; 0x1300
  2001a0:	e3a03002 	mov	r3, #2	; 0x2
  2001a4:	e281100a 	add	r1, r1, #10	; 0xa
  2001a8:	e2800003 	add	r0, r0, #3	; 0x3
  2001ac:	e50c30ff 	str	r3, [ip, #-255]
  2001b0:	e50c20fb 	str	r2, [ip, #-251]
  2001b4:	e50c10f7 	str	r1, [ip, #-247]
  2001b8:	e50c00f3 	str	r0, [ip, #-243]
  2001bc:	e3540008 	cmp	r4, #8	; 0x8
  2001c0:	051c30f3 	ldreq	r3, [ip, #-243]
  2001c4:	050c30f3 	streq	r3, [ip, #-243]
  2001c8:	0a000008 	beq	2001f0 <BOARD_ConfigureNorFlash+0x68>
  2001cc:	e3540010 	cmp	r4, #16	; 0x10
  2001d0:	051c30f3 	ldreq	r3, [ip, #-243]
  2001d4:	03833a01 	orreq	r3, r3, #4096	; 0x1000
  2001d8:	050c30f3 	streq	r3, [ip, #-243]
  2001dc:	0a000003 	beq	2001f0 <BOARD_ConfigureNorFlash+0x68>
  2001e0:	e3540020 	cmp	r4, #32	; 0x20
  2001e4:	051c30f3 	ldreq	r3, [ip, #-243]
  2001e8:	03833a02 	orreq	r3, r3, #8192	; 0x2000
  2001ec:	050c30f3 	streq	r3, [ip, #-243]
  2001f0:	e8bd0010 	pop	{r4}
  2001f4:	e12fff1e 	bx	lr
  2001f8:	0a0a0a06 	.word	0x0a0a0a06

002001fc <BOARD_ConfigureSdram>:
  2001fc:	e92d4010 	push	{r4, lr}
  200200:	e59f3158 	ldr	r3, [pc, #344]	; 200360 <BOARD_ConfigureSdram+0x164>
  200204:	e3500010 	cmp	r0, #16	; 0x10
  200208:	e24dd008 	sub	sp, sp, #8	; 0x8
  20020c:	e59f4150 	ldr	r4, [pc, #336]	; 200364 <BOARD_ConfigureSdram+0x168>
  200210:	e3a01001 	mov	r1, #1	; 0x1
  200214:	11a04003 	movne	r4, r3
  200218:	e59f0148 	ldr	r0, [pc, #328]	; 200368 <BOARD_ConfigureSdram+0x16c>
  20021c:	e59f3148 	ldr	r3, [pc, #328]	; 20036c <BOARD_ConfigureSdram+0x170>
  200220:	e1a0e00f 	mov	lr, pc
  200224:	e12fff13 	bx	r3
  200228:	e3e03c11 	mvn	r3, #4352	; 0x1100
  20022c:	e3a01002 	mov	r1, #2	; 0x2
  200230:	e583101d 	str	r1, [r3, #29]
  200234:	e3e02c15 	mvn	r2, #5376	; 0x1500
  200238:	e3a03000 	mov	r3, #0	; 0x0
  20023c:	e50240f7 	str	r4, [r2, #-247]
  200240:	e58d3004 	str	r3, [sp, #4]
  200244:	e59d2004 	ldr	r2, [sp, #4]
  200248:	e2833ff9 	add	r3, r3, #996	; 0x3e4
  20024c:	e2833003 	add	r3, r3, #3	; 0x3
  200250:	e1520003 	cmp	r2, r3
  200254:	8a000006 	bhi	200274 <BOARD_ConfigureSdram+0x78>
  200258:	e1a01003 	mov	r1, r3
  20025c:	e59d3004 	ldr	r3, [sp, #4]
  200260:	e2833001 	add	r3, r3, #1	; 0x1
  200264:	e58d3004 	str	r3, [sp, #4]
  200268:	e59d2004 	ldr	r2, [sp, #4]
  20026c:	e1520001 	cmp	r2, r1
  200270:	9afffff9 	bls	20025c <BOARD_ConfigureSdram+0x60>
  200274:	e3e01c15 	mvn	r1, #5376	; 0x1500
  200278:	e3a03001 	mov	r3, #1	; 0x1
  20027c:	e50130ff 	str	r3, [r1, #-255]
  200280:	e3a02000 	mov	r2, #0	; 0x0
  200284:	e3a00202 	mov	r0, #536870912	; 0x20000000
  200288:	e0833003 	add	r3, r3, r3
  20028c:	e5802000 	str	r2, [r0]
  200290:	e50130ff 	str	r3, [r1, #-255]
  200294:	e5802000 	str	r2, [r0]
  200298:	e58d2004 	str	r2, [sp, #4]
  20029c:	e59d3004 	ldr	r3, [sp, #4]
  2002a0:	e2822c27 	add	r2, r2, #9984	; 0x2700
  2002a4:	e282200f 	add	r2, r2, #15	; 0xf
  2002a8:	e1530002 	cmp	r3, r2
  2002ac:	8a000006 	bhi	2002cc <BOARD_ConfigureSdram+0xd0>
  2002b0:	e1a01002 	mov	r1, r2
  2002b4:	e59d3004 	ldr	r3, [sp, #4]
  2002b8:	e2833001 	add	r3, r3, #1	; 0x1
  2002bc:	e58d3004 	str	r3, [sp, #4]
  2002c0:	e59d2004 	ldr	r2, [sp, #4]
  2002c4:	e1520001 	cmp	r2, r1
  2002c8:	9afffff9 	bls	2002b4 <BOARD_ConfigureSdram+0xb8>
  2002cc:	e3e01c15 	mvn	r1, #5376	; 0x1500
  2002d0:	e3a00202 	mov	r0, #536870912	; 0x20000000
  2002d4:	e3a02004 	mov	r2, #4	; 0x4
  2002d8:	e3a03001 	mov	r3, #1	; 0x1
  2002dc:	e50120ff 	str	r2, [r1, #-255]
  2002e0:	e3a0c003 	mov	ip, #3	; 0x3
  2002e4:	e5803004 	str	r3, [r0, #4]
  2002e8:	e0833003 	add	r3, r3, r3
  2002ec:	e50120ff 	str	r2, [r1, #-255]
  2002f0:	e5803008 	str	r3, [r0, #8]
  2002f4:	e083300c 	add	r3, r3, ip
  2002f8:	e50120ff 	str	r2, [r1, #-255]
  2002fc:	e580c00c 	str	ip, [r0, #12]
  200300:	e50120ff 	str	r2, [r1, #-255]
  200304:	e5802010 	str	r2, [r0, #16]
  200308:	e50120ff 	str	r2, [r1, #-255]
  20030c:	e5803014 	str	r3, [r0, #20]
  200310:	e2833001 	add	r3, r3, #1	; 0x1
  200314:	e50120ff 	str	r2, [r1, #-255]
  200318:	e5803018 	str	r3, [r0, #24]
  20031c:	e2833001 	add	r3, r3, #1	; 0x1
  200320:	e50120ff 	str	r2, [r1, #-255]
  200324:	e580301c 	str	r3, [r0, #28]
  200328:	e2833001 	add	r3, r3, #1	; 0x1
  20032c:	e50120ff 	str	r2, [r1, #-255]
  200330:	e5803020 	str	r3, [r0, #32]
  200334:	e59f3034 	ldr	r3, [pc, #52]	; 200370 <BOARD_ConfigureSdram+0x174>
  200338:	e3a04000 	mov	r4, #0	; 0x0
  20033c:	e2822fe6 	add	r2, r2, #920	; 0x398
  200340:	e501c0ff 	str	ip, [r1, #-255]
  200344:	e5803024 	str	r3, [r0, #36]
  200348:	e50120fb 	str	r2, [r1, #-251]
  20034c:	e50140ff 	str	r4, [r1, #-255]
  200350:	e5804000 	str	r4, [r0]
  200354:	e28dd008 	add	sp, sp, #8	; 0x8
  200358:	e8bd4010 	pop	{r4, lr}
  20035c:	e12fff1e 	bx	lr
  200360:	96338379 	.word	0x96338379
  200364:	963383f9 	.word	0x963383f9
  200368:	10000e48 	.word	0x10000e48
  20036c:	100002a8 	.word	0x100002a8
  200370:	cafedede 	.word	0xcafedede
Disassembly of section .fixed:

10000000 <_sfixed>:
10000000:	e59f10c8 	ldr	r1, [pc, #200]	; 100000d0 <test+0xac>
10000004:	e3a02902 	mov	r2, #32768	; 0x8000
10000008:	e5812000 	str	r2, [r1]
1000000c:	e59f00c0 	ldr	r0, [pc, #192]	; 100000d4 <test+0xb0>
10000010:	e3a01902 	mov	r1, #32768	; 0x8000
10000014:	e5801000 	str	r1, [r0]
10000018:	e59f00b8 	ldr	r0, [pc, #184]	; 100000d8 <test+0xb4>
1000001c:	e5801000 	str	r1, [r0]
10000020:	e59f00b4 	ldr	r0, [pc, #180]	; 100000dc <test+0xb8>

10000024 <test>:
10000024:	e5801004 	str	r1, [r0, #4]
10000028:	e3a02c01 	mov	r2, #256	; 0x100
1000002c:	e2522001 	subs	r2, r2, #1	; 0x1
10000030:	1afffffd 	bne	1000002c <test+0x8>
10000034:	e5801000 	str	r1, [r0]
10000038:	e3a02c01 	mov	r2, #256	; 0x100
1000003c:	e2522001 	subs	r2, r2, #1	; 0x1
10000040:	1afffffd 	bne	1000003c <test+0x18>
10000044:	eafffff6 	b	10000024 <test>
10000048:	e59f0090 	ldr	r0, [pc, #144]	; 100000e0 <test+0xbc>
1000004c:	e59ff090 	ldr	pc, [pc, #144]	; 100000e4 <test+0xc0>
10000050:	e59f0090 	ldr	r0, [pc, #144]	; 100000e8 <test+0xc4>
10000054:	e59f1090 	ldr	r1, [pc, #144]	; 100000ec <test+0xc8>
10000058:	e59f2090 	ldr	r2, [pc, #144]	; 100000f0 <test+0xcc>
1000005c:	e1510002 	cmp	r1, r2
10000060:	34903004 	ldrcc	r3, [r0], #4
10000064:	34813004 	strcc	r3, [r1], #4
10000068:	3afffffb 	bcc	1000005c <test+0x38>
1000006c:	e59fd080 	ldr	sp, [pc, #128]	; 100000f4 <test+0xd0>
10000070:	e92d0001 	push	{r0}
10000074:	e59f007c 	ldr	r0, [pc, #124]	; 100000f8 <test+0xd4>
10000078:	e12fff30 	blx	r0
1000007c:	e8bd0001 	pop	{r0}
10000080:	e59f1074 	ldr	r1, [pc, #116]	; 100000fc <test+0xd8>
10000084:	e59f2074 	ldr	r2, [pc, #116]	; 10000100 <test+0xdc>
10000088:	e1510002 	cmp	r1, r2
1000008c:	34903004 	ldrcc	r3, [r0], #4
10000090:	34813004 	strcc	r3, [r1], #4
10000094:	3afffffb 	bcc	10000088 <test+0x64>
10000098:	e59f0064 	ldr	r0, [pc, #100]	; 10000104 <test+0xe0>
1000009c:	e59f1064 	ldr	r1, [pc, #100]	; 10000108 <test+0xe4>
100000a0:	e3a02000 	mov	r2, #0	; 0x0
100000a4:	e1500001 	cmp	r0, r1
100000a8:	34802004 	strcc	r2, [r0], #4
100000ac:	3afffffc 	bcc	100000a4 <test+0x80>
100000b0:	e321f0d2 	msr	CPSR_c, #210	; 0xd2
100000b4:	e59fd038 	ldr	sp, [pc, #56]	; 100000f4 <test+0xd0>
100000b8:	e24d4060 	sub	r4, sp, #96	; 0x60
100000bc:	e321f053 	msr	CPSR_c, #83	; 0x53
100000c0:	e1a0d004 	mov	sp, r4
100000c4:	e59f0040 	ldr	r0, [pc, #64]	; 1000010c <test+0xe8>
100000c8:	e12fff30 	blx	r0
100000cc:	eafffffe 	b	100000cc <test+0xa8>
100000d0:	fffffd44 	.word	0xfffffd44
100000d4:	fffff600 	.word	0xfffff600
100000d8:	fffff610 	.word	0xfffff610
100000dc:	fffff630 	.word	0xfffff630
100000e0:	00200378 	.word	0x00200378
100000e4:	10000050 	.word	0x10000050
100000e8:	1000102c 	.word	0x1000102c
100000ec:	00200000 	.word	0x00200000
100000f0:	00200374 	.word	0x00200374
100000f4:	00301000 	.word	0x00301000
100000f8:	0020000c 	.word	0x0020000c
100000fc:	00200378 	.word	0x00200378
10000100:	002007f0 	.word	0x002007f0
10000104:	00300000 	.word	0x00300000
10000108:	00300000 	.word	0x00300000
1000010c:	10000150 	.word	0x10000150

10000110 <_readControlRegister>:
10000110:	e3a00000 	mov	r0, #0	; 0x0
10000114:	ee110f10 	mrc	15, 0, r0, cr1, cr0, {0}
10000118:	e12fff1e 	bx	lr

1000011c <_writeControlRegister>:
1000011c:	ee010f10 	mcr	15, 0, r0, cr1, cr0, {0}
10000120:	e12fff1e 	bx	lr

10000124 <_waitForInterrupt>:
10000124:	e3a00000 	mov	r0, #0	; 0x0
10000128:	ee070f90 	mcr	15, 0, r0, cr7, cr0, {4}
1000012c:	e12fff1e 	bx	lr

10000130 <_writeTTB>:
10000130:	ee020f10 	mcr	15, 0, r0, cr2, cr0, {0}
10000134:	e12fff1e 	bx	lr

10000138 <_writeDomain>:
10000138:	ee030f10 	mcr	15, 0, r0, cr3, cr0, {0}
1000013c:	e12fff1e 	bx	lr

10000140 <_writeITLBLockdown>:
10000140:	ee0a0f10 	mcr	15, 0, r0, cr10, cr0, {0}
10000144:	e12fff1e 	bx	lr

10000148 <_prefetchICacheLine>:
10000148:	ee070f3d 	mcr	15, 0, r0, cr7, cr13, {1}
1000014c:	e12fff1e 	bx	lr

10000150 <main>:
10000150:	e3e0cc02 	mvn	ip, #512	; 0x200
10000154:	e51c30f7 	ldr	r3, [ip, #-247]
10000158:	e38334a5 	orr	r3, r3, #-1526726656	; 0xa5000000
1000015c:	e3833001 	orr	r3, r3, #1	; 0x1
10000160:	e92d4070 	push	{r4, r5, r6, lr}
10000164:	e50c30f7 	str	r3, [ip, #-247]
10000168:	e3a01001 	mov	r1, #1	; 0x1
1000016c:	e59f20e8 	ldr	r2, [pc, #232]	; 1000025c <main+0x10c>
10000170:	e59f00e8 	ldr	r0, [pc, #232]	; 10000260 <main+0x110>
10000174:	e1a0e00f 	mov	lr, pc
10000178:	e12fff12 	bx	r2
1000017c:	e3a01907 	mov	r1, #114688	; 0x1c000
10000180:	e3a0267d 	mov	r2, #131072000	; 0x7d00000
10000184:	e59f30d8 	ldr	r3, [pc, #216]	; 10000264 <main+0x114>
10000188:	e2822afa 	add	r2, r2, #1024000	; 0xfa000
1000018c:	e2811c02 	add	r1, r1, #512	; 0x200
10000190:	e3a00b02 	mov	r0, #2048	; 0x800
10000194:	e1a0e00f 	mov	lr, pc
10000198:	e12fff13 	bx	r3
1000019c:	e59f40c4 	ldr	r4, [pc, #196]	; 10000268 <main+0x118>
100001a0:	e59f00c4 	ldr	r0, [pc, #196]	; 1000026c <main+0x11c>
100001a4:	e1a0e00f 	mov	lr, pc
100001a8:	e12fff14 	bx	r4
100001ac:	e59f10bc 	ldr	r1, [pc, #188]	; 10000270 <main+0x120>
100001b0:	e59f00bc 	ldr	r0, [pc, #188]	; 10000274 <main+0x124>
100001b4:	e1a0e00f 	mov	lr, pc
100001b8:	e12fff14 	bx	r4
100001bc:	e59f10b4 	ldr	r1, [pc, #180]	; 10000278 <main+0x128>
100001c0:	e59f00b4 	ldr	r0, [pc, #180]	; 1000027c <main+0x12c>
100001c4:	e1a0e00f 	mov	lr, pc
100001c8:	e12fff14 	bx	r4
100001cc:	e59f20ac 	ldr	r2, [pc, #172]	; 10000280 <main+0x130>
100001d0:	e59f10ac 	ldr	r1, [pc, #172]	; 10000284 <main+0x134>
100001d4:	e59f00ac 	ldr	r0, [pc, #172]	; 10000288 <main+0x138>
100001d8:	e1a0e00f 	mov	lr, pc
100001dc:	e12fff14 	bx	r4
100001e0:	e3a01084 	mov	r1, #132	; 0x84
100001e4:	e59f00a0 	ldr	r0, [pc, #160]	; 1000028c <main+0x13c>
100001e8:	e1a0e00f 	mov	lr, pc
100001ec:	e12fff14 	bx	r4
100001f0:	e59f3098 	ldr	r3, [pc, #152]	; 10000290 <main+0x140>
100001f4:	e1a0e00f 	mov	lr, pc
100001f8:	e12fff13 	bx	r3
100001fc:	e59f0090 	ldr	r0, [pc, #144]	; 10000294 <main+0x144>
10000200:	e1a0e00f 	mov	lr, pc
10000204:	e12fff14 	bx	r4
10000208:	e3a0558f 	mov	r5, #599785472	; 0x23c00000
1000020c:	e3a00020 	mov	r0, #32	; 0x20
10000210:	e59f3080 	ldr	r3, [pc, #128]	; 10000298 <main+0x148>
10000214:	e1a0e00f 	mov	lr, pc
10000218:	e12fff13 	bx	r3
1000021c:	e2855603 	add	r5, r5, #3145728	; 0x300000
10000220:	e3a01001 	mov	r1, #1	; 0x1
10000224:	e59f3070 	ldr	r3, [pc, #112]	; 1000029c <main+0x14c>
10000228:	e59f0070 	ldr	r0, [pc, #112]	; 100002a0 <main+0x150>
1000022c:	e1a0e00f 	mov	lr, pc
10000230:	e12fff13 	bx	r3
10000234:	e1a01005 	mov	r1, r5
10000238:	e59f0064 	ldr	r0, [pc, #100]	; 100002a4 <main+0x154>
1000023c:	e1a0e00f 	mov	lr, pc
10000240:	e12fff14 	bx	r4
10000244:	e3a01e65 	mov	r1, #1616	; 0x650
10000248:	e2811008 	add	r1, r1, #8	; 0x8
1000024c:	e3a00000 	mov	r0, #0	; 0x0
10000250:	e1a0e00f 	mov	lr, pc
10000254:	e12fff15 	bx	r5
10000258:	eafffffe 	b	10000258 <main+0x108>
1000025c:	100002a8 	.word	0x100002a8
10000260:	10000d64 	.word	0x10000d64
10000264:	10000a88 	.word	0x10000a88
10000268:	100009b0 	.word	0x100009b0
1000026c:	10000f90 	.word	0x10000f90
10000270:	10000da8 	.word	0x10000da8
10000274:	10000d84 	.word	0x10000d84
10000278:	10000db4 	.word	0x10000db4
1000027c:	10000dac 	.word	0x10000dac
10000280:	10000de8 	.word	0x10000de8
10000284:	10000ddc 	.word	0x10000ddc
10000288:	10000dc4 	.word	0x10000dc4
1000028c:	10000df4 	.word	0x10000df4
10000290:	10000be4 	.word	0x10000be4
10000294:	10000e10 	.word	0x10000e10
10000298:	002001fc 	.word	0x002001fc
1000029c:	10000b64 	.word	0x10000b64
100002a0:	10000d70 	.word	0x10000d70
100002a4:	10000e24 	.word	0x10000e24

100002a8 <PIO_Configure>:
100002a8:	e3510000 	cmp	r1, #0	; 0x0
100002ac:	e92d0070 	push	{r4, r5, r6}
100002b0:	0a000030 	beq	10000378 <PIO_Configure+0xd0>
100002b4:	e3a05001 	mov	r5, #1	; 0x1
100002b8:	e3e06c03 	mvn	r6, #768	; 0x300
100002bc:	e5d03009 	ldrb	r3, [r0, #9]
100002c0:	e3530004 	cmp	r3, #4	; 0x4
100002c4:	979ff103 	ldrls	pc, [pc, r3, lsl #2]
100002c8:	ea000004 	b	100002e0 <PIO_Configure+0x38>
100002cc:	100003a4 	.word	0x100003a4
100002d0:	10000380 	.word	0x10000380
100002d4:	10000334 	.word	0x10000334
100002d8:	100002ec 	.word	0x100002ec
100002dc:	100002ec 	.word	0x100002ec
100002e0:	e3a00000 	mov	r0, #0	; 0x0
100002e4:	e8bd0070 	pop	{r4, r5, r6}
100002e8:	e12fff1e 	bx	lr
100002ec:	e5d0400a 	ldrb	r4, [r0, #10]
100002f0:	e8901004 	ldm	r0, {r2, ip}
100002f4:	e3140001 	tst	r4, #1	; 0x1
100002f8:	e58c2044 	str	r2, [ip, #68]
100002fc:	158c2064 	strne	r2, [ip, #100]
10000300:	058c2060 	streq	r2, [ip, #96]
10000304:	e3140004 	tst	r4, #4	; 0x4
10000308:	158c2050 	strne	r2, [ip, #80]
1000030c:	058c2054 	streq	r2, [ip, #84]
10000310:	e3530004 	cmp	r3, #4	; 0x4
10000314:	058c2030 	streq	r2, [ip, #48]
10000318:	158c2034 	strne	r2, [ip, #52]
1000031c:	e58c2010 	str	r2, [ip, #16]
10000320:	e58c2000 	str	r2, [ip]
10000324:	e2511001 	subs	r1, r1, #1	; 0x1
10000328:	0a000012 	beq	10000378 <PIO_Configure+0xd0>
1000032c:	e280000c 	add	r0, r0, #12	; 0xc
10000330:	eaffffe1 	b	100002bc <PIO_Configure+0x14>
10000334:	e5d03008 	ldrb	r3, [r0, #8]
10000338:	e1a03315 	lsl	r3, r5, r3
1000033c:	e50630ef 	str	r3, [r6, #-239]
10000340:	e5d0c00a 	ldrb	ip, [r0, #10]
10000344:	e5902004 	ldr	r2, [r0, #4]
10000348:	e5903000 	ldr	r3, [r0]
1000034c:	e31c0001 	tst	ip, #1	; 0x1
10000350:	e5823044 	str	r3, [r2, #68]
10000354:	15823064 	strne	r3, [r2, #100]
10000358:	05823060 	streq	r3, [r2, #96]
1000035c:	e31c0002 	tst	ip, #2	; 0x2
10000360:	15823020 	strne	r3, [r2, #32]
10000364:	05823024 	streq	r3, [r2, #36]
10000368:	e2511001 	subs	r1, r1, #1	; 0x1
1000036c:	e5823014 	str	r3, [r2, #20]
10000370:	e5823000 	str	r3, [r2]
10000374:	1affffec 	bne	1000032c <PIO_Configure+0x84>
10000378:	e3a00001 	mov	r0, #1	; 0x1
1000037c:	eaffffd8 	b	100002e4 <PIO_Configure+0x3c>
10000380:	e5d0300a 	ldrb	r3, [r0, #10]
10000384:	e8901004 	ldm	r0, {r2, ip}
10000388:	e3130001 	tst	r3, #1	; 0x1
1000038c:	e58c2044 	str	r2, [ip, #68]
10000390:	158c2064 	strne	r2, [ip, #100]
10000394:	058c2060 	streq	r2, [ip, #96]
10000398:	e58c2074 	str	r2, [ip, #116]
1000039c:	e58c2004 	str	r2, [ip, #4]
100003a0:	eaffffdf 	b	10000324 <PIO_Configure+0x7c>
100003a4:	e5d0300a 	ldrb	r3, [r0, #10]
100003a8:	e8901004 	ldm	r0, {r2, ip}
100003ac:	e3130001 	tst	r3, #1	; 0x1
100003b0:	e58c2044 	str	r2, [ip, #68]
100003b4:	158c2064 	strne	r2, [ip, #100]
100003b8:	058c2060 	streq	r2, [ip, #96]
100003bc:	e58c2070 	str	r2, [ip, #112]
100003c0:	e58c2004 	str	r2, [ip, #4]
100003c4:	eaffffd6 	b	10000324 <PIO_Configure+0x7c>

100003c8 <PutUnsignedInt>:
100003c8:	e92d4070 	push	{r4, r5, r6, lr}
100003cc:	e3530009 	cmp	r3, #9	; 0x9
100003d0:	e1a06002 	mov	r6, r2
100003d4:	e1a05003 	mov	r5, r3
100003d8:	e1a04000 	mov	r4, r0
100003dc:	e1a02001 	mov	r2, r1
100003e0:	e246c001 	sub	ip, r6, #1	; 0x1
100003e4:	8a000014 	bhi	1000043c <PutUnsignedInt+0x74>
100003e8:	e35c0000 	cmp	ip, #0	; 0x0
100003ec:	d3a06001 	movle	r6, #1	; 0x1
100003f0:	da000005 	ble	1000040c <PutUnsignedInt+0x44>
100003f4:	e3a03000 	mov	r3, #0	; 0x0
100003f8:	e7c42003 	strb	r2, [r4, r3]
100003fc:	e2833001 	add	r3, r3, #1	; 0x1
10000400:	e153000c 	cmp	r3, ip
10000404:	1afffffb 	bne	100003f8 <PutUnsignedInt+0x30>
10000408:	e0844003 	add	r4, r4, r3
1000040c:	e59f3050 	ldr	r3, [pc, #80]	; 10000464 <PutUnsignedInt+0x9c>
10000410:	e0821593 	umull	r1, r2, r3, r5
10000414:	e1a021a2 	lsr	r2, r2, #3
10000418:	e1a03182 	lsl	r3, r2, #3
1000041c:	e1a02082 	lsl	r2, r2, #1
10000420:	e0822003 	add	r2, r2, r3
10000424:	e0622005 	rsb	r2, r2, r5
10000428:	e2822030 	add	r2, r2, #48	; 0x30
1000042c:	e5c42000 	strb	r2, [r4]
10000430:	e1a00006 	mov	r0, r6
10000434:	e8bd4070 	pop	{r4, r5, r6, lr}
10000438:	e12fff1e 	bx	lr
1000043c:	e59f2020 	ldr	r2, [pc, #32]	; 10000464 <PutUnsignedInt+0x9c>
10000440:	e083e592 	umull	lr, r3, r2, r5
10000444:	e1a0200c 	mov	r2, ip
10000448:	e1a031a3 	lsr	r3, r3, #3
1000044c:	e59fc014 	ldr	ip, [pc, #20]	; 10000468 <PutUnsignedInt+0xa0>
10000450:	e1a0e00f 	mov	lr, pc
10000454:	e12fff1c 	bx	ip
10000458:	e0844000 	add	r4, r4, r0
1000045c:	e2806001 	add	r6, r0, #1	; 0x1
10000460:	eaffffe9 	b	1000040c <PutUnsignedInt+0x44>
10000464:	cccccccd 	.word	0xcccccccd
10000468:	100003c8 	.word	0x100003c8

1000046c <PutSignedInt>:
1000046c:	e92d4070 	push	{r4, r5, r6, lr}
10000470:	e0236fc3 	eor	r6, r3, r3, asr #31
10000474:	e0466fc3 	sub	r6, r6, r3, asr #31
10000478:	e3560009 	cmp	r6, #9	; 0x9
1000047c:	e1a05003 	mov	r5, r3
10000480:	e242c001 	sub	ip, r2, #1	; 0x1
10000484:	e1a04000 	mov	r4, r0
10000488:	e1a03001 	mov	r3, r1
1000048c:	9a00000a 	bls	100004bc <PutSignedInt+0x50>
10000490:	e3550000 	cmp	r5, #0	; 0x0
10000494:	ba000028 	blt	1000053c <PutSignedInt+0xd0>
10000498:	e59f20c4 	ldr	r2, [pc, #196]	; 10000564 <PutSignedInt+0xf8>
1000049c:	e083e692 	umull	lr, r3, r2, r6
100004a0:	e1a0200c 	mov	r2, ip
100004a4:	e1a031a3 	lsr	r3, r3, #3
100004a8:	e59fc0b8 	ldr	ip, [pc, #184]	; 10000568 <PutSignedInt+0xfc>
100004ac:	e1a0e00f 	mov	lr, pc
100004b0:	e12fff1c 	bx	ip
100004b4:	e0841000 	add	r1, r4, r0
100004b8:	ea000013 	b	1000050c <PutSignedInt+0xa0>
100004bc:	e3550000 	cmp	r5, #0	; 0x0
100004c0:	b24cc001 	sublt	ip, ip, #1	; 0x1
100004c4:	e35c0000 	cmp	ip, #0	; 0x0
100004c8:	d3a02000 	movle	r2, #0	; 0x0
100004cc:	d1a01000 	movle	r1, r0
100004d0:	d1a00002 	movle	r0, r2
100004d4:	da000007 	ble	100004f8 <PutSignedInt+0x8c>
100004d8:	e3a02000 	mov	r2, #0	; 0x0
100004dc:	e7c43002 	strb	r3, [r4, r2]
100004e0:	e2822001 	add	r2, r2, #1	; 0x1
100004e4:	e152000c 	cmp	r2, ip
100004e8:	1afffffb 	bne	100004dc <PutSignedInt+0x70>
100004ec:	e0844002 	add	r4, r4, r2
100004f0:	e1a01004 	mov	r1, r4
100004f4:	e1a00002 	mov	r0, r2
100004f8:	e3550000 	cmp	r5, #0	; 0x0
100004fc:	b1a01004 	movlt	r1, r4
10000500:	b3a0302d 	movlt	r3, #45	; 0x2d
10000504:	b4c13001 	strblt	r3, [r1], #1
10000508:	b2820001 	addlt	r0, r2, #1	; 0x1
1000050c:	e59f3050 	ldr	r3, [pc, #80]	; 10000564 <PutSignedInt+0xf8>
10000510:	e082c693 	umull	ip, r2, r3, r6
10000514:	e1a021a2 	lsr	r2, r2, #3
10000518:	e1a03182 	lsl	r3, r2, #3
1000051c:	e1a02082 	lsl	r2, r2, #1
10000520:	e0822003 	add	r2, r2, r3
10000524:	e0622006 	rsb	r2, r2, r6
10000528:	e2822030 	add	r2, r2, #48	; 0x30
1000052c:	e5c12000 	strb	r2, [r1]
10000530:	e2800001 	add	r0, r0, #1	; 0x1
10000534:	e8bd4070 	pop	{r4, r5, r6, lr}
10000538:	e12fff1e 	bx	lr
1000053c:	e59f2020 	ldr	r2, [pc, #32]	; 10000564 <PutSignedInt+0xf8>
10000540:	e083e692 	umull	lr, r3, r2, r6
10000544:	e1a031a3 	lsr	r3, r3, #3
10000548:	e1a0200c 	mov	r2, ip
1000054c:	e2633000 	rsb	r3, r3, #0	; 0x0
10000550:	e59fc010 	ldr	ip, [pc, #16]	; 10000568 <PutSignedInt+0xfc>
10000554:	e1a0e00f 	mov	lr, pc
10000558:	e12fff1c 	bx	ip
1000055c:	e0841000 	add	r1, r4, r0
10000560:	eaffffe9 	b	1000050c <PutSignedInt+0xa0>
10000564:	cccccccd 	.word	0xcccccccd
10000568:	1000046c 	.word	0x1000046c

1000056c <PutHexa>:
1000056c:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
10000570:	e24dd008 	sub	sp, sp, #8	; 0x8
10000574:	e59d7020 	ldr	r7, [sp, #32]
10000578:	e1b06227 	lsrs	r6, r7, #4
1000057c:	e1a05002 	mov	r5, r2
10000580:	e1a04000 	mov	r4, r0
10000584:	e1a0c001 	mov	ip, r1
10000588:	e1a08003 	mov	r8, r3
1000058c:	e2422001 	sub	r2, r2, #1	; 0x1
10000590:	1a000016 	bne	100005f0 <PutHexa+0x84>
10000594:	e3520000 	cmp	r2, #0	; 0x0
10000598:	d3a05001 	movle	r5, #1	; 0x1
1000059c:	da000005 	ble	100005b8 <PutHexa+0x4c>
100005a0:	e1a03006 	mov	r3, r6
100005a4:	e7c4c003 	strb	ip, [r4, r3]
100005a8:	e2833001 	add	r3, r3, #1	; 0x1
100005ac:	e1530002 	cmp	r3, r2
100005b0:	1afffffb 	bne	100005a4 <PutHexa+0x38>
100005b4:	e0844003 	add	r4, r4, r3
100005b8:	e207300f 	and	r3, r7, #15	; 0xf
100005bc:	e3530009 	cmp	r3, #9	; 0x9
100005c0:	92833030 	addls	r3, r3, #48	; 0x30
100005c4:	95c43000 	strbls	r3, [r4]
100005c8:	9a000004 	bls	100005e0 <PutHexa+0x74>
100005cc:	e3580000 	cmp	r8, #0	; 0x0
100005d0:	12833037 	addne	r3, r3, #55	; 0x37
100005d4:	02833057 	addeq	r3, r3, #87	; 0x57
100005d8:	15c43000 	strbne	r3, [r4]
100005dc:	05c43000 	strbeq	r3, [r4]
100005e0:	e1a00005 	mov	r0, r5
100005e4:	e28dd008 	add	sp, sp, #8	; 0x8
100005e8:	e8bd41f0 	pop	{r4, r5, r6, r7, r8, lr}
100005ec:	e12fff1e 	bx	lr
100005f0:	e58d6000 	str	r6, [sp]
100005f4:	e59fc010 	ldr	ip, [pc, #16]	; 1000060c <PutHexa+0xa0>
100005f8:	e1a0e00f 	mov	lr, pc
100005fc:	e12fff1c 	bx	ip
10000600:	e0844000 	add	r4, r4, r0
10000604:	e2805001 	add	r5, r0, #1	; 0x1
10000608:	eaffffea 	b	100005b8 <PutHexa+0x4c>
1000060c:	1000056c 	.word	0x1000056c

10000610 <vsnprintf>:
10000610:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
10000614:	e2506000 	subs	r6, r0, #0	; 0x0
10000618:	e1a04003 	mov	r4, r3
1000061c:	13a03000 	movne	r3, #0	; 0x0
10000620:	15c63000 	strbne	r3, [r6]
10000624:	e59f9268 	ldr	r9, [pc, #616]	; 10000894 <vsnprintf+0x284>
10000628:	e59fb268 	ldr	fp, [pc, #616]	; 10000898 <vsnprintf+0x288>
1000062c:	e24dd00c 	sub	sp, sp, #12	; 0xc
10000630:	e1a07001 	mov	r7, r1
10000634:	e3a05000 	mov	r5, #0	; 0x0
10000638:	e5d23000 	ldrb	r3, [r2]
1000063c:	e3530000 	cmp	r3, #0	; 0x0
10000640:	11550007 	cmpne	r5, r7
10000644:	23a01000 	movcs	r1, #0	; 0x0
10000648:	33a01001 	movcc	r1, #1	; 0x1
1000064c:	2a00004a 	bcs	1000077c <vsnprintf+0x16c>
10000650:	e3530025 	cmp	r3, #37	; 0x25
10000654:	14c63001 	strbne	r3, [r6], #1
10000658:	12822001 	addne	r2, r2, #1	; 0x1
1000065c:	12855001 	addne	r5, r5, #1	; 0x1
10000660:	1afffff4 	bne	10000638 <vsnprintf+0x28>
10000664:	e5d20001 	ldrb	r0, [r2, #1]
10000668:	e3500025 	cmp	r0, #37	; 0x25
1000066c:	e2828001 	add	r8, r2, #1	; 0x1
10000670:	04c60001 	strbeq	r0, [r6], #1
10000674:	02822002 	addeq	r2, r2, #2	; 0x2
10000678:	02855001 	addeq	r5, r5, #1	; 0x1
1000067c:	0affffed 	beq	10000638 <vsnprintf+0x28>
10000680:	e3500030 	cmp	r0, #48	; 0x30
10000684:	05f80001 	ldrbeq	r0, [r8, #1]!
10000688:	e240c030 	sub	ip, r0, #48	; 0x30
1000068c:	e20c30ff 	and	r3, ip, #255	; 0xff
10000690:	13a01020 	movne	r1, #32	; 0x20
10000694:	03a01030 	moveq	r1, #48	; 0x30
10000698:	e3530009 	cmp	r3, #9	; 0x9
1000069c:	83a02000 	movhi	r2, #0	; 0x0
100006a0:	81a0a002 	movhi	sl, r2
100006a4:	8a00000b 	bhi	100006d8 <vsnprintf+0xc8>
100006a8:	e3a02000 	mov	r2, #0	; 0x0
100006ac:	e1a03182 	lsl	r3, r2, #3
100006b0:	e5f80001 	ldrb	r0, [r8, #1]!
100006b4:	e1a02082 	lsl	r2, r2, #1
100006b8:	e0822003 	add	r2, r2, r3
100006bc:	e082200c 	add	r2, r2, ip
100006c0:	e240c030 	sub	ip, r0, #48	; 0x30
100006c4:	e20c30ff 	and	r3, ip, #255	; 0xff
100006c8:	e3530009 	cmp	r3, #9	; 0x9
100006cc:	e20220ff 	and	r2, r2, #255	; 0xff
100006d0:	9afffff5 	bls	100006ac <vsnprintf+0x9c>
100006d4:	e1a0a002 	mov	sl, r2
100006d8:	e0823005 	add	r3, r2, r5
100006dc:	e1570003 	cmp	r7, r3
100006e0:	30653007 	rsbcc	r3, r5, r7
100006e4:	3203a0ff 	andcc	sl, r3, #255	; 0xff
100006e8:	e2403058 	sub	r3, r0, #88	; 0x58
100006ec:	e3530020 	cmp	r3, #32	; 0x20
100006f0:	979ff103 	ldrls	pc, [pc, r3, lsl #2]
100006f4:	ea000028 	b	1000079c <vsnprintf+0x18c>
100006f8:	100007a4 	.word	0x100007a4
100006fc:	1000079c 	.word	0x1000079c
10000700:	1000079c 	.word	0x1000079c
10000704:	1000079c 	.word	0x1000079c
10000708:	1000079c 	.word	0x1000079c
1000070c:	1000079c 	.word	0x1000079c
10000710:	1000079c 	.word	0x1000079c
10000714:	1000079c 	.word	0x1000079c
10000718:	1000079c 	.word	0x1000079c
1000071c:	1000079c 	.word	0x1000079c
10000720:	1000079c 	.word	0x1000079c
10000724:	100007d8 	.word	0x100007d8
10000728:	100007f0 	.word	0x100007f0
1000072c:	1000079c 	.word	0x1000079c
10000730:	1000079c 	.word	0x1000079c
10000734:	1000079c 	.word	0x1000079c
10000738:	1000079c 	.word	0x1000079c
1000073c:	100007f0 	.word	0x100007f0
10000740:	1000079c 	.word	0x1000079c
10000744:	1000079c 	.word	0x1000079c
10000748:	1000079c 	.word	0x1000079c
1000074c:	1000079c 	.word	0x1000079c
10000750:	1000079c 	.word	0x1000079c
10000754:	1000079c 	.word	0x1000079c
10000758:	1000079c 	.word	0x1000079c
1000075c:	1000079c 	.word	0x1000079c
10000760:	1000079c 	.word	0x1000079c
10000764:	10000814 	.word	0x10000814
10000768:	1000079c 	.word	0x1000079c
1000076c:	1000084c 	.word	0x1000084c
10000770:	1000079c 	.word	0x1000079c
10000774:	1000079c 	.word	0x1000079c
10000778:	1000086c 	.word	0x1000086c
1000077c:	e1570005 	cmp	r7, r5
10000780:	85c61000 	strbhi	r1, [r6]
10000784:	95461001 	strbls	r1, [r6, #-1]
10000788:	92455001 	subls	r5, r5, #1	; 0x1
1000078c:	e1a00005 	mov	r0, r5
10000790:	e28dd00c 	add	sp, sp, #12	; 0xc
10000794:	e8bd4ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
10000798:	e12fff1e 	bx	lr
1000079c:	e3e05000 	mvn	r5, #0	; 0x0
100007a0:	eafffff9 	b	1000078c <vsnprintf+0x17c>
100007a4:	e594c000 	ldr	ip, [r4]
100007a8:	e3a03001 	mov	r3, #1	; 0x1
100007ac:	e1a0200a 	mov	r2, sl
100007b0:	e1a00006 	mov	r0, r6
100007b4:	e58dc000 	str	ip, [sp]
100007b8:	e1a0e00f 	mov	lr, pc
100007bc:	e12fff19 	bx	r9
100007c0:	e2844004 	add	r4, r4, #4	; 0x4
100007c4:	e1a03000 	mov	r3, r0
100007c8:	e0866003 	add	r6, r6, r3
100007cc:	e0855000 	add	r5, r5, r0
100007d0:	e2882001 	add	r2, r8, #1	; 0x1
100007d4:	eaffff97 	b	10000638 <vsnprintf+0x28>
100007d8:	e5943000 	ldr	r3, [r4]
100007dc:	e3a00001 	mov	r0, #1	; 0x1
100007e0:	e5c63000 	strb	r3, [r6]
100007e4:	e2844004 	add	r4, r4, #4	; 0x4
100007e8:	e1a03000 	mov	r3, r0
100007ec:	eafffff5 	b	100007c8 <vsnprintf+0x1b8>
100007f0:	e5943000 	ldr	r3, [r4]
100007f4:	e1a0200a 	mov	r2, sl
100007f8:	e1a00006 	mov	r0, r6
100007fc:	e59fc098 	ldr	ip, [pc, #152]	; 1000089c <vsnprintf+0x28c>
10000800:	e1a0e00f 	mov	lr, pc
10000804:	e12fff1c 	bx	ip
10000808:	e2844004 	add	r4, r4, #4	; 0x4
1000080c:	e1a03000 	mov	r3, r0
10000810:	eaffffec 	b	100007c8 <vsnprintf+0x1b8>
10000814:	e5942000 	ldr	r2, [r4]
10000818:	e5d23000 	ldrb	r3, [r2]
1000081c:	e3530000 	cmp	r3, #0	; 0x0
10000820:	e2844004 	add	r4, r4, #4	; 0x4
10000824:	01a00003 	moveq	r0, r3
10000828:	0affffe6 	beq	100007c8 <vsnprintf+0x1b8>
1000082c:	e3a00000 	mov	r0, #0	; 0x0
10000830:	e7c63000 	strb	r3, [r6, r0]
10000834:	e2800001 	add	r0, r0, #1	; 0x1
10000838:	e7d23000 	ldrb	r3, [r2, r0]
1000083c:	e3530000 	cmp	r3, #0	; 0x0
10000840:	1afffffa 	bne	10000830 <vsnprintf+0x220>
10000844:	e1a03000 	mov	r3, r0
10000848:	eaffffde 	b	100007c8 <vsnprintf+0x1b8>
1000084c:	e5943000 	ldr	r3, [r4]
10000850:	e1a0200a 	mov	r2, sl
10000854:	e1a00006 	mov	r0, r6
10000858:	e1a0e00f 	mov	lr, pc
1000085c:	e12fff1b 	bx	fp
10000860:	e2844004 	add	r4, r4, #4	; 0x4
10000864:	e1a03000 	mov	r3, r0
10000868:	eaffffd6 	b	100007c8 <vsnprintf+0x1b8>
1000086c:	e594c000 	ldr	ip, [r4]
10000870:	e3a03000 	mov	r3, #0	; 0x0
10000874:	e1a0200a 	mov	r2, sl
10000878:	e1a00006 	mov	r0, r6
1000087c:	e58dc000 	str	ip, [sp]
10000880:	e1a0e00f 	mov	lr, pc
10000884:	e12fff19 	bx	r9
10000888:	e2844004 	add	r4, r4, #4	; 0x4
1000088c:	e1a03000 	mov	r3, r0
10000890:	eaffffcc 	b	100007c8 <vsnprintf+0x1b8>
10000894:	1000056c 	.word	0x1000056c
10000898:	100003c8 	.word	0x100003c8
1000089c:	1000046c 	.word	0x1000046c

100008a0 <vsprintf>:
100008a0:	e1a03002 	mov	r3, r2
100008a4:	e92d4010 	push	{r4, lr}
100008a8:	e1a02001 	mov	r2, r1
100008ac:	e59fc010 	ldr	ip, [pc, #16]	; 100008c4 <vsprintf+0x24>
100008b0:	e3a01064 	mov	r1, #100	; 0x64
100008b4:	e1a0e00f 	mov	lr, pc
100008b8:	e12fff1c 	bx	ip
100008bc:	e8bd4010 	pop	{r4, lr}
100008c0:	e12fff1e 	bx	lr
100008c4:	10000610 	.word	0x10000610

100008c8 <vfprintf>:
100008c8:	e92d45f0 	push	{r4, r5, r6, r7, r8, sl, lr}
100008cc:	e59fe094 	ldr	lr, [pc, #148]	; 10000968 <vfprintf+0xa0>
100008d0:	e24dd08c 	sub	sp, sp, #140	; 0x8c
100008d4:	e1a0c00e 	mov	ip, lr
100008d8:	e1a05001 	mov	r5, r1
100008dc:	e1a06002 	mov	r6, r2
100008e0:	e1a08000 	mov	r8, r0
100008e4:	e28d7064 	add	r7, sp, #100	; 0x64
100008e8:	e8bc000f 	ldm	ip!, {r0, r1, r2, r3}
100008ec:	e1a0e007 	mov	lr, r7
100008f0:	e8ae000f 	stmia	lr!, {r0, r1, r2, r3}
100008f4:	e8bc000f 	ldm	ip!, {r0, r1, r2, r3}
100008f8:	e8ae000f 	stmia	lr!, {r0, r1, r2, r3}
100008fc:	e59c4000 	ldr	r4, [ip]
10000900:	e1a01005 	mov	r1, r5
10000904:	e1a02006 	mov	r2, r6
10000908:	e1a0000d 	mov	r0, sp
1000090c:	e58e4000 	str	r4, [lr]
10000910:	e59f3054 	ldr	r3, [pc, #84]	; 1000096c <vfprintf+0xa4>
10000914:	e1a0e00f 	mov	lr, pc
10000918:	e12fff13 	bx	r3
1000091c:	e3500063 	cmp	r0, #99	; 0x63
10000920:	e1a0a00d 	mov	sl, sp
10000924:	da000007 	ble	10000948 <vfprintf+0x80>
10000928:	e59f3040 	ldr	r3, [pc, #64]	; 10000970 <vfprintf+0xa8>
1000092c:	e5932000 	ldr	r2, [r3]
10000930:	e1a00007 	mov	r0, r7
10000934:	e592100c 	ldr	r1, [r2, #12]
10000938:	e59f3034 	ldr	r3, [pc, #52]	; 10000974 <vfprintf+0xac>
1000093c:	e1a0e00f 	mov	lr, pc
10000940:	e12fff13 	bx	r3
10000944:	eafffffe 	b	10000944 <vfprintf+0x7c>
10000948:	e1a0000d 	mov	r0, sp
1000094c:	e1a01008 	mov	r1, r8
10000950:	e59f301c 	ldr	r3, [pc, #28]	; 10000974 <vfprintf+0xac>
10000954:	e1a0e00f 	mov	lr, pc
10000958:	e12fff13 	bx	r3
1000095c:	e28dd08c 	add	sp, sp, #140	; 0x8c
10000960:	e8bd45f0 	pop	{r4, r5, r6, r7, r8, sl, lr}
10000964:	e12fff1e 	bx	lr
10000968:	10000e54 	.word	0x10000e54
1000096c:	100008a0 	.word	0x100008a0
10000970:	002003e8 	.word	0x002003e8
10000974:	10000ae0 	.word	0x10000ae0

10000978 <vprintf>:
10000978:	e59f3028 	ldr	r3, [pc, #40]	; 100009a8 <vprintf+0x30>
1000097c:	e593c000 	ldr	ip, [r3]
10000980:	e92d4010 	push	{r4, lr}
10000984:	e1a0e000 	mov	lr, r0
10000988:	e1a02001 	mov	r2, r1
1000098c:	e59c0008 	ldr	r0, [ip, #8]
10000990:	e1a0100e 	mov	r1, lr
10000994:	e59f3010 	ldr	r3, [pc, #16]	; 100009ac <vprintf+0x34>
10000998:	e1a0e00f 	mov	lr, pc
1000099c:	e12fff13 	bx	r3
100009a0:	e8bd4010 	pop	{r4, lr}
100009a4:	e12fff1e 	bx	lr
100009a8:	002003e8 	.word	0x002003e8
100009ac:	100008c8 	.word	0x100008c8

100009b0 <printf>:
100009b0:	e92d000f 	push	{r0, r1, r2, r3}
100009b4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
100009b8:	e24dd00c 	sub	sp, sp, #12	; 0xc
100009bc:	e28d2014 	add	r2, sp, #20	; 0x14
100009c0:	e1a01002 	mov	r1, r2
100009c4:	e59d0010 	ldr	r0, [sp, #16]
100009c8:	e58d2004 	str	r2, [sp, #4]
100009cc:	e59f3014 	ldr	r3, [pc, #20]	; 100009e8 <printf+0x38>
100009d0:	e1a0e00f 	mov	lr, pc
100009d4:	e12fff13 	bx	r3
100009d8:	e28dd00c 	add	sp, sp, #12	; 0xc
100009dc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
100009e0:	e28dd010 	add	sp, sp, #16	; 0x10
100009e4:	e12fff1e 	bx	lr
100009e8:	10000978 	.word	0x10000978

100009ec <memcpy>:
100009ec:	e92d0030 	push	{r4, r5}
100009f0:	e1a04000 	mov	r4, r0
100009f4:	e2105003 	ands	r5, r0, #3	; 0x3
100009f8:	e1a0c004 	mov	ip, r4
100009fc:	e1a00001 	mov	r0, r1
10000a00:	1a000007 	bne	10000a24 <memcpy+0x38>
10000a04:	e3110003 	tst	r1, #3	; 0x3
10000a08:	13a03000 	movne	r3, #0	; 0x0
10000a0c:	03a03001 	moveq	r3, #1	; 0x1
10000a10:	e3520003 	cmp	r2, #3	; 0x3
10000a14:	93a03000 	movls	r3, #0	; 0x0
10000a18:	82033001 	andhi	r3, r3, #1	; 0x1
10000a1c:	e3530000 	cmp	r3, #0	; 0x0
10000a20:	1a00000a 	bne	10000a50 <memcpy+0x64>
10000a24:	e3520000 	cmp	r2, #0	; 0x0
10000a28:	0a000005 	beq	10000a44 <memcpy+0x58>
10000a2c:	e3a01000 	mov	r1, #0	; 0x0
10000a30:	e7d03001 	ldrb	r3, [r0, r1]
10000a34:	e7cc3001 	strb	r3, [ip, r1]
10000a38:	e2811001 	add	r1, r1, #1	; 0x1
10000a3c:	e1510002 	cmp	r1, r2
10000a40:	1afffffa 	bne	10000a30 <memcpy+0x44>
10000a44:	e1a00004 	mov	r0, r4
10000a48:	e8bd0030 	pop	{r4, r5}
10000a4c:	e12fff1e 	bx	lr
10000a50:	e1a0c005 	mov	ip, r5
10000a54:	e791300c 	ldr	r3, [r1, ip]
10000a58:	e784300c 	str	r3, [r4, ip]
10000a5c:	e28cc004 	add	ip, ip, #4	; 0x4
10000a60:	e06c3002 	rsb	r3, ip, r2
10000a64:	e3530003 	cmp	r3, #3	; 0x3
10000a68:	8afffff9 	bhi	10000a54 <memcpy+0x68>
10000a6c:	e2422004 	sub	r2, r2, #4	; 0x4
10000a70:	e3c23003 	bic	r3, r2, #3	; 0x3
10000a74:	e2833004 	add	r3, r3, #4	; 0x4
10000a78:	e0810003 	add	r0, r1, r3
10000a7c:	e084c003 	add	ip, r4, r3
10000a80:	e2022003 	and	r2, r2, #3	; 0x3
10000a84:	eaffffe6 	b	10000a24 <memcpy+0x38>

10000a88 <DBGU_Configure>:
10000a88:	e92d4070 	push	{r4, r5, r6, lr}
10000a8c:	e3a0300c 	mov	r3, #12	; 0xc
10000a90:	e3e04c0d 	mvn	r4, #3328	; 0xd00
10000a94:	e1a05000 	mov	r5, r0
10000a98:	e1a00002 	mov	r0, r2
10000a9c:	e3e02000 	mvn	r2, #0	; 0x0
10000aa0:	e50430ff 	str	r3, [r4, #-255]
10000aa4:	e1a01201 	lsl	r1, r1, #4
10000aa8:	e50420f3 	str	r2, [r4, #-243]
10000aac:	e59f3028 	ldr	r3, [pc, #40]	; 10000adc <DBGU_Configure+0x54>
10000ab0:	e1a0e00f 	mov	lr, pc
10000ab4:	e12fff13 	bx	r3
10000ab8:	e3a03c02 	mov	r3, #512	; 0x200
10000abc:	e2833002 	add	r3, r3, #2	; 0x2
10000ac0:	e3a02050 	mov	r2, #80	; 0x50
10000ac4:	e50400df 	str	r0, [r4, #-223]
10000ac8:	e50450fb 	str	r5, [r4, #-251]
10000acc:	e5843021 	str	r3, [r4, #33]
10000ad0:	e50420ff 	str	r2, [r4, #-255]
10000ad4:	e8bd4070 	pop	{r4, r5, r6, lr}
10000ad8:	e12fff1e 	bx	lr
10000adc:	10000c4c 	.word	0x10000c4c

10000ae0 <fputs>:
10000ae0:	e92d00f0 	push	{r4, r5, r6, r7}
10000ae4:	e5d0c000 	ldrb	ip, [r0]
10000ae8:	e35c0000 	cmp	ip, #0	; 0x0
10000aec:	e1a06000 	mov	r6, r0
10000af0:	01a0000c 	moveq	r0, ip
10000af4:	0a00000b 	beq	10000b28 <fputs+0x48>
10000af8:	e59f3060 	ldr	r3, [pc, #96]	; 10000b60 <fputs+0x80>
10000afc:	e5935000 	ldr	r5, [r3]
10000b00:	e3e02c0d 	mvn	r2, #3328	; 0xd00
10000b04:	e5954008 	ldr	r4, [r5, #8]
10000b08:	e3a00000 	mov	r0, #0	; 0x0
10000b0c:	e1a07002 	mov	r7, r2
10000b10:	e1510004 	cmp	r1, r4
10000b14:	0a000005 	beq	10000b30 <fputs+0x50>
10000b18:	e595300c 	ldr	r3, [r5, #12]
10000b1c:	e1510003 	cmp	r1, r3
10000b20:	0a000002 	beq	10000b30 <fputs+0x50>
10000b24:	e3e00000 	mvn	r0, #0	; 0x0
10000b28:	e8bd00f0 	pop	{r4, r5, r6, r7}
10000b2c:	e12fff1e 	bx	lr
10000b30:	e51230eb 	ldr	r3, [r2, #-235]
10000b34:	e3130c02 	tst	r3, #512	; 0x200
10000b38:	0afffffc 	beq	10000b30 <fputs+0x50>
10000b3c:	e507c0e3 	str	ip, [r7, #-227]
10000b40:	e51230eb 	ldr	r3, [r2, #-235]
10000b44:	e3130c02 	tst	r3, #512	; 0x200
10000b48:	0afffffc 	beq	10000b40 <fputs+0x60>
10000b4c:	e2800001 	add	r0, r0, #1	; 0x1
10000b50:	e7d6c000 	ldrb	ip, [r6, r0]
10000b54:	e35c0000 	cmp	ip, #0	; 0x0
10000b58:	1affffec 	bne	10000b10 <fputs+0x30>
10000b5c:	eafffff1 	b	10000b28 <fputs+0x48>
10000b60:	002003e8 	.word	0x002003e8

10000b64 <BOOT_NOR_CopyBin>:
10000b64:	e92d40f0 	push	{r4, r5, r6, r7, lr}
10000b68:	e2515000 	subs	r5, r1, #0	; 0x0
10000b6c:	e24dd00c 	sub	sp, sp, #12	; 0xc
10000b70:	e1a04000 	mov	r4, r0
10000b74:	0a000013 	beq	10000bc8 <BOOT_NOR_CopyBin+0x64>
10000b78:	e59f7058 	ldr	r7, [pc, #88]	; 10000bd8 <BOOT_NOR_CopyBin+0x74>
10000b7c:	e59f6058 	ldr	r6, [pc, #88]	; 10000bdc <BOOT_NOR_CopyBin+0x78>
10000b80:	e594c008 	ldr	ip, [r4, #8]
10000b84:	e5943000 	ldr	r3, [r4]
10000b88:	e5941010 	ldr	r1, [r4, #16]
10000b8c:	e594200c 	ldr	r2, [r4, #12]
10000b90:	e59f0048 	ldr	r0, [pc, #72]	; 10000be0 <BOOT_NOR_CopyBin+0x7c>
10000b94:	e58dc000 	str	ip, [sp]
10000b98:	e1a0e00f 	mov	lr, pc
10000b9c:	e12fff17 	bx	r7
10000ba0:	e5941000 	ldr	r1, [r4]
10000ba4:	e2840008 	add	r0, r4, #8	; 0x8
10000ba8:	e8900005 	ldm	r0, {r0, r2}
10000bac:	e2811201 	add	r1, r1, #268435456	; 0x10000000
10000bb0:	e1a0e00f 	mov	lr, pc
10000bb4:	e12fff16 	bx	r6
10000bb8:	e2453001 	sub	r3, r5, #1	; 0x1
10000bbc:	e21350ff 	ands	r5, r3, #255	; 0xff
10000bc0:	e2844014 	add	r4, r4, #20	; 0x14
10000bc4:	1affffed 	bne	10000b80 <BOOT_NOR_CopyBin+0x1c>
10000bc8:	e3a00000 	mov	r0, #0	; 0x0
10000bcc:	e28dd00c 	add	sp, sp, #12	; 0xc
10000bd0:	e8bd40f0 	pop	{r4, r5, r6, r7, lr}
10000bd4:	e12fff1e 	bx	lr
10000bd8:	100009b0 	.word	0x100009b0
10000bdc:	100009ec 	.word	0x100009ec
10000be0:	10000e78 	.word	0x10000e78

10000be4 <CP15_Enable_I_Cache>:
10000be4:	e92d4010 	push	{r4, lr}
10000be8:	e59f3048 	ldr	r3, [pc, #72]	; 10000c38 <CP15_Enable_I_Cache+0x54>
10000bec:	e1a0e00f 	mov	lr, pc
10000bf0:	e12fff13 	bx	r3
10000bf4:	e3100a01 	tst	r0, #4096	; 0x1000
10000bf8:	0a000005 	beq	10000c14 <CP15_Enable_I_Cache+0x30>
10000bfc:	e59f0038 	ldr	r0, [pc, #56]	; 10000c3c <CP15_Enable_I_Cache+0x58>
10000c00:	e59f3038 	ldr	r3, [pc, #56]	; 10000c40 <CP15_Enable_I_Cache+0x5c>
10000c04:	e1a0e00f 	mov	lr, pc
10000c08:	e12fff13 	bx	r3
10000c0c:	e8bd4010 	pop	{r4, lr}
10000c10:	e12fff1e 	bx	lr
10000c14:	e3800a01 	orr	r0, r0, #4096	; 0x1000
10000c18:	e59f3024 	ldr	r3, [pc, #36]	; 10000c44 <CP15_Enable_I_Cache+0x60>
10000c1c:	e1a0e00f 	mov	lr, pc
10000c20:	e12fff13 	bx	r3
10000c24:	e59f3014 	ldr	r3, [pc, #20]	; 10000c40 <CP15_Enable_I_Cache+0x5c>
10000c28:	e59f0018 	ldr	r0, [pc, #24]	; 10000c48 <CP15_Enable_I_Cache+0x64>
10000c2c:	e1a0e00f 	mov	lr, pc
10000c30:	e12fff13 	bx	r3
10000c34:	eafffff4 	b	10000c0c <CP15_Enable_I_Cache+0x28>
10000c38:	10000110 	.word	0x10000110
10000c3c:	10001008 	.word	0x10001008
10000c40:	100009b0 	.word	0x100009b0
10000c44:	1000011c 	.word	0x1000011c
10000c48:	10000ff0 	.word	0x10000ff0

10000c4c <__aeabi_uidiv>:
10000c4c:	e2512001 	subs	r2, r1, #1	; 0x1
10000c50:	012fff1e 	bxeq	lr
10000c54:	3a000036 	bcc	10000d34 <__aeabi_uidiv+0xe8>
10000c58:	e1500001 	cmp	r0, r1
10000c5c:	9a000022 	bls	10000cec <__aeabi_uidiv+0xa0>
10000c60:	e1110002 	tst	r1, r2
10000c64:	0a000023 	beq	10000cf8 <__aeabi_uidiv+0xac>
10000c68:	e311020e 	tst	r1, #-536870912	; 0xe0000000
10000c6c:	01a01181 	lsleq	r1, r1, #3
10000c70:	03a03008 	moveq	r3, #8	; 0x8
10000c74:	13a03001 	movne	r3, #1	; 0x1
10000c78:	e3510201 	cmp	r1, #268435456	; 0x10000000
10000c7c:	31510000 	cmpcc	r1, r0
10000c80:	31a01201 	lslcc	r1, r1, #4
10000c84:	31a03203 	lslcc	r3, r3, #4
10000c88:	3afffffa 	bcc	10000c78 <__aeabi_uidiv+0x2c>
10000c8c:	e3510102 	cmp	r1, #-2147483648	; 0x80000000
10000c90:	31510000 	cmpcc	r1, r0
10000c94:	31a01081 	lslcc	r1, r1, #1
10000c98:	31a03083 	lslcc	r3, r3, #1
10000c9c:	3afffffa 	bcc	10000c8c <__aeabi_uidiv+0x40>
10000ca0:	e3a02000 	mov	r2, #0	; 0x0
10000ca4:	e1500001 	cmp	r0, r1
10000ca8:	20400001 	subcs	r0, r0, r1
10000cac:	21822003 	orrcs	r2, r2, r3
10000cb0:	e15000a1 	cmp	r0, r1, lsr #1
10000cb4:	204000a1 	subcs	r0, r0, r1, lsr #1
10000cb8:	218220a3 	orrcs	r2, r2, r3, lsr #1
10000cbc:	e1500121 	cmp	r0, r1, lsr #2
10000cc0:	20400121 	subcs	r0, r0, r1, lsr #2
10000cc4:	21822123 	orrcs	r2, r2, r3, lsr #2
10000cc8:	e15001a1 	cmp	r0, r1, lsr #3
10000ccc:	204001a1 	subcs	r0, r0, r1, lsr #3
10000cd0:	218221a3 	orrcs	r2, r2, r3, lsr #3
10000cd4:	e3500000 	cmp	r0, #0	; 0x0
10000cd8:	11b03223 	lsrsne	r3, r3, #4
10000cdc:	11a01221 	lsrne	r1, r1, #4
10000ce0:	1affffef 	bne	10000ca4 <__aeabi_uidiv+0x58>
10000ce4:	e1a00002 	mov	r0, r2
10000ce8:	e12fff1e 	bx	lr
10000cec:	03a00001 	moveq	r0, #1	; 0x1
10000cf0:	13a00000 	movne	r0, #0	; 0x0
10000cf4:	e12fff1e 	bx	lr
10000cf8:	e3510801 	cmp	r1, #65536	; 0x10000
10000cfc:	21a01821 	lsrcs	r1, r1, #16
10000d00:	23a02010 	movcs	r2, #16	; 0x10
10000d04:	33a02000 	movcc	r2, #0	; 0x0
10000d08:	e3510c01 	cmp	r1, #256	; 0x100
10000d0c:	21a01421 	lsrcs	r1, r1, #8
10000d10:	22822008 	addcs	r2, r2, #8	; 0x8
10000d14:	e3510010 	cmp	r1, #16	; 0x10
10000d18:	21a01221 	lsrcs	r1, r1, #4
10000d1c:	22822004 	addcs	r2, r2, #4	; 0x4
10000d20:	e3510004 	cmp	r1, #4	; 0x4
10000d24:	82822003 	addhi	r2, r2, #3	; 0x3
10000d28:	908220a1 	addls	r2, r2, r1, lsr #1
10000d2c:	e1a00230 	lsr	r0, r0, r2
10000d30:	e12fff1e 	bx	lr
10000d34:	e3500000 	cmp	r0, #0	; 0x0
10000d38:	13e00000 	mvnne	r0, #0	; 0x0
10000d3c:	ea000007 	b	10000d60 <__aeabi_idiv0>

10000d40 <__aeabi_uidivmod>:
10000d40:	e3510000 	cmp	r1, #0	; 0x0
10000d44:	0afffffa 	beq	10000d34 <__aeabi_uidiv+0xe8>
10000d48:	e92d4003 	push	{r0, r1, lr}
10000d4c:	ebffffbe 	bl	10000c4c <__aeabi_uidiv>
10000d50:	e8bd4006 	pop	{r1, r2, lr}
10000d54:	e0030092 	mul	r3, r2, r0
10000d58:	e0411003 	sub	r1, r1, r3
10000d5c:	e12fff1e 	bx	lr

10000d60 <__aeabi_idiv0>:
10000d60:	e12fff1e 	bx	lr

10000d64 <pinsDbgu.3118>:
10000d64:	0000c000 fffff600 00000003              ............

10000d70 <tabDesc>:
10000d70:	10020000 10000da4 23f00000 0004b000     ...........#....
10000d80:	10000da4 41202d2d 62313954 73746f6f     ....-- AT91boots
10000d90:	70617274 6f725020 7463656a 20732520     trap Project %s 
10000da0:	0d0a2d2d 00000000 00302e33 25202d2d     --......3.0.-- %
10000db0:	000d0a73 31395441 394d4153 2d303247     s...AT91SAM9G20-
10000dc0:	00004b45 43202d2d 69706d6f 3a64656c     EK..-- Compiled:
10000dd0:	20732520 2d207325 000d0a2d 20677541      %s %s --...Aug 
10000de0:	32203631 00313130 303a3830 32323a31     16 2011.08:01:22
10000df0:	00000000 202d492d 74746553 3a676e69     ....-I- Setting:
10000e00:	4b434d20 25203d20 7a484d64 00000d0a      MCK = %dMHz....
10000e10:	202d492d 74696e49 52445320 0d0a4d41     -I- Init SDRAM..
10000e20:	00000000 202d492d 706d754a 206f7420     ....-I- Jump to 
10000e30:	30257830 0d0a7838 00000000              0x%08x......

10000e3c <pinsSdram.2193>:
10000e3c:	ffff0000 fffff800 00000004              ............

10000e48 <pinsSdram.2154>:
10000e48:	ffff0000 fffff800 00000004 69647473     ............stdi
10000e58:	3a632e6f 636e6920 73616572 414d2065     o.c: increase MA
10000e68:	54535f58 474e4952 5a49535f 000d0a45     X_STRING_SIZE...
10000e78:	202d492d 79706f43 73252220 25282022     -I- Copy "%s" (%
10000e88:	79622064 29736574 6f726620 4f4e206d     d bytes) from NO
10000e98:	78302052 78383025 206f7420 30257830     R 0x%08x to 0x%0
10000ea8:	0d0a7838 00000000 202d492d 61632044     8x......-I- D ca
10000eb8:	20656863 61736964 64656c62 000d0a2e     che disabled....
10000ec8:	202d492d 61632044 20656863 61207369     -I- D cache is a
10000ed8:	6165726c 64207964 62617369 2e64656c     lready disabled.
10000ee8:	00000d0a 202d452d 6e206f44 6968746f     ....-E- Do nothi
10000ef8:	203a676e 20554d4d 20746f6e 62616e65     ng: MMU not enab
10000f08:	0a64656c 0000000d 202d492d 61632044     led.....-I- D ca
10000f18:	20656863 62616e65 2e64656c 00000d0a     che enabled.....
10000f28:	202d492d 61632044 20656863 61207369     -I- D cache is a
10000f38:	6165726c 65207964 6c62616e 0a2e6465     lready enabled..
10000f48:	0000000d 202d492d 20554d4d 61736964     ....-I- MMU disa
10000f58:	64656c62 000d0a2e 202d492d 20554d4d     bled....-I- MMU 
10000f68:	61207369 6165726c 64207964 62617369     is already disab
10000f78:	2e64656c 00000d0a 202d492d 20554d4d     led.....-I- MMU 
10000f88:	62616e65 2e64656c 00000d0a 202d492d     enabled.....-I- 
10000f98:	20554d4d 61207369 6165726c 65207964     MMU is already e
10000fa8:	6c62616e 0a2e6465 0000000d 202d492d     nabled......-I- 
10000fb8:	61632049 20656863 61736964 64656c62     I cache disabled
10000fc8:	000d0a2e 202d492d 61632049 20656863     ....-I- I cache 
10000fd8:	61207369 6165726c 64207964 62617369     is already disab
10000fe8:	2e64656c 00000d0a 202d492d 61632049     led.....-I- I ca
10000ff8:	20656863 62616e65 2e64656c 00000d0a     che enabled.....
10001008:	202d492d 61632049 20656863 61207369     -I- I cache is a
10001018:	6165726c 65207964 6c62616e 0a2e6465     lready enabled..
10001028:	0000000d                                ....
