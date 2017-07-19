   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
2212                     ; 35 void set_position(uint16_t val)
2212                     ; 36 {
2214                     	switch	.text
2215  0000               _set_position:
2219                     ; 37 TIM2_CCR3H = val >> 8;
2221  0000 9e            	ld	a,xh
2222  0001 c75315        	ld	_TIM2_CCR3H,a
2223                     ; 38 	TIM2_CCR3L = val & 0xFF;
2225  0004 9f            	ld	a,xl
2226  0005 a4ff          	and	a,#255
2227  0007 c75316        	ld	_TIM2_CCR3L,a
2228                     ; 39 }
2231  000a 81            	ret
2283                     ; 41 void timer1_setup(uint16_t prescaler, uint16_t top)
2283                     ; 42 {
2284                     	switch	.text
2285  000b               _timer1_setup:
2287  000b 89            	pushw	x
2288       00000000      OFST:	set	0
2291                     ; 43 	TIM1_ARRH = (top >> 8);
2293  000c 7b05          	ld	a,(OFST+5,sp)
2294  000e c75262        	ld	_TIM1_ARRH,a
2295                     ; 44 	TIM1_ARRL = top & 0xFF;
2297  0011 7b06          	ld	a,(OFST+6,sp)
2298  0013 a4ff          	and	a,#255
2299  0015 c75263        	ld	_TIM1_ARRL,a
2300                     ; 45 	TIM1_PSCRH = prescaler >> 8; // clock/5
2302  0018 9e            	ld	a,xh
2303  0019 c75260        	ld	_TIM1_PSCRH,a
2304                     ; 46 	TIM1_PSCRL = prescaler & 0xFF;
2306  001c 9f            	ld	a,xl
2307  001d a4ff          	and	a,#255
2308  001f c75261        	ld	_TIM1_PSCRL,a
2309                     ; 49 	TIM1_CCMR1 = (1 << 0);
2311  0022 35015258      	mov	_TIM1_CCMR1,#1
2312                     ; 50 	TIM1_CCMR1 |= (4 << 4);	//filter
2314  0026 721c5258      	bset	_TIM1_CCMR1,#6
2315                     ; 52 	TIM1_CCER1 |= (0 << 1);	//rising edge
2317  002a c6525c        	ld	a,_TIM1_CCER1
2318                     ; 53 	TIM1_CCER1 |= (1 << 0);	//1 ch enable
2320  002d 7210525c      	bset	_TIM1_CCER1,#0
2321                     ; 55 	TIM1_CCMR2 = (2	<< 0);	//falling edge
2323  0031 35025259      	mov	_TIM1_CCMR2,#2
2324                     ; 56 	TIM1_CCMR2 |= (4 << 4);	//filter
2326  0035 721c5259      	bset	_TIM1_CCMR2,#6
2327                     ; 57 	TIM1_CCER1 |= (1 << 5); //2 ch polaryty
2329  0039 721a525c      	bset	_TIM1_CCER1,#5
2330                     ; 58 	TIM1_CCER1 |= (1 << 4);	//2 ch enable
2332  003d 7218525c      	bset	_TIM1_CCER1,#4
2333                     ; 59 	TIM1_SMCR = (5 << 4) | (4 << 0);
2335  0041 35545252      	mov	_TIM1_SMCR,#84
2336                     ; 60 	TIM1_IER = (1 << 1) | (1 << 2);
2338  0045 35065254      	mov	_TIM1_IER,#6
2339                     ; 61 }
2342  0049 85            	popw	x
2343  004a 81            	ret
2394                     ; 64 void timer2_setup(uint8_t prescaler, uint16_t top)
2394                     ; 65 {
2395                     	switch	.text
2396  004b               _timer2_setup:
2398  004b 88            	push	a
2399       00000000      OFST:	set	0
2402                     ; 66 	TIM2_ARRH = (top >> 8);
2404  004c 7b04          	ld	a,(OFST+4,sp)
2405  004e c7530f        	ld	_TIM2_ARRH,a
2406                     ; 67 	TIM2_ARRL = top & 0xFF;
2408  0051 7b05          	ld	a,(OFST+5,sp)
2409  0053 a4ff          	and	a,#255
2410  0055 c75310        	ld	_TIM2_ARRL,a
2411                     ; 68 	TIM2_CCR3H = 3000 >> 8;
2413  0058 350b5315      	mov	_TIM2_CCR3H,#11
2414                     ; 69 	TIM2_CCR3L = 3000 & 0xFF;
2416  005c 35b85316      	mov	_TIM2_CCR3L,#184
2417                     ; 70 	TIM2_PSCR = prescaler; // clock/8
2419  0060 7b01          	ld	a,(OFST+1,sp)
2420  0062 c7530e        	ld	_TIM2_PSCR,a
2421                     ; 71 	TIM2_CCMR3 = (6 << 4) | (1 << 3); //PWM and preload buffer
2423  0065 35685309      	mov	_TIM2_CCMR3,#104
2424                     ; 72 	TIM2_CCER2 = 1;
2426  0069 3501530b      	mov	_TIM2_CCER2,#1
2427                     ; 73 	TIM2_IER |= (1 << 0);
2429  006d 72105303      	bset	_TIM2_IER,#0
2430                     ; 74 	TIM2_IER |= (1 << 3);
2432  0071 72165303      	bset	_TIM2_IER,#3
2433                     ; 75 }
2436  0075 84            	pop	a
2437  0076 81            	ret
2464                     ; 78 void timer4_setup(void)
2464                     ; 79 {
2465                     	switch	.text
2466  0077               _timer4_setup:
2470                     ; 80 	TIM4_ARR = 249;
2472  0077 35f95348      	mov	_TIM4_ARR,#249
2473                     ; 81 	TIM4_CR1 = 1 << 7;
2475  007b 35805340      	mov	_TIM4_CR1,#128
2476                     ; 82 	TIM4_IER = 1;
2478  007f 35015343      	mov	_TIM4_IER,#1
2479                     ; 83 	TIM4_PSCR = 7;	
2481  0083 35075347      	mov	_TIM4_PSCR,#7
2482                     ; 84 }
2485  0087 81            	ret
2509                     ; 86 void timer1_start(void)
2509                     ; 87 {
2510                     	switch	.text
2511  0088               _timer1_start:
2515                     ; 88 	TIM1_CR1 |= TIM1_CR1_CEN;
2517  0088 72105250      	bset	_TIM1_CR1,#0
2518                     ; 89 }
2521  008c 81            	ret
2545                     ; 91 void timer2_start(void)
2545                     ; 92 {
2546                     	switch	.text
2547  008d               _timer2_start:
2551                     ; 93 	TIM2_CR1 |= TIM2_CR1_CEN;
2553  008d 72105300      	bset	_TIM2_CR1,#0
2554                     ; 94 }
2557  0091 81            	ret
2593                     ; 95 void timer4_start(uint16_t cycles)
2593                     ; 96 {
2594                     	switch	.text
2595  0092               _timer4_start:
2599                     ; 97 	tim4_cycles = cycles;
2601  0092 bf00          	ldw	_tim4_cycles,x
2602                     ; 98 	TIM4_CR1 |= TIM4_CR1_CEN;
2604  0094 72105340      	bset	_TIM4_CR1,#0
2605                     ; 99 }
2608  0098 81            	ret
2632                     ; 101 void timer4_stop (void)
2632                     ; 102 {
2633                     	switch	.text
2634  0099               _timer4_stop:
2638                     ; 103 	TIM4_CR1 &= ~TIM4_CR1_CEN;
2640  0099 72115340      	bres	_TIM4_CR1,#0
2641                     ; 104 }
2644  009d 81            	ret
2677                     ; 106 void timer4_overflow(void)
2677                     ; 107 {
2678                     	switch	.text
2679  009e               _timer4_overflow:
2683                     ; 108 	TIM4_SR &= ~TIM4_SR1_UIF;
2685  009e 72115344      	bres	_TIM4_SR,#0
2686                     ; 109 	if (--tim4_cycles == 0)
2688  00a2 be00          	ldw	x,_tim4_cycles
2689  00a4 1d0001        	subw	x,#1
2690  00a7 bf00          	ldw	_tim4_cycles,x
2691  00a9 2703          	jreq	L62
2692  00ab cc015e        	jp	L1061
2693  00ae               L62:
2694                     ; 111 		if(buttons_status == TOP_RELEASED | buttons_status == BOT_RELEASED)
2696  00ae b600          	ld	a,_buttons_status
2697  00b0 a102          	cp	a,#2
2698  00b2 2706          	jreq	L5061
2700  00b4 b600          	ld	a,_buttons_status
2701  00b6 a104          	cp	a,#4
2702  00b8 2611          	jrne	L3061
2703  00ba               L5061:
2704                     ; 113 			if (in_pwm < med_in_val)
2706  00ba be00          	ldw	x,_in_pwm
2707  00bc b300          	cpw	x,_med_in_val
2708  00be 2405          	jruge	L7061
2709                     ; 114 			set_position(med_val);
2711  00c0 be00          	ldw	x,_med_val
2712  00c2 cd0000        	call	_set_position
2714  00c5               L7061:
2715                     ; 115 			buttons_status = 0;
2717  00c5 3f00          	clr	_buttons_status
2719  00c7 ac5e015e      	jpf	L1061
2720  00cb               L3061:
2721                     ; 118 		else if (buttons_status == TOP_PRESSED)
2723  00cb b600          	ld	a,_buttons_status
2724  00cd a101          	cp	a,#1
2725  00cf 263e          	jrne	L3161
2726                     ; 120 			tim4_cycles = 150;
2728  00d1 ae0096        	ldw	x,#150
2729  00d4 bf00          	ldw	_tim4_cycles,x
2730                     ; 121 			if (in_pwm < med_in_val){
2732  00d6 be00          	ldw	x,_in_pwm
2733  00d8 b300          	cpw	x,_med_in_val
2734  00da 241c          	jruge	L5161
2735                     ; 122 				if (top_val < AMP_MAX){
2737  00dc be00          	ldw	x,_top_val
2738  00de a31388        	cpw	x,#5000
2739  00e1 247b          	jruge	L1061
2740                     ; 123 				top_val += AMP_STEP;
2742  00e3 be00          	ldw	x,_top_val
2743  00e5 1c0028        	addw	x,#40
2744  00e8 bf00          	ldw	_top_val,x
2745                     ; 124 				bot_val -= AMP_STEP;
2747  00ea be00          	ldw	x,_bot_val
2748  00ec 1d0028        	subw	x,#40
2749  00ef bf00          	ldw	_bot_val,x
2750                     ; 125 				set_position(top_val);
2752  00f1 be00          	ldw	x,_top_val
2753  00f3 cd0000        	call	_set_position
2755  00f6 2066          	jra	L1061
2756  00f8               L5161:
2757                     ; 128 					if (divider > 1){
2759  00f8 be00          	ldw	x,_divider
2760  00fa a30002        	cpw	x,#2
2761  00fd 255f          	jrult	L1061
2762                     ; 129 						divider--;
2764  00ff be00          	ldw	x,_divider
2765  0101 1d0001        	subw	x,#1
2766  0104 bf00          	ldw	_divider,x
2767                     ; 130 						divider--;
2769  0106 be00          	ldw	x,_divider
2770  0108 1d0001        	subw	x,#1
2771  010b bf00          	ldw	_divider,x
2772  010d 204f          	jra	L1061
2773  010f               L3161:
2774                     ; 133 		}else if (buttons_status == BOT_PRESSED)
2776  010f b600          	ld	a,_buttons_status
2777  0111 a103          	cp	a,#3
2778  0113 263e          	jrne	L7261
2779                     ; 135 			tim4_cycles = 150;
2781  0115 ae0096        	ldw	x,#150
2782  0118 bf00          	ldw	_tim4_cycles,x
2783                     ; 136 				if (in_pwm < med_in_val)
2785  011a be00          	ldw	x,_in_pwm
2786  011c b300          	cpw	x,_med_in_val
2787  011e 241c          	jruge	L1361
2788                     ; 138 				if (top_val > AMP_MIN)
2790  0120 be00          	ldw	x,_top_val
2791  0122 a303e9        	cpw	x,#1001
2792  0125 2537          	jrult	L1061
2793                     ; 140 				top_val -= AMP_STEP;
2795  0127 be00          	ldw	x,_top_val
2796  0129 1d0028        	subw	x,#40
2797  012c bf00          	ldw	_top_val,x
2798                     ; 141 				bot_val += AMP_STEP;
2800  012e be00          	ldw	x,_bot_val
2801  0130 1c0028        	addw	x,#40
2802  0133 bf00          	ldw	_bot_val,x
2803                     ; 142 				set_position(top_val);
2805  0135 be00          	ldw	x,_top_val
2806  0137 cd0000        	call	_set_position
2808  013a 2022          	jra	L1061
2809  013c               L1361:
2810                     ; 145 				if (divider < DIVIDER_MAX){
2812  013c be00          	ldw	x,_divider
2813  013e a300c8        	cpw	x,#200
2814  0141 241b          	jruge	L1061
2815                     ; 146 						divider++;
2817  0143 be00          	ldw	x,_divider
2818  0145 1c0001        	addw	x,#1
2819  0148 bf00          	ldw	_divider,x
2820                     ; 147 						divider++;
2822  014a be00          	ldw	x,_divider
2823  014c 1c0001        	addw	x,#1
2824  014f bf00          	ldw	_divider,x
2825  0151 200b          	jra	L1061
2826  0153               L7261:
2827                     ; 150 		}else if (buttons_status == BOTH_PRESSED)
2829  0153 b600          	ld	a,_buttons_status
2830  0155 a105          	cp	a,#5
2831  0157 2605          	jrne	L1061
2832                     ; 152 			set_position(top_val);
2834  0159 be00          	ldw	x,_top_val
2835  015b cd0000        	call	_set_position
2837  015e               L1061:
2838                     ; 157 }
2841  015e 81            	ret
2882                     ; 158 void timer1_capture1(void)
2882                     ; 159 {
2883                     	switch	.text
2884  015f               _timer1_capture1:
2888                     ; 161 	if ((TIM1_SR1 & TIM1_SR1_CC1IF))
2890  015f c65255        	ld	a,_TIM1_SR1
2891  0162 a502          	bcp	a,#2
2892  0164 2708          	jreq	L5561
2893                     ; 163 			TIM1_SR1 &= ~TIM1_SR1_CC1IF;
2895  0166 72135255      	bres	_TIM1_SR1,#1
2897  016a ac600260      	jpf	L7561
2898  016e               L5561:
2899                     ; 164 	}else if ((TIM1_SR1 & TIM1_SR1_CC2IF))
2901  016e c65255        	ld	a,_TIM1_SR1
2902  0171 a504          	bcp	a,#4
2903  0173 2603          	jrne	L23
2904  0175 cc0260        	jp	L7561
2905  0178               L23:
2906                     ; 166 	TIM1_SR1 &= ~TIM1_SR1_CC2IF;
2908  0178 72155255      	bres	_TIM1_SR1,#2
2909                     ; 167 		in_pwm = TIM1_CCR2H << 8;
2911  017c c65267        	ld	a,_TIM1_CCR2H
2912  017f 5f            	clrw	x
2913  0180 97            	ld	xl,a
2914  0181 4f            	clr	a
2915  0182 02            	rlwa	x,a
2916  0183 bf00          	ldw	_in_pwm,x
2917                     ; 168 	in_pwm |= TIM1_CCR2L & 0xFF;
2919  0185 c65268        	ld	a,_TIM1_CCR2L
2920  0188 5f            	clrw	x
2921  0189 97            	ld	xl,a
2922  018a 01            	rrwa	x,a
2923  018b ba01          	or	a,_in_pwm+1
2924  018d 01            	rrwa	x,a
2925  018e ba00          	or	a,_in_pwm
2926  0190 01            	rrwa	x,a
2927  0191 bf00          	ldw	_in_pwm,x
2928                     ; 169 	if (startup == 0)
2930  0193 3d00          	tnz	_startup
2931  0195 2609          	jrne	L3661
2932                     ; 171 		calculate(in_pwm);
2934  0197 be00          	ldw	x,_in_pwm
2935  0199 cd0000        	call	_calculate
2938  019c ac600260      	jpf	L7561
2939  01a0               L3661:
2940                     ; 173 		else if (startup == 100)
2942  01a0 b600          	ld	a,_startup
2943  01a2 a164          	cp	a,#100
2944  01a4 2612          	jrne	L7661
2945                     ; 175 				if (in_pwm > med_in_val)
2947  01a6 be00          	ldw	x,_in_pwm
2948  01a8 b300          	cpw	x,_med_in_val
2949  01aa 2306          	jrule	L1761
2950                     ; 177 					startup--;
2952  01ac 3a00          	dec	_startup
2954  01ae ac600260      	jpf	L7561
2955  01b2               L1761:
2956                     ; 180 					startup = 0;
2958  01b2 3f00          	clr	_startup
2959  01b4 ac600260      	jpf	L7561
2960  01b8               L7661:
2961                     ; 182 		}else if ((startup > 50) && (startup < 100)){
2963  01b8 b600          	ld	a,_startup
2964  01ba a133          	cp	a,#51
2965  01bc 250c          	jrult	L7761
2967  01be b600          	ld	a,_startup
2968  01c0 a164          	cp	a,#100
2969  01c2 2406          	jruge	L7761
2970                     ; 183 		startup--;
2972  01c4 3a00          	dec	_startup
2974  01c6 ac600260      	jpf	L7561
2975  01ca               L7761:
2976                     ; 184 		}else if (startup == 50)
2978  01ca b600          	ld	a,_startup
2979  01cc a132          	cp	a,#50
2980  01ce 2614          	jrne	L3071
2981                     ; 186 			TIM2_CCR3H = top_val >> 8;
2983  01d0 5500005315    	mov	_TIM2_CCR3H,_top_val
2984                     ; 187 			TIM2_CCR3L = top_val & 0xFF;
2986  01d5 b601          	ld	a,_top_val+1
2987  01d7 a4ff          	and	a,#255
2988  01d9 c75316        	ld	_TIM2_CCR3L,a
2989                     ; 188 			top_in_val = in_pwm;
2991  01dc be00          	ldw	x,_in_pwm
2992  01de bf00          	ldw	_top_in_val,x
2993                     ; 189 			startup--;
2995  01e0 3a00          	dec	_startup
2997  01e2 207c          	jpf	L7561
2998  01e4               L3071:
2999                     ; 190 		}else if(startup == 49){
3001  01e4 b600          	ld	a,_startup
3002  01e6 a131          	cp	a,#49
3003  01e8 260a          	jrne	L7071
3004                     ; 191 					if (in_pwm < med_in_val)
3006  01ea be00          	ldw	x,_in_pwm
3007  01ec b300          	cpw	x,_med_in_val
3008  01ee 2470          	jruge	L7561
3009                     ; 193 						startup--;
3011  01f0 3a00          	dec	_startup
3012  01f2 206c          	jra	L7561
3013  01f4               L7071:
3014                     ; 195 			}else if ((startup > 1) && (startup < 49))
3016  01f4 b600          	ld	a,_startup
3017  01f6 a102          	cp	a,#2
3018  01f8 250a          	jrult	L5171
3020  01fa b600          	ld	a,_startup
3021  01fc a131          	cp	a,#49
3022  01fe 2404          	jruge	L5171
3023                     ; 197 				startup--;
3025  0200 3a00          	dec	_startup
3027  0202 205c          	jra	L7561
3028  0204               L5171:
3029                     ; 198 			}else if (startup == 1)
3031  0204 b600          	ld	a,_startup
3032  0206 a101          	cp	a,#1
3033  0208 2656          	jrne	L7561
3034                     ; 200 				startup = 0;
3036  020a 3f00          	clr	_startup
3037                     ; 201 				bot_in_val = in_pwm;
3039  020c be00          	ldw	x,_in_pwm
3040  020e bf00          	ldw	_bot_in_val,x
3041                     ; 202 				FLASH_DUKR = 0xAE;
3043  0210 35ae5064      	mov	_FLASH_DUKR,#174
3044                     ; 203 				FLASH_DUKR = 0x56;
3046  0214 35565064      	mov	_FLASH_DUKR,#86
3047                     ; 204 				ee_top_in_val_h = top_in_val >> 8;
3049  0218 be00          	ldw	x,_top_in_val
3050  021a 4f            	clr	a
3051  021b 01            	rrwa	x,a
3052  021c 89            	pushw	x
3053  021d ae0000        	ldw	x,#_ee_top_in_val_h
3054  0220 cd0000        	call	c_eewrw
3056  0223 85            	popw	x
3057                     ; 205 				ee_top_in_val_l = top_in_val & 0xFF;
3059  0224 b600          	ld	a,_top_in_val
3060  0226 97            	ld	xl,a
3061  0227 b601          	ld	a,_top_in_val+1
3062  0229 a4ff          	and	a,#255
3063  022b 5f            	clrw	x
3064  022c 02            	rlwa	x,a
3065  022d 89            	pushw	x
3066  022e 01            	rrwa	x,a
3067  022f ae0000        	ldw	x,#_ee_top_in_val_l
3068  0232 cd0000        	call	c_eewrw
3070  0235 85            	popw	x
3071                     ; 207 				ee_bot_in_val_h = bot_in_val >> 8;
3073  0236 be00          	ldw	x,_bot_in_val
3074  0238 4f            	clr	a
3075  0239 01            	rrwa	x,a
3076  023a 89            	pushw	x
3077  023b ae0000        	ldw	x,#_ee_bot_in_val_h
3078  023e cd0000        	call	c_eewrw
3080  0241 85            	popw	x
3081                     ; 208 				ee_bot_in_val_l = bot_in_val & 0xFF;
3083  0242 b600          	ld	a,_bot_in_val
3084  0244 97            	ld	xl,a
3085  0245 b601          	ld	a,_bot_in_val+1
3086  0247 a4ff          	and	a,#255
3087  0249 5f            	clrw	x
3088  024a 02            	rlwa	x,a
3089  024b 89            	pushw	x
3090  024c 01            	rrwa	x,a
3091  024d ae0000        	ldw	x,#_ee_bot_in_val_l
3092  0250 cd0000        	call	c_eewrw
3094  0253 85            	popw	x
3095                     ; 210 				TIM2_CCR3H = med_val >> 8;
3097  0254 5500005315    	mov	_TIM2_CCR3H,_med_val
3098                     ; 211 				TIM2_CCR3L = med_val & 0xFF;
3100  0259 b601          	ld	a,_med_val+1
3101  025b a4ff          	and	a,#255
3102  025d c75316        	ld	_TIM2_CCR3L,a
3103  0260               L7561:
3104                     ; 216 }
3107  0260 81            	ret
3131                     ; 217 void timer1_capture2(void)
3131                     ; 218 {
3132                     	switch	.text
3133  0261               _timer1_capture2:
3137                     ; 220 	TIM1_SR1 &= ~TIM1_SR1_CC2IF;
3139  0261 72155255      	bres	_TIM1_SR1,#2
3140                     ; 223 }
3143  0265 81            	ret
3171                     ; 225 void timer1_trigger(void)
3171                     ; 226 {
3172                     	switch	.text
3173  0266               _timer1_trigger:
3177                     ; 227 	TIM1_SR1 &= ~TIM1_SR1_TIF;
3179  0266 721d5255      	bres	_TIM1_SR1,#6
3180                     ; 228 	if (!(PC_IDR & (1 << 6)))
3182  026a c6500b        	ld	a,_PC_IDR
3183  026d a540          	bcp	a,#64
3184  026f 261f          	jrne	L3471
3185                     ; 231 		in_pwm = TIM1_CNTRH << 8;
3187  0271 c6525e        	ld	a,_TIM1_CNTRH
3188  0274 5f            	clrw	x
3189  0275 97            	ld	xl,a
3190  0276 4f            	clr	a
3191  0277 02            	rlwa	x,a
3192  0278 bf00          	ldw	_in_pwm,x
3193                     ; 232 		in_pwm |= TIM1_CNTRL & 0xFF;
3195  027a c6525f        	ld	a,_TIM1_CNTRL
3196  027d 5f            	clrw	x
3197  027e 97            	ld	xl,a
3198  027f 01            	rrwa	x,a
3199  0280 ba01          	or	a,_in_pwm+1
3200  0282 01            	rrwa	x,a
3201  0283 ba00          	or	a,_in_pwm
3202  0285 01            	rrwa	x,a
3203  0286 bf00          	ldw	_in_pwm,x
3204                     ; 234 		TIM1_CNTRH = 0;
3206  0288 725f525e      	clr	_TIM1_CNTRH
3207                     ; 235 		TIM1_CNTRL = 0;
3209  028c 725f525f      	clr	_TIM1_CNTRL
3210  0290               L3471:
3211                     ; 238 }
3214  0290 81            	ret
3261                     ; 239 void timer2_compare3(void)
3261                     ; 240 {
3262                     	switch	.text
3263  0291               _timer2_compare3:
3265  0291 89            	pushw	x
3266       00000002      OFST:	set	2
3269                     ; 242 	TIM2_SR1 &= ~TIM2_SR1_CC3IF;
3271  0292 72175304      	bres	_TIM2_SR1,#3
3272                     ; 243 	timval = TIM2_CCR3H << 8;
3274  0296 c65315        	ld	a,_TIM2_CCR3H
3275  0299 5f            	clrw	x
3276  029a 97            	ld	xl,a
3277  029b 4f            	clr	a
3278  029c 02            	rlwa	x,a
3279  029d 1f01          	ldw	(OFST-1,sp),x
3280                     ; 244 	timval |= TIM2_CCR3L & 0xFF;
3282  029f c65316        	ld	a,_TIM2_CCR3L
3283  02a2 5f            	clrw	x
3284  02a3 97            	ld	xl,a
3285  02a4 01            	rrwa	x,a
3286  02a5 1a02          	or	a,(OFST+0,sp)
3287  02a7 01            	rrwa	x,a
3288  02a8 1a01          	or	a,(OFST-1,sp)
3289  02aa 01            	rrwa	x,a
3290  02ab 1f01          	ldw	(OFST-1,sp),x
3291                     ; 246 if (usart_counter++ == 3)
3293  02ad b600          	ld	a,_usart_counter
3294  02af 3c00          	inc	_usart_counter
3295  02b1 a103          	cp	a,#3
3296  02b3 264a          	jrne	L3671
3297                     ; 248 		usart_counter = 0;
3299  02b5 3f00          	clr	_usart_counter
3300                     ; 249 		usart_send("\nOUT: ", 6);
3302  02b7 ae0006        	ldw	x,#6
3303  02ba 89            	pushw	x
3304  02bb ae0008        	ldw	x,#L5671
3305  02be cd0000        	call	_usart_send
3307  02c1 85            	popw	x
3308                     ; 251 	itoa(timval, &buff[0], 10);
3310  02c2 ae000a        	ldw	x,#10
3311  02c5 89            	pushw	x
3312  02c6 ae0000        	ldw	x,#_buff
3313  02c9 89            	pushw	x
3314  02ca 1e05          	ldw	x,(OFST+3,sp)
3315  02cc ad6c          	call	_itoa
3317  02ce 5b04          	addw	sp,#4
3318                     ; 252 		usart_send(&buff[0], 5);
3320  02d0 ae0005        	ldw	x,#5
3321  02d3 89            	pushw	x
3322  02d4 ae0000        	ldw	x,#_buff
3323  02d7 cd0000        	call	_usart_send
3325  02da 85            	popw	x
3326                     ; 254 		usart_send("   IN: ", 7);
3328  02db ae0007        	ldw	x,#7
3329  02de 89            	pushw	x
3330  02df ae0000        	ldw	x,#L7671
3331  02e2 cd0000        	call	_usart_send
3333  02e5 85            	popw	x
3334                     ; 255 		itoa(in_pwm, &buff2[0], 10);
3336  02e6 ae000a        	ldw	x,#10
3337  02e9 89            	pushw	x
3338  02ea ae0000        	ldw	x,#_buff2
3339  02ed 89            	pushw	x
3340  02ee be00          	ldw	x,_in_pwm
3341  02f0 ad48          	call	_itoa
3343  02f2 5b04          	addw	sp,#4
3344                     ; 256 		usart_send(&buff2[0], 5);
3346  02f4 ae0005        	ldw	x,#5
3347  02f7 89            	pushw	x
3348  02f8 ae0000        	ldw	x,#_buff2
3349  02fb cd0000        	call	_usart_send
3351  02fe 85            	popw	x
3352  02ff               L3671:
3353                     ; 259 	if (!increasing)
3355  02ff 3d00          	tnz	_increasing
3356  0301 2614          	jrne	L1771
3357                     ; 261 		timval -= step;
3359  0303 1e01          	ldw	x,(OFST-1,sp)
3360  0305 72b00000      	subw	x,_step
3361  0309 1f01          	ldw	(OFST-1,sp),x
3362                     ; 262 		if (timval <= bot_val)
3364  030b 1e01          	ldw	x,(OFST-1,sp)
3365  030d b300          	cpw	x,_bot_val
3366  030f 2216          	jrugt	L5771
3367                     ; 264 			increasing = 1;
3369  0311 35010000      	mov	_increasing,#1
3370  0315 2010          	jra	L5771
3371  0317               L1771:
3372                     ; 267 		timval += step;
3374  0317 1e01          	ldw	x,(OFST-1,sp)
3375  0319 72bb0000      	addw	x,_step
3376  031d 1f01          	ldw	(OFST-1,sp),x
3377                     ; 268 		if (timval >= top_val)
3379  031f 1e01          	ldw	x,(OFST-1,sp)
3380  0321 b300          	cpw	x,_top_val
3381  0323 2502          	jrult	L5771
3382                     ; 270 			increasing = 0;
3384  0325 3f00          	clr	_increasing
3385  0327               L5771:
3386                     ; 273 	TIM2_CCR3H = timval >> 8;
3388  0327 7b01          	ld	a,(OFST-1,sp)
3389  0329 c75315        	ld	_TIM2_CCR3H,a
3390                     ; 274 	TIM2_CCR3L = timval & 0xFF;
3392  032c 7b02          	ld	a,(OFST+0,sp)
3393  032e a4ff          	and	a,#255
3394  0330 c75316        	ld	_TIM2_CCR3L,a
3395                     ; 278 }
3398  0333 85            	popw	x
3399  0334 81            	ret
3423                     ; 279 void timer2_overflow (void)
3423                     ; 280 {
3424                     	switch	.text
3425  0335               _timer2_overflow:
3429                     ; 281 	TIM2_SR1 &= ~TIM2_SR1_UIF;
3431  0335 72115304      	bres	_TIM2_SR1,#0
3432                     ; 282 	return;
3435  0339 81            	ret
3545                     ; 287 char *itoa(int value, char *sp, int radix)
3545                     ; 288 {
3546                     	switch	.text
3547  033a               _itoa:
3549  033a 89            	pushw	x
3550  033b 521a          	subw	sp,#26
3551       0000001a      OFST:	set	26
3554                     ; 290     char *tp = tmp;
3556  033d 96            	ldw	x,sp
3557  033e 1c0005        	addw	x,#OFST-21
3558  0341 1f19          	ldw	(OFST-1,sp),x
3559                     ; 295     int sign = (radix == 10 && value < 0);    
3561  0343 1e21          	ldw	x,(OFST+7,sp)
3562  0345 a3000a        	cpw	x,#10
3563  0348 260a          	jrne	L64
3564  034a 9c            	rvf
3565  034b 1e1b          	ldw	x,(OFST+1,sp)
3566  034d 2e05          	jrsge	L64
3567  034f ae0001        	ldw	x,#1
3568  0352 2001          	jra	L05
3569  0354               L64:
3570  0354 5f            	clrw	x
3571  0355               L05:
3572  0355 1f03          	ldw	(OFST-23,sp),x
3573                     ; 296     if (sign)
3575  0357 1e03          	ldw	x,(OFST-23,sp)
3576  0359 2707          	jreq	L7602
3577                     ; 297         v = -value;
3579  035b 1e1b          	ldw	x,(OFST+1,sp)
3580  035d 50            	negw	x
3581  035e 1f17          	ldw	(OFST-3,sp),x
3583  0360 203d          	jra	L5702
3584  0362               L7602:
3585                     ; 299         v = (unsigned)value;
3587  0362 1e1b          	ldw	x,(OFST+1,sp)
3588  0364 1f17          	ldw	(OFST-3,sp),x
3589  0366 2037          	jra	L5702
3590  0368               L3702:
3591                     ; 303         i = v % radix;
3593  0368 1e17          	ldw	x,(OFST-3,sp)
3594  036a 1621          	ldw	y,(OFST+7,sp)
3595  036c 65            	divw	x,y
3596  036d 51            	exgw	x,y
3597  036e 1f15          	ldw	(OFST-5,sp),x
3598                     ; 304         v /= radix; // v/=radix uses less CPU clocks than v=v/radix does
3600  0370 1e17          	ldw	x,(OFST-3,sp)
3601  0372 1621          	ldw	y,(OFST+7,sp)
3602  0374 65            	divw	x,y
3603  0375 1f17          	ldw	(OFST-3,sp),x
3604                     ; 305         if (i < 10)
3606  0377 9c            	rvf
3607  0378 1e15          	ldw	x,(OFST-5,sp)
3608  037a a3000a        	cpw	x,#10
3609  037d 2e11          	jrsge	L1012
3610                     ; 306           *tp++ = i+'0';
3612  037f 7b16          	ld	a,(OFST-4,sp)
3613  0381 ab30          	add	a,#48
3614  0383 1e19          	ldw	x,(OFST-1,sp)
3615  0385 1c0001        	addw	x,#1
3616  0388 1f19          	ldw	(OFST-1,sp),x
3617  038a 1d0001        	subw	x,#1
3618  038d f7            	ld	(x),a
3620  038e 200f          	jra	L5702
3621  0390               L1012:
3622                     ; 308           *tp++ = i + 'a' - 10;
3624  0390 7b16          	ld	a,(OFST-4,sp)
3625  0392 ab57          	add	a,#87
3626  0394 1e19          	ldw	x,(OFST-1,sp)
3627  0396 1c0001        	addw	x,#1
3628  0399 1f19          	ldw	(OFST-1,sp),x
3629  039b 1d0001        	subw	x,#1
3630  039e f7            	ld	(x),a
3631  039f               L5702:
3632                     ; 301     while (v || tp == tmp)
3634  039f 1e17          	ldw	x,(OFST-3,sp)
3635  03a1 26c5          	jrne	L3702
3637  03a3 96            	ldw	x,sp
3638  03a4 1c0005        	addw	x,#OFST-21
3639  03a7 bf00          	ldw	c_x,x
3640  03a9 1e19          	ldw	x,(OFST-1,sp)
3641  03ab b300          	cpw	x,c_x
3642  03ad 27b9          	jreq	L3702
3643                     ; 311     len = tp - tmp;
3645  03af 96            	ldw	x,sp
3646  03b0 1c0005        	addw	x,#OFST-21
3647  03b3 1f01          	ldw	(OFST-25,sp),x
3648  03b5 1e19          	ldw	x,(OFST-1,sp)
3649  03b7 72f001        	subw	x,(OFST-25,sp)
3650  03ba 1f17          	ldw	(OFST-3,sp),x
3651                     ; 313     if (sign) 
3653  03bc 1e03          	ldw	x,(OFST-23,sp)
3654  03be 272c          	jreq	L1112
3655                     ; 315         *sp++ = '-';
3657  03c0 1e1f          	ldw	x,(OFST+5,sp)
3658  03c2 1c0001        	addw	x,#1
3659  03c5 1f1f          	ldw	(OFST+5,sp),x
3660  03c7 1d0001        	subw	x,#1
3661  03ca a62d          	ld	a,#45
3662  03cc f7            	ld	(x),a
3663                     ; 316         len++;
3665  03cd 1e17          	ldw	x,(OFST-3,sp)
3666  03cf 1c0001        	addw	x,#1
3667  03d2 1f17          	ldw	(OFST-3,sp),x
3668  03d4 2016          	jra	L1112
3669  03d6               L7012:
3670                     ; 320         *sp++ = *--tp;
3672  03d6 0d1a          	tnz	(OFST+0,sp)
3673  03d8 2602          	jrne	L25
3674  03da 0a19          	dec	(OFST-1,sp)
3675  03dc               L25:
3676  03dc 0a1a          	dec	(OFST+0,sp)
3677  03de 1e19          	ldw	x,(OFST-1,sp)
3678  03e0 f6            	ld	a,(x)
3679  03e1 1e1f          	ldw	x,(OFST+5,sp)
3680  03e3 1c0001        	addw	x,#1
3681  03e6 1f1f          	ldw	(OFST+5,sp),x
3682  03e8 1d0001        	subw	x,#1
3683  03eb f7            	ld	(x),a
3684  03ec               L1112:
3685                     ; 319     while (tp > tmp)
3687  03ec 96            	ldw	x,sp
3688  03ed 1c0005        	addw	x,#OFST-21
3689  03f0 bf00          	ldw	c_x,x
3690  03f2 1e19          	ldw	x,(OFST-1,sp)
3691  03f4 b300          	cpw	x,c_x
3692  03f6 22de          	jrugt	L7012
3693                     ; 322     return sp;
3695  03f8 1e1f          	ldw	x,(OFST+5,sp)
3698  03fa 5b1c          	addw	sp,#28
3699  03fc 81            	ret
3712                     	xdef	_timer2_overflow
3713                     	xdef	_timer1_trigger
3714                     	xdef	_timer1_capture2
3715                     	xdef	_set_position
3716                     	xref	_ee_bot_in_val_l
3717                     	xref	_ee_bot_in_val_h
3718                     	xref	_ee_top_in_val_l
3719                     	xref	_ee_top_in_val_h
3720                     	xref	_calculate
3721                     	xref.b	_tim4_cycles
3722                     	xref.b	_bot_in_val
3723                     	xref.b	_top_in_val
3724                     	xref.b	_med_in_val
3725                     	xref.b	_med_val
3726                     	xref.b	_startup
3727                     	xref.b	_usart_counter
3728                     	xref.b	_buff2
3729                     	xref.b	_buff
3730                     	xref.b	_in_pwm
3731                     	xref.b	_increasing
3732                     	xref.b	_divider
3733                     	xref.b	_step
3734                     	xref.b	_bot_val
3735                     	xref.b	_top_val
3736                     	xref.b	_buttons_status
3737                     	xdef	_itoa
3738                     	xref	_usart_send
3739                     	xdef	_timer4_overflow
3740                     	xdef	_timer4_start
3741                     	xdef	_timer4_stop
3742                     	xdef	_timer2_compare3
3743                     	xdef	_timer1_capture1
3744                     	xdef	_timer1_start
3745                     	xdef	_timer2_start
3746                     	xdef	_timer4_setup
3747                     	xdef	_timer2_setup
3748                     	xdef	_timer1_setup
3749                     .const:	section	.text
3750  0000               L7671:
3751  0000 202020494e3a  	dc.b	"   IN: ",0
3752  0008               L5671:
3753  0008 0a4f55543a20  	dc.b	10,79,85,84,58,32,0
3754                     	xref.b	c_x
3774                     	xref	c_eewrw
3775                     	end
