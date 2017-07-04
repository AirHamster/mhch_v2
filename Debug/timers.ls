   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
2229                     ; 7 void timer1_setup(uint16_t prescaler, uint16_t top)
2229                     ; 8 {
2231                     	switch	.text
2232  0000               _timer1_setup:
2234  0000 89            	pushw	x
2235       00000000      OFST:	set	0
2238                     ; 9 	TIM1_ARRH = (top >> 8);
2240  0001 7b05          	ld	a,(OFST+5,sp)
2241  0003 c75262        	ld	_TIM1_ARRH,a
2242                     ; 10 	TIM1_ARRL = top & 0xFF;
2244  0006 7b06          	ld	a,(OFST+6,sp)
2245  0008 a4ff          	and	a,#255
2246  000a c75263        	ld	_TIM1_ARRL,a
2247                     ; 11 	TIM1_PSCRH = prescaler >> 8; // clock/5
2249  000d 9e            	ld	a,xh
2250  000e c75260        	ld	_TIM1_PSCRH,a
2251                     ; 12 	TIM1_PSCRL = prescaler & 0xFF;
2253  0011 9f            	ld	a,xl
2254  0012 a4ff          	and	a,#255
2255  0014 c75261        	ld	_TIM1_PSCRL,a
2256                     ; 16 	TIM1_CCMR1 = (2 << 4) | (1 << 0);	//filter and tim1 ch1 mapping (not a optional byte!!)
2258  0017 35215258      	mov	_TIM1_CCMR1,#33
2259                     ; 17 	TIM1_CCMR2 = (2 << 4) | (3 << 0);	//for second trigger
2261  001b 35235259      	mov	_TIM1_CCMR2,#35
2262                     ; 18 	TIM1_CCER1 = (0 << 1);	//rising edge triggering for first input trigger
2264  001f 725f525c      	clr	_TIM1_CCER1
2265                     ; 19 	TIM1_CCER1 = (1 << 5);	//falling edge triggering for second input trigger
2267  0023 3520525c      	mov	_TIM1_CCER1,#32
2268                     ; 20 	TIM1_SMCR = (5 << 4);
2270  0027 35505252      	mov	_TIM1_SMCR,#80
2271                     ; 21 	TIM1_CCER1 = (1 << 0) | (1 << 4); //capture enable
2273  002b 3511525c      	mov	_TIM1_CCER1,#17
2274                     ; 22 	TIM1_IER = 1 << 1;	//interrupts
2276  002f 35025254      	mov	_TIM1_IER,#2
2277                     ; 23 	TIM1_CR1 |= TIM1_CR1_CEN;
2279  0033 72105250      	bset	_TIM1_CR1,#0
2280                     ; 24 }
2283  0037 85            	popw	x
2284  0038 81            	ret
2335                     ; 27 void timer2_setup(uint8_t prescaler, uint16_t top)
2335                     ; 28 {
2336                     	switch	.text
2337  0039               _timer2_setup:
2339  0039 88            	push	a
2340       00000000      OFST:	set	0
2343                     ; 29 	TIM2_ARRH = (top >> 8);
2345  003a 7b04          	ld	a,(OFST+4,sp)
2346  003c c7530f        	ld	_TIM2_ARRH,a
2347                     ; 30 	TIM2_ARRL = top & 0xFF;
2349  003f 7b05          	ld	a,(OFST+5,sp)
2350  0041 a4ff          	and	a,#255
2351  0043 c75310        	ld	_TIM2_ARRL,a
2352                     ; 31 	TIM2_CCR3H = 6000 >> 8;
2354  0046 35175315      	mov	_TIM2_CCR3H,#23
2355                     ; 32 	TIM2_CCR3L = 6000 & 0xFF;
2357  004a 35705316      	mov	_TIM2_CCR3L,#112
2358                     ; 33 	TIM2_PSCR = prescaler; // clock/8
2360  004e 7b01          	ld	a,(OFST+1,sp)
2361  0050 c7530e        	ld	_TIM2_PSCR,a
2362                     ; 34 	TIM2_CCMR3 = (6 << 4) | (1 << 3); //PWM and preload buffer
2364  0053 35685309      	mov	_TIM2_CCMR3,#104
2365                     ; 35 	TIM2_CCER2 = 1;
2367  0057 3501530b      	mov	_TIM2_CCER2,#1
2368                     ; 36 	TIM2_IER |= (1 << 0);
2370  005b 72105303      	bset	_TIM2_IER,#0
2371                     ; 37 	TIM2_IER |= (1 << 3);
2373  005f 72165303      	bset	_TIM2_IER,#3
2374                     ; 42 }
2377  0063 84            	pop	a
2378  0064 81            	ret
2412                     ; 45 void timer4_setup(uint8_t prescaler, uint8_t top)
2412                     ; 46 {
2413                     	switch	.text
2414  0065               _timer4_setup:
2418                     ; 48 }
2421  0065 81            	ret
2445                     ; 50 void timer1_start(void)
2445                     ; 51 {
2446                     	switch	.text
2447  0066               _timer1_start:
2451                     ; 52 	TIM1_CR1 |= TIM1_CR1_CEN;
2453  0066 72105250      	bset	_TIM1_CR1,#0
2454                     ; 53 }
2457  006a 81            	ret
2481                     ; 55 void timer2_start(void)
2481                     ; 56 {
2482                     	switch	.text
2483  006b               _timer2_start:
2487                     ; 57 	TIM2_CR1 |= TIM2_CR1_CEN;
2489  006b 72105300      	bset	_TIM2_CR1,#0
2490                     ; 59 }
2493  006f 81            	ret
2516                     ; 60 void timer4_start(void)
2516                     ; 61 {
2517                     	switch	.text
2518  0070               _timer4_start:
2522                     ; 63 }
2525  0070 81            	ret
2562                     ; 65 void timer1_capture1(void)
2562                     ; 66 {
2563                     	switch	.text
2564  0071               _timer1_capture1:
2566  0071 89            	pushw	x
2567       00000002      OFST:	set	2
2570                     ; 68 	TIM1_SR1 &= ~TIM1_SR1_CC1IF;
2572  0072 72135255      	bres	_TIM1_SR1,#1
2573                     ; 69 	result = TIM1_CCR1H << 8;
2575  0076 c65265        	ld	a,_TIM1_CCR1H
2576  0079 5f            	clrw	x
2577  007a 97            	ld	xl,a
2578  007b 4f            	clr	a
2579  007c 02            	rlwa	x,a
2580  007d 1f01          	ldw	(OFST-1,sp),x
2581                     ; 70 	result |= TIM1_CCR1L; 
2583  007f c65266        	ld	a,_TIM1_CCR1L
2584  0082 5f            	clrw	x
2585  0083 97            	ld	xl,a
2586  0084 01            	rrwa	x,a
2587  0085 1a02          	or	a,(OFST+0,sp)
2588  0087 01            	rrwa	x,a
2589  0088 1a01          	or	a,(OFST-1,sp)
2590  008a 01            	rrwa	x,a
2591  008b 1f01          	ldw	(OFST-1,sp),x
2592                     ; 72 }
2595  008d 85            	popw	x
2596  008e 81            	ret
2620                     ; 74 void timer2_compare3(void)
2620                     ; 75 {
2621                     	switch	.text
2622  008f               _timer2_compare3:
2626                     ; 76 	TIM2_SR1 &= ~TIM2_SR1_CC3IF;
2628  008f 72175304      	bres	_TIM2_SR1,#3
2629                     ; 78 }
2632  0093 81            	ret
2656                     ; 79 void timer2_overflow (void)
2656                     ; 80 {
2657                     	switch	.text
2658  0094               _timer2_overflow:
2662                     ; 81 	TIM2_SR1 &= ~TIM2_SR1_UIF;
2664  0094 72115304      	bres	_TIM2_SR1,#0
2665                     ; 82 	return;
2668  0098 81            	ret
2681                     	xdef	_timer2_overflow
2682                     	xdef	_timer4_start
2683                     	xdef	_timer4_setup
2684                     	xdef	_timer2_compare3
2685                     	xdef	_timer1_capture1
2686                     	xdef	_timer1_start
2687                     	xdef	_timer2_start
2688                     	xdef	_timer2_setup
2689                     	xdef	_timer1_setup
2708                     	end
