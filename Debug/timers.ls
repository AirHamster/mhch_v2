   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
2228                     ; 17 void timer1_setup(uint16_t prescaler, uint16_t top)
2228                     ; 18 {
2230                     	switch	.text
2231  0000               _timer1_setup:
2233  0000 89            	pushw	x
2234       00000000      OFST:	set	0
2237                     ; 19 	TIM1_ARRH = (top >> 8);
2239  0001 7b05          	ld	a,(OFST+5,sp)
2240  0003 c75262        	ld	_TIM1_ARRH,a
2241                     ; 20 	TIM1_ARRL = top & 0xFF;
2243  0006 7b06          	ld	a,(OFST+6,sp)
2244  0008 a4ff          	and	a,#255
2245  000a c75263        	ld	_TIM1_ARRL,a
2246                     ; 21 	TIM1_PSCRH = prescaler >> 8; // clock/5
2248  000d 9e            	ld	a,xh
2249  000e c75260        	ld	_TIM1_PSCRH,a
2250                     ; 22 	TIM1_PSCRL = prescaler & 0xFF;
2252  0011 9f            	ld	a,xl
2253  0012 a4ff          	and	a,#255
2254  0014 c75261        	ld	_TIM1_PSCRL,a
2255                     ; 38 	TIM1_CCMR1 = (1 << 0);
2257  0017 35015258      	mov	_TIM1_CCMR1,#1
2258                     ; 39 	TIM1_CCMR1 |= (4 << 4);	//filter
2260  001b 721c5258      	bset	_TIM1_CCMR1,#6
2261                     ; 41 	TIM1_CCER1 |= (0 << 1);	//rising edge
2263  001f c6525c        	ld	a,_TIM1_CCER1
2264                     ; 42 	TIM1_CCER1 |= (1 << 0);	//1 ch enable
2266  0022 7210525c      	bset	_TIM1_CCER1,#0
2267                     ; 44 	TIM1_CCMR2 = (2	<< 0);
2269  0026 35025259      	mov	_TIM1_CCMR2,#2
2270                     ; 45 	TIM1_CCMR2 |= (4 << 4);	//filter
2272  002a 721c5259      	bset	_TIM1_CCMR2,#6
2273                     ; 46 	TIM1_CCER1 |= (1 << 5); //2 ch polaryty
2275  002e 721a525c      	bset	_TIM1_CCER1,#5
2276                     ; 47 	TIM1_CCER1 |= (1 << 4);	//2 ch enable
2278  0032 7218525c      	bset	_TIM1_CCER1,#4
2279                     ; 48 	TIM1_SMCR = (5 << 4) | (4 << 0);
2281  0036 35545252      	mov	_TIM1_SMCR,#84
2282                     ; 49 	TIM1_IER = (1 << 1) | (1 << 2);
2284  003a 35065254      	mov	_TIM1_IER,#6
2285                     ; 50 }
2288  003e 85            	popw	x
2289  003f 81            	ret
2340                     ; 53 void timer2_setup(uint8_t prescaler, uint16_t top)
2340                     ; 54 {
2341                     	switch	.text
2342  0040               _timer2_setup:
2344  0040 88            	push	a
2345       00000000      OFST:	set	0
2348                     ; 55 	TIM2_ARRH = (top >> 8);
2350  0041 7b04          	ld	a,(OFST+4,sp)
2351  0043 c7530f        	ld	_TIM2_ARRH,a
2352                     ; 56 	TIM2_ARRL = top & 0xFF;
2354  0046 7b05          	ld	a,(OFST+5,sp)
2355  0048 a4ff          	and	a,#255
2356  004a c75310        	ld	_TIM2_ARRL,a
2357                     ; 57 	TIM2_CCR3H = 3000 >> 8;
2359  004d 350b5315      	mov	_TIM2_CCR3H,#11
2360                     ; 58 	TIM2_CCR3L = 3000 & 0xFF;
2362  0051 35b85316      	mov	_TIM2_CCR3L,#184
2363                     ; 59 	TIM2_PSCR = prescaler; // clock/8
2365  0055 7b01          	ld	a,(OFST+1,sp)
2366  0057 c7530e        	ld	_TIM2_PSCR,a
2367                     ; 60 	TIM2_CCMR3 = (6 << 4) | (1 << 3); //PWM and preload buffer
2369  005a 35685309      	mov	_TIM2_CCMR3,#104
2370                     ; 61 	TIM2_CCER2 = 1;
2372  005e 3501530b      	mov	_TIM2_CCER2,#1
2373                     ; 62 	TIM2_IER |= (1 << 0);
2375  0062 72105303      	bset	_TIM2_IER,#0
2376                     ; 63 	TIM2_IER |= (1 << 3);
2378  0066 72165303      	bset	_TIM2_IER,#3
2379                     ; 68 }
2382  006a 84            	pop	a
2383  006b 81            	ret
2417                     ; 71 void timer4_setup(uint8_t prescaler, uint8_t top)
2417                     ; 72 {
2418                     	switch	.text
2419  006c               _timer4_setup:
2423                     ; 74 }
2426  006c 81            	ret
2450                     ; 76 void timer1_start(void)
2450                     ; 77 {
2451                     	switch	.text
2452  006d               _timer1_start:
2456                     ; 78 	TIM1_CR1 |= TIM1_CR1_CEN;
2458  006d 72105250      	bset	_TIM1_CR1,#0
2459                     ; 79 }
2462  0071 81            	ret
2486                     ; 81 void timer2_start(void)
2486                     ; 82 {
2487                     	switch	.text
2488  0072               _timer2_start:
2492                     ; 83 	TIM2_CR1 |= TIM2_CR1_CEN;
2494  0072 72105300      	bset	_TIM2_CR1,#0
2495                     ; 85 }
2498  0076 81            	ret
2521                     ; 86 void timer4_start(void)
2521                     ; 87 {
2522                     	switch	.text
2523  0077               _timer4_start:
2527                     ; 89 }
2530  0077 81            	ret
2557                     ; 91 void timer1_capture1(void)
2557                     ; 92 {
2558                     	switch	.text
2559  0078               _timer1_capture1:
2563                     ; 94 	if ((TIM1_SR1 & TIM1_SR1_CC1IF))
2565  0078 c65255        	ld	a,_TIM1_SR1
2566  007b a502          	bcp	a,#2
2567  007d 2706          	jreq	L3551
2568                     ; 96 			TIM1_SR1 &= ~TIM1_SR1_CC1IF;
2570  007f 72135255      	bres	_TIM1_SR1,#1
2572  0083 200b          	jra	L5551
2573  0085               L3551:
2574                     ; 97 	}else if ((TIM1_SR1 & TIM1_SR1_CC2IF))
2576  0085 c65255        	ld	a,_TIM1_SR1
2577  0088 a504          	bcp	a,#4
2578  008a 2704          	jreq	L5551
2579                     ; 99 	TIM1_SR1 &= ~TIM1_SR1_CC2IF;
2581  008c 72155255      	bres	_TIM1_SR1,#2
2582  0090               L5551:
2583                     ; 100 	in_pwm = TIM1_CCR2H << 8;
2585  0090 c65267        	ld	a,_TIM1_CCR2H
2586  0093 5f            	clrw	x
2587  0094 97            	ld	xl,a
2588  0095 4f            	clr	a
2589  0096 02            	rlwa	x,a
2590  0097 bf00          	ldw	_in_pwm,x
2591                     ; 101 	in_pwm |= TIM1_CCR2L & 0xFF;
2593  0099 c65268        	ld	a,_TIM1_CCR2L
2594  009c 5f            	clrw	x
2595  009d 97            	ld	xl,a
2596  009e 01            	rrwa	x,a
2597  009f ba01          	or	a,_in_pwm+1
2598  00a1 01            	rrwa	x,a
2599  00a2 ba00          	or	a,_in_pwm
2600  00a4 01            	rrwa	x,a
2601  00a5 bf00          	ldw	_in_pwm,x
2602                     ; 105 }
2605  00a7 81            	ret
2629                     ; 106 void timer1_capture2(void)
2629                     ; 107 {
2630                     	switch	.text
2631  00a8               _timer1_capture2:
2635                     ; 109 	TIM1_SR1 &= ~TIM1_SR1_CC2IF;
2637  00a8 72155255      	bres	_TIM1_SR1,#2
2638                     ; 112 }
2641  00ac 81            	ret
2669                     ; 114 void timer1_trigger(void)
2669                     ; 115 {
2670                     	switch	.text
2671  00ad               _timer1_trigger:
2675                     ; 116 	TIM1_SR1 &= ~TIM1_SR1_TIF;
2677  00ad 721d5255      	bres	_TIM1_SR1,#6
2678                     ; 117 	if (!(PC_IDR & (1 << 6)))
2680  00b1 c6500b        	ld	a,_PC_IDR
2681  00b4 a540          	bcp	a,#64
2682  00b6 261f          	jrne	L1061
2683                     ; 122 		in_pwm = TIM1_CNTRH << 8;
2685  00b8 c6525e        	ld	a,_TIM1_CNTRH
2686  00bb 5f            	clrw	x
2687  00bc 97            	ld	xl,a
2688  00bd 4f            	clr	a
2689  00be 02            	rlwa	x,a
2690  00bf bf00          	ldw	_in_pwm,x
2691                     ; 123 		in_pwm |= TIM1_CNTRL & 0xFF;
2693  00c1 c6525f        	ld	a,_TIM1_CNTRL
2694  00c4 5f            	clrw	x
2695  00c5 97            	ld	xl,a
2696  00c6 01            	rrwa	x,a
2697  00c7 ba01          	or	a,_in_pwm+1
2698  00c9 01            	rrwa	x,a
2699  00ca ba00          	or	a,_in_pwm
2700  00cc 01            	rrwa	x,a
2701  00cd bf00          	ldw	_in_pwm,x
2702                     ; 125 		TIM1_CNTRH = 0;
2704  00cf 725f525e      	clr	_TIM1_CNTRH
2705                     ; 126 		TIM1_CNTRL = 0;
2707  00d3 725f525f      	clr	_TIM1_CNTRL
2708  00d7               L1061:
2709                     ; 129 }
2712  00d7 81            	ret
2759                     ; 130 void timer2_compare3(void)
2759                     ; 131 {
2760                     	switch	.text
2761  00d8               _timer2_compare3:
2763  00d8 89            	pushw	x
2764       00000002      OFST:	set	2
2767                     ; 133 	TIM2_SR1 &= ~TIM2_SR1_CC3IF;
2769  00d9 72175304      	bres	_TIM2_SR1,#3
2770                     ; 134 	timval = TIM2_CCR3H << 8;
2772  00dd c65315        	ld	a,_TIM2_CCR3H
2773  00e0 5f            	clrw	x
2774  00e1 97            	ld	xl,a
2775  00e2 4f            	clr	a
2776  00e3 02            	rlwa	x,a
2777  00e4 1f01          	ldw	(OFST-1,sp),x
2778                     ; 135 	timval |= TIM2_CCR3L & 0xFF;
2780  00e6 c65316        	ld	a,_TIM2_CCR3L
2781  00e9 5f            	clrw	x
2782  00ea 97            	ld	xl,a
2783  00eb 01            	rrwa	x,a
2784  00ec 1a02          	or	a,(OFST+0,sp)
2785  00ee 01            	rrwa	x,a
2786  00ef 1a01          	or	a,(OFST-1,sp)
2787  00f1 01            	rrwa	x,a
2788  00f2 1f01          	ldw	(OFST-1,sp),x
2789                     ; 137 if (usart_counter++ == 5)
2791  00f4 b600          	ld	a,_usart_counter
2792  00f6 3c00          	inc	_usart_counter
2793  00f8 a105          	cp	a,#5
2794  00fa 264a          	jrne	L1261
2795                     ; 139 		usart_counter = 0;
2797  00fc 3f00          	clr	_usart_counter
2798                     ; 140 		usart_send("\nOUT: ", 6);
2800  00fe ae0006        	ldw	x,#6
2801  0101 89            	pushw	x
2802  0102 ae0008        	ldw	x,#L3261
2803  0105 cd0000        	call	_usart_send
2805  0108 85            	popw	x
2806                     ; 142 	itoa(timval, &buff[0], 10);
2808  0109 ae000a        	ldw	x,#10
2809  010c 89            	pushw	x
2810  010d ae0000        	ldw	x,#_buff
2811  0110 89            	pushw	x
2812  0111 1e05          	ldw	x,(OFST+3,sp)
2813  0113 ad6c          	call	_itoa
2815  0115 5b04          	addw	sp,#4
2816                     ; 143 		usart_send(&buff[0], 5);
2818  0117 ae0005        	ldw	x,#5
2819  011a 89            	pushw	x
2820  011b ae0000        	ldw	x,#_buff
2821  011e cd0000        	call	_usart_send
2823  0121 85            	popw	x
2824                     ; 145 		usart_send("   IN: ", 7);
2826  0122 ae0007        	ldw	x,#7
2827  0125 89            	pushw	x
2828  0126 ae0000        	ldw	x,#L5261
2829  0129 cd0000        	call	_usart_send
2831  012c 85            	popw	x
2832                     ; 146 		itoa(in_pwm, &buff2[0], 10);
2834  012d ae000a        	ldw	x,#10
2835  0130 89            	pushw	x
2836  0131 ae0000        	ldw	x,#_buff2
2837  0134 89            	pushw	x
2838  0135 be00          	ldw	x,_in_pwm
2839  0137 ad48          	call	_itoa
2841  0139 5b04          	addw	sp,#4
2842                     ; 147 		usart_send(&buff2[0], 5);
2844  013b ae0005        	ldw	x,#5
2845  013e 89            	pushw	x
2846  013f ae0000        	ldw	x,#_buff2
2847  0142 cd0000        	call	_usart_send
2849  0145 85            	popw	x
2850  0146               L1261:
2851                     ; 150 	if (!increasing)
2853  0146 3d00          	tnz	_increasing
2854  0148 2614          	jrne	L7261
2855                     ; 152 		timval -= step;
2857  014a 1e01          	ldw	x,(OFST-1,sp)
2858  014c 72b00000      	subw	x,_step
2859  0150 1f01          	ldw	(OFST-1,sp),x
2860                     ; 153 		if (timval <= bot_val)
2862  0152 1e01          	ldw	x,(OFST-1,sp)
2863  0154 b300          	cpw	x,_bot_val
2864  0156 2216          	jrugt	L3361
2865                     ; 155 			increasing = 1;
2867  0158 35010000      	mov	_increasing,#1
2868  015c 2010          	jra	L3361
2869  015e               L7261:
2870                     ; 158 		timval += step;
2872  015e 1e01          	ldw	x,(OFST-1,sp)
2873  0160 72bb0000      	addw	x,_step
2874  0164 1f01          	ldw	(OFST-1,sp),x
2875                     ; 159 		if (timval >= top_val)
2877  0166 1e01          	ldw	x,(OFST-1,sp)
2878  0168 b300          	cpw	x,_top_val
2879  016a 2502          	jrult	L3361
2880                     ; 161 			increasing = 0;
2882  016c 3f00          	clr	_increasing
2883  016e               L3361:
2884                     ; 164 	TIM2_CCR3H = timval >> 8;
2886  016e 7b01          	ld	a,(OFST-1,sp)
2887  0170 c75315        	ld	_TIM2_CCR3H,a
2888                     ; 165 	TIM2_CCR3L = timval & 0xFF;
2890  0173 7b02          	ld	a,(OFST+0,sp)
2891  0175 a4ff          	and	a,#255
2892  0177 c75316        	ld	_TIM2_CCR3L,a
2893                     ; 169 }
2896  017a 85            	popw	x
2897  017b 81            	ret
2921                     ; 170 void timer2_overflow (void)
2921                     ; 171 {
2922                     	switch	.text
2923  017c               _timer2_overflow:
2927                     ; 172 	TIM2_SR1 &= ~TIM2_SR1_UIF;
2929  017c 72115304      	bres	_TIM2_SR1,#0
2930                     ; 173 	return;
2933  0180 81            	ret
3043                     ; 176 char *itoa(int value, char *sp, int radix)
3043                     ; 177 {
3044                     	switch	.text
3045  0181               _itoa:
3047  0181 89            	pushw	x
3048  0182 521a          	subw	sp,#26
3049       0000001a      OFST:	set	26
3052                     ; 179     char *tp = tmp;
3054  0184 96            	ldw	x,sp
3055  0185 1c0005        	addw	x,#OFST-21
3056  0188 1f19          	ldw	(OFST-1,sp),x
3057                     ; 184     int sign = (radix == 10 && value < 0);    
3059  018a 1e21          	ldw	x,(OFST+7,sp)
3060  018c a3000a        	cpw	x,#10
3061  018f 260a          	jrne	L43
3062  0191 9c            	rvf
3063  0192 1e1b          	ldw	x,(OFST+1,sp)
3064  0194 2e05          	jrsge	L43
3065  0196 ae0001        	ldw	x,#1
3066  0199 2001          	jra	L63
3067  019b               L43:
3068  019b 5f            	clrw	x
3069  019c               L63:
3070  019c 1f03          	ldw	(OFST-23,sp),x
3071                     ; 185     if (sign)
3073  019e 1e03          	ldw	x,(OFST-23,sp)
3074  01a0 2707          	jreq	L5271
3075                     ; 186         v = -value;
3077  01a2 1e1b          	ldw	x,(OFST+1,sp)
3078  01a4 50            	negw	x
3079  01a5 1f17          	ldw	(OFST-3,sp),x
3081  01a7 203d          	jra	L3371
3082  01a9               L5271:
3083                     ; 188         v = (unsigned)value;
3085  01a9 1e1b          	ldw	x,(OFST+1,sp)
3086  01ab 1f17          	ldw	(OFST-3,sp),x
3087  01ad 2037          	jra	L3371
3088  01af               L1371:
3089                     ; 192         i = v % radix;
3091  01af 1e17          	ldw	x,(OFST-3,sp)
3092  01b1 1621          	ldw	y,(OFST+7,sp)
3093  01b3 65            	divw	x,y
3094  01b4 51            	exgw	x,y
3095  01b5 1f15          	ldw	(OFST-5,sp),x
3096                     ; 193         v /= radix; // v/=radix uses less CPU clocks than v=v/radix does
3098  01b7 1e17          	ldw	x,(OFST-3,sp)
3099  01b9 1621          	ldw	y,(OFST+7,sp)
3100  01bb 65            	divw	x,y
3101  01bc 1f17          	ldw	(OFST-3,sp),x
3102                     ; 194         if (i < 10)
3104  01be 9c            	rvf
3105  01bf 1e15          	ldw	x,(OFST-5,sp)
3106  01c1 a3000a        	cpw	x,#10
3107  01c4 2e11          	jrsge	L7371
3108                     ; 195           *tp++ = i+'0';
3110  01c6 7b16          	ld	a,(OFST-4,sp)
3111  01c8 ab30          	add	a,#48
3112  01ca 1e19          	ldw	x,(OFST-1,sp)
3113  01cc 1c0001        	addw	x,#1
3114  01cf 1f19          	ldw	(OFST-1,sp),x
3115  01d1 1d0001        	subw	x,#1
3116  01d4 f7            	ld	(x),a
3118  01d5 200f          	jra	L3371
3119  01d7               L7371:
3120                     ; 197           *tp++ = i + 'a' - 10;
3122  01d7 7b16          	ld	a,(OFST-4,sp)
3123  01d9 ab57          	add	a,#87
3124  01db 1e19          	ldw	x,(OFST-1,sp)
3125  01dd 1c0001        	addw	x,#1
3126  01e0 1f19          	ldw	(OFST-1,sp),x
3127  01e2 1d0001        	subw	x,#1
3128  01e5 f7            	ld	(x),a
3129  01e6               L3371:
3130                     ; 190     while (v || tp == tmp)
3132  01e6 1e17          	ldw	x,(OFST-3,sp)
3133  01e8 26c5          	jrne	L1371
3135  01ea 96            	ldw	x,sp
3136  01eb 1c0005        	addw	x,#OFST-21
3137  01ee bf00          	ldw	c_x,x
3138  01f0 1e19          	ldw	x,(OFST-1,sp)
3139  01f2 b300          	cpw	x,c_x
3140  01f4 27b9          	jreq	L1371
3141                     ; 200     len = tp - tmp;
3143  01f6 96            	ldw	x,sp
3144  01f7 1c0005        	addw	x,#OFST-21
3145  01fa 1f01          	ldw	(OFST-25,sp),x
3146  01fc 1e19          	ldw	x,(OFST-1,sp)
3147  01fe 72f001        	subw	x,(OFST-25,sp)
3148  0201 1f17          	ldw	(OFST-3,sp),x
3149                     ; 202     if (sign) 
3151  0203 1e03          	ldw	x,(OFST-23,sp)
3152  0205 272c          	jreq	L7471
3153                     ; 204         *sp++ = '-';
3155  0207 1e1f          	ldw	x,(OFST+5,sp)
3156  0209 1c0001        	addw	x,#1
3157  020c 1f1f          	ldw	(OFST+5,sp),x
3158  020e 1d0001        	subw	x,#1
3159  0211 a62d          	ld	a,#45
3160  0213 f7            	ld	(x),a
3161                     ; 205         len++;
3163  0214 1e17          	ldw	x,(OFST-3,sp)
3164  0216 1c0001        	addw	x,#1
3165  0219 1f17          	ldw	(OFST-3,sp),x
3166  021b 2016          	jra	L7471
3167  021d               L5471:
3168                     ; 209         *sp++ = *--tp;
3170  021d 0d1a          	tnz	(OFST+0,sp)
3171  021f 2602          	jrne	L04
3172  0221 0a19          	dec	(OFST-1,sp)
3173  0223               L04:
3174  0223 0a1a          	dec	(OFST+0,sp)
3175  0225 1e19          	ldw	x,(OFST-1,sp)
3176  0227 f6            	ld	a,(x)
3177  0228 1e1f          	ldw	x,(OFST+5,sp)
3178  022a 1c0001        	addw	x,#1
3179  022d 1f1f          	ldw	(OFST+5,sp),x
3180  022f 1d0001        	subw	x,#1
3181  0232 f7            	ld	(x),a
3182  0233               L7471:
3183                     ; 208     while (tp > tmp)
3185  0233 96            	ldw	x,sp
3186  0234 1c0005        	addw	x,#OFST-21
3187  0237 bf00          	ldw	c_x,x
3188  0239 1e19          	ldw	x,(OFST-1,sp)
3189  023b b300          	cpw	x,c_x
3190  023d 22de          	jrugt	L5471
3191                     ; 211     return sp;
3193  023f 1e1f          	ldw	x,(OFST+5,sp)
3196  0241 5b1c          	addw	sp,#28
3197  0243 81            	ret
3210                     	xdef	_timer2_overflow
3211                     	xdef	_timer1_trigger
3212                     	xdef	_timer1_capture2
3213                     	xdef	_timer4_start
3214                     	xdef	_timer4_setup
3215                     	xref.b	_usart_counter
3216                     	xref.b	_buff2
3217                     	xref.b	_buff
3218                     	xref.b	_in_pwm
3219                     	xref.b	_increasing
3220                     	xref.b	_step
3221                     	xref.b	_bot_val
3222                     	xref.b	_top_val
3223                     	xdef	_itoa
3224                     	xref	_usart_send
3225                     	xdef	_timer2_compare3
3226                     	xdef	_timer1_capture1
3227                     	xdef	_timer1_start
3228                     	xdef	_timer2_start
3229                     	xdef	_timer2_setup
3230                     	xdef	_timer1_setup
3231                     .const:	section	.text
3232  0000               L5261:
3233  0000 202020494e3a  	dc.b	"   IN: ",0
3234  0008               L3261:
3235  0008 0a4f55543a20  	dc.b	10,79,85,84,58,32,0
3236                     	xref.b	c_x
3256                     	end
