
bin/boot-at91sam9g20-ek-norflash2sdram.elf:     file format elf32-littlearm

Disassembly of section .prerelocate:

00200000 <defaultSpuriousHandler>:
  200000:	eafffffe 	b	200000 <defaultSpuriousHandler>

00200004 <defaultFiqHandler>:
  200004:	eafffffe 	b	200004 <defaultFiqHandler>

00200008 <defaultIrqHandler>:
  200008:	eafffffe 	b	200008 <defaultIrqHandler>

0020000c <LowLevelInit>:
  20000c:	e92d4010 	push	{r4, lr}
  200010:	e3a01901 	mov	r1, #16384	; 0x4000
  200014:	e3e02000 	mvn	r2, #0	; 0x0
  200018:	e3a03c01 	mov	r3, #256	; 0x100
  20001c:	e2811001 	add	r1, r1, #1	; 0x1
  200020:	e3e00c03 	mvn	r0, #768	; 0x300
  200024:	e50239ff 	str	r3, [r2, #-2559]
  200028:	e50239ef 	str	r3, [r2, #-2543]
  20002c:	e50239cb 	str	r3, [r2, #-2507]
  200030:	e50010df 	str	r1, [r0, #-223]
  200034:	e5103097 	ldr	r3, [r0, #-151]
  200038:	e3130001 	tst	r3, #1	; 0x1
  20003c:	e3e02c03 	mvn	r2, #768	; 0x300
  200040:	0afffffb 	beq	200034 <LowLevelInit+0x28>
  200044:	e3a03212 	mov	r3, #536870913	; 0x20000001
  200048:	e283382a 	add	r3, r3, #2752512	; 0x2a0000
  20004c:	e2833c06 	add	r3, r3, #1536	; 0x600
  200050:	e50230d7 	str	r3, [r2, #-215]
  200054:	e1a01002 	mov	r1, r2
  200058:	e5113097 	ldr	r3, [r1, #-151]
  20005c:	e3130002 	tst	r3, #2	; 0x2
  200060:	e3e02c03 	mvn	r2, #768	; 0x300
  200064:	0afffffb 	beq	200058 <LowLevelInit+0x4c>
  200068:	e5123097 	ldr	r3, [r2, #-151]
  20006c:	e3130004 	tst	r3, #4	; 0x4
  200070:	1a000006 	bne	200090 <LowLevelInit+0x84>
  200074:	e3a03819 	mov	r3, #1638400	; 0x190000
  200078:	e2833c3f 	add	r3, r3, #16128	; 0x3f00
  20007c:	e2833251 	add	r3, r3, #268435461	; 0x10000005
  200080:	e50230d3 	str	r3, [r2, #-211]
  200084:	e5123097 	ldr	r3, [r2, #-151]
  200088:	e3130004 	tst	r3, #4	; 0x4
  20008c:	0afffffc 	beq	200084 <LowLevelInit+0x78>
  200090:	e3e01c03 	mvn	r1, #768	; 0x300
  200094:	e5113097 	ldr	r3, [r1, #-151]
  200098:	e3130008 	tst	r3, #8	; 0x8
  20009c:	e3e02c03 	mvn	r2, #768	; 0x300
  2000a0:	0afffffb 	beq	200094 <LowLevelInit+0x88>
  2000a4:	e3a03c13 	mov	r3, #4864	; 0x1300
  2000a8:	e50230cf 	str	r3, [r2, #-207]
  2000ac:	e5123097 	ldr	r3, [r2, #-151]
  2000b0:	e3130008 	tst	r3, #8	; 0x8
  2000b4:	e3e00c03 	mvn	r0, #768	; 0x300
  2000b8:	0afffffb 	beq	2000ac <LowLevelInit+0xa0>
  2000bc:	e3e02000 	mvn	r2, #0	; 0x0
  2000c0:	e3a01c01 	mov	r1, #256	; 0x100
  2000c4:	e50219cf 	str	r1, [r2, #-2511]
  2000c8:	e51030cf 	ldr	r3, [r0, #-207]
  2000cc:	e3833002 	orr	r3, r3, #2	; 0x2
  2000d0:	e50030cf 	str	r3, [r0, #-207]
  2000d4:	e1a02000 	mov	r2, r0
  2000d8:	e5123097 	ldr	r3, [r2, #-151]
  2000dc:	e3130008 	tst	r3, #8	; 0x8
  2000e0:	0afffffc 	beq	2000d8 <LowLevelInit+0xcc>
  2000e4:	e3e02000 	mvn	r2, #0	; 0x0
  2000e8:	e3a03c01 	mov	r3, #256	; 0x100
  2000ec:	e50239cf 	str	r3, [r2, #-2511]
  2000f0:	e59f3098 	ldr	r3, [pc, #152]	; 200190 <LowLevelInit+0x184>
  2000f4:	e3e01c0f 	mvn	r1, #3840	; 0xf00
  2000f8:	e5812025 	str	r2, [r1, #37]
  2000fc:	e59f0090 	ldr	r0, [pc, #144]	; 200194 <LowLevelInit+0x188>
  200100:	e501307f 	str	r3, [r1, #-127]
  200104:	e2822002 	add	r2, r2, #2	; 0x2
  200108:	e1a03102 	lsl	r3, r2, #2
  20010c:	e2822001 	add	r2, r2, #1	; 0x1
  200110:	e2433d3e 	sub	r3, r3, #3968	; 0xf80
  200114:	e352001f 	cmp	r2, #31	; 0x1f
  200118:	e5830000 	str	r0, [r3]
  20011c:	e3e01c0f 	mvn	r1, #3840	; 0xf00
  200120:	1afffff8 	bne	200108 <LowLevelInit+0xfc>
  200124:	e59f306c 	ldr	r3, [pc, #108]	; 200198 <LowLevelInit+0x18c>
  200128:	e5813035 	str	r3, [r1, #53]
  20012c:	e3a03000 	mov	r3, #0	; 0x0
  200130:	e1a02003 	mov	r2, r3
  200134:	e2833001 	add	r3, r3, #1	; 0x1
  200138:	e20330ff 	and	r3, r3, #255	; 0xff
  20013c:	e3530008 	cmp	r3, #8	; 0x8
  200140:	e5812031 	str	r2, [r1, #49]
  200144:	1afffffa 	bne	200134 <LowLevelInit+0x128>
  200148:	e3e04c02 	mvn	r4, #512	; 0x200
  20014c:	e3a03902 	mov	r3, #32768	; 0x8000
  200150:	e50430bb 	str	r3, [r4, #-187]
  200154:	e59f2040 	ldr	r2, [pc, #64]	; 20019c <LowLevelInit+0x190>
  200158:	e1a0e00f 	mov	lr, pc
  20015c:	e12fff12 	bx	r2
  200160:	e51430df 	ldr	r3, [r4, #-223]
  200164:	e3c33803 	bic	r3, r3, #196608	; 0x30000
  200168:	e50430df 	str	r3, [r4, #-223]
  20016c:	e51420cf 	ldr	r2, [r4, #-207]
  200170:	e3c22402 	bic	r2, r2, #33554432	; 0x2000000
  200174:	e3a00010 	mov	r0, #16	; 0x10
  200178:	e50420cf 	str	r2, [r4, #-207]
  20017c:	e59f301c 	ldr	r3, [pc, #28]	; 2001a0 <LowLevelInit+0x194>
  200180:	e1a0e00f 	mov	lr, pc
  200184:	e12fff13 	bx	r3
  200188:	e8bd4010 	pop	{r4, lr}
  20018c:	e12fff1e 	bx	lr
  200190:	00200004 	.word	0x00200004
  200194:	00200008 	.word	0x00200008
  200198:	00200000 	.word	0x00200000
  20019c:	002001a4 	.word	0x002001a4
  2001a0:	002001b4 	.word	0x002001b4

002001a4 <BOARD_RemapRam>:
  2001a4:	e3a02003 	mov	r2, #3	; 0x3
  2001a8:	e3e03c11 	mvn	r3, #4352	; 0x1100
  2001ac:	e5832001 	str	r2, [r3, #1]
  2001b0:	e12fff1e 	bx	lr

002001b4 <BOARD_ConfigureNorFlash>:
  2001b4:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
  2001b8:	e3a0180a 	mov	r1, #655360	; 0xa0000
  2001bc:	e1a04000 	mov	r4, r0
  2001c0:	e59f205c 	ldr	r2, [pc, #92]	; 200224 <BOARD_ConfigureNorFlash+0x70>
  2001c4:	e3a00801 	mov	r0, #65536	; 0x10000
  2001c8:	e3e0cc13 	mvn	ip, #4864	; 0x1300
  2001cc:	e3a03002 	mov	r3, #2	; 0x2
  2001d0:	e281100a 	add	r1, r1, #10	; 0xa
  2001d4:	e2800003 	add	r0, r0, #3	; 0x3
  2001d8:	e50c30ff 	str	r3, [ip, #-255]
  2001dc:	e50c20fb 	str	r2, [ip, #-251]
  2001e0:	e50c10f7 	str	r1, [ip, #-247]
  2001e4:	e50c00f3 	str	r0, [ip, #-243]
  2001e8:	e3540008 	cmp	r4, #8	; 0x8
  2001ec:	051c30f3 	ldreq	r3, [ip, #-243]
  2001f0:	050c30f3 	streq	r3, [ip, #-243]
  2001f4:	0a000008 	beq	20021c <BOARD_ConfigureNorFlash+0x68>
  2001f8:	e3540010 	cmp	r4, #16	; 0x10
  2001fc:	051c30f3 	ldreq	r3, [ip, #-243]
  200200:	03833a01 	orreq	r3, r3, #4096	; 0x1000
  200204:	050c30f3 	streq	r3, [ip, #-243]
  200208:	0a000003 	beq	20021c <BOARD_ConfigureNorFlash+0x68>
  20020c:	e3540020 	cmp	r4, #32	; 0x20
  200210:	051c30f3 	ldreq	r3, [ip, #-243]
  200214:	03833a02 	orreq	r3, r3, #8192	; 0x2000
  200218:	050c30f3 	streq	r3, [ip, #-243]
  20021c:	e8bd0010 	pop	{r4}
  200220:	e12fff1e 	bx	lr
  200224:	0a0a0a06 	.word	0x0a0a0a06

00200228 <BOARD_ConfigureSdram>:
  200228:	e92d4010 	push	{r4, lr}
  20022c:	e59f3158 	ldr	r3, [pc, #344]	; 20038c <BOARD_ConfigureSdram+0x164>
  200230:	e3500010 	cmp	r0, #16	; 0x10
  200234:	e24dd008 	sub	sp, sp, #8	; 0x8
  200238:	e59f4150 	ldr	r4, [pc, #336]	; 200390 <BOARD_ConfigureSdram+0x168>
  20023c:	e3a01001 	mov	r1, #1	; 0x1
  200240:	11a04003 	movne	r4, r3
  200244:	e59f0148 	ldr	r0, [pc, #328]	; 200394 <BOARD_ConfigureSdram+0x16c>
  200248:	e59f3148 	ldr	r3, [pc, #328]	; 200398 <BOARD_ConfigureSdram+0x170>
  20024c:	e1a0e00f 	mov	lr, pc
  200250:	e12fff13 	bx	r3
  200254:	e3e03c11 	mvn	r3, #4352	; 0x1100
  200258:	e3a01002 	mov	r1, #2	; 0x2
  20025c:	e583101d 	str	r1, [r3, #29]
  200260:	e3e02c15 	mvn	r2, #5376	; 0x1500
  200264:	e3a03000 	mov	r3, #0	; 0x0
  200268:	e50240f7 	str	r4, [r2, #-247]
  20026c:	e58d3004 	str	r3, [sp, #4]
  200270:	e59d2004 	ldr	r2, [sp, #4]
  200274:	e2833ff9 	add	r3, r3, #996	; 0x3e4
  200278:	e2833003 	add	r3, r3, #3	; 0x3
  20027c:	e1520003 	cmp	r2, r3
  200280:	8a000006 	bhi	2002a0 <BOARD_ConfigureSdram+0x78>
  200284:	e1a01003 	mov	r1, r3
  200288:	e59d3004 	ldr	r3, [sp, #4]
  20028c:	e2833001 	add	r3, r3, #1	; 0x1
  200290:	e58d3004 	str	r3, [sp, #4]
  200294:	e59d2004 	ldr	r2, [sp, #4]
  200298:	e1520001 	cmp	r2, r1
  20029c:	9afffff9 	bls	200288 <BOARD_ConfigureSdram+0x60>
  2002a0:	e3e01c15 	mvn	r1, #5376	; 0x1500
  2002a4:	e3a03001 	mov	r3, #1	; 0x1
  2002a8:	e50130ff 	str	r3, [r1, #-255]
  2002ac:	e3a02000 	mov	r2, #0	; 0x0
  2002b0:	e3a00202 	mov	r0, #536870912	; 0x20000000
  2002b4:	e0833003 	add	r3, r3, r3
  2002b8:	e5802000 	str	r2, [r0]
  2002bc:	e50130ff 	str	r3, [r1, #-255]
  2002c0:	e5802000 	str	r2, [r0]
  2002c4:	e58d2004 	str	r2, [sp, #4]
  2002c8:	e59d3004 	ldr	r3, [sp, #4]
  2002cc:	e2822c27 	add	r2, r2, #9984	; 0x2700
  2002d0:	e282200f 	add	r2, r2, #15	; 0xf
  2002d4:	e1530002 	cmp	r3, r2
  2002d8:	8a000006 	bhi	2002f8 <BOARD_ConfigureSdram+0xd0>
  2002dc:	e1a01002 	mov	r1, r2
  2002e0:	e59d3004 	ldr	r3, [sp, #4]
  2002e4:	e2833001 	add	r3, r3, #1	; 0x1
  2002e8:	e58d3004 	str	r3, [sp, #4]
  2002ec:	e59d2004 	ldr	r2, [sp, #4]
  2002f0:	e1520001 	cmp	r2, r1
  2002f4:	9afffff9 	bls	2002e0 <BOARD_ConfigureSdram+0xb8>
  2002f8:	e3e01c15 	mvn	r1, #5376	; 0x1500
  2002fc:	e3a00202 	mov	r0, #536870912	; 0x20000000
  200300:	e3a02004 	mov	r2, #4	; 0x4
  200304:	e3a03001 	mov	r3, #1	; 0x1
  200308:	e50120ff 	str	r2, [r1, #-255]
  20030c:	e3a0c003 	mov	ip, #3	; 0x3
  200310:	e5803004 	str	r3, [r0, #4]
  200314:	e0833003 	add	r3, r3, r3
  200318:	e50120ff 	str	r2, [r1, #-255]
  20031c:	e5803008 	str	r3, [r0, #8]
  200320:	e083300c 	add	r3, r3, ip
  200324:	e50120ff 	str	r2, [r1, #-255]
  200328:	e580c00c 	str	ip, [r0, #12]
  20032c:	e50120ff 	str	r2, [r1, #-255]
  200330:	e5802010 	str	r2, [r0, #16]
  200334:	e50120ff 	str	r2, [r1, #-255]
  200338:	e5803014 	str	r3, [r0, #20]
  20033c:	e2833001 	add	r3, r3, #1	; 0x1
  200340:	e50120ff 	str	r2, [r1, #-255]
  200344:	e5803018 	str	r3, [r0, #24]
  200348:	e2833001 	add	r3, r3, #1	; 0x1
  20034c:	e50120ff 	str	r2, [r1, #-255]
  200350:	e580301c 	str	r3, [r0, #28]
  200354:	e2833001 	add	r3, r3, #1	; 0x1
  200358:	e50120ff 	str	r2, [r1, #-255]
  20035c:	e5803020 	str	r3, [r0, #32]
  200360:	e59f3034 	ldr	r3, [pc, #52]	; 20039c <BOARD_ConfigureSdram+0x174>
  200364:	e3a04000 	mov	r4, #0	; 0x0
  200368:	e2822fe6 	add	r2, r2, #920	; 0x398
  20036c:	e501c0ff 	str	ip, [r1, #-255]
  200370:	e5803024 	str	r3, [r0, #36]
  200374:	e50120fb 	str	r2, [r1, #-251]
  200378:	e50140ff 	str	r4, [r1, #-255]
  20037c:	e5804000 	str	r4, [r0]
  200380:	e28dd008 	add	sp, sp, #8	; 0x8
  200384:	e8bd4010 	pop	{r4, lr}
  200388:	e12fff1e 	bx	lr
  20038c:	96338379 	.word	0x96338379
  200390:	963383f9 	.word	0x963383f9
  200394:	10000e08 	.word	0x10000e08
  200398:	10000268 	.word	0x10000268
  20039c:	cafedede 	.word	0xcafedede
Disassembly of section .fixed:

10000000 <_sfixed>:
10000000:	e59f108c 	ldr	r1, [pc, #140]	; 10000094 <_sfixed+0x94>
10000004:	e3a02902 	mov	r2, #32768	; 0x8000
10000008:	e5812000 	str	r2, [r1]
1000000c:	e59f0084 	ldr	r0, [pc, #132]	; 10000098 <_sfixed+0x98>
10000010:	e59ff084 	ldr	pc, [pc, #132]	; 1000009c <_sfixed+0x9c>
10000014:	e59f0084 	ldr	r0, [pc, #132]	; 100000a0 <_sfixed+0xa0>
10000018:	e59f1084 	ldr	r1, [pc, #132]	; 100000a4 <_sfixed+0xa4>
1000001c:	e59f2084 	ldr	r2, [pc, #132]	; 100000a8 <_sfixed+0xa8>
10000020:	e1510002 	cmp	r1, r2
10000024:	34903004 	ldrcc	r3, [r0], #4
10000028:	34813004 	strcc	r3, [r1], #4
1000002c:	3afffffb 	bcc	10000020 <_sfixed+0x20>
10000030:	e59fd074 	ldr	sp, [pc, #116]	; 100000ac <_sfixed+0xac>
10000034:	e92d0001 	push	{r0}
10000038:	e59f0070 	ldr	r0, [pc, #112]	; 100000b0 <_sfixed+0xb0>
1000003c:	e12fff30 	blx	r0
10000040:	e8bd0001 	pop	{r0}
10000044:	e59f1068 	ldr	r1, [pc, #104]	; 100000b4 <_sfixed+0xb4>
10000048:	e59f2068 	ldr	r2, [pc, #104]	; 100000b8 <_sfixed+0xb8>
1000004c:	e1510002 	cmp	r1, r2
10000050:	34903004 	ldrcc	r3, [r0], #4
10000054:	34813004 	strcc	r3, [r1], #4
10000058:	3afffffb 	bcc	1000004c <_sfixed+0x4c>
1000005c:	e59f0058 	ldr	r0, [pc, #88]	; 100000bc <_sfixed+0xbc>
10000060:	e59f1058 	ldr	r1, [pc, #88]	; 100000c0 <_sfixed+0xc0>
10000064:	e3a02000 	mov	r2, #0	; 0x0
10000068:	e1500001 	cmp	r0, r1
1000006c:	34802004 	strcc	r2, [r0], #4
10000070:	3afffffc 	bcc	10000068 <_sfixed+0x68>
10000074:	e321f0d2 	msr	CPSR_c, #210	; 0xd2
10000078:	e59fd02c 	ldr	sp, [pc, #44]	; 100000ac <_sfixed+0xac>
1000007c:	e24d4060 	sub	r4, sp, #96	; 0x60
10000080:	e321f053 	msr	CPSR_c, #83	; 0x53
10000084:	e1a0d004 	mov	sp, r4
10000088:	e59f0034 	ldr	r0, [pc, #52]	; 100000c4 <_sfixed+0xc4>
1000008c:	e12fff30 	blx	r0
10000090:	eafffffe 	b	10000090 <_sfixed+0x90>
10000094:	fffffd44 	.word	0xfffffd44
10000098:	002003a0 	.word	0x002003a0
1000009c:	10000014 	.word	0x10000014
100000a0:	10000fec 	.word	0x10000fec
100000a4:	00200000 	.word	0x00200000
100000a8:	002003a0 	.word	0x002003a0
100000ac:	00301000 	.word	0x00301000
100000b0:	0020000c 	.word	0x0020000c
100000b4:	002003a0 	.word	0x002003a0
100000b8:	00200818 	.word	0x00200818
100000bc:	00300000 	.word	0x00300000
100000c0:	00300000 	.word	0x00300000
100000c4:	10000110 	.word	0x10000110
100000c8:	e1a00000 	.word	0xe1a00000
100000cc:	e1a00000 	.word	0xe1a00000

100000d0 <_readControlRegister>:
100000d0:	e3a00000 	mov	r0, #0	; 0x0
100000d4:	ee110f10 	mrc	15, 0, r0, cr1, cr0, {0}
100000d8:	e12fff1e 	bx	lr

100000dc <_writeControlRegister>:
100000dc:	ee010f10 	mcr	15, 0, r0, cr1, cr0, {0}
100000e0:	e12fff1e 	bx	lr

100000e4 <_waitForInterrupt>:
100000e4:	e3a00000 	mov	r0, #0	; 0x0
100000e8:	ee070f90 	mcr	15, 0, r0, cr7, cr0, {4}
100000ec:	e12fff1e 	bx	lr

100000f0 <_writeTTB>:
100000f0:	ee020f10 	mcr	15, 0, r0, cr2, cr0, {0}
100000f4:	e12fff1e 	bx	lr

100000f8 <_writeDomain>:
100000f8:	ee030f10 	mcr	15, 0, r0, cr3, cr0, {0}
100000fc:	e12fff1e 	bx	lr

10000100 <_writeITLBLockdown>:
10000100:	ee0a0f10 	mcr	15, 0, r0, cr10, cr0, {0}
10000104:	e12fff1e 	bx	lr

10000108 <_prefetchICacheLine>:
10000108:	ee070f3d 	mcr	15, 0, r0, cr7, cr13, {1}
1000010c:	e12fff1e 	bx	lr

10000110 <main>:
10000110:	e3e0cc02 	mvn	ip, #512	; 0x200
10000114:	e51c30f7 	ldr	r3, [ip, #-247]
10000118:	e38334a5 	orr	r3, r3, #-1526726656	; 0xa5000000
1000011c:	e3833001 	orr	r3, r3, #1	; 0x1
10000120:	e92d4070 	push	{r4, r5, r6, lr}
10000124:	e50c30f7 	str	r3, [ip, #-247]
10000128:	e3a01001 	mov	r1, #1	; 0x1
1000012c:	e59f20e8 	ldr	r2, [pc, #232]	; 1000021c <main+0x10c>
10000130:	e59f00e8 	ldr	r0, [pc, #232]	; 10000220 <main+0x110>
10000134:	e1a0e00f 	mov	lr, pc
10000138:	e12fff12 	bx	r2
1000013c:	e3a01907 	mov	r1, #114688	; 0x1c000
10000140:	e3a0267d 	mov	r2, #131072000	; 0x7d00000
10000144:	e59f30d8 	ldr	r3, [pc, #216]	; 10000224 <main+0x114>
10000148:	e2822afa 	add	r2, r2, #1024000	; 0xfa000
1000014c:	e2811c02 	add	r1, r1, #512	; 0x200
10000150:	e3a00b02 	mov	r0, #2048	; 0x800
10000154:	e1a0e00f 	mov	lr, pc
10000158:	e12fff13 	bx	r3
1000015c:	e59f40c4 	ldr	r4, [pc, #196]	; 10000228 <main+0x118>
10000160:	e59f00c4 	ldr	r0, [pc, #196]	; 1000022c <main+0x11c>
10000164:	e1a0e00f 	mov	lr, pc
10000168:	e12fff14 	bx	r4
1000016c:	e59f10bc 	ldr	r1, [pc, #188]	; 10000230 <main+0x120>
10000170:	e59f00bc 	ldr	r0, [pc, #188]	; 10000234 <main+0x124>
10000174:	e1a0e00f 	mov	lr, pc
10000178:	e12fff14 	bx	r4
1000017c:	e59f10b4 	ldr	r1, [pc, #180]	; 10000238 <main+0x128>
10000180:	e59f00b4 	ldr	r0, [pc, #180]	; 1000023c <main+0x12c>
10000184:	e1a0e00f 	mov	lr, pc
10000188:	e12fff14 	bx	r4
1000018c:	e59f20ac 	ldr	r2, [pc, #172]	; 10000240 <main+0x130>
10000190:	e59f10ac 	ldr	r1, [pc, #172]	; 10000244 <main+0x134>
10000194:	e59f00ac 	ldr	r0, [pc, #172]	; 10000248 <main+0x138>
10000198:	e1a0e00f 	mov	lr, pc
1000019c:	e12fff14 	bx	r4
100001a0:	e3a01084 	mov	r1, #132	; 0x84
100001a4:	e59f00a0 	ldr	r0, [pc, #160]	; 1000024c <main+0x13c>
100001a8:	e1a0e00f 	mov	lr, pc
100001ac:	e12fff14 	bx	r4
100001b0:	e59f3098 	ldr	r3, [pc, #152]	; 10000250 <main+0x140>
100001b4:	e1a0e00f 	mov	lr, pc
100001b8:	e12fff13 	bx	r3
100001bc:	e59f0090 	ldr	r0, [pc, #144]	; 10000254 <main+0x144>
100001c0:	e1a0e00f 	mov	lr, pc
100001c4:	e12fff14 	bx	r4
100001c8:	e3a0558f 	mov	r5, #599785472	; 0x23c00000
100001cc:	e3a00020 	mov	r0, #32	; 0x20
100001d0:	e59f3080 	ldr	r3, [pc, #128]	; 10000258 <main+0x148>
100001d4:	e1a0e00f 	mov	lr, pc
100001d8:	e12fff13 	bx	r3
100001dc:	e2855603 	add	r5, r5, #3145728	; 0x300000
100001e0:	e3a01001 	mov	r1, #1	; 0x1
100001e4:	e59f3070 	ldr	r3, [pc, #112]	; 1000025c <main+0x14c>
100001e8:	e59f0070 	ldr	r0, [pc, #112]	; 10000260 <main+0x150>
100001ec:	e1a0e00f 	mov	lr, pc
100001f0:	e12fff13 	bx	r3
100001f4:	e1a01005 	mov	r1, r5
100001f8:	e59f0064 	ldr	r0, [pc, #100]	; 10000264 <main+0x154>
100001fc:	e1a0e00f 	mov	lr, pc
10000200:	e12fff14 	bx	r4
10000204:	e3a01e65 	mov	r1, #1616	; 0x650
10000208:	e2811008 	add	r1, r1, #8	; 0x8
1000020c:	e3a00000 	mov	r0, #0	; 0x0
10000210:	e1a0e00f 	mov	lr, pc
10000214:	e12fff15 	bx	r5
10000218:	eafffffe 	b	10000218 <main+0x108>
1000021c:	10000268 	.word	0x10000268
10000220:	10000d24 	.word	0x10000d24
10000224:	10000a48 	.word	0x10000a48
10000228:	10000970 	.word	0x10000970
1000022c:	10000f50 	.word	0x10000f50
10000230:	10000d68 	.word	0x10000d68
10000234:	10000d44 	.word	0x10000d44
10000238:	10000d74 	.word	0x10000d74
1000023c:	10000d6c 	.word	0x10000d6c
10000240:	10000da8 	.word	0x10000da8
10000244:	10000d9c 	.word	0x10000d9c
10000248:	10000d84 	.word	0x10000d84
1000024c:	10000db4 	.word	0x10000db4
10000250:	10000ba4 	.word	0x10000ba4
10000254:	10000dd0 	.word	0x10000dd0
10000258:	00200228 	.word	0x00200228
1000025c:	10000b24 	.word	0x10000b24
10000260:	10000d30 	.word	0x10000d30
10000264:	10000de4 	.word	0x10000de4

10000268 <PIO_Configure>:
10000268:	e3510000 	cmp	r1, #0	; 0x0
1000026c:	e92d0070 	push	{r4, r5, r6}
10000270:	0a000030 	beq	10000338 <PIO_Configure+0xd0>
10000274:	e3a05001 	mov	r5, #1	; 0x1
10000278:	e3e06c03 	mvn	r6, #768	; 0x300
1000027c:	e5d03009 	ldrb	r3, [r0, #9]
10000280:	e3530004 	cmp	r3, #4	; 0x4
10000284:	979ff103 	ldrls	pc, [pc, r3, lsl #2]
10000288:	ea000004 	b	100002a0 <PIO_Configure+0x38>
1000028c:	10000364 	.word	0x10000364
10000290:	10000340 	.word	0x10000340
10000294:	100002f4 	.word	0x100002f4
10000298:	100002ac 	.word	0x100002ac
1000029c:	100002ac 	.word	0x100002ac
100002a0:	e3a00000 	mov	r0, #0	; 0x0
100002a4:	e8bd0070 	pop	{r4, r5, r6}
100002a8:	e12fff1e 	bx	lr
100002ac:	e5d0400a 	ldrb	r4, [r0, #10]
100002b0:	e8901004 	ldm	r0, {r2, ip}
100002b4:	e3140001 	tst	r4, #1	; 0x1
100002b8:	e58c2044 	str	r2, [ip, #68]
100002bc:	158c2064 	strne	r2, [ip, #100]
100002c0:	058c2060 	streq	r2, [ip, #96]
100002c4:	e3140004 	tst	r4, #4	; 0x4
100002c8:	158c2050 	strne	r2, [ip, #80]
100002cc:	058c2054 	streq	r2, [ip, #84]
100002d0:	e3530004 	cmp	r3, #4	; 0x4
100002d4:	058c2030 	streq	r2, [ip, #48]
100002d8:	158c2034 	strne	r2, [ip, #52]
100002dc:	e58c2010 	str	r2, [ip, #16]
100002e0:	e58c2000 	str	r2, [ip]
100002e4:	e2511001 	subs	r1, r1, #1	; 0x1
100002e8:	0a000012 	beq	10000338 <PIO_Configure+0xd0>
100002ec:	e280000c 	add	r0, r0, #12	; 0xc
100002f0:	eaffffe1 	b	1000027c <PIO_Configure+0x14>
100002f4:	e5d03008 	ldrb	r3, [r0, #8]
100002f8:	e1a03315 	lsl	r3, r5, r3
100002fc:	e50630ef 	str	r3, [r6, #-239]
10000300:	e5d0c00a 	ldrb	ip, [r0, #10]
10000304:	e5902004 	ldr	r2, [r0, #4]
10000308:	e5903000 	ldr	r3, [r0]
1000030c:	e31c0001 	tst	ip, #1	; 0x1
10000310:	e5823044 	str	r3, [r2, #68]
10000314:	15823064 	strne	r3, [r2, #100]
10000318:	05823060 	streq	r3, [r2, #96]
1000031c:	e31c0002 	tst	ip, #2	; 0x2
10000320:	15823020 	strne	r3, [r2, #32]
10000324:	05823024 	streq	r3, [r2, #36]
10000328:	e2511001 	subs	r1, r1, #1	; 0x1
1000032c:	e5823014 	str	r3, [r2, #20]
10000330:	e5823000 	str	r3, [r2]
10000334:	1affffec 	bne	100002ec <PIO_Configure+0x84>
10000338:	e3a00001 	mov	r0, #1	; 0x1
1000033c:	eaffffd8 	b	100002a4 <PIO_Configure+0x3c>
10000340:	e5d0300a 	ldrb	r3, [r0, #10]
10000344:	e8901004 	ldm	r0, {r2, ip}
10000348:	e3130001 	tst	r3, #1	; 0x1
1000034c:	e58c2044 	str	r2, [ip, #68]
10000350:	158c2064 	strne	r2, [ip, #100]
10000354:	058c2060 	streq	r2, [ip, #96]
10000358:	e58c2074 	str	r2, [ip, #116]
1000035c:	e58c2004 	str	r2, [ip, #4]
10000360:	eaffffdf 	b	100002e4 <PIO_Configure+0x7c>
10000364:	e5d0300a 	ldrb	r3, [r0, #10]
10000368:	e8901004 	ldm	r0, {r2, ip}
1000036c:	e3130001 	tst	r3, #1	; 0x1
10000370:	e58c2044 	str	r2, [ip, #68]
10000374:	158c2064 	strne	r2, [ip, #100]
10000378:	058c2060 	streq	r2, [ip, #96]
1000037c:	e58c2070 	str	r2, [ip, #112]
10000380:	e58c2004 	str	r2, [ip, #4]
10000384:	eaffffd6 	b	100002e4 <PIO_Configure+0x7c>

10000388 <PutUnsignedInt>:
10000388:	e92d4070 	push	{r4, r5, r6, lr}
1000038c:	e3530009 	cmp	r3, #9	; 0x9
10000390:	e1a06002 	mov	r6, r2
10000394:	e1a05003 	mov	r5, r3
10000398:	e1a04000 	mov	r4, r0
1000039c:	e1a02001 	mov	r2, r1
100003a0:	e246c001 	sub	ip, r6, #1	; 0x1
100003a4:	8a000014 	bhi	100003fc <PutUnsignedInt+0x74>
100003a8:	e35c0000 	cmp	ip, #0	; 0x0
100003ac:	d3a06001 	movle	r6, #1	; 0x1
100003b0:	da000005 	ble	100003cc <PutUnsignedInt+0x44>
100003b4:	e3a03000 	mov	r3, #0	; 0x0
100003b8:	e7c42003 	strb	r2, [r4, r3]
100003bc:	e2833001 	add	r3, r3, #1	; 0x1
100003c0:	e153000c 	cmp	r3, ip
100003c4:	1afffffb 	bne	100003b8 <PutUnsignedInt+0x30>
100003c8:	e0844003 	add	r4, r4, r3
100003cc:	e59f3050 	ldr	r3, [pc, #80]	; 10000424 <PutUnsignedInt+0x9c>
100003d0:	e0821593 	umull	r1, r2, r3, r5
100003d4:	e1a021a2 	lsr	r2, r2, #3
100003d8:	e1a03182 	lsl	r3, r2, #3
100003dc:	e1a02082 	lsl	r2, r2, #1
100003e0:	e0822003 	add	r2, r2, r3
100003e4:	e0622005 	rsb	r2, r2, r5
100003e8:	e2822030 	add	r2, r2, #48	; 0x30
100003ec:	e5c42000 	strb	r2, [r4]
100003f0:	e1a00006 	mov	r0, r6
100003f4:	e8bd4070 	pop	{r4, r5, r6, lr}
100003f8:	e12fff1e 	bx	lr
100003fc:	e59f2020 	ldr	r2, [pc, #32]	; 10000424 <PutUnsignedInt+0x9c>
10000400:	e083e592 	umull	lr, r3, r2, r5
10000404:	e1a0200c 	mov	r2, ip
10000408:	e1a031a3 	lsr	r3, r3, #3
1000040c:	e59fc014 	ldr	ip, [pc, #20]	; 10000428 <PutUnsignedInt+0xa0>
10000410:	e1a0e00f 	mov	lr, pc
10000414:	e12fff1c 	bx	ip
10000418:	e0844000 	add	r4, r4, r0
1000041c:	e2806001 	add	r6, r0, #1	; 0x1
10000420:	eaffffe9 	b	100003cc <PutUnsignedInt+0x44>
10000424:	cccccccd 	.word	0xcccccccd
10000428:	10000388 	.word	0x10000388

1000042c <PutSignedInt>:
1000042c:	e92d4070 	push	{r4, r5, r6, lr}
10000430:	e0236fc3 	eor	r6, r3, r3, asr #31
10000434:	e0466fc3 	sub	r6, r6, r3, asr #31
10000438:	e3560009 	cmp	r6, #9	; 0x9
1000043c:	e1a05003 	mov	r5, r3
10000440:	e242c001 	sub	ip, r2, #1	; 0x1
10000444:	e1a04000 	mov	r4, r0
10000448:	e1a03001 	mov	r3, r1
1000044c:	9a00000a 	bls	1000047c <PutSignedInt+0x50>
10000450:	e3550000 	cmp	r5, #0	; 0x0
10000454:	ba000028 	blt	100004fc <PutSignedInt+0xd0>
10000458:	e59f20c4 	ldr	r2, [pc, #196]	; 10000524 <PutSignedInt+0xf8>
1000045c:	e083e692 	umull	lr, r3, r2, r6
10000460:	e1a0200c 	mov	r2, ip
10000464:	e1a031a3 	lsr	r3, r3, #3
10000468:	e59fc0b8 	ldr	ip, [pc, #184]	; 10000528 <PutSignedInt+0xfc>
1000046c:	e1a0e00f 	mov	lr, pc
10000470:	e12fff1c 	bx	ip
10000474:	e0841000 	add	r1, r4, r0
10000478:	ea000013 	b	100004cc <PutSignedInt+0xa0>
1000047c:	e3550000 	cmp	r5, #0	; 0x0
10000480:	b24cc001 	sublt	ip, ip, #1	; 0x1
10000484:	e35c0000 	cmp	ip, #0	; 0x0
10000488:	d3a02000 	movle	r2, #0	; 0x0
1000048c:	d1a01000 	movle	r1, r0
10000490:	d1a00002 	movle	r0, r2
10000494:	da000007 	ble	100004b8 <PutSignedInt+0x8c>
10000498:	e3a02000 	mov	r2, #0	; 0x0
1000049c:	e7c43002 	strb	r3, [r4, r2]
100004a0:	e2822001 	add	r2, r2, #1	; 0x1
100004a4:	e152000c 	cmp	r2, ip
100004a8:	1afffffb 	bne	1000049c <PutSignedInt+0x70>
100004ac:	e0844002 	add	r4, r4, r2
100004b0:	e1a01004 	mov	r1, r4
100004b4:	e1a00002 	mov	r0, r2
100004b8:	e3550000 	cmp	r5, #0	; 0x0
100004bc:	b1a01004 	movlt	r1, r4
100004c0:	b3a0302d 	movlt	r3, #45	; 0x2d
100004c4:	b4c13001 	strblt	r3, [r1], #1
100004c8:	b2820001 	addlt	r0, r2, #1	; 0x1
100004cc:	e59f3050 	ldr	r3, [pc, #80]	; 10000524 <PutSignedInt+0xf8>
100004d0:	e082c693 	umull	ip, r2, r3, r6
100004d4:	e1a021a2 	lsr	r2, r2, #3
100004d8:	e1a03182 	lsl	r3, r2, #3
100004dc:	e1a02082 	lsl	r2, r2, #1
100004e0:	e0822003 	add	r2, r2, r3
100004e4:	e0622006 	rsb	r2, r2, r6
100004e8:	e2822030 	add	r2, r2, #48	; 0x30
100004ec:	e5c12000 	strb	r2, [r1]
100004f0:	e2800001 	add	r0, r0, #1	; 0x1
100004f4:	e8bd4070 	pop	{r4, r5, r6, lr}
100004f8:	e12fff1e 	bx	lr
100004fc:	e59f2020 	ldr	r2, [pc, #32]	; 10000524 <PutSignedInt+0xf8>
10000500:	e083e692 	umull	lr, r3, r2, r6
10000504:	e1a031a3 	lsr	r3, r3, #3
10000508:	e1a0200c 	mov	r2, ip
1000050c:	e2633000 	rsb	r3, r3, #0	; 0x0
10000510:	e59fc010 	ldr	ip, [pc, #16]	; 10000528 <PutSignedInt+0xfc>
10000514:	e1a0e00f 	mov	lr, pc
10000518:	e12fff1c 	bx	ip
1000051c:	e0841000 	add	r1, r4, r0
10000520:	eaffffe9 	b	100004cc <PutSignedInt+0xa0>
10000524:	cccccccd 	.word	0xcccccccd
10000528:	1000042c 	.word	0x1000042c

1000052c <PutHexa>:
1000052c:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
10000530:	e24dd008 	sub	sp, sp, #8	; 0x8
10000534:	e59d7020 	ldr	r7, [sp, #32]
10000538:	e1b06227 	lsrs	r6, r7, #4
1000053c:	e1a05002 	mov	r5, r2
10000540:	e1a04000 	mov	r4, r0
10000544:	e1a0c001 	mov	ip, r1
10000548:	e1a08003 	mov	r8, r3
1000054c:	e2422001 	sub	r2, r2, #1	; 0x1
10000550:	1a000016 	bne	100005b0 <PutHexa+0x84>
10000554:	e3520000 	cmp	r2, #0	; 0x0
10000558:	d3a05001 	movle	r5, #1	; 0x1
1000055c:	da000005 	ble	10000578 <PutHexa+0x4c>
10000560:	e1a03006 	mov	r3, r6
10000564:	e7c4c003 	strb	ip, [r4, r3]
10000568:	e2833001 	add	r3, r3, #1	; 0x1
1000056c:	e1530002 	cmp	r3, r2
10000570:	1afffffb 	bne	10000564 <PutHexa+0x38>
10000574:	e0844003 	add	r4, r4, r3
10000578:	e207300f 	and	r3, r7, #15	; 0xf
1000057c:	e3530009 	cmp	r3, #9	; 0x9
10000580:	92833030 	addls	r3, r3, #48	; 0x30
10000584:	95c43000 	strbls	r3, [r4]
10000588:	9a000004 	bls	100005a0 <PutHexa+0x74>
1000058c:	e3580000 	cmp	r8, #0	; 0x0
10000590:	12833037 	addne	r3, r3, #55	; 0x37
10000594:	02833057 	addeq	r3, r3, #87	; 0x57
10000598:	15c43000 	strbne	r3, [r4]
1000059c:	05c43000 	strbeq	r3, [r4]
100005a0:	e1a00005 	mov	r0, r5
100005a4:	e28dd008 	add	sp, sp, #8	; 0x8
100005a8:	e8bd41f0 	pop	{r4, r5, r6, r7, r8, lr}
100005ac:	e12fff1e 	bx	lr
100005b0:	e58d6000 	str	r6, [sp]
100005b4:	e59fc010 	ldr	ip, [pc, #16]	; 100005cc <PutHexa+0xa0>
100005b8:	e1a0e00f 	mov	lr, pc
100005bc:	e12fff1c 	bx	ip
100005c0:	e0844000 	add	r4, r4, r0
100005c4:	e2805001 	add	r5, r0, #1	; 0x1
100005c8:	eaffffea 	b	10000578 <PutHexa+0x4c>
100005cc:	1000052c 	.word	0x1000052c

100005d0 <vsnprintf>:
100005d0:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
100005d4:	e2506000 	subs	r6, r0, #0	; 0x0
100005d8:	e1a04003 	mov	r4, r3
100005dc:	13a03000 	movne	r3, #0	; 0x0
100005e0:	15c63000 	strbne	r3, [r6]
100005e4:	e59f9268 	ldr	r9, [pc, #616]	; 10000854 <vsnprintf+0x284>
100005e8:	e59fb268 	ldr	fp, [pc, #616]	; 10000858 <vsnprintf+0x288>
100005ec:	e24dd00c 	sub	sp, sp, #12	; 0xc
100005f0:	e1a07001 	mov	r7, r1
100005f4:	e3a05000 	mov	r5, #0	; 0x0
100005f8:	e5d23000 	ldrb	r3, [r2]
100005fc:	e3530000 	cmp	r3, #0	; 0x0
10000600:	11550007 	cmpne	r5, r7
10000604:	23a01000 	movcs	r1, #0	; 0x0
10000608:	33a01001 	movcc	r1, #1	; 0x1
1000060c:	2a00004a 	bcs	1000073c <vsnprintf+0x16c>
10000610:	e3530025 	cmp	r3, #37	; 0x25
10000614:	14c63001 	strbne	r3, [r6], #1
10000618:	12822001 	addne	r2, r2, #1	; 0x1
1000061c:	12855001 	addne	r5, r5, #1	; 0x1
10000620:	1afffff4 	bne	100005f8 <vsnprintf+0x28>
10000624:	e5d20001 	ldrb	r0, [r2, #1]
10000628:	e3500025 	cmp	r0, #37	; 0x25
1000062c:	e2828001 	add	r8, r2, #1	; 0x1
10000630:	04c60001 	strbeq	r0, [r6], #1
10000634:	02822002 	addeq	r2, r2, #2	; 0x2
10000638:	02855001 	addeq	r5, r5, #1	; 0x1
1000063c:	0affffed 	beq	100005f8 <vsnprintf+0x28>
10000640:	e3500030 	cmp	r0, #48	; 0x30
10000644:	05f80001 	ldrbeq	r0, [r8, #1]!
10000648:	e240c030 	sub	ip, r0, #48	; 0x30
1000064c:	e20c30ff 	and	r3, ip, #255	; 0xff
10000650:	13a01020 	movne	r1, #32	; 0x20
10000654:	03a01030 	moveq	r1, #48	; 0x30
10000658:	e3530009 	cmp	r3, #9	; 0x9
1000065c:	83a02000 	movhi	r2, #0	; 0x0
10000660:	81a0a002 	movhi	sl, r2
10000664:	8a00000b 	bhi	10000698 <vsnprintf+0xc8>
10000668:	e3a02000 	mov	r2, #0	; 0x0
1000066c:	e1a03182 	lsl	r3, r2, #3
10000670:	e5f80001 	ldrb	r0, [r8, #1]!
10000674:	e1a02082 	lsl	r2, r2, #1
10000678:	e0822003 	add	r2, r2, r3
1000067c:	e082200c 	add	r2, r2, ip
10000680:	e240c030 	sub	ip, r0, #48	; 0x30
10000684:	e20c30ff 	and	r3, ip, #255	; 0xff
10000688:	e3530009 	cmp	r3, #9	; 0x9
1000068c:	e20220ff 	and	r2, r2, #255	; 0xff
10000690:	9afffff5 	bls	1000066c <vsnprintf+0x9c>
10000694:	e1a0a002 	mov	sl, r2
10000698:	e0823005 	add	r3, r2, r5
1000069c:	e1570003 	cmp	r7, r3
100006a0:	30653007 	rsbcc	r3, r5, r7
100006a4:	3203a0ff 	andcc	sl, r3, #255	; 0xff
100006a8:	e2403058 	sub	r3, r0, #88	; 0x58
100006ac:	e3530020 	cmp	r3, #32	; 0x20
100006b0:	979ff103 	ldrls	pc, [pc, r3, lsl #2]
100006b4:	ea000028 	b	1000075c <vsnprintf+0x18c>
100006b8:	10000764 	.word	0x10000764
100006bc:	1000075c 	.word	0x1000075c
100006c0:	1000075c 	.word	0x1000075c
100006c4:	1000075c 	.word	0x1000075c
100006c8:	1000075c 	.word	0x1000075c
100006cc:	1000075c 	.word	0x1000075c
100006d0:	1000075c 	.word	0x1000075c
100006d4:	1000075c 	.word	0x1000075c
100006d8:	1000075c 	.word	0x1000075c
100006dc:	1000075c 	.word	0x1000075c
100006e0:	1000075c 	.word	0x1000075c
100006e4:	10000798 	.word	0x10000798
100006e8:	100007b0 	.word	0x100007b0
100006ec:	1000075c 	.word	0x1000075c
100006f0:	1000075c 	.word	0x1000075c
100006f4:	1000075c 	.word	0x1000075c
100006f8:	1000075c 	.word	0x1000075c
100006fc:	100007b0 	.word	0x100007b0
10000700:	1000075c 	.word	0x1000075c
10000704:	1000075c 	.word	0x1000075c
10000708:	1000075c 	.word	0x1000075c
1000070c:	1000075c 	.word	0x1000075c
10000710:	1000075c 	.word	0x1000075c
10000714:	1000075c 	.word	0x1000075c
10000718:	1000075c 	.word	0x1000075c
1000071c:	1000075c 	.word	0x1000075c
10000720:	1000075c 	.word	0x1000075c
10000724:	100007d4 	.word	0x100007d4
10000728:	1000075c 	.word	0x1000075c
1000072c:	1000080c 	.word	0x1000080c
10000730:	1000075c 	.word	0x1000075c
10000734:	1000075c 	.word	0x1000075c
10000738:	1000082c 	.word	0x1000082c
1000073c:	e1570005 	cmp	r7, r5
10000740:	85c61000 	strbhi	r1, [r6]
10000744:	95461001 	strbls	r1, [r6, #-1]
10000748:	92455001 	subls	r5, r5, #1	; 0x1
1000074c:	e1a00005 	mov	r0, r5
10000750:	e28dd00c 	add	sp, sp, #12	; 0xc
10000754:	e8bd4ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
10000758:	e12fff1e 	bx	lr
1000075c:	e3e05000 	mvn	r5, #0	; 0x0
10000760:	eafffff9 	b	1000074c <vsnprintf+0x17c>
10000764:	e594c000 	ldr	ip, [r4]
10000768:	e3a03001 	mov	r3, #1	; 0x1
1000076c:	e1a0200a 	mov	r2, sl
10000770:	e1a00006 	mov	r0, r6
10000774:	e58dc000 	str	ip, [sp]
10000778:	e1a0e00f 	mov	lr, pc
1000077c:	e12fff19 	bx	r9
10000780:	e2844004 	add	r4, r4, #4	; 0x4
10000784:	e1a03000 	mov	r3, r0
10000788:	e0866003 	add	r6, r6, r3
1000078c:	e0855000 	add	r5, r5, r0
10000790:	e2882001 	add	r2, r8, #1	; 0x1
10000794:	eaffff97 	b	100005f8 <vsnprintf+0x28>
10000798:	e5943000 	ldr	r3, [r4]
1000079c:	e3a00001 	mov	r0, #1	; 0x1
100007a0:	e5c63000 	strb	r3, [r6]
100007a4:	e2844004 	add	r4, r4, #4	; 0x4
100007a8:	e1a03000 	mov	r3, r0
100007ac:	eafffff5 	b	10000788 <vsnprintf+0x1b8>
100007b0:	e5943000 	ldr	r3, [r4]
100007b4:	e1a0200a 	mov	r2, sl
100007b8:	e1a00006 	mov	r0, r6
100007bc:	e59fc098 	ldr	ip, [pc, #152]	; 1000085c <vsnprintf+0x28c>
100007c0:	e1a0e00f 	mov	lr, pc
100007c4:	e12fff1c 	bx	ip
100007c8:	e2844004 	add	r4, r4, #4	; 0x4
100007cc:	e1a03000 	mov	r3, r0
100007d0:	eaffffec 	b	10000788 <vsnprintf+0x1b8>
100007d4:	e5942000 	ldr	r2, [r4]
100007d8:	e5d23000 	ldrb	r3, [r2]
100007dc:	e3530000 	cmp	r3, #0	; 0x0
100007e0:	e2844004 	add	r4, r4, #4	; 0x4
100007e4:	01a00003 	moveq	r0, r3
100007e8:	0affffe6 	beq	10000788 <vsnprintf+0x1b8>
100007ec:	e3a00000 	mov	r0, #0	; 0x0
100007f0:	e7c63000 	strb	r3, [r6, r0]
100007f4:	e2800001 	add	r0, r0, #1	; 0x1
100007f8:	e7d23000 	ldrb	r3, [r2, r0]
100007fc:	e3530000 	cmp	r3, #0	; 0x0
10000800:	1afffffa 	bne	100007f0 <vsnprintf+0x220>
10000804:	e1a03000 	mov	r3, r0
10000808:	eaffffde 	b	10000788 <vsnprintf+0x1b8>
1000080c:	e5943000 	ldr	r3, [r4]
10000810:	e1a0200a 	mov	r2, sl
10000814:	e1a00006 	mov	r0, r6
10000818:	e1a0e00f 	mov	lr, pc
1000081c:	e12fff1b 	bx	fp
10000820:	e2844004 	add	r4, r4, #4	; 0x4
10000824:	e1a03000 	mov	r3, r0
10000828:	eaffffd6 	b	10000788 <vsnprintf+0x1b8>
1000082c:	e594c000 	ldr	ip, [r4]
10000830:	e3a03000 	mov	r3, #0	; 0x0
10000834:	e1a0200a 	mov	r2, sl
10000838:	e1a00006 	mov	r0, r6
1000083c:	e58dc000 	str	ip, [sp]
10000840:	e1a0e00f 	mov	lr, pc
10000844:	e12fff19 	bx	r9
10000848:	e2844004 	add	r4, r4, #4	; 0x4
1000084c:	e1a03000 	mov	r3, r0
10000850:	eaffffcc 	b	10000788 <vsnprintf+0x1b8>
10000854:	1000052c 	.word	0x1000052c
10000858:	10000388 	.word	0x10000388
1000085c:	1000042c 	.word	0x1000042c

10000860 <vsprintf>:
10000860:	e1a03002 	mov	r3, r2
10000864:	e92d4010 	push	{r4, lr}
10000868:	e1a02001 	mov	r2, r1
1000086c:	e59fc010 	ldr	ip, [pc, #16]	; 10000884 <vsprintf+0x24>
10000870:	e3a01064 	mov	r1, #100	; 0x64
10000874:	e1a0e00f 	mov	lr, pc
10000878:	e12fff1c 	bx	ip
1000087c:	e8bd4010 	pop	{r4, lr}
10000880:	e12fff1e 	bx	lr
10000884:	100005d0 	.word	0x100005d0

10000888 <vfprintf>:
10000888:	e92d45f0 	push	{r4, r5, r6, r7, r8, sl, lr}
1000088c:	e59fe094 	ldr	lr, [pc, #148]	; 10000928 <vfprintf+0xa0>
10000890:	e24dd08c 	sub	sp, sp, #140	; 0x8c
10000894:	e1a0c00e 	mov	ip, lr
10000898:	e1a05001 	mov	r5, r1
1000089c:	e1a06002 	mov	r6, r2
100008a0:	e1a08000 	mov	r8, r0
100008a4:	e28d7064 	add	r7, sp, #100	; 0x64
100008a8:	e8bc000f 	ldm	ip!, {r0, r1, r2, r3}
100008ac:	e1a0e007 	mov	lr, r7
100008b0:	e8ae000f 	stmia	lr!, {r0, r1, r2, r3}
100008b4:	e8bc000f 	ldm	ip!, {r0, r1, r2, r3}
100008b8:	e8ae000f 	stmia	lr!, {r0, r1, r2, r3}
100008bc:	e59c4000 	ldr	r4, [ip]
100008c0:	e1a01005 	mov	r1, r5
100008c4:	e1a02006 	mov	r2, r6
100008c8:	e1a0000d 	mov	r0, sp
100008cc:	e58e4000 	str	r4, [lr]
100008d0:	e59f3054 	ldr	r3, [pc, #84]	; 1000092c <vfprintf+0xa4>
100008d4:	e1a0e00f 	mov	lr, pc
100008d8:	e12fff13 	bx	r3
100008dc:	e3500063 	cmp	r0, #99	; 0x63
100008e0:	e1a0a00d 	mov	sl, sp
100008e4:	da000007 	ble	10000908 <vfprintf+0x80>
100008e8:	e59f3040 	ldr	r3, [pc, #64]	; 10000930 <vfprintf+0xa8>
100008ec:	e5932000 	ldr	r2, [r3]
100008f0:	e1a00007 	mov	r0, r7
100008f4:	e592100c 	ldr	r1, [r2, #12]
100008f8:	e59f3034 	ldr	r3, [pc, #52]	; 10000934 <vfprintf+0xac>
100008fc:	e1a0e00f 	mov	lr, pc
10000900:	e12fff13 	bx	r3
10000904:	eafffffe 	b	10000904 <vfprintf+0x7c>
10000908:	e1a0000d 	mov	r0, sp
1000090c:	e1a01008 	mov	r1, r8
10000910:	e59f301c 	ldr	r3, [pc, #28]	; 10000934 <vfprintf+0xac>
10000914:	e1a0e00f 	mov	lr, pc
10000918:	e12fff13 	bx	r3
1000091c:	e28dd08c 	add	sp, sp, #140	; 0x8c
10000920:	e8bd45f0 	pop	{r4, r5, r6, r7, r8, sl, lr}
10000924:	e12fff1e 	bx	lr
10000928:	10000e14 	.word	0x10000e14
1000092c:	10000860 	.word	0x10000860
10000930:	00200410 	.word	0x00200410
10000934:	10000aa0 	.word	0x10000aa0

10000938 <vprintf>:
10000938:	e59f3028 	ldr	r3, [pc, #40]	; 10000968 <vprintf+0x30>
1000093c:	e593c000 	ldr	ip, [r3]
10000940:	e92d4010 	push	{r4, lr}
10000944:	e1a0e000 	mov	lr, r0
10000948:	e1a02001 	mov	r2, r1
1000094c:	e59c0008 	ldr	r0, [ip, #8]
10000950:	e1a0100e 	mov	r1, lr
10000954:	e59f3010 	ldr	r3, [pc, #16]	; 1000096c <vprintf+0x34>
10000958:	e1a0e00f 	mov	lr, pc
1000095c:	e12fff13 	bx	r3
10000960:	e8bd4010 	pop	{r4, lr}
10000964:	e12fff1e 	bx	lr
10000968:	00200410 	.word	0x00200410
1000096c:	10000888 	.word	0x10000888

10000970 <printf>:
10000970:	e92d000f 	push	{r0, r1, r2, r3}
10000974:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
10000978:	e24dd00c 	sub	sp, sp, #12	; 0xc
1000097c:	e28d2014 	add	r2, sp, #20	; 0x14
10000980:	e1a01002 	mov	r1, r2
10000984:	e59d0010 	ldr	r0, [sp, #16]
10000988:	e58d2004 	str	r2, [sp, #4]
1000098c:	e59f3014 	ldr	r3, [pc, #20]	; 100009a8 <printf+0x38>
10000990:	e1a0e00f 	mov	lr, pc
10000994:	e12fff13 	bx	r3
10000998:	e28dd00c 	add	sp, sp, #12	; 0xc
1000099c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
100009a0:	e28dd010 	add	sp, sp, #16	; 0x10
100009a4:	e12fff1e 	bx	lr
100009a8:	10000938 	.word	0x10000938

100009ac <memcpy>:
100009ac:	e92d0030 	push	{r4, r5}
100009b0:	e1a04000 	mov	r4, r0
100009b4:	e2105003 	ands	r5, r0, #3	; 0x3
100009b8:	e1a0c004 	mov	ip, r4
100009bc:	e1a00001 	mov	r0, r1
100009c0:	1a000007 	bne	100009e4 <memcpy+0x38>
100009c4:	e3110003 	tst	r1, #3	; 0x3
100009c8:	13a03000 	movne	r3, #0	; 0x0
100009cc:	03a03001 	moveq	r3, #1	; 0x1
100009d0:	e3520003 	cmp	r2, #3	; 0x3
100009d4:	93a03000 	movls	r3, #0	; 0x0
100009d8:	82033001 	andhi	r3, r3, #1	; 0x1
100009dc:	e3530000 	cmp	r3, #0	; 0x0
100009e0:	1a00000a 	bne	10000a10 <memcpy+0x64>
100009e4:	e3520000 	cmp	r2, #0	; 0x0
100009e8:	0a000005 	beq	10000a04 <memcpy+0x58>
100009ec:	e3a01000 	mov	r1, #0	; 0x0
100009f0:	e7d03001 	ldrb	r3, [r0, r1]
100009f4:	e7cc3001 	strb	r3, [ip, r1]
100009f8:	e2811001 	add	r1, r1, #1	; 0x1
100009fc:	e1510002 	cmp	r1, r2
10000a00:	1afffffa 	bne	100009f0 <memcpy+0x44>
10000a04:	e1a00004 	mov	r0, r4
10000a08:	e8bd0030 	pop	{r4, r5}
10000a0c:	e12fff1e 	bx	lr
10000a10:	e1a0c005 	mov	ip, r5
10000a14:	e791300c 	ldr	r3, [r1, ip]
10000a18:	e784300c 	str	r3, [r4, ip]
10000a1c:	e28cc004 	add	ip, ip, #4	; 0x4
10000a20:	e06c3002 	rsb	r3, ip, r2
10000a24:	e3530003 	cmp	r3, #3	; 0x3
10000a28:	8afffff9 	bhi	10000a14 <memcpy+0x68>
10000a2c:	e2422004 	sub	r2, r2, #4	; 0x4
10000a30:	e3c23003 	bic	r3, r2, #3	; 0x3
10000a34:	e2833004 	add	r3, r3, #4	; 0x4
10000a38:	e0810003 	add	r0, r1, r3
10000a3c:	e084c003 	add	ip, r4, r3
10000a40:	e2022003 	and	r2, r2, #3	; 0x3
10000a44:	eaffffe6 	b	100009e4 <memcpy+0x38>

10000a48 <DBGU_Configure>:
10000a48:	e92d4070 	push	{r4, r5, r6, lr}
10000a4c:	e3a0300c 	mov	r3, #12	; 0xc
10000a50:	e3e04c0d 	mvn	r4, #3328	; 0xd00
10000a54:	e1a05000 	mov	r5, r0
10000a58:	e1a00002 	mov	r0, r2
10000a5c:	e3e02000 	mvn	r2, #0	; 0x0
10000a60:	e50430ff 	str	r3, [r4, #-255]
10000a64:	e1a01201 	lsl	r1, r1, #4
10000a68:	e50420f3 	str	r2, [r4, #-243]
10000a6c:	e59f3028 	ldr	r3, [pc, #40]	; 10000a9c <DBGU_Configure+0x54>
10000a70:	e1a0e00f 	mov	lr, pc
10000a74:	e12fff13 	bx	r3
10000a78:	e3a03c02 	mov	r3, #512	; 0x200
10000a7c:	e2833002 	add	r3, r3, #2	; 0x2
10000a80:	e3a02050 	mov	r2, #80	; 0x50
10000a84:	e50400df 	str	r0, [r4, #-223]
10000a88:	e50450fb 	str	r5, [r4, #-251]
10000a8c:	e5843021 	str	r3, [r4, #33]
10000a90:	e50420ff 	str	r2, [r4, #-255]
10000a94:	e8bd4070 	pop	{r4, r5, r6, lr}
10000a98:	e12fff1e 	bx	lr
10000a9c:	10000c0c 	.word	0x10000c0c

10000aa0 <fputs>:
10000aa0:	e92d00f0 	push	{r4, r5, r6, r7}
10000aa4:	e5d0c000 	ldrb	ip, [r0]
10000aa8:	e35c0000 	cmp	ip, #0	; 0x0
10000aac:	e1a06000 	mov	r6, r0
10000ab0:	01a0000c 	moveq	r0, ip
10000ab4:	0a00000b 	beq	10000ae8 <fputs+0x48>
10000ab8:	e59f3060 	ldr	r3, [pc, #96]	; 10000b20 <fputs+0x80>
10000abc:	e5935000 	ldr	r5, [r3]
10000ac0:	e3e02c0d 	mvn	r2, #3328	; 0xd00
10000ac4:	e5954008 	ldr	r4, [r5, #8]
10000ac8:	e3a00000 	mov	r0, #0	; 0x0
10000acc:	e1a07002 	mov	r7, r2
10000ad0:	e1510004 	cmp	r1, r4
10000ad4:	0a000005 	beq	10000af0 <fputs+0x50>
10000ad8:	e595300c 	ldr	r3, [r5, #12]
10000adc:	e1510003 	cmp	r1, r3
10000ae0:	0a000002 	beq	10000af0 <fputs+0x50>
10000ae4:	e3e00000 	mvn	r0, #0	; 0x0
10000ae8:	e8bd00f0 	pop	{r4, r5, r6, r7}
10000aec:	e12fff1e 	bx	lr
10000af0:	e51230eb 	ldr	r3, [r2, #-235]
10000af4:	e3130c02 	tst	r3, #512	; 0x200
10000af8:	0afffffc 	beq	10000af0 <fputs+0x50>
10000afc:	e507c0e3 	str	ip, [r7, #-227]
10000b00:	e51230eb 	ldr	r3, [r2, #-235]
10000b04:	e3130c02 	tst	r3, #512	; 0x200
10000b08:	0afffffc 	beq	10000b00 <fputs+0x60>
10000b0c:	e2800001 	add	r0, r0, #1	; 0x1
10000b10:	e7d6c000 	ldrb	ip, [r6, r0]
10000b14:	e35c0000 	cmp	ip, #0	; 0x0
10000b18:	1affffec 	bne	10000ad0 <fputs+0x30>
10000b1c:	eafffff1 	b	10000ae8 <fputs+0x48>
10000b20:	00200410 	.word	0x00200410

10000b24 <BOOT_NOR_CopyBin>:
10000b24:	e92d40f0 	push	{r4, r5, r6, r7, lr}
10000b28:	e2515000 	subs	r5, r1, #0	; 0x0
10000b2c:	e24dd00c 	sub	sp, sp, #12	; 0xc
10000b30:	e1a04000 	mov	r4, r0
10000b34:	0a000013 	beq	10000b88 <BOOT_NOR_CopyBin+0x64>
10000b38:	e59f7058 	ldr	r7, [pc, #88]	; 10000b98 <BOOT_NOR_CopyBin+0x74>
10000b3c:	e59f6058 	ldr	r6, [pc, #88]	; 10000b9c <BOOT_NOR_CopyBin+0x78>
10000b40:	e594c008 	ldr	ip, [r4, #8]
10000b44:	e5943000 	ldr	r3, [r4]
10000b48:	e5941010 	ldr	r1, [r4, #16]
10000b4c:	e594200c 	ldr	r2, [r4, #12]
10000b50:	e59f0048 	ldr	r0, [pc, #72]	; 10000ba0 <BOOT_NOR_CopyBin+0x7c>
10000b54:	e58dc000 	str	ip, [sp]
10000b58:	e1a0e00f 	mov	lr, pc
10000b5c:	e12fff17 	bx	r7
10000b60:	e5941000 	ldr	r1, [r4]
10000b64:	e2840008 	add	r0, r4, #8	; 0x8
10000b68:	e8900005 	ldm	r0, {r0, r2}
10000b6c:	e2811201 	add	r1, r1, #268435456	; 0x10000000
10000b70:	e1a0e00f 	mov	lr, pc
10000b74:	e12fff16 	bx	r6
10000b78:	e2453001 	sub	r3, r5, #1	; 0x1
10000b7c:	e21350ff 	ands	r5, r3, #255	; 0xff
10000b80:	e2844014 	add	r4, r4, #20	; 0x14
10000b84:	1affffed 	bne	10000b40 <BOOT_NOR_CopyBin+0x1c>
10000b88:	e3a00000 	mov	r0, #0	; 0x0
10000b8c:	e28dd00c 	add	sp, sp, #12	; 0xc
10000b90:	e8bd40f0 	pop	{r4, r5, r6, r7, lr}
10000b94:	e12fff1e 	bx	lr
10000b98:	10000970 	.word	0x10000970
10000b9c:	100009ac 	.word	0x100009ac
10000ba0:	10000e38 	.word	0x10000e38

10000ba4 <CP15_Enable_I_Cache>:
10000ba4:	e92d4010 	push	{r4, lr}
10000ba8:	e59f3048 	ldr	r3, [pc, #72]	; 10000bf8 <CP15_Enable_I_Cache+0x54>
10000bac:	e1a0e00f 	mov	lr, pc
10000bb0:	e12fff13 	bx	r3
10000bb4:	e3100a01 	tst	r0, #4096	; 0x1000
10000bb8:	0a000005 	beq	10000bd4 <CP15_Enable_I_Cache+0x30>
10000bbc:	e59f0038 	ldr	r0, [pc, #56]	; 10000bfc <CP15_Enable_I_Cache+0x58>
10000bc0:	e59f3038 	ldr	r3, [pc, #56]	; 10000c00 <CP15_Enable_I_Cache+0x5c>
10000bc4:	e1a0e00f 	mov	lr, pc
10000bc8:	e12fff13 	bx	r3
10000bcc:	e8bd4010 	pop	{r4, lr}
10000bd0:	e12fff1e 	bx	lr
10000bd4:	e3800a01 	orr	r0, r0, #4096	; 0x1000
10000bd8:	e59f3024 	ldr	r3, [pc, #36]	; 10000c04 <CP15_Enable_I_Cache+0x60>
10000bdc:	e1a0e00f 	mov	lr, pc
10000be0:	e12fff13 	bx	r3
10000be4:	e59f3014 	ldr	r3, [pc, #20]	; 10000c00 <CP15_Enable_I_Cache+0x5c>
10000be8:	e59f0018 	ldr	r0, [pc, #24]	; 10000c08 <CP15_Enable_I_Cache+0x64>
10000bec:	e1a0e00f 	mov	lr, pc
10000bf0:	e12fff13 	bx	r3
10000bf4:	eafffff4 	b	10000bcc <CP15_Enable_I_Cache+0x28>
10000bf8:	100000d0 	.word	0x100000d0
10000bfc:	10000fc8 	.word	0x10000fc8
10000c00:	10000970 	.word	0x10000970
10000c04:	100000dc 	.word	0x100000dc
10000c08:	10000fb0 	.word	0x10000fb0

10000c0c <__aeabi_uidiv>:
10000c0c:	e2512001 	subs	r2, r1, #1	; 0x1
10000c10:	012fff1e 	bxeq	lr
10000c14:	3a000036 	bcc	10000cf4 <__aeabi_uidiv+0xe8>
10000c18:	e1500001 	cmp	r0, r1
10000c1c:	9a000022 	bls	10000cac <__aeabi_uidiv+0xa0>
10000c20:	e1110002 	tst	r1, r2
10000c24:	0a000023 	beq	10000cb8 <__aeabi_uidiv+0xac>
10000c28:	e311020e 	tst	r1, #-536870912	; 0xe0000000
10000c2c:	01a01181 	lsleq	r1, r1, #3
10000c30:	03a03008 	moveq	r3, #8	; 0x8
10000c34:	13a03001 	movne	r3, #1	; 0x1
10000c38:	e3510201 	cmp	r1, #268435456	; 0x10000000
10000c3c:	31510000 	cmpcc	r1, r0
10000c40:	31a01201 	lslcc	r1, r1, #4
10000c44:	31a03203 	lslcc	r3, r3, #4
10000c48:	3afffffa 	bcc	10000c38 <__aeabi_uidiv+0x2c>
10000c4c:	e3510102 	cmp	r1, #-2147483648	; 0x80000000
10000c50:	31510000 	cmpcc	r1, r0
10000c54:	31a01081 	lslcc	r1, r1, #1
10000c58:	31a03083 	lslcc	r3, r3, #1
10000c5c:	3afffffa 	bcc	10000c4c <__aeabi_uidiv+0x40>
10000c60:	e3a02000 	mov	r2, #0	; 0x0
10000c64:	e1500001 	cmp	r0, r1
10000c68:	20400001 	subcs	r0, r0, r1
10000c6c:	21822003 	orrcs	r2, r2, r3
10000c70:	e15000a1 	cmp	r0, r1, lsr #1
10000c74:	204000a1 	subcs	r0, r0, r1, lsr #1
10000c78:	218220a3 	orrcs	r2, r2, r3, lsr #1
10000c7c:	e1500121 	cmp	r0, r1, lsr #2
10000c80:	20400121 	subcs	r0, r0, r1, lsr #2
10000c84:	21822123 	orrcs	r2, r2, r3, lsr #2
10000c88:	e15001a1 	cmp	r0, r1, lsr #3
10000c8c:	204001a1 	subcs	r0, r0, r1, lsr #3
10000c90:	218221a3 	orrcs	r2, r2, r3, lsr #3
10000c94:	e3500000 	cmp	r0, #0	; 0x0
10000c98:	11b03223 	lsrsne	r3, r3, #4
10000c9c:	11a01221 	lsrne	r1, r1, #4
10000ca0:	1affffef 	bne	10000c64 <__aeabi_uidiv+0x58>
10000ca4:	e1a00002 	mov	r0, r2
10000ca8:	e12fff1e 	bx	lr
10000cac:	03a00001 	moveq	r0, #1	; 0x1
10000cb0:	13a00000 	movne	r0, #0	; 0x0
10000cb4:	e12fff1e 	bx	lr
10000cb8:	e3510801 	cmp	r1, #65536	; 0x10000
10000cbc:	21a01821 	lsrcs	r1, r1, #16
10000cc0:	23a02010 	movcs	r2, #16	; 0x10
10000cc4:	33a02000 	movcc	r2, #0	; 0x0
10000cc8:	e3510c01 	cmp	r1, #256	; 0x100
10000ccc:	21a01421 	lsrcs	r1, r1, #8
10000cd0:	22822008 	addcs	r2, r2, #8	; 0x8
10000cd4:	e3510010 	cmp	r1, #16	; 0x10
10000cd8:	21a01221 	lsrcs	r1, r1, #4
10000cdc:	22822004 	addcs	r2, r2, #4	; 0x4
10000ce0:	e3510004 	cmp	r1, #4	; 0x4
10000ce4:	82822003 	addhi	r2, r2, #3	; 0x3
10000ce8:	908220a1 	addls	r2, r2, r1, lsr #1
10000cec:	e1a00230 	lsr	r0, r0, r2
10000cf0:	e12fff1e 	bx	lr
10000cf4:	e3500000 	cmp	r0, #0	; 0x0
10000cf8:	13e00000 	mvnne	r0, #0	; 0x0
10000cfc:	ea000007 	b	10000d20 <__aeabi_idiv0>

10000d00 <__aeabi_uidivmod>:
10000d00:	e3510000 	cmp	r1, #0	; 0x0
10000d04:	0afffffa 	beq	10000cf4 <__aeabi_uidiv+0xe8>
10000d08:	e92d4003 	push	{r0, r1, lr}
10000d0c:	ebffffbe 	bl	10000c0c <__aeabi_uidiv>
10000d10:	e8bd4006 	pop	{r1, r2, lr}
10000d14:	e0030092 	mul	r3, r2, r0
10000d18:	e0411003 	sub	r1, r1, r3
10000d1c:	e12fff1e 	bx	lr

10000d20 <__aeabi_idiv0>:
10000d20:	e12fff1e 	bx	lr

10000d24 <pinsDbgu.3118>:
10000d24:	0000c000 fffff600 00000003              ............

10000d30 <tabDesc>:
10000d30:	10020000 10000d64 23f00000 0004b000     ....d......#....
10000d40:	10000d64 41202d2d 62313954 73746f6f     d...-- AT91boots
10000d50:	70617274 6f725020 7463656a 20732520     trap Project %s 
10000d60:	0d0a2d2d 00000000 00302e33 25202d2d     --......3.0.-- %
10000d70:	000d0a73 31395441 394d4153 2d303247     s...AT91SAM9G20-
10000d80:	00004b45 43202d2d 69706d6f 3a64656c     EK..-- Compiled:
10000d90:	20732520 2d207325 000d0a2d 20677541      %s %s --...Aug 
10000da0:	32203731 00313130 333a3630 30333a32     17 2011.06:32:30
10000db0:	00000000 202d492d 74746553 3a676e69     ....-I- Setting:
10000dc0:	4b434d20 25203d20 7a484d64 00000d0a      MCK = %dMHz....
10000dd0:	202d492d 74696e49 52445320 0d0a4d41     -I- Init SDRAM..
10000de0:	00000000 202d492d 706d754a 206f7420     ....-I- Jump to 
10000df0:	30257830 0d0a7838 00000000              0x%08x......

10000dfc <pinsSdram.2193>:
10000dfc:	ffff0000 fffff800 00000004              ............

10000e08 <pinsSdram.2154>:
10000e08:	ffff0000 fffff800 00000004 69647473     ............stdi
10000e18:	3a632e6f 636e6920 73616572 414d2065     o.c: increase MA
10000e28:	54535f58 474e4952 5a49535f 000d0a45     X_STRING_SIZE...
10000e38:	202d492d 79706f43 73252220 25282022     -I- Copy "%s" (%
10000e48:	79622064 29736574 6f726620 4f4e206d     d bytes) from NO
10000e58:	78302052 78383025 206f7420 30257830     R 0x%08x to 0x%0
10000e68:	0d0a7838 00000000 202d492d 61632044     8x......-I- D ca
10000e78:	20656863 61736964 64656c62 000d0a2e     che disabled....
10000e88:	202d492d 61632044 20656863 61207369     -I- D cache is a
10000e98:	6165726c 64207964 62617369 2e64656c     lready disabled.
10000ea8:	00000d0a 202d452d 6e206f44 6968746f     ....-E- Do nothi
10000eb8:	203a676e 20554d4d 20746f6e 62616e65     ng: MMU not enab
10000ec8:	0a64656c 0000000d 202d492d 61632044     led.....-I- D ca
10000ed8:	20656863 62616e65 2e64656c 00000d0a     che enabled.....
10000ee8:	202d492d 61632044 20656863 61207369     -I- D cache is a
10000ef8:	6165726c 65207964 6c62616e 0a2e6465     lready enabled..
10000f08:	0000000d 202d492d 20554d4d 61736964     ....-I- MMU disa
10000f18:	64656c62 000d0a2e 202d492d 20554d4d     bled....-I- MMU 
10000f28:	61207369 6165726c 64207964 62617369     is already disab
10000f38:	2e64656c 00000d0a 202d492d 20554d4d     led.....-I- MMU 
10000f48:	62616e65 2e64656c 00000d0a 202d492d     enabled.....-I- 
10000f58:	20554d4d 61207369 6165726c 65207964     MMU is already e
10000f68:	6c62616e 0a2e6465 0000000d 202d492d     nabled......-I- 
10000f78:	61632049 20656863 61736964 64656c62     I cache disabled
10000f88:	000d0a2e 202d492d 61632049 20656863     ....-I- I cache 
10000f98:	61207369 6165726c 64207964 62617369     is already disab
10000fa8:	2e64656c 00000d0a 202d492d 61632049     led.....-I- I ca
10000fb8:	20656863 62616e65 2e64656c 00000d0a     che enabled.....
10000fc8:	202d492d 61632049 20656863 61207369     -I- I cache is a
10000fd8:	6165726c 65207964 6c62616e 0a2e6465     lready enabled..
10000fe8:	0000000d                                ....
