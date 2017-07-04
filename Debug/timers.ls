   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
2210                     ; 6 void timer1_setup(uint16_t prescaler, uint16_t top)
2210                     ; 7 {
2212                     	switch	.text
2213  0000               _timer1_setup:
2217                     ; 9 }
2220  0000 81            	ret
2271                     ; 12 void timer2_setup(uint8_t prescaler, uint16_t top)
2271                     ; 13 {
2272                     	switch	.text
2273  0001               _timer2_setup:
2275  0001 88            	push	a
2276       00000000      OFST:	set	0
2279                     ; 14 	TIM2_ARRH = (top >> 8);
2281  0002 7b04          	ld	a,(OFST+4,sp)
2282  0004 c7530f        	ld	_TIM2_ARRH,a
2283                     ; 15 	TIM2_ARRL = top & 0xFF;
2285  0007 7b05          	ld	a,(OFST+5,sp)
2286  0009 a4ff          	and	a,#255
2287  000b c75310        	ld	_TIM2_ARRL,a
2288                     ; 16 		TIM2_CCR3H = 6000 >> 8;
2290  000e 35175315      	mov	_TIM2_CCR3H,#23
2291                     ; 17 	TIM2_CCR3L = 6000 & 0xFF;
2293  0012 35705316      	mov	_TIM2_CCR3L,#112
2294                     ; 18 	TIM2_PSCR = prescaler; // clock/8
2296  0016 7b01          	ld	a,(OFST+1,sp)
2297  0018 c7530e        	ld	_TIM2_PSCR,a
2298                     ; 19 	TIM2_CCMR3 = (6 << 4) | (1 << 3); //PWM and preload buffer
2300  001b 35685309      	mov	_TIM2_CCMR3,#104
2301                     ; 20 	TIM2_CCER2 = 1;
2303  001f 3501530b      	mov	_TIM2_CCER2,#1
2304                     ; 21 	TIM2_IER |= (1 << 0);
2306  0023 72105303      	bset	_TIM2_IER,#0
2307                     ; 22 	TIM2_IER |= (1 << 3);
2309  0027 72165303      	bset	_TIM2_IER,#3
2310                     ; 27 }
2313  002b 84            	pop	a
2314  002c 81            	ret
2348                     ; 30 void timer4_setup(uint8_t prescaler, uint8_t top)
2348                     ; 31 {
2349                     	switch	.text
2350  002d               _timer4_setup:
2354                     ; 33 }
2357  002d 81            	ret
2381                     ; 35 void timer1_start(void)
2381                     ; 36 {
2382                     	switch	.text
2383  002e               _timer1_start:
2387                     ; 37 	TIM1_CR1 |= TIM1_CR1_CEN;
2389  002e 72105250      	bset	_TIM1_CR1,#0
2390                     ; 38 }
2393  0032 81            	ret
2417                     ; 40 void timer2_start(void)
2417                     ; 41 {
2418                     	switch	.text
2419  0033               _timer2_start:
2423                     ; 42 	TIM2_CR1 |= TIM2_CR1_CEN;
2425  0033 72105300      	bset	_TIM2_CR1,#0
2426                     ; 44 }
2429  0037 81            	ret
2452                     ; 45 void timer4_start(void)
2452                     ; 46 {
2453                     	switch	.text
2454  0038               _timer4_start:
2458                     ; 48 }
2461  0038 81            	ret
2484                     ; 50 void timer1_capture1(void)
2484                     ; 51 {
2485                     	switch	.text
2486  0039               _timer1_capture1:
2490                     ; 54 }
2493  0039 81            	ret
2517                     ; 56 void timer2_compare3(void)
2517                     ; 57 {
2518                     	switch	.text
2519  003a               _timer2_compare3:
2523                     ; 58 	TIM2_SR1 &= ~TIM2_SR1_CC3IF;
2525  003a 72175304      	bres	_TIM2_SR1,#3
2526                     ; 60 }
2529  003e 81            	ret
2553                     ; 61 void timer2_overflow (void)
2553                     ; 62 {
2554                     	switch	.text
2555  003f               _timer2_overflow:
2559                     ; 63 	TIM2_SR1 &= ~TIM2_SR1_UIF;
2561  003f 72115304      	bres	_TIM2_SR1,#0
2562                     ; 64 	return;
2565  0043 81            	ret
2578                     	xdef	_timer2_overflow
2579                     	xdef	_timer4_start
2580                     	xdef	_timer4_setup
2581                     	xdef	_timer2_compare3
2582                     	xdef	_timer1_capture1
2583                     	xdef	_timer1_start
2584                     	xdef	_timer2_start
2585                     	xdef	_timer2_setup
2586                     	xdef	_timer1_setup
2605                     	end
