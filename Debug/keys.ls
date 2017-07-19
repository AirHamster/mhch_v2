   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
2214                     ; 29 void portc_event (void)
2214                     ; 30 {
2216                     	switch	.text
2217  0000               _portc_event:
2219  0000 89            	pushw	x
2220       00000002      OFST:	set	2
2223                     ; 31 	if ((PC_IDR & (1 << 5)) == 0)
2225  0001 c6500b        	ld	a,_PC_IDR
2226  0004 a520          	bcp	a,#32
2227  0006 2621          	jrne	L1441
2228                     ; 33 		if ((PD_IDR & (1 << 3)) == 0)
2230  0008 c65010        	ld	a,_PD_IDR
2231  000b a508          	bcp	a,#8
2232  000d 260e          	jrne	L3441
2233                     ; 35 			timer4_start(1000);
2235  000f ae03e8        	ldw	x,#1000
2236  0012 cd0000        	call	_timer4_start
2238                     ; 36 			buttons_status = BOTH_PRESSED;
2240  0015 35050000      	mov	_buttons_status,#5
2242  0019 aca100a1      	jpf	L7441
2243  001d               L3441:
2244                     ; 38 			timer4_start(150);
2246  001d ae0096        	ldw	x,#150
2247  0020 cd0000        	call	_timer4_start
2249                     ; 39 			buttons_status = BOT_PRESSED;
2251  0023 35030000      	mov	_buttons_status,#3
2252  0027 2078          	jra	L7441
2253  0029               L1441:
2254                     ; 42 			timer4_start(500);
2256  0029 ae01f4        	ldw	x,#500
2257  002c cd0000        	call	_timer4_start
2259                     ; 43 			buttons_status = BOT_RELEASED;
2261  002f 35040000      	mov	_buttons_status,#4
2262                     ; 45 			FLASH_DUKR = 0xAE;
2264  0033 35ae5064      	mov	_FLASH_DUKR,#174
2265                     ; 46 			FLASH_DUKR = 0x56;
2267  0037 35565064      	mov	_FLASH_DUKR,#86
2268                     ; 47 			if (in_pwm < med_in_val){
2270  003b be00          	ldw	x,_in_pwm
2271  003d b300          	cpw	x,_med_in_val
2272  003f 2456          	jruge	L1541
2273                     ; 50 			ee_top_val_h = top_val >> 8;
2275  0041 be00          	ldw	x,_top_val
2276  0043 4f            	clr	a
2277  0044 01            	rrwa	x,a
2278  0045 89            	pushw	x
2279  0046 ae0000        	ldw	x,#_ee_top_val_h
2280  0049 cd0000        	call	c_eewrw
2282  004c 85            	popw	x
2283                     ; 51 			ee_top_val_l |= top_val & 0xFF;
2285  004d b600          	ld	a,_top_val
2286  004f 97            	ld	xl,a
2287  0050 b601          	ld	a,_top_val+1
2288  0052 a4ff          	and	a,#255
2289  0054 5f            	clrw	x
2290  0055 02            	rlwa	x,a
2291  0056 1f01          	ldw	(OFST-1,sp),x
2292  0058 01            	rrwa	x,a
2293  0059 ce0000        	ldw	x,_ee_top_val_l
2294  005c 01            	rrwa	x,a
2295  005d 1a02          	or	a,(OFST+0,sp)
2296  005f 01            	rrwa	x,a
2297  0060 1a01          	or	a,(OFST-1,sp)
2298  0062 01            	rrwa	x,a
2299  0063 89            	pushw	x
2300  0064 ae0000        	ldw	x,#_ee_top_val_l
2301  0067 cd0000        	call	c_eewrw
2303  006a 85            	popw	x
2304                     ; 53 			ee_bot_val_h = bot_val >> 8;
2306  006b be00          	ldw	x,_bot_val
2307  006d 4f            	clr	a
2308  006e 01            	rrwa	x,a
2309  006f 89            	pushw	x
2310  0070 ae0000        	ldw	x,#_ee_bot_val_h
2311  0073 cd0000        	call	c_eewrw
2313  0076 85            	popw	x
2314                     ; 54 			ee_bot_val_l |= bot_val & 0xFF;
2316  0077 b600          	ld	a,_bot_val
2317  0079 97            	ld	xl,a
2318  007a b601          	ld	a,_bot_val+1
2319  007c a4ff          	and	a,#255
2320  007e 5f            	clrw	x
2321  007f 02            	rlwa	x,a
2322  0080 1f01          	ldw	(OFST-1,sp),x
2323  0082 01            	rrwa	x,a
2324  0083 ce0000        	ldw	x,_ee_bot_val_l
2325  0086 01            	rrwa	x,a
2326  0087 1a02          	or	a,(OFST+0,sp)
2327  0089 01            	rrwa	x,a
2328  008a 1a01          	or	a,(OFST-1,sp)
2329  008c 01            	rrwa	x,a
2330  008d 89            	pushw	x
2331  008e ae0000        	ldw	x,#_ee_bot_val_l
2332  0091 cd0000        	call	c_eewrw
2334  0094 85            	popw	x
2336  0095 200a          	jra	L7441
2337  0097               L1541:
2338                     ; 57 			ee_divider = divider;
2340  0097 be00          	ldw	x,_divider
2341  0099 89            	pushw	x
2342  009a ae0000        	ldw	x,#_ee_divider
2343  009d cd0000        	call	c_eewrw
2345  00a0 85            	popw	x
2346  00a1               L7441:
2347                     ; 60 }
2350  00a1 85            	popw	x
2351  00a2 81            	ret
2389                     ; 62 void  portd_event(void)
2389                     ; 63 {
2390                     	switch	.text
2391  00a3               _portd_event:
2393  00a3 89            	pushw	x
2394       00000002      OFST:	set	2
2397                     ; 64 		if ((PD_IDR & (1 << 3)) ==0)
2399  00a4 c65010        	ld	a,_PD_IDR
2400  00a7 a508          	bcp	a,#8
2401  00a9 2621          	jrne	L5641
2402                     ; 66 		if ((PC_IDR & (1 << 5)) == 0)
2404  00ab c6500b        	ld	a,_PC_IDR
2405  00ae a520          	bcp	a,#32
2406  00b0 260e          	jrne	L7641
2407                     ; 68 			timer4_start(1000);
2409  00b2 ae03e8        	ldw	x,#1000
2410  00b5 cd0000        	call	_timer4_start
2412                     ; 69 			buttons_status = BOTH_PRESSED;
2414  00b8 35050000      	mov	_buttons_status,#5
2416  00bc ac440144      	jpf	L3741
2417  00c0               L7641:
2418                     ; 71 			timer4_start(150);
2420  00c0 ae0096        	ldw	x,#150
2421  00c3 cd0000        	call	_timer4_start
2423                     ; 72 			buttons_status = TOP_PRESSED;
2425  00c6 35010000      	mov	_buttons_status,#1
2426  00ca 2078          	jra	L3741
2427  00cc               L5641:
2428                     ; 75 			timer4_start(500);
2430  00cc ae01f4        	ldw	x,#500
2431  00cf cd0000        	call	_timer4_start
2433                     ; 76 			buttons_status = TOP_RELEASED;
2435  00d2 35020000      	mov	_buttons_status,#2
2436                     ; 78 			FLASH_DUKR = 0xAE;
2438  00d6 35ae5064      	mov	_FLASH_DUKR,#174
2439                     ; 79 			FLASH_DUKR = 0x56;
2441  00da 35565064      	mov	_FLASH_DUKR,#86
2442                     ; 80 			if (in_pwm < med_in_val){
2444  00de be00          	ldw	x,_in_pwm
2445  00e0 b300          	cpw	x,_med_in_val
2446  00e2 2456          	jruge	L5741
2447                     ; 83 			ee_top_val_h = top_val >> 8;
2449  00e4 be00          	ldw	x,_top_val
2450  00e6 4f            	clr	a
2451  00e7 01            	rrwa	x,a
2452  00e8 89            	pushw	x
2453  00e9 ae0000        	ldw	x,#_ee_top_val_h
2454  00ec cd0000        	call	c_eewrw
2456  00ef 85            	popw	x
2457                     ; 84 			ee_top_val_l |= top_val & 0xFF;
2459  00f0 b600          	ld	a,_top_val
2460  00f2 97            	ld	xl,a
2461  00f3 b601          	ld	a,_top_val+1
2462  00f5 a4ff          	and	a,#255
2463  00f7 5f            	clrw	x
2464  00f8 02            	rlwa	x,a
2465  00f9 1f01          	ldw	(OFST-1,sp),x
2466  00fb 01            	rrwa	x,a
2467  00fc ce0000        	ldw	x,_ee_top_val_l
2468  00ff 01            	rrwa	x,a
2469  0100 1a02          	or	a,(OFST+0,sp)
2470  0102 01            	rrwa	x,a
2471  0103 1a01          	or	a,(OFST-1,sp)
2472  0105 01            	rrwa	x,a
2473  0106 89            	pushw	x
2474  0107 ae0000        	ldw	x,#_ee_top_val_l
2475  010a cd0000        	call	c_eewrw
2477  010d 85            	popw	x
2478                     ; 86 			ee_bot_val_h = bot_val >> 8;
2480  010e be00          	ldw	x,_bot_val
2481  0110 4f            	clr	a
2482  0111 01            	rrwa	x,a
2483  0112 89            	pushw	x
2484  0113 ae0000        	ldw	x,#_ee_bot_val_h
2485  0116 cd0000        	call	c_eewrw
2487  0119 85            	popw	x
2488                     ; 87 			ee_bot_val_l |= bot_val & 0xFF;
2490  011a b600          	ld	a,_bot_val
2491  011c 97            	ld	xl,a
2492  011d b601          	ld	a,_bot_val+1
2493  011f a4ff          	and	a,#255
2494  0121 5f            	clrw	x
2495  0122 02            	rlwa	x,a
2496  0123 1f01          	ldw	(OFST-1,sp),x
2497  0125 01            	rrwa	x,a
2498  0126 ce0000        	ldw	x,_ee_bot_val_l
2499  0129 01            	rrwa	x,a
2500  012a 1a02          	or	a,(OFST+0,sp)
2501  012c 01            	rrwa	x,a
2502  012d 1a01          	or	a,(OFST-1,sp)
2503  012f 01            	rrwa	x,a
2504  0130 89            	pushw	x
2505  0131 ae0000        	ldw	x,#_ee_bot_val_l
2506  0134 cd0000        	call	c_eewrw
2508  0137 85            	popw	x
2510  0138 200a          	jra	L3741
2511  013a               L5741:
2512                     ; 90 			ee_divider = divider;
2514  013a be00          	ldw	x,_divider
2515  013c 89            	pushw	x
2516  013d ae0000        	ldw	x,#_ee_divider
2517  0140 cd0000        	call	c_eewrw
2519  0143 85            	popw	x
2520  0144               L3741:
2521                     ; 93 }
2524  0144 85            	popw	x
2525  0145 81            	ret
2538                     	xref.b	_in_pwm
2539                     	xref.b	_divider
2540                     	xref.b	_med_in_val
2541                     	xref.b	_bot_val
2542                     	xref.b	_top_val
2543                     	xref	_ee_divider
2544                     	xref	_ee_bot_val_l
2545                     	xref	_ee_bot_val_h
2546                     	xref	_ee_top_val_l
2547                     	xref	_ee_top_val_h
2548                     	xref.b	_buttons_status
2549                     	xref	_timer4_start
2550                     	xdef	_portd_event
2551                     	xdef	_portc_event
2570                     	xref	c_eewrw
2571                     	end
