   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
2225                     ; 5 void timer1_setup(uint16_t prescaler, uint16_t top)
2225                     ; 6  {
2227                     	switch	.text
2228  0000               _timer1_setup:
2230  0000 89            	pushw	x
2231       00000000      OFST:	set	0
2234                     ; 7   TIM1_PSCRH = prescaler >> 8;
2236  0001 9e            	ld	a,xh
2237  0002 c75260        	ld	_TIM1_PSCRH,a
2238                     ; 8   TIM1_PSCRL = prescaler & 0xFF;
2240  0005 9f            	ld	a,xl
2241  0006 a4ff          	and	a,#255
2242  0008 c75261        	ld	_TIM1_PSCRL,a
2243                     ; 9   TIM1_ARRH = (top) >> 8; //	overflow frequency = 16Ì / 8 / 1000 = 2000 Ãö
2245  000b 7b05          	ld	a,(OFST+5,sp)
2246  000d c75262        	ld	_TIM1_ARRH,a
2247                     ; 10   TIM1_ARRL = (top)& 0xFF;
2249  0010 7b06          	ld	a,(OFST+6,sp)
2250  0012 a4ff          	and	a,#255
2251  0014 c75263        	ld	_TIM1_ARRL,a
2252                     ; 12 	TIM1_IER |= TIM1_IER_CC1IE;	//compare  int for recalculation
2254  0017 72125254      	bset	_TIM1_IER,#1
2255                     ; 13 	TIM1_CCMR1 |= (6<<4) | TIM1_CCMR_OCxPE;	//PWM mode1
2257  001b c65258        	ld	a,_TIM1_CCMR1
2258  001e aa68          	or	a,#104
2259  0020 c75258        	ld	_TIM1_CCMR1,a
2260                     ; 25  }
2263  0023 85            	popw	x
2264  0024 81            	ret
2310                     ; 28  void timer2_setup(uint8_t prescaler, uint16_t top)
2310                     ; 29  {
2311                     	switch	.text
2312  0025               _timer2_setup:
2314  0025 88            	push	a
2315       00000000      OFST:	set	0
2318                     ; 30 	 TIM2_PSCR = prescaler;
2320  0026 c7530e        	ld	_TIM2_PSCR,a
2321                     ; 31 	 TIM2_ARRH = (top) >> 8; //	overflow frequency = 16Ì / 8 / 1000 = 2000 Ãö
2323  0029 7b04          	ld	a,(OFST+4,sp)
2324  002b c7530f        	ld	_TIM2_ARRH,a
2325                     ; 32 	 TIM2_ARRL = (top)& 0xFF;
2327  002e 7b05          	ld	a,(OFST+5,sp)
2328  0030 a4ff          	and	a,#255
2329  0032 c75310        	ld	_TIM2_ARRL,a
2330                     ; 33  }
2333  0035 84            	pop	a
2334  0036 81            	ret
2368                     ; 35  void timer4_setup(uint8_t prescaler, uint8_t top)
2368                     ; 36  {
2369                     	switch	.text
2370  0037               _timer4_setup:
2374                     ; 38  }
2377  0037 81            	ret
2401                     ; 40  void timer1_start(void)
2401                     ; 41  {
2402                     	switch	.text
2403  0038               _timer1_start:
2407                     ; 42 	 TIM2_CR1 |= TIM1_CR1_CEN;
2409  0038 72105300      	bset	_TIM2_CR1,#0
2410                     ; 43  }
2413  003c 81            	ret
2436                     ; 45  void timer1_capture1(void)
2436                     ; 46  {
2437                     	switch	.text
2438  003d               _timer1_capture1:
2442                     ; 49  }
2445  003d 81            	ret
2468                     ; 51  void timer2_compare1(void)
2468                     ; 52  {
2469                     	switch	.text
2470  003e               _timer2_compare1:
2474                     ; 54  }
2477  003e 81            	ret
2490                     	xdef	_timer2_compare1
2491                     	xdef	_timer4_setup
2492                     	xdef	_timer1_capture1
2493                     	xdef	_timer1_start
2494                     	xdef	_timer2_setup
2495                     	xdef	_timer1_setup
2514                     	end
