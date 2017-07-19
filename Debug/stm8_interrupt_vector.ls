   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
2201                     ; 27 @far @interrupt void NonHandledInterrupt (void)
2201                     ; 28 {
2202                     	switch	.text
2203  0000               f_NonHandledInterrupt:
2207                     ; 32 	return;
2210  0000 80            	iret
2234                     ; 36 @far @interrupt void timer2_compare_handler (void)
2234                     ; 37 {
2235                     	switch	.text
2236  0001               f_timer2_compare_handler:
2238  0001 8a            	push	cc
2239  0002 84            	pop	a
2240  0003 a4bf          	and	a,#191
2241  0005 88            	push	a
2242  0006 86            	pop	cc
2243  0007 3b0002        	push	c_x+2
2244  000a be00          	ldw	x,c_x
2245  000c 89            	pushw	x
2246  000d 3b0002        	push	c_y+2
2247  0010 be00          	ldw	x,c_y
2248  0012 89            	pushw	x
2251                     ; 38 	timer2_compare3();
2253  0013 cd0000        	call	_timer2_compare3
2255                     ; 39 	}
2258  0016 85            	popw	x
2259  0017 bf00          	ldw	c_y,x
2260  0019 320002        	pop	c_y+2
2261  001c 85            	popw	x
2262  001d bf00          	ldw	c_x,x
2263  001f 320002        	pop	c_x+2
2264  0022 80            	iret
2288                     ; 40 	@far @interrupt void UART_Resieved_Handler (void)
2288                     ; 41 {	
2289                     	switch	.text
2290  0023               f_UART_Resieved_Handler:
2292  0023 8a            	push	cc
2293  0024 84            	pop	a
2294  0025 a4bf          	and	a,#191
2295  0027 88            	push	a
2296  0028 86            	pop	cc
2297  0029 3b0002        	push	c_x+2
2298  002c be00          	ldw	x,c_x
2299  002e 89            	pushw	x
2300  002f 3b0002        	push	c_y+2
2301  0032 be00          	ldw	x,c_y
2302  0034 89            	pushw	x
2305                     ; 43 		UART_Resieved();
2307  0035 cd0000        	call	_UART_Resieved
2309                     ; 45 	return;
2312  0038 85            	popw	x
2313  0039 bf00          	ldw	c_y,x
2314  003b 320002        	pop	c_y+2
2315  003e 85            	popw	x
2316  003f bf00          	ldw	c_x,x
2317  0041 320002        	pop	c_x+2
2318  0044 80            	iret
2342                     ; 47 @far @interrupt void timer2_overflow_handler (void)
2342                     ; 48 {
2343                     	switch	.text
2344  0045               f_timer2_overflow_handler:
2346  0045 8a            	push	cc
2347  0046 84            	pop	a
2348  0047 a4bf          	and	a,#191
2349  0049 88            	push	a
2350  004a 86            	pop	cc
2351  004b 3b0002        	push	c_x+2
2352  004e be00          	ldw	x,c_x
2353  0050 89            	pushw	x
2354  0051 3b0002        	push	c_y+2
2355  0054 be00          	ldw	x,c_y
2356  0056 89            	pushw	x
2359                     ; 49 	timer2_overflow();
2361  0057 cd0000        	call	_timer2_overflow
2363                     ; 50 	return;
2366  005a 85            	popw	x
2367  005b bf00          	ldw	c_y,x
2368  005d 320002        	pop	c_y+2
2369  0060 85            	popw	x
2370  0061 bf00          	ldw	c_x,x
2371  0063 320002        	pop	c_x+2
2372  0066 80            	iret
2396                     ; 52 @far @interrupt void timer1_capture1_handler (void)
2396                     ; 53 {
2397                     	switch	.text
2398  0067               f_timer1_capture1_handler:
2400  0067 8a            	push	cc
2401  0068 84            	pop	a
2402  0069 a4bf          	and	a,#191
2403  006b 88            	push	a
2404  006c 86            	pop	cc
2405  006d 3b0002        	push	c_x+2
2406  0070 be00          	ldw	x,c_x
2407  0072 89            	pushw	x
2408  0073 3b0002        	push	c_y+2
2409  0076 be00          	ldw	x,c_y
2410  0078 89            	pushw	x
2413                     ; 54 	timer1_capture1();
2415  0079 cd0000        	call	_timer1_capture1
2417                     ; 55 	return;
2420  007c 85            	popw	x
2421  007d bf00          	ldw	c_y,x
2422  007f 320002        	pop	c_y+2
2423  0082 85            	popw	x
2424  0083 bf00          	ldw	c_x,x
2425  0085 320002        	pop	c_x+2
2426  0088 80            	iret
2450                     ; 57 @far @interrupt void timer1_trigger_handler (void)
2450                     ; 58 {
2451                     	switch	.text
2452  0089               f_timer1_trigger_handler:
2454  0089 8a            	push	cc
2455  008a 84            	pop	a
2456  008b a4bf          	and	a,#191
2457  008d 88            	push	a
2458  008e 86            	pop	cc
2459  008f 3b0002        	push	c_x+2
2460  0092 be00          	ldw	x,c_x
2461  0094 89            	pushw	x
2462  0095 3b0002        	push	c_y+2
2463  0098 be00          	ldw	x,c_y
2464  009a 89            	pushw	x
2467                     ; 59 	timer1_trigger();
2469  009b cd0000        	call	_timer1_trigger
2471                     ; 60 	return;
2474  009e 85            	popw	x
2475  009f bf00          	ldw	c_y,x
2476  00a1 320002        	pop	c_y+2
2477  00a4 85            	popw	x
2478  00a5 bf00          	ldw	c_x,x
2479  00a7 320002        	pop	c_x+2
2480  00aa 80            	iret
2504                     ; 63 @far @interrupt void portd_int (void)
2504                     ; 64 {
2505                     	switch	.text
2506  00ab               f_portd_int:
2508  00ab 8a            	push	cc
2509  00ac 84            	pop	a
2510  00ad a4bf          	and	a,#191
2511  00af 88            	push	a
2512  00b0 86            	pop	cc
2513       00000001      OFST:	set	1
2514  00b1 3b0002        	push	c_x+2
2515  00b4 be00          	ldw	x,c_x
2516  00b6 89            	pushw	x
2517  00b7 3b0002        	push	c_y+2
2518  00ba be00          	ldw	x,c_y
2519  00bc 89            	pushw	x
2520  00bd 88            	push	a
2523                     ; 65 	EXTI_CR1 = (EXTI_CR1 & 0x3f) | (~EXTI_CR1 & 0xcf);
2525  00be c650a0        	ld	a,_EXTI_CR1
2526  00c1 43            	cpl	a
2527  00c2 a4cf          	and	a,#207
2528  00c4 6b01          	ld	(OFST+0,sp),a
2529  00c6 c650a0        	ld	a,_EXTI_CR1
2530  00c9 a43f          	and	a,#63
2531  00cb 1a01          	or	a,(OFST+0,sp)
2532  00cd c750a0        	ld	_EXTI_CR1,a
2533                     ; 66 	portd_event();
2535  00d0 cd0000        	call	_portd_event
2537                     ; 67 	return;
2540  00d3 84            	pop	a
2541  00d4 85            	popw	x
2542  00d5 bf00          	ldw	c_y,x
2543  00d7 320002        	pop	c_y+2
2544  00da 85            	popw	x
2545  00db bf00          	ldw	c_x,x
2546  00dd 320002        	pop	c_x+2
2547  00e0 80            	iret
2571                     ; 70 @far @interrupt void portc_int (void)
2571                     ; 71 {
2572                     	switch	.text
2573  00e1               f_portc_int:
2575  00e1 8a            	push	cc
2576  00e2 84            	pop	a
2577  00e3 a4bf          	and	a,#191
2578  00e5 88            	push	a
2579  00e6 86            	pop	cc
2580       00000001      OFST:	set	1
2581  00e7 3b0002        	push	c_x+2
2582  00ea be00          	ldw	x,c_x
2583  00ec 89            	pushw	x
2584  00ed 3b0002        	push	c_y+2
2585  00f0 be00          	ldw	x,c_y
2586  00f2 89            	pushw	x
2587  00f3 88            	push	a
2590                     ; 73 	EXTI_CR1 = (EXTI_CR1 & 0xcf) | (~EXTI_CR1 & 0x3f);
2592  00f4 c650a0        	ld	a,_EXTI_CR1
2593  00f7 43            	cpl	a
2594  00f8 a43f          	and	a,#63
2595  00fa 6b01          	ld	(OFST+0,sp),a
2596  00fc c650a0        	ld	a,_EXTI_CR1
2597  00ff a4cf          	and	a,#207
2598  0101 1a01          	or	a,(OFST+0,sp)
2599  0103 c750a0        	ld	_EXTI_CR1,a
2600                     ; 74 	portc_event();
2602  0106 cd0000        	call	_portc_event
2604                     ; 75 	return;
2607  0109 84            	pop	a
2608  010a 85            	popw	x
2609  010b bf00          	ldw	c_y,x
2610  010d 320002        	pop	c_y+2
2611  0110 85            	popw	x
2612  0111 bf00          	ldw	c_x,x
2613  0113 320002        	pop	c_x+2
2614  0116 80            	iret
2638                     ; 77 @far @interrupt void tim4_overflow_handler (void)
2638                     ; 78 {
2639                     	switch	.text
2640  0117               f_tim4_overflow_handler:
2642  0117 8a            	push	cc
2643  0118 84            	pop	a
2644  0119 a4bf          	and	a,#191
2645  011b 88            	push	a
2646  011c 86            	pop	cc
2647  011d 3b0002        	push	c_x+2
2648  0120 be00          	ldw	x,c_x
2649  0122 89            	pushw	x
2650  0123 3b0002        	push	c_y+2
2651  0126 be00          	ldw	x,c_y
2652  0128 89            	pushw	x
2655                     ; 79 	timer4_overflow();
2657  0129 cd0000        	call	_timer4_overflow
2659                     ; 80 }
2662  012c 85            	popw	x
2663  012d bf00          	ldw	c_y,x
2664  012f 320002        	pop	c_y+2
2665  0132 85            	popw	x
2666  0133 bf00          	ldw	c_x,x
2667  0135 320002        	pop	c_x+2
2668  0138 80            	iret
2670                     .const:	section	.text
2671  0000               __vectab:
2672  0000 82            	dc.b	130
2674  0001 00            	dc.b	page(__stext)
2675  0002 0000          	dc.w	__stext
2676  0004 82            	dc.b	130
2678  0005 00            	dc.b	page(f_NonHandledInterrupt)
2679  0006 0000          	dc.w	f_NonHandledInterrupt
2680  0008 82            	dc.b	130
2682  0009 00            	dc.b	page(f_NonHandledInterrupt)
2683  000a 0000          	dc.w	f_NonHandledInterrupt
2684  000c 82            	dc.b	130
2686  000d 00            	dc.b	page(f_NonHandledInterrupt)
2687  000e 0000          	dc.w	f_NonHandledInterrupt
2688  0010 82            	dc.b	130
2690  0011 00            	dc.b	page(f_NonHandledInterrupt)
2691  0012 0000          	dc.w	f_NonHandledInterrupt
2692  0014 82            	dc.b	130
2694  0015 00            	dc.b	page(f_NonHandledInterrupt)
2695  0016 0000          	dc.w	f_NonHandledInterrupt
2696  0018 82            	dc.b	130
2698  0019 00            	dc.b	page(f_NonHandledInterrupt)
2699  001a 0000          	dc.w	f_NonHandledInterrupt
2700  001c 82            	dc.b	130
2702  001d e1            	dc.b	page(f_portc_int)
2703  001e 00e1          	dc.w	f_portc_int
2704  0020 82            	dc.b	130
2706  0021 ab            	dc.b	page(f_portd_int)
2707  0022 00ab          	dc.w	f_portd_int
2708  0024 82            	dc.b	130
2710  0025 00            	dc.b	page(f_NonHandledInterrupt)
2711  0026 0000          	dc.w	f_NonHandledInterrupt
2712  0028 82            	dc.b	130
2714  0029 00            	dc.b	page(f_NonHandledInterrupt)
2715  002a 0000          	dc.w	f_NonHandledInterrupt
2716  002c 82            	dc.b	130
2718  002d 00            	dc.b	page(f_NonHandledInterrupt)
2719  002e 0000          	dc.w	f_NonHandledInterrupt
2720  0030 82            	dc.b	130
2722  0031 00            	dc.b	page(f_NonHandledInterrupt)
2723  0032 0000          	dc.w	f_NonHandledInterrupt
2724  0034 82            	dc.b	130
2726  0035 89            	dc.b	page(f_timer1_trigger_handler)
2727  0036 0089          	dc.w	f_timer1_trigger_handler
2728  0038 82            	dc.b	130
2730  0039 67            	dc.b	page(f_timer1_capture1_handler)
2731  003a 0067          	dc.w	f_timer1_capture1_handler
2732  003c 82            	dc.b	130
2734  003d 45            	dc.b	page(f_timer2_overflow_handler)
2735  003e 0045          	dc.w	f_timer2_overflow_handler
2736  0040 82            	dc.b	130
2738  0041 01            	dc.b	page(f_timer2_compare_handler)
2739  0042 0001          	dc.w	f_timer2_compare_handler
2740  0044 82            	dc.b	130
2742  0045 00            	dc.b	page(f_NonHandledInterrupt)
2743  0046 0000          	dc.w	f_NonHandledInterrupt
2744  0048 82            	dc.b	130
2746  0049 00            	dc.b	page(f_NonHandledInterrupt)
2747  004a 0000          	dc.w	f_NonHandledInterrupt
2748  004c 82            	dc.b	130
2750  004d 00            	dc.b	page(f_NonHandledInterrupt)
2751  004e 0000          	dc.w	f_NonHandledInterrupt
2752  0050 82            	dc.b	130
2754  0051 23            	dc.b	page(f_UART_Resieved_Handler)
2755  0052 0023          	dc.w	f_UART_Resieved_Handler
2756  0054 82            	dc.b	130
2758  0055 00            	dc.b	page(f_NonHandledInterrupt)
2759  0056 0000          	dc.w	f_NonHandledInterrupt
2760  0058 82            	dc.b	130
2762  0059 00            	dc.b	page(f_NonHandledInterrupt)
2763  005a 0000          	dc.w	f_NonHandledInterrupt
2764  005c 82            	dc.b	130
2766  005d 00            	dc.b	page(f_NonHandledInterrupt)
2767  005e 0000          	dc.w	f_NonHandledInterrupt
2768  0060 82            	dc.b	130
2770  0061 00            	dc.b	page(f_NonHandledInterrupt)
2771  0062 0000          	dc.w	f_NonHandledInterrupt
2772  0064 82            	dc.b	130
2774  0065 17            	dc.b	page(f_tim4_overflow_handler)
2775  0066 0117          	dc.w	f_tim4_overflow_handler
2776  0068 82            	dc.b	130
2778  0069 00            	dc.b	page(f_NonHandledInterrupt)
2779  006a 0000          	dc.w	f_NonHandledInterrupt
2780  006c 82            	dc.b	130
2782  006d 00            	dc.b	page(f_NonHandledInterrupt)
2783  006e 0000          	dc.w	f_NonHandledInterrupt
2784  0070 82            	dc.b	130
2786  0071 00            	dc.b	page(f_NonHandledInterrupt)
2787  0072 0000          	dc.w	f_NonHandledInterrupt
2788  0074 82            	dc.b	130
2790  0075 00            	dc.b	page(f_NonHandledInterrupt)
2791  0076 0000          	dc.w	f_NonHandledInterrupt
2792  0078 82            	dc.b	130
2794  0079 00            	dc.b	page(f_NonHandledInterrupt)
2795  007a 0000          	dc.w	f_NonHandledInterrupt
2796  007c 82            	dc.b	130
2798  007d 00            	dc.b	page(f_NonHandledInterrupt)
2799  007e 0000          	dc.w	f_NonHandledInterrupt
2850                     	xdef	__vectab
2851                     	xdef	f_tim4_overflow_handler
2852                     	xdef	f_portc_int
2853                     	xdef	f_portd_int
2854                     	xdef	f_timer1_trigger_handler
2855                     	xdef	f_timer1_capture1_handler
2856                     	xdef	f_timer2_overflow_handler
2857                     	xdef	f_UART_Resieved_Handler
2858                     	xdef	f_timer2_compare_handler
2859                     	xref	__stext
2860                     	xdef	f_NonHandledInterrupt
2861                     	xref	_portd_event
2862                     	xref	_portc_event
2863                     	xref	_timer4_overflow
2864                     	xref	_timer2_compare3
2865                     	xref	_timer2_overflow
2866                     	xref	_timer1_trigger
2867                     	xref	_timer1_capture1
2868                     	xref	_UART_Resieved
2869                     	xref.b	c_x
2870                     	xref.b	c_y
2889                     	end
