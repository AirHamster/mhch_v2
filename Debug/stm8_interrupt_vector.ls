   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
2201                     ; 23 @far @interrupt void NonHandledInterrupt (void)
2201                     ; 24 {
2202                     	switch	.text
2203  0000               f_NonHandledInterrupt:
2207                     ; 28 	return;
2210  0000 80            	iret
2234                     ; 32 @far @interrupt void timer2_compare_handler (void)
2234                     ; 33 {
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
2251                     ; 34 	timer2_compare3();
2253  0013 cd0000        	call	_timer2_compare3
2255                     ; 35 	}
2258  0016 85            	popw	x
2259  0017 bf00          	ldw	c_y,x
2260  0019 320002        	pop	c_y+2
2261  001c 85            	popw	x
2262  001d bf00          	ldw	c_x,x
2263  001f 320002        	pop	c_x+2
2264  0022 80            	iret
2288                     ; 36 	@far @interrupt void UART_Resieved_Handler (void)
2288                     ; 37 {	
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
2305                     ; 39 		UART_Resieved();
2307  0035 cd0000        	call	_UART_Resieved
2309                     ; 41 	return;
2312  0038 85            	popw	x
2313  0039 bf00          	ldw	c_y,x
2314  003b 320002        	pop	c_y+2
2315  003e 85            	popw	x
2316  003f bf00          	ldw	c_x,x
2317  0041 320002        	pop	c_x+2
2318  0044 80            	iret
2342                     ; 43 @far @interrupt void timer2_overflow_handler (void)
2342                     ; 44 {
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
2359                     ; 45 	timer2_overflow();
2361  0057 cd0000        	call	_timer2_overflow
2363                     ; 46 	return;
2366  005a 85            	popw	x
2367  005b bf00          	ldw	c_y,x
2368  005d 320002        	pop	c_y+2
2369  0060 85            	popw	x
2370  0061 bf00          	ldw	c_x,x
2371  0063 320002        	pop	c_x+2
2372  0066 80            	iret
2396                     ; 48 @far @interrupt void timer1_capture1_handler (void)
2396                     ; 49 {
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
2413                     ; 50 	timer1_capture1();
2415  0079 cd0000        	call	_timer1_capture1
2417                     ; 51 	return;
2420  007c 85            	popw	x
2421  007d bf00          	ldw	c_y,x
2422  007f 320002        	pop	c_y+2
2423  0082 85            	popw	x
2424  0083 bf00          	ldw	c_x,x
2425  0085 320002        	pop	c_x+2
2426  0088 80            	iret
2450                     ; 53 @far @interrupt void timer1_trigger_handler (void)
2450                     ; 54 {
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
2467                     ; 55 	timer1_trigger();
2469  009b cd0000        	call	_timer1_trigger
2471                     ; 56 	return;
2474  009e 85            	popw	x
2475  009f bf00          	ldw	c_y,x
2476  00a1 320002        	pop	c_y+2
2477  00a4 85            	popw	x
2478  00a5 bf00          	ldw	c_x,x
2479  00a7 320002        	pop	c_x+2
2480  00aa 80            	iret
2482                     .const:	section	.text
2483  0000               __vectab:
2484  0000 82            	dc.b	130
2486  0001 00            	dc.b	page(__stext)
2487  0002 0000          	dc.w	__stext
2488  0004 82            	dc.b	130
2490  0005 00            	dc.b	page(f_NonHandledInterrupt)
2491  0006 0000          	dc.w	f_NonHandledInterrupt
2492  0008 82            	dc.b	130
2494  0009 00            	dc.b	page(f_NonHandledInterrupt)
2495  000a 0000          	dc.w	f_NonHandledInterrupt
2496  000c 82            	dc.b	130
2498  000d 00            	dc.b	page(f_NonHandledInterrupt)
2499  000e 0000          	dc.w	f_NonHandledInterrupt
2500  0010 82            	dc.b	130
2502  0011 00            	dc.b	page(f_NonHandledInterrupt)
2503  0012 0000          	dc.w	f_NonHandledInterrupt
2504  0014 82            	dc.b	130
2506  0015 00            	dc.b	page(f_NonHandledInterrupt)
2507  0016 0000          	dc.w	f_NonHandledInterrupt
2508  0018 82            	dc.b	130
2510  0019 00            	dc.b	page(f_NonHandledInterrupt)
2511  001a 0000          	dc.w	f_NonHandledInterrupt
2512  001c 82            	dc.b	130
2514  001d 00            	dc.b	page(f_NonHandledInterrupt)
2515  001e 0000          	dc.w	f_NonHandledInterrupt
2516  0020 82            	dc.b	130
2518  0021 00            	dc.b	page(f_NonHandledInterrupt)
2519  0022 0000          	dc.w	f_NonHandledInterrupt
2520  0024 82            	dc.b	130
2522  0025 00            	dc.b	page(f_NonHandledInterrupt)
2523  0026 0000          	dc.w	f_NonHandledInterrupt
2524  0028 82            	dc.b	130
2526  0029 00            	dc.b	page(f_NonHandledInterrupt)
2527  002a 0000          	dc.w	f_NonHandledInterrupt
2528  002c 82            	dc.b	130
2530  002d 00            	dc.b	page(f_NonHandledInterrupt)
2531  002e 0000          	dc.w	f_NonHandledInterrupt
2532  0030 82            	dc.b	130
2534  0031 00            	dc.b	page(f_NonHandledInterrupt)
2535  0032 0000          	dc.w	f_NonHandledInterrupt
2536  0034 82            	dc.b	130
2538  0035 89            	dc.b	page(f_timer1_trigger_handler)
2539  0036 0089          	dc.w	f_timer1_trigger_handler
2540  0038 82            	dc.b	130
2542  0039 67            	dc.b	page(f_timer1_capture1_handler)
2543  003a 0067          	dc.w	f_timer1_capture1_handler
2544  003c 82            	dc.b	130
2546  003d 45            	dc.b	page(f_timer2_overflow_handler)
2547  003e 0045          	dc.w	f_timer2_overflow_handler
2548  0040 82            	dc.b	130
2550  0041 01            	dc.b	page(f_timer2_compare_handler)
2551  0042 0001          	dc.w	f_timer2_compare_handler
2552  0044 82            	dc.b	130
2554  0045 00            	dc.b	page(f_NonHandledInterrupt)
2555  0046 0000          	dc.w	f_NonHandledInterrupt
2556  0048 82            	dc.b	130
2558  0049 00            	dc.b	page(f_NonHandledInterrupt)
2559  004a 0000          	dc.w	f_NonHandledInterrupt
2560  004c 82            	dc.b	130
2562  004d 00            	dc.b	page(f_NonHandledInterrupt)
2563  004e 0000          	dc.w	f_NonHandledInterrupt
2564  0050 82            	dc.b	130
2566  0051 23            	dc.b	page(f_UART_Resieved_Handler)
2567  0052 0023          	dc.w	f_UART_Resieved_Handler
2568  0054 82            	dc.b	130
2570  0055 00            	dc.b	page(f_NonHandledInterrupt)
2571  0056 0000          	dc.w	f_NonHandledInterrupt
2572  0058 82            	dc.b	130
2574  0059 00            	dc.b	page(f_NonHandledInterrupt)
2575  005a 0000          	dc.w	f_NonHandledInterrupt
2576  005c 82            	dc.b	130
2578  005d 00            	dc.b	page(f_NonHandledInterrupt)
2579  005e 0000          	dc.w	f_NonHandledInterrupt
2580  0060 82            	dc.b	130
2582  0061 00            	dc.b	page(f_NonHandledInterrupt)
2583  0062 0000          	dc.w	f_NonHandledInterrupt
2584  0064 82            	dc.b	130
2586  0065 00            	dc.b	page(f_NonHandledInterrupt)
2587  0066 0000          	dc.w	f_NonHandledInterrupt
2588  0068 82            	dc.b	130
2590  0069 00            	dc.b	page(f_NonHandledInterrupt)
2591  006a 0000          	dc.w	f_NonHandledInterrupt
2592  006c 82            	dc.b	130
2594  006d 00            	dc.b	page(f_NonHandledInterrupt)
2595  006e 0000          	dc.w	f_NonHandledInterrupt
2596  0070 82            	dc.b	130
2598  0071 00            	dc.b	page(f_NonHandledInterrupt)
2599  0072 0000          	dc.w	f_NonHandledInterrupt
2600  0074 82            	dc.b	130
2602  0075 00            	dc.b	page(f_NonHandledInterrupt)
2603  0076 0000          	dc.w	f_NonHandledInterrupt
2604  0078 82            	dc.b	130
2606  0079 00            	dc.b	page(f_NonHandledInterrupt)
2607  007a 0000          	dc.w	f_NonHandledInterrupt
2608  007c 82            	dc.b	130
2610  007d 00            	dc.b	page(f_NonHandledInterrupt)
2611  007e 0000          	dc.w	f_NonHandledInterrupt
2662                     	xdef	__vectab
2663                     	xdef	f_timer1_trigger_handler
2664                     	xdef	f_timer1_capture1_handler
2665                     	xdef	f_timer2_overflow_handler
2666                     	xdef	f_UART_Resieved_Handler
2667                     	xdef	f_timer2_compare_handler
2668                     	xref	__stext
2669                     	xdef	f_NonHandledInterrupt
2670                     	xref	_timer2_compare3
2671                     	xref	_timer2_overflow
2672                     	xref	_timer1_trigger
2673                     	xref	_timer1_capture1
2674                     	xref	_UART_Resieved
2675                     	xref.b	c_x
2676                     	xref.b	c_y
2695                     	end
