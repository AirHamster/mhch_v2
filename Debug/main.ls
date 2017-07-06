   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
2172                     	bsct
2173  0000               _top_val:
2174  0000 0fa0          	dc.w	4000
2175  0002               _bot_val:
2176  0002 07d0          	dc.w	2000
2177  0004               _step:
2178  0004 0000          	dc.w	0
2179  0006               _divider:
2180  0006 0028          	dc.w	40
2181  0008               _in_pwm:
2182  0008 0000          	dc.w	0
2183  000a               _usart_counter:
2184  000a 00            	dc.b	0
2244                     ; 27 void calculate(uint8_t hight, uint8_t low)
2244                     ; 28 {
2246                     	switch	.text
2247  0000               _calculate:
2249  0000 89            	pushw	x
2250  0001 89            	pushw	x
2251       00000002      OFST:	set	2
2254                     ; 31 	result = hight << 8;
2256  0002 9e            	ld	a,xh
2257  0003 5f            	clrw	x
2258  0004 97            	ld	xl,a
2259  0005 4f            	clr	a
2260  0006 02            	rlwa	x,a
2261  0007 1f01          	ldw	(OFST-1,sp),x
2262                     ; 32 	result |= low;
2264  0009 7b04          	ld	a,(OFST+2,sp)
2265  000b 5f            	clrw	x
2266  000c 97            	ld	xl,a
2267  000d 01            	rrwa	x,a
2268  000e 1a02          	or	a,(OFST+0,sp)
2269  0010 01            	rrwa	x,a
2270  0011 1a01          	or	a,(OFST-1,sp)
2271  0013 01            	rrwa	x,a
2272  0014 1f01          	ldw	(OFST-1,sp),x
2273                     ; 34 	result -= 5000;
2275  0016 1e01          	ldw	x,(OFST-1,sp)
2276  0018 1d1388        	subw	x,#5000
2277  001b 1f01          	ldw	(OFST-1,sp),x
2278                     ; 35 	step = result / divider;
2280  001d 1e01          	ldw	x,(OFST-1,sp)
2281  001f 90be06        	ldw	y,_divider
2282  0022 65            	divw	x,y
2283  0023 bf04          	ldw	_step,x
2284                     ; 37 }
2287  0025 5b04          	addw	sp,#4
2288  0027 81            	ret
2325                     ; 38 main()
2325                     ; 39 {
2326                     	switch	.text
2327  0028               _main:
2331                     ; 41 		CLK_CKDIVR=0;                //	no dividers
2333  0028 725f50c6      	clr	_CLK_CKDIVR
2334                     ; 45 		CLK_PCKENR1=0xff;//0x8B;     //0b10001011;        //clocking for TIM1, UART1, SPI i I2C
2336  002c 35ff50c7      	mov	_CLK_PCKENR1,#255
2337                     ; 47 		PA_CR1 = 1 << 3;
2339  0030 35085003      	mov	_PA_CR1,#8
2340                     ; 48 		PA_CR2 = 1 << 3;
2342  0034 35085004      	mov	_PA_CR2,#8
2343                     ; 49 		PA_DDR = 1<<3;
2345  0038 35085002      	mov	_PA_DDR,#8
2346                     ; 50 		PA_ODR = 1<<3;
2348  003c 35085000      	mov	_PA_ODR,#8
2349                     ; 52 		PC_CR1 = 1 << 6;
2351  0040 3540500d      	mov	_PC_CR1,#64
2352                     ; 63 		timer1_setup(TIM1_PRESCALER, TIM1_TOP);
2354  0044 aefa00        	ldw	x,#64000
2355  0047 89            	pushw	x
2356  0048 ae0004        	ldw	x,#4
2357  004b cd0000        	call	_timer1_setup
2359  004e 85            	popw	x
2360                     ; 64 		timer2_setup(TIM2_PRESCALER, TIM2_TOP);
2362  004f ae9c40        	ldw	x,#40000
2363  0052 89            	pushw	x
2364  0053 a603          	ld	a,#3
2365  0055 cd0000        	call	_timer2_setup
2367  0058 85            	popw	x
2368                     ; 65 		usart_setup();
2370  0059 cd0000        	call	_usart_setup
2372                     ; 66 		usart_send("Hello", 5);
2374  005c ae0005        	ldw	x,#5
2375  005f 89            	pushw	x
2376  0060 ae0000        	ldw	x,#L7641
2377  0063 cd0000        	call	_usart_send
2379  0066 85            	popw	x
2380                     ; 67 		timer2_start();
2382  0067 cd0000        	call	_timer2_start
2384                     ; 68 		timer1_start();
2386  006a cd0000        	call	_timer1_start
2388                     ; 69 _asm ("RIM");  //on interupts
2391  006d 9a            RIM
2393  006e               L1741:
2394                     ; 70 	while (1);
2396  006e 20fe          	jra	L1741
2494                     	xdef	_main
2495                     	xdef	_calculate
2496                     	switch	.ubsct
2497  0000               _buff2:
2498  0000 0000000000    	ds.b	5
2499                     	xdef	_buff2
2500  0005               _buff:
2501  0005 0000000000    	ds.b	5
2502                     	xdef	_buff
2503                     	xdef	_usart_counter
2504  000a               _increasing:
2505  000a 00            	ds.b	1
2506                     	xdef	_increasing
2507                     	xdef	_in_pwm
2508                     	xdef	_divider
2509                     	xdef	_step
2510                     	xdef	_bot_val
2511                     	xdef	_top_val
2512                     	xref	_usart_send
2513                     	xref	_usart_setup
2514                     	xref	_timer1_start
2515                     	xref	_timer2_start
2516                     	xref	_timer2_setup
2517                     	xref	_timer1_setup
2518                     .const:	section	.text
2519  0000               L7641:
2520  0000 48656c6c6f00  	dc.b	"Hello",0
2540                     	end
