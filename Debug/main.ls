   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
2172                     .eeprom:	section	.data
2173  0000               _default_top_val_h:
2174  0000 000f          	dc.w	15
2175  0002               _default_top_val_l:
2176  0002 00a0          	dc.w	160
2177  0004               _default_bot_val_h:
2178  0004 0007          	dc.w	7
2179  0006               _default_bot_val_l:
2180  0006 00d0          	dc.w	208
2181  0008               _default_top_in_val_h:
2182  0008 0019          	dc.w	25
2183  000a               _default_top_in_val_l:
2184  000a 0000          	dc.w	0
2185  000c               _default_bot_in_val_h:
2186  000c 000d          	dc.w	13
2187  000e               _default_bot_in_val_l:
2188  000e 00ac          	dc.w	172
2189  0010               _default_divider:
2190  0010 0028          	dc.w	40
2191  0012               _ee_top_val_h:
2192  0012 000f          	dc.w	15
2193  0014               _ee_top_val_l:
2194  0014 00a0          	dc.w	160
2195  0016               _ee_bot_val_h:
2196  0016 0007          	dc.w	7
2197  0018               _ee_bot_val_l:
2198  0018 00d0          	dc.w	208
2199  001a               _ee_top_in_val_h:
2200  001a 0019          	dc.w	25
2201  001c               _ee_top_in_val_l:
2202  001c 0000          	dc.w	0
2203  001e               _ee_bot_in_val_h:
2204  001e 000d          	dc.w	13
2205  0020               _ee_bot_in_val_l:
2206  0020 00ac          	dc.w	172
2207  0022               _ee_divider:
2208  0022 0029          	dc.w	41
2209                     	bsct
2210  0000               _top_val:
2211  0000 0fa0          	dc.w	4000
2212  0002               _bot_val:
2213  0002 07d0          	dc.w	2000
2214  0004               _med_val:
2215  0004 0bb8          	dc.w	3000
2216  0006               _top_in_val:
2217  0006 1900          	dc.w	6400
2218  0008               _bot_in_val:
2219  0008 0dac          	dc.w	3500
2220  000a               _step:
2221  000a 0000          	dc.w	0
2222  000c               _in_pwm:
2223  000c 0000          	dc.w	0
2224  000e               _increasing:
2225  000e 01            	dc.b	1
2226  000f               _usart_counter:
2227  000f 00            	dc.b	0
2277                     ; 78 void calculate(uint16_t width)
2277                     ; 79 {
2279                     	switch	.text
2280  0000               _calculate:
2282  0000 89            	pushw	x
2283       00000000      OFST:	set	0
2286                     ; 80 	if (width < bot_val)
2288  0001 b302          	cpw	x,_bot_val
2289  0003 2404          	jruge	L7441
2290                     ; 81 		width = bot_in_val;
2292  0005 be08          	ldw	x,_bot_in_val
2293  0007 1f01          	ldw	(OFST+1,sp),x
2294  0009               L7441:
2295                     ; 82 	if (width > top_in_val)
2297  0009 1e01          	ldw	x,(OFST+1,sp)
2298  000b b306          	cpw	x,_top_in_val
2299  000d 2304          	jrule	L1541
2300                     ; 83 		width = top_val;
2302  000f be00          	ldw	x,_top_val
2303  0011 1f01          	ldw	(OFST+1,sp),x
2304  0013               L1541:
2305                     ; 84 		if (in_pwm < (bot_in_val + 200)){
2307  0013 be08          	ldw	x,_bot_in_val
2308  0015 1c00c8        	addw	x,#200
2309  0018 b30c          	cpw	x,_in_pwm
2310  001a 230e          	jrule	L3541
2311                     ; 85 			if (buttons_status == 0)
2313  001c 3d0c          	tnz	_buttons_status
2314  001e 2605          	jrne	L5541
2315                     ; 86 				set_position(med_val);
2317  0020 be04          	ldw	x,_med_val
2318  0022 cd0000        	call	_set_position
2320  0025               L5541:
2321                     ; 88 			step = 0;
2323  0025 5f            	clrw	x
2324  0026 bf0a          	ldw	_step,x
2326  0028 200c          	jra	L7541
2327  002a               L3541:
2328                     ; 90 			step = (width - bot_in_val) / divider;
2330  002a 1e01          	ldw	x,(OFST+1,sp)
2331  002c 72b00008      	subw	x,_bot_in_val
2332  0030 90be0e        	ldw	y,_divider
2333  0033 65            	divw	x,y
2334  0034 bf0a          	ldw	_step,x
2335  0036               L7541:
2336                     ; 92 }
2339  0036 85            	popw	x
2340  0037 81            	ret
2397                     ; 93 main()
2397                     ; 94 {
2398                     	switch	.text
2399  0038               _main:
2403                     ; 96 		CLK_CKDIVR=0;                //	no dividers
2405  0038 725f50c6      	clr	_CLK_CKDIVR
2406                     ; 97 		startup = 100;
2408  003c 3564000d      	mov	_startup,#100
2409                     ; 100 		top_val = ee_top_val_l;
2411  0040 ce0014        	ldw	x,_ee_top_val_l
2412  0043 bf00          	ldw	_top_val,x
2413                     ; 101 		top_val |= ee_top_val_h << 8;
2415  0045 ce0012        	ldw	x,_ee_top_val_h
2416  0048 4f            	clr	a
2417  0049 02            	rlwa	x,a
2418  004a 01            	rrwa	x,a
2419  004b ba01          	or	a,_top_val+1
2420  004d 01            	rrwa	x,a
2421  004e ba00          	or	a,_top_val
2422  0050 01            	rrwa	x,a
2423  0051 bf00          	ldw	_top_val,x
2424                     ; 103 		bot_val = ee_bot_val_l;
2426  0053 ce0018        	ldw	x,_ee_bot_val_l
2427  0056 bf02          	ldw	_bot_val,x
2428                     ; 104 		bot_val |= ee_bot_val_h << 8;
2430  0058 ce0016        	ldw	x,_ee_bot_val_h
2431  005b 4f            	clr	a
2432  005c 02            	rlwa	x,a
2433  005d 01            	rrwa	x,a
2434  005e ba03          	or	a,_bot_val+1
2435  0060 01            	rrwa	x,a
2436  0061 ba02          	or	a,_bot_val
2437  0063 01            	rrwa	x,a
2438  0064 bf02          	ldw	_bot_val,x
2439                     ; 106 		top_in_val = ee_top_in_val_l;
2441  0066 ce001c        	ldw	x,_ee_top_in_val_l
2442  0069 bf06          	ldw	_top_in_val,x
2443                     ; 107 		top_in_val |= ee_top_in_val_h << 8;
2445  006b ce001a        	ldw	x,_ee_top_in_val_h
2446  006e 4f            	clr	a
2447  006f 02            	rlwa	x,a
2448  0070 01            	rrwa	x,a
2449  0071 ba07          	or	a,_top_in_val+1
2450  0073 01            	rrwa	x,a
2451  0074 ba06          	or	a,_top_in_val
2452  0076 01            	rrwa	x,a
2453  0077 bf06          	ldw	_top_in_val,x
2454                     ; 109 		bot_in_val = ee_bot_in_val_l;
2456  0079 ce0020        	ldw	x,_ee_bot_in_val_l
2457  007c bf08          	ldw	_bot_in_val,x
2458                     ; 110 		bot_in_val |= ee_bot_in_val_h << 8;
2460  007e ce001e        	ldw	x,_ee_bot_in_val_h
2461  0081 4f            	clr	a
2462  0082 02            	rlwa	x,a
2463  0083 01            	rrwa	x,a
2464  0084 ba09          	or	a,_bot_in_val+1
2465  0086 01            	rrwa	x,a
2466  0087 ba08          	or	a,_bot_in_val
2467  0089 01            	rrwa	x,a
2468  008a bf08          	ldw	_bot_in_val,x
2469                     ; 112 		divider = ee_divider;
2471  008c ce0022        	ldw	x,_ee_divider
2472  008f bf0e          	ldw	_divider,x
2473                     ; 113 		med_in_val = (top_in_val - bot_in_val) / 2 + bot_in_val;
2475  0091 be06          	ldw	x,_top_in_val
2476  0093 72b00008      	subw	x,_bot_in_val
2477  0097 54            	srlw	x
2478  0098 72bb0008      	addw	x,_bot_in_val
2479  009c bf10          	ldw	_med_in_val,x
2480                     ; 116 		CLK_PCKENR1=0xff;//0x8B;     //0b10001011;        //clocking for TIM1, UART1, SPI i I2C
2482  009e 35ff50c7      	mov	_CLK_PCKENR1,#255
2483                     ; 118 		PA_CR1 = 1 << 3;
2485  00a2 35085003      	mov	_PA_CR1,#8
2486                     ; 119 		PA_CR2 = 1 << 3;
2488  00a6 35085004      	mov	_PA_CR2,#8
2489                     ; 120 		PA_DDR = 1<<3;
2491  00aa 35085002      	mov	_PA_DDR,#8
2492                     ; 121 		PA_ODR = 1<<3;
2494  00ae 35085000      	mov	_PA_ODR,#8
2495                     ; 123 		PC_CR1 = 1 << 6;
2497  00b2 3540500d      	mov	_PC_CR1,#64
2498                     ; 125 		PD_CR2 = 1 << 3;
2500  00b6 35085013      	mov	_PD_CR2,#8
2501                     ; 126 		PC_CR2 = 1 << 5;
2503  00ba 3520500e      	mov	_PC_CR2,#32
2504                     ; 128 		EXTI_CR1 = (2 << 6) | (2 << 4);
2506  00be 35a050a0      	mov	_EXTI_CR1,#160
2507                     ; 138 		timer1_setup(TIM1_PRESCALER, TIM1_TOP);
2509  00c2 aefa00        	ldw	x,#64000
2510  00c5 89            	pushw	x
2511  00c6 ae0004        	ldw	x,#4
2512  00c9 cd0000        	call	_timer1_setup
2514  00cc 85            	popw	x
2515                     ; 139 		timer2_setup(TIM2_PRESCALER, TIM2_TOP);
2517  00cd ae9c40        	ldw	x,#40000
2518  00d0 89            	pushw	x
2519  00d1 a603          	ld	a,#3
2520  00d3 cd0000        	call	_timer2_setup
2522  00d6 85            	popw	x
2523                     ; 140 		timer4_setup();
2525  00d7 cd0000        	call	_timer4_setup
2527                     ; 141 		usart_setup();
2529  00da cd0000        	call	_usart_setup
2531                     ; 142 		usart_send("Hello", 5);
2533  00dd ae0005        	ldw	x,#5
2534  00e0 89            	pushw	x
2535  00e1 ae0000        	ldw	x,#L1741
2536  00e4 cd0000        	call	_usart_send
2538  00e7 85            	popw	x
2539                     ; 143 		timer2_start();
2541  00e8 cd0000        	call	_timer2_start
2543                     ; 144 		timer1_start();
2545  00eb cd0000        	call	_timer1_start
2547                     ; 145 _asm ("RIM");  //on interupts
2550  00ee 9a            RIM
2552  00ef               L3741:
2554  00ef 20fe          	jra	L3741
2881                     	xdef	_main
2882                     	xdef	_calculate
2883                     	switch	.ubsct
2884  0000               _buff2:
2885  0000 0000000000    	ds.b	5
2886                     	xdef	_buff2
2887  0005               _buff:
2888  0005 0000000000    	ds.b	5
2889                     	xdef	_buff
2890                     	xref	_set_position
2891  000a               _tim4_cycles:
2892  000a 0000          	ds.b	2
2893                     	xdef	_tim4_cycles
2894  000c               _buttons_status:
2895  000c 00            	ds.b	1
2896                     	xdef	_buttons_status
2897  000d               _startup:
2898  000d 00            	ds.b	1
2899                     	xdef	_startup
2900                     	xdef	_usart_counter
2901                     	xdef	_increasing
2902                     	xdef	_in_pwm
2903  000e               _divider:
2904  000e 0000          	ds.b	2
2905                     	xdef	_divider
2906                     	xdef	_step
2907  0010               _med_in_val:
2908  0010 0000          	ds.b	2
2909                     	xdef	_med_in_val
2910                     	xdef	_bot_in_val
2911                     	xdef	_top_in_val
2912                     	xdef	_med_val
2913                     	xdef	_bot_val
2914                     	xdef	_top_val
2915                     	xdef	_ee_divider
2916                     	xdef	_ee_bot_in_val_l
2917                     	xdef	_ee_bot_in_val_h
2918                     	xdef	_ee_top_in_val_l
2919                     	xdef	_ee_top_in_val_h
2920                     	xdef	_ee_bot_val_l
2921                     	xdef	_ee_bot_val_h
2922                     	xdef	_ee_top_val_l
2923                     	xdef	_ee_top_val_h
2924                     	xdef	_default_divider
2925                     	xdef	_default_bot_in_val_l
2926                     	xdef	_default_bot_in_val_h
2927                     	xdef	_default_top_in_val_l
2928                     	xdef	_default_top_in_val_h
2929                     	xdef	_default_bot_val_l
2930                     	xdef	_default_bot_val_h
2931                     	xdef	_default_top_val_l
2932                     	xdef	_default_top_val_h
2933                     	xref	_usart_send
2934                     	xref	_usart_setup
2935                     	xref	_timer1_start
2936                     	xref	_timer2_start
2937                     	xref	_timer4_setup
2938                     	xref	_timer2_setup
2939                     	xref	_timer1_setup
2940                     .const:	section	.text
2941  0000               L1741:
2942  0000 48656c6c6f00  	dc.b	"Hello",0
2962                     	end
