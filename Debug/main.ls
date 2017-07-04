   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
2172                     	bsct
2173  0000               _top_val:
2174  0000 1f40          	dc.w	8000
2175  0002               _bot_val:
2176  0002 0fa0          	dc.w	4000
2177  0004               _step:
2178  0004 0000          	dc.w	0
2179  0006               _divider:
2180  0006 0028          	dc.w	40
2181  0008               _in_pwm:
2182  0008 0000          	dc.w	0
2183  000a               _usart_counter:
2184  000a 00            	dc.b	0
2300                     ; 24 char *itoa(int value, char *sp, int radix)
2300                     ; 25 {
2302                     	switch	.text
2303  0000               _itoa:
2305  0000 89            	pushw	x
2306  0001 521a          	subw	sp,#26
2307       0000001a      OFST:	set	26
2310                     ; 27     char *tp = tmp;
2312  0003 96            	ldw	x,sp
2313  0004 1c0005        	addw	x,#OFST-21
2314  0007 1f19          	ldw	(OFST-1,sp),x
2315                     ; 32     int sign = (radix == 10 && value < 0);    
2317  0009 1e21          	ldw	x,(OFST+7,sp)
2318  000b a3000a        	cpw	x,#10
2319  000e 260a          	jrne	L6
2320  0010 9c            	rvf
2321  0011 1e1b          	ldw	x,(OFST+1,sp)
2322  0013 2e05          	jrsge	L6
2323  0015 ae0001        	ldw	x,#1
2324  0018 2001          	jra	L01
2325  001a               L6:
2326  001a 5f            	clrw	x
2327  001b               L01:
2328  001b 1f03          	ldw	(OFST-23,sp),x
2329                     ; 33     if (sign)
2331  001d 1e03          	ldw	x,(OFST-23,sp)
2332  001f 2707          	jreq	L7051
2333                     ; 34         v = -value;
2335  0021 1e1b          	ldw	x,(OFST+1,sp)
2336  0023 50            	negw	x
2337  0024 1f17          	ldw	(OFST-3,sp),x
2339  0026 203d          	jra	L5151
2340  0028               L7051:
2341                     ; 36         v = (unsigned)value;
2343  0028 1e1b          	ldw	x,(OFST+1,sp)
2344  002a 1f17          	ldw	(OFST-3,sp),x
2345  002c 2037          	jra	L5151
2346  002e               L3151:
2347                     ; 40         i = v % radix;
2349  002e 1e17          	ldw	x,(OFST-3,sp)
2350  0030 1621          	ldw	y,(OFST+7,sp)
2351  0032 65            	divw	x,y
2352  0033 51            	exgw	x,y
2353  0034 1f15          	ldw	(OFST-5,sp),x
2354                     ; 41         v /= radix; // v/=radix uses less CPU clocks than v=v/radix does
2356  0036 1e17          	ldw	x,(OFST-3,sp)
2357  0038 1621          	ldw	y,(OFST+7,sp)
2358  003a 65            	divw	x,y
2359  003b 1f17          	ldw	(OFST-3,sp),x
2360                     ; 42         if (i < 10)
2362  003d 9c            	rvf
2363  003e 1e15          	ldw	x,(OFST-5,sp)
2364  0040 a3000a        	cpw	x,#10
2365  0043 2e11          	jrsge	L1251
2366                     ; 43           *tp++ = i+'0';
2368  0045 7b16          	ld	a,(OFST-4,sp)
2369  0047 ab30          	add	a,#48
2370  0049 1e19          	ldw	x,(OFST-1,sp)
2371  004b 1c0001        	addw	x,#1
2372  004e 1f19          	ldw	(OFST-1,sp),x
2373  0050 1d0001        	subw	x,#1
2374  0053 f7            	ld	(x),a
2376  0054 200f          	jra	L5151
2377  0056               L1251:
2378                     ; 45           *tp++ = i + 'a' - 10;
2380  0056 7b16          	ld	a,(OFST-4,sp)
2381  0058 ab57          	add	a,#87
2382  005a 1e19          	ldw	x,(OFST-1,sp)
2383  005c 1c0001        	addw	x,#1
2384  005f 1f19          	ldw	(OFST-1,sp),x
2385  0061 1d0001        	subw	x,#1
2386  0064 f7            	ld	(x),a
2387  0065               L5151:
2388                     ; 38     while (v || tp == tmp)
2390  0065 1e17          	ldw	x,(OFST-3,sp)
2391  0067 26c5          	jrne	L3151
2393  0069 96            	ldw	x,sp
2394  006a 1c0005        	addw	x,#OFST-21
2395  006d bf00          	ldw	c_x,x
2396  006f 1e19          	ldw	x,(OFST-1,sp)
2397  0071 b300          	cpw	x,c_x
2398  0073 27b9          	jreq	L3151
2399                     ; 48     len = tp - tmp;
2401  0075 96            	ldw	x,sp
2402  0076 1c0005        	addw	x,#OFST-21
2403  0079 1f01          	ldw	(OFST-25,sp),x
2404  007b 1e19          	ldw	x,(OFST-1,sp)
2405  007d 72f001        	subw	x,(OFST-25,sp)
2406  0080 1f17          	ldw	(OFST-3,sp),x
2407                     ; 50     if (sign) 
2409  0082 1e03          	ldw	x,(OFST-23,sp)
2410  0084 272c          	jreq	L1351
2411                     ; 52         *sp++ = '-';
2413  0086 1e1f          	ldw	x,(OFST+5,sp)
2414  0088 1c0001        	addw	x,#1
2415  008b 1f1f          	ldw	(OFST+5,sp),x
2416  008d 1d0001        	subw	x,#1
2417  0090 a62d          	ld	a,#45
2418  0092 f7            	ld	(x),a
2419                     ; 53         len++;
2421  0093 1e17          	ldw	x,(OFST-3,sp)
2422  0095 1c0001        	addw	x,#1
2423  0098 1f17          	ldw	(OFST-3,sp),x
2424  009a 2016          	jra	L1351
2425  009c               L7251:
2426                     ; 57         *sp++ = *--tp;
2428  009c 0d1a          	tnz	(OFST+0,sp)
2429  009e 2602          	jrne	L21
2430  00a0 0a19          	dec	(OFST-1,sp)
2431  00a2               L21:
2432  00a2 0a1a          	dec	(OFST+0,sp)
2433  00a4 1e19          	ldw	x,(OFST-1,sp)
2434  00a6 f6            	ld	a,(x)
2435  00a7 1e1f          	ldw	x,(OFST+5,sp)
2436  00a9 1c0001        	addw	x,#1
2437  00ac 1f1f          	ldw	(OFST+5,sp),x
2438  00ae 1d0001        	subw	x,#1
2439  00b1 f7            	ld	(x),a
2440  00b2               L1351:
2441                     ; 56     while (tp > tmp)
2443  00b2 96            	ldw	x,sp
2444  00b3 1c0005        	addw	x,#OFST-21
2445  00b6 bf00          	ldw	c_x,x
2446  00b8 1e19          	ldw	x,(OFST-1,sp)
2447  00ba b300          	cpw	x,c_x
2448  00bc 22de          	jrugt	L7251
2449                     ; 59     return sp;
2451  00be 1e1f          	ldw	x,(OFST+5,sp)
2454  00c0 5b1c          	addw	sp,#28
2455  00c2 81            	ret
2533                     ; 61 void calculate(uint8_t hight, uint8_t low)
2533                     ; 62 {
2534                     	switch	.text
2535  00c3               _calculate:
2537  00c3 89            	pushw	x
2538  00c4 520a          	subw	sp,#10
2539       0000000a      OFST:	set	10
2542                     ; 66 	result = hight << 8;
2544  00c6 9e            	ld	a,xh
2545  00c7 5f            	clrw	x
2546  00c8 97            	ld	xl,a
2547  00c9 4f            	clr	a
2548  00ca 02            	rlwa	x,a
2549  00cb 1f09          	ldw	(OFST-1,sp),x
2550                     ; 67 	result |= low;
2552  00cd 7b0c          	ld	a,(OFST+2,sp)
2553  00cf 5f            	clrw	x
2554  00d0 97            	ld	xl,a
2555  00d1 01            	rrwa	x,a
2556  00d2 1a0a          	or	a,(OFST+0,sp)
2557  00d4 01            	rrwa	x,a
2558  00d5 1a09          	or	a,(OFST-1,sp)
2559  00d7 01            	rrwa	x,a
2560  00d8 1f09          	ldw	(OFST-1,sp),x
2561                     ; 68 	if (usart_counter++ == 5)
2563  00da b60a          	ld	a,_usart_counter
2564  00dc 3c0a          	inc	_usart_counter
2565  00de a105          	cp	a,#5
2566  00e0 2650          	jrne	L3751
2567                     ; 70 		usart_counter = 0;
2569  00e2 3f0a          	clr	_usart_counter
2570                     ; 71 		usart_send("\nOUT: ", 6);
2572  00e4 ae0006        	ldw	x,#6
2573  00e7 89            	pushw	x
2574  00e8 ae000e        	ldw	x,#L5751
2575  00eb cd0000        	call	_usart_send
2577  00ee 85            	popw	x
2578                     ; 72 		itoa(result, &buff[0], 10);
2580  00ef ae000a        	ldw	x,#10
2581  00f2 89            	pushw	x
2582  00f3 96            	ldw	x,sp
2583  00f4 1c0003        	addw	x,#OFST-7
2584  00f7 89            	pushw	x
2585  00f8 1e0d          	ldw	x,(OFST+3,sp)
2586  00fa cd0000        	call	_itoa
2588  00fd 5b04          	addw	sp,#4
2589                     ; 73 		usart_send(&buff[0], 4);
2591  00ff ae0004        	ldw	x,#4
2592  0102 89            	pushw	x
2593  0103 96            	ldw	x,sp
2594  0104 1c0003        	addw	x,#OFST-7
2595  0107 cd0000        	call	_usart_send
2597  010a 85            	popw	x
2598                     ; 75 		usart_send("   IN: ", 7);
2600  010b ae0007        	ldw	x,#7
2601  010e 89            	pushw	x
2602  010f ae0006        	ldw	x,#L7751
2603  0112 cd0000        	call	_usart_send
2605  0115 85            	popw	x
2606                     ; 76 		itoa(in_pwm, &buff2[0], 10);
2608  0116 ae000a        	ldw	x,#10
2609  0119 89            	pushw	x
2610  011a 96            	ldw	x,sp
2611  011b 1c0007        	addw	x,#OFST-3
2612  011e 89            	pushw	x
2613  011f be08          	ldw	x,_in_pwm
2614  0121 cd0000        	call	_itoa
2616  0124 5b04          	addw	sp,#4
2617                     ; 77 		usart_send(&buff2[0], 4);
2619  0126 ae0004        	ldw	x,#4
2620  0129 89            	pushw	x
2621  012a 96            	ldw	x,sp
2622  012b 1c0007        	addw	x,#OFST-3
2623  012e cd0000        	call	_usart_send
2625  0131 85            	popw	x
2626  0132               L3751:
2627                     ; 81 	result -= 5000;
2629  0132 1e09          	ldw	x,(OFST-1,sp)
2630  0134 1d1388        	subw	x,#5000
2631  0137 1f09          	ldw	(OFST-1,sp),x
2632                     ; 82 	step = result / divider;
2634  0139 1e09          	ldw	x,(OFST-1,sp)
2635  013b 90be06        	ldw	y,_divider
2636  013e 65            	divw	x,y
2637  013f bf04          	ldw	_step,x
2638                     ; 84 }
2641  0141 5b0c          	addw	sp,#12
2642  0143 81            	ret
2678                     ; 85 main()
2678                     ; 86 {
2679                     	switch	.text
2680  0144               _main:
2684                     ; 88 		CLK_CKDIVR=0;                //	no dividers
2686  0144 725f50c6      	clr	_CLK_CKDIVR
2687                     ; 92 		CLK_PCKENR1=0xff;//0x8B;     //0b10001011;        //clocking for TIM1, UART1, SPI i I2C
2689  0148 35ff50c7      	mov	_CLK_PCKENR1,#255
2690                     ; 94 		PA_CR1 = 1 << 3;
2692  014c 35085003      	mov	_PA_CR1,#8
2693                     ; 95 		PA_CR2 = 1 << 3;
2695  0150 35085004      	mov	_PA_CR2,#8
2696                     ; 96 		PA_DDR = 1<<3;
2698  0154 35085002      	mov	_PA_DDR,#8
2699                     ; 97 		PA_ODR = 1<<3;
2701  0158 35085000      	mov	_PA_ODR,#8
2702                     ; 99 		PC_CR1 = 1 << 6;
2704  015c 3540500d      	mov	_PC_CR1,#64
2705                     ; 110 		timer1_setup(TIM1_PRESCALER, TIM1_TOP);
2707  0160 aefa00        	ldw	x,#64000
2708  0163 89            	pushw	x
2709  0164 ae0005        	ldw	x,#5
2710  0167 cd0000        	call	_timer1_setup
2712  016a 85            	popw	x
2713                     ; 111 		timer2_setup(TIM2_PRESCALER, TIM2_TOP);
2715  016b ae9c40        	ldw	x,#40000
2716  016e 89            	pushw	x
2717  016f a603          	ld	a,#3
2718  0171 cd0000        	call	_timer2_setup
2720  0174 85            	popw	x
2721                     ; 112 		usart_setup();
2723  0175 cd0000        	call	_usart_setup
2725                     ; 113 		usart_send("Hello", 5);
2727  0178 ae0005        	ldw	x,#5
2728  017b 89            	pushw	x
2729  017c ae0000        	ldw	x,#L1161
2730  017f cd0000        	call	_usart_send
2732  0182 85            	popw	x
2733                     ; 114 		timer2_start();
2735  0183 cd0000        	call	_timer2_start
2737                     ; 115 _asm ("RIM");  //on interupts
2740  0186 9a            RIM
2742  0187               L3161:
2743                     ; 116 	while (1);
2745  0187 20fe          	jra	L3161
2823                     	xdef	_main
2824                     	xdef	_calculate
2825                     	xdef	_itoa
2826                     	xdef	_usart_counter
2827                     	switch	.ubsct
2828  0000               _increasing:
2829  0000 00            	ds.b	1
2830                     	xdef	_increasing
2831                     	xdef	_in_pwm
2832                     	xdef	_divider
2833                     	xdef	_step
2834                     	xdef	_bot_val
2835                     	xdef	_top_val
2836                     	xref	_usart_send
2837                     	xref	_usart_setup
2838                     	xref	_timer2_start
2839                     	xref	_timer2_setup
2840                     	xref	_timer1_setup
2841                     .const:	section	.text
2842  0000               L1161:
2843  0000 48656c6c6f00  	dc.b	"Hello",0
2844  0006               L7751:
2845  0006 202020494e3a  	dc.b	"   IN: ",0
2846  000e               L5751:
2847  000e 0a4f55543a20  	dc.b	10,79,85,84,58,32,0
2848                     	xref.b	c_x
2868                     	end
