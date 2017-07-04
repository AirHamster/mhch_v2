   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
2229                     ; 13 void timer1_setup(uint16_t prescaler, uint16_t top)
2229                     ; 14 {
2231                     	switch	.text
2232  0000               _timer1_setup:
2234  0000 89            	pushw	x
2235       00000000      OFST:	set	0
2238                     ; 15 	TIM1_ARRH = (top >> 8);
2240  0001 7b05          	ld	a,(OFST+5,sp)
2241  0003 c75262        	ld	_TIM1_ARRH,a
2242                     ; 16 	TIM1_ARRL = top & 0xFF;
2244  0006 7b06          	ld	a,(OFST+6,sp)
2245  0008 a4ff          	and	a,#255
2246  000a c75263        	ld	_TIM1_ARRL,a
2247                     ; 17 	TIM1_PSCRH = prescaler >> 8; // clock/5
2249  000d 9e            	ld	a,xh
2250  000e c75260        	ld	_TIM1_PSCRH,a
2251                     ; 18 	TIM1_PSCRL = prescaler & 0xFF;
2253  0011 9f            	ld	a,xl
2254  0012 a4ff          	and	a,#255
2255  0014 c75261        	ld	_TIM1_PSCRL,a
2256                     ; 22 	TIM1_CCMR1 = (2 << 4) | (1 << 0);	//filter and tim1 ch1 mapping (not a optional byte!!)
2258  0017 35215258      	mov	_TIM1_CCMR1,#33
2259                     ; 23 	TIM1_CCMR2 = (2 << 4) | (3 << 0);	//for second trigger
2261  001b 35235259      	mov	_TIM1_CCMR2,#35
2262                     ; 26 	TIM1_SMCR = (5 << 4) | (5 << 0);
2264  001f 35555252      	mov	_TIM1_SMCR,#85
2265                     ; 27 	TIM1_CCER1 = (1 << 0) | (1 << 4); //capture enable
2267  0023 3511525c      	mov	_TIM1_CCER1,#17
2268                     ; 28 	TIM1_IER = (1 << 1) | (1 << 6);	//interrupts
2270  0027 35425254      	mov	_TIM1_IER,#66
2271                     ; 29 	TIM1_CR1 |= TIM1_CR1_CEN;
2273  002b 72105250      	bset	_TIM1_CR1,#0
2274                     ; 30 }
2277  002f 85            	popw	x
2278  0030 81            	ret
2329                     ; 33 void timer2_setup(uint8_t prescaler, uint16_t top)
2329                     ; 34 {
2330                     	switch	.text
2331  0031               _timer2_setup:
2333  0031 88            	push	a
2334       00000000      OFST:	set	0
2337                     ; 35 	TIM2_ARRH = (top >> 8);
2339  0032 7b04          	ld	a,(OFST+4,sp)
2340  0034 c7530f        	ld	_TIM2_ARRH,a
2341                     ; 36 	TIM2_ARRL = top & 0xFF;
2343  0037 7b05          	ld	a,(OFST+5,sp)
2344  0039 a4ff          	and	a,#255
2345  003b c75310        	ld	_TIM2_ARRL,a
2346                     ; 37 	TIM2_CCR3H = 6000 >> 8;
2348  003e 35175315      	mov	_TIM2_CCR3H,#23
2349                     ; 38 	TIM2_CCR3L = 6000 & 0xFF;
2351  0042 35705316      	mov	_TIM2_CCR3L,#112
2352                     ; 39 	TIM2_PSCR = prescaler; // clock/8
2354  0046 7b01          	ld	a,(OFST+1,sp)
2355  0048 c7530e        	ld	_TIM2_PSCR,a
2356                     ; 40 	TIM2_CCMR3 = (6 << 4) | (1 << 3); //PWM and preload buffer
2358  004b 35685309      	mov	_TIM2_CCMR3,#104
2359                     ; 41 	TIM2_CCER2 = 1;
2361  004f 3501530b      	mov	_TIM2_CCER2,#1
2362                     ; 42 	TIM2_IER |= (1 << 0);
2364  0053 72105303      	bset	_TIM2_IER,#0
2365                     ; 43 	TIM2_IER |= (1 << 3);
2367  0057 72165303      	bset	_TIM2_IER,#3
2368                     ; 48 }
2371  005b 84            	pop	a
2372  005c 81            	ret
2406                     ; 51 void timer4_setup(uint8_t prescaler, uint8_t top)
2406                     ; 52 {
2407                     	switch	.text
2408  005d               _timer4_setup:
2412                     ; 54 }
2415  005d 81            	ret
2439                     ; 56 void timer1_start(void)
2439                     ; 57 {
2440                     	switch	.text
2441  005e               _timer1_start:
2445                     ; 58 	TIM1_CR1 |= TIM1_CR1_CEN;
2447  005e 72105250      	bset	_TIM1_CR1,#0
2448                     ; 59 }
2451  0062 81            	ret
2475                     ; 61 void timer2_start(void)
2475                     ; 62 {
2476                     	switch	.text
2477  0063               _timer2_start:
2481                     ; 63 	TIM2_CR1 |= TIM2_CR1_CEN;
2483  0063 72105300      	bset	_TIM2_CR1,#0
2484                     ; 65 }
2487  0067 81            	ret
2510                     ; 66 void timer4_start(void)
2510                     ; 67 {
2511                     	switch	.text
2512  0068               _timer4_start:
2516                     ; 69 }
2519  0068 81            	ret
2556                     ; 71 void timer1_capture1(void)
2556                     ; 72 {
2557                     	switch	.text
2558  0069               _timer1_capture1:
2560  0069 89            	pushw	x
2561       00000002      OFST:	set	2
2564                     ; 74 	TIM1_SR1 &= ~TIM1_SR1_CC1IF;
2566  006a 72135255      	bres	_TIM1_SR1,#1
2567                     ; 75 	result = TIM1_CCR1H << 8;
2569  006e c65265        	ld	a,_TIM1_CCR1H
2570  0071 5f            	clrw	x
2571  0072 97            	ld	xl,a
2572  0073 4f            	clr	a
2573  0074 02            	rlwa	x,a
2574  0075 1f01          	ldw	(OFST-1,sp),x
2575                     ; 76 	result |= TIM1_CCR1L; 
2577  0077 c65266        	ld	a,_TIM1_CCR1L
2578  007a 5f            	clrw	x
2579  007b 97            	ld	xl,a
2580  007c 01            	rrwa	x,a
2581  007d 1a02          	or	a,(OFST+0,sp)
2582  007f 01            	rrwa	x,a
2583  0080 1a01          	or	a,(OFST-1,sp)
2584  0082 01            	rrwa	x,a
2585  0083 1f01          	ldw	(OFST-1,sp),x
2586                     ; 79 }
2589  0085 85            	popw	x
2590  0086 81            	ret
2619                     ; 81 void timer1_trigger(void)
2619                     ; 82 {
2620                     	switch	.text
2621  0087               _timer1_trigger:
2625                     ; 83 	TIM1_SR1 &= ~TIM1_SR1_TIF;
2627  0087 721d5255      	bres	_TIM1_SR1,#6
2628                     ; 84 	if (!(PC_IDR & (1 << 6)))
2630  008b c6500b        	ld	a,_PC_IDR
2631  008e a540          	bcp	a,#64
2632  0090 262a          	jrne	L1751
2633                     ; 88 		calculate(TIM1_CNTRH, TIM1_CNTRL);
2635  0092 c6525f        	ld	a,_TIM1_CNTRL
2636  0095 97            	ld	xl,a
2637  0096 c6525e        	ld	a,_TIM1_CNTRH
2638  0099 95            	ld	xh,a
2639  009a cd0000        	call	_calculate
2641                     ; 89 		in_pwm = TIM1_CNTRH << 8;
2643  009d c6525e        	ld	a,_TIM1_CNTRH
2644  00a0 5f            	clrw	x
2645  00a1 97            	ld	xl,a
2646  00a2 4f            	clr	a
2647  00a3 02            	rlwa	x,a
2648  00a4 bf00          	ldw	_in_pwm,x
2649                     ; 90 		in_pwm |= TIM1_CNTRL & 0xFF;
2651  00a6 c6525f        	ld	a,_TIM1_CNTRL
2652  00a9 5f            	clrw	x
2653  00aa 97            	ld	xl,a
2654  00ab 01            	rrwa	x,a
2655  00ac ba01          	or	a,_in_pwm+1
2656  00ae 01            	rrwa	x,a
2657  00af ba00          	or	a,_in_pwm
2658  00b1 01            	rrwa	x,a
2659  00b2 bf00          	ldw	_in_pwm,x
2660                     ; 91 		TIM1_CNTRH = 0;
2662  00b4 725f525e      	clr	_TIM1_CNTRH
2663                     ; 92 		TIM1_CNTRL = 0;
2665  00b8 725f525f      	clr	_TIM1_CNTRL
2666  00bc               L1751:
2667                     ; 95 }
2670  00bc 81            	ret
2711                     ; 96 void timer2_compare3(void)
2711                     ; 97 {
2712                     	switch	.text
2713  00bd               _timer2_compare3:
2715  00bd 89            	pushw	x
2716       00000002      OFST:	set	2
2719                     ; 99 	TIM2_SR1 &= ~TIM2_SR1_CC3IF;
2721  00be 72175304      	bres	_TIM2_SR1,#3
2722                     ; 100 	timval = TIM2_CCR3H << 8;
2724  00c2 c65315        	ld	a,_TIM2_CCR3H
2725  00c5 5f            	clrw	x
2726  00c6 97            	ld	xl,a
2727  00c7 4f            	clr	a
2728  00c8 02            	rlwa	x,a
2729  00c9 1f01          	ldw	(OFST-1,sp),x
2730                     ; 101 	timval |= TIM2_CCR3L & 0xFF;
2732  00cb c65316        	ld	a,_TIM2_CCR3L
2733  00ce 5f            	clrw	x
2734  00cf 97            	ld	xl,a
2735  00d0 01            	rrwa	x,a
2736  00d1 1a02          	or	a,(OFST+0,sp)
2737  00d3 01            	rrwa	x,a
2738  00d4 1a01          	or	a,(OFST-1,sp)
2739  00d6 01            	rrwa	x,a
2740  00d7 1f01          	ldw	(OFST-1,sp),x
2741                     ; 102 	if (!increasing)
2743  00d9 3d00          	tnz	_increasing
2744  00db 2614          	jrne	L1161
2745                     ; 104 		timval -= step;
2747  00dd 1e01          	ldw	x,(OFST-1,sp)
2748  00df 72b00000      	subw	x,_step
2749  00e3 1f01          	ldw	(OFST-1,sp),x
2750                     ; 105 		if (timval <= bot_val)
2752  00e5 1e01          	ldw	x,(OFST-1,sp)
2753  00e7 b300          	cpw	x,_bot_val
2754  00e9 2216          	jrugt	L5161
2755                     ; 107 			increasing = 1;
2757  00eb 35010000      	mov	_increasing,#1
2758  00ef 2010          	jra	L5161
2759  00f1               L1161:
2760                     ; 110 		timval += step;
2762  00f1 1e01          	ldw	x,(OFST-1,sp)
2763  00f3 72bb0000      	addw	x,_step
2764  00f7 1f01          	ldw	(OFST-1,sp),x
2765                     ; 111 		if (timval >= top_val)
2767  00f9 1e01          	ldw	x,(OFST-1,sp)
2768  00fb b300          	cpw	x,_top_val
2769  00fd 2502          	jrult	L5161
2770                     ; 113 			increasing = 0;
2772  00ff 3f00          	clr	_increasing
2773  0101               L5161:
2774                     ; 121 }
2777  0101 85            	popw	x
2778  0102 81            	ret
2802                     ; 122 void timer2_overflow (void)
2802                     ; 123 {
2803                     	switch	.text
2804  0103               _timer2_overflow:
2808                     ; 124 	TIM2_SR1 &= ~TIM2_SR1_UIF;
2810  0103 72115304      	bres	_TIM2_SR1,#0
2811                     ; 125 	return;
2814  0107 81            	ret
2827                     	xdef	_timer2_overflow
2828                     	xdef	_timer1_trigger
2829                     	xdef	_timer4_start
2830                     	xdef	_timer4_setup
2831                     	xref	_calculate
2832                     	xref.b	_in_pwm
2833                     	xref.b	_increasing
2834                     	xref.b	_step
2835                     	xref.b	_bot_val
2836                     	xref.b	_top_val
2837                     	xdef	_timer2_compare3
2838                     	xdef	_timer1_capture1
2839                     	xdef	_timer1_start
2840                     	xdef	_timer2_start
2841                     	xdef	_timer2_setup
2842                     	xdef	_timer1_setup
2861                     	end
