   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
2201                     ; 21 @far @interrupt void NonHandledInterrupt (void)
2201                     ; 22 {
2202                     	switch	.text
2203  0000               f_NonHandledInterrupt:
2207                     ; 26 	return;
2210  0000 80            	iret
2234                     ; 30 @far @interrupt void timer2_compare_handler (void)
2234                     ; 31 {
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
2251                     ; 32 	timer2_compare3();
2253  0013 cd0000        	call	_timer2_compare3
2255                     ; 33 	}
2258  0016 85            	popw	x
2259  0017 bf00          	ldw	c_y,x
2260  0019 320002        	pop	c_y+2
2261  001c 85            	popw	x
2262  001d bf00          	ldw	c_x,x
2263  001f 320002        	pop	c_x+2
2264  0022 80            	iret
2288                     ; 34 	@far @interrupt void UART_Resieved_Handler (void)
2288                     ; 35 {	
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
2305                     ; 37 		UART_Resieved();
2307  0035 cd0000        	call	_UART_Resieved
2309                     ; 39 	return;
2312  0038 85            	popw	x
2313  0039 bf00          	ldw	c_y,x
2314  003b 320002        	pop	c_y+2
2315  003e 85            	popw	x
2316  003f bf00          	ldw	c_x,x
2317  0041 320002        	pop	c_x+2
2318  0044 80            	iret
2342                     ; 41 @far @interrupt void timer2_overflow_handler (void)
2342                     ; 42 {
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
2359                     ; 43 	timer2_overflow();
2361  0057 cd0000        	call	_timer2_overflow
2363                     ; 44 	return;
2366  005a 85            	popw	x
2367  005b bf00          	ldw	c_y,x
2368  005d 320002        	pop	c_y+2
2369  0060 85            	popw	x
2370  0061 bf00          	ldw	c_x,x
2371  0063 320002        	pop	c_x+2
2372  0066 80            	iret
2396                     ; 46 @far @interrupt void timer1_capture1_handler (void)
2396                     ; 47 {
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
2413                     ; 48 	timer1_capture1();
2415  0079 cd0000        	call	_timer1_capture1
2417                     ; 49 	return;
2420  007c 85            	popw	x
2421  007d bf00          	ldw	c_y,x
2422  007f 320002        	pop	c_y+2
2423  0082 85            	popw	x
2424  0083 bf00          	ldw	c_x,x
2425  0085 320002        	pop	c_x+2
2426  0088 80            	iret
2428                     .const:	section	.text
2429  0000               __vectab:
2430  0000 82            	dc.b	130
2432  0001 00            	dc.b	page(__stext)
2433  0002 0000          	dc.w	__stext
2434  0004 82            	dc.b	130
2436  0005 00            	dc.b	page(f_NonHandledInterrupt)
2437  0006 0000          	dc.w	f_NonHandledInterrupt
2438  0008 82            	dc.b	130
2440  0009 00            	dc.b	page(f_NonHandledInterrupt)
2441  000a 0000          	dc.w	f_NonHandledInterrupt
2442  000c 82            	dc.b	130
2444  000d 00            	dc.b	page(f_NonHandledInterrupt)
2445  000e 0000          	dc.w	f_NonHandledInterrupt
2446  0010 82            	dc.b	130
2448  0011 00            	dc.b	page(f_NonHandledInterrupt)
2449  0012 0000          	dc.w	f_NonHandledInterrupt
2450  0014 82            	dc.b	130
2452  0015 00            	dc.b	page(f_NonHandledInterrupt)
2453  0016 0000          	dc.w	f_NonHandledInterrupt
2454  0018 82            	dc.b	130
2456  0019 00            	dc.b	page(f_NonHandledInterrupt)
2457  001a 0000          	dc.w	f_NonHandledInterrupt
2458  001c 82            	dc.b	130
2460  001d 00            	dc.b	page(f_NonHandledInterrupt)
2461  001e 0000          	dc.w	f_NonHandledInterrupt
2462  0020 82            	dc.b	130
2464  0021 00            	dc.b	page(f_NonHandledInterrupt)
2465  0022 0000          	dc.w	f_NonHandledInterrupt
2466  0024 82            	dc.b	130
2468  0025 00            	dc.b	page(f_NonHandledInterrupt)
2469  0026 0000          	dc.w	f_NonHandledInterrupt
2470  0028 82            	dc.b	130
2472  0029 00            	dc.b	page(f_NonHandledInterrupt)
2473  002a 0000          	dc.w	f_NonHandledInterrupt
2474  002c 82            	dc.b	130
2476  002d 00            	dc.b	page(f_NonHandledInterrupt)
2477  002e 0000          	dc.w	f_NonHandledInterrupt
2478  0030 82            	dc.b	130
2480  0031 00            	dc.b	page(f_NonHandledInterrupt)
2481  0032 0000          	dc.w	f_NonHandledInterrupt
2482  0034 82            	dc.b	130
2484  0035 00            	dc.b	page(f_NonHandledInterrupt)
2485  0036 0000          	dc.w	f_NonHandledInterrupt
2486  0038 82            	dc.b	130
2488  0039 67            	dc.b	page(f_timer1_capture1_handler)
2489  003a 0067          	dc.w	f_timer1_capture1_handler
2490  003c 82            	dc.b	130
2492  003d 45            	dc.b	page(f_timer2_overflow_handler)
2493  003e 0045          	dc.w	f_timer2_overflow_handler
2494  0040 82            	dc.b	130
2496  0041 01            	dc.b	page(f_timer2_compare_handler)
2497  0042 0001          	dc.w	f_timer2_compare_handler
2498  0044 82            	dc.b	130
2500  0045 00            	dc.b	page(f_NonHandledInterrupt)
2501  0046 0000          	dc.w	f_NonHandledInterrupt
2502  0048 82            	dc.b	130
2504  0049 00            	dc.b	page(f_NonHandledInterrupt)
2505  004a 0000          	dc.w	f_NonHandledInterrupt
2506  004c 82            	dc.b	130
2508  004d 00            	dc.b	page(f_NonHandledInterrupt)
2509  004e 0000          	dc.w	f_NonHandledInterrupt
2510  0050 82            	dc.b	130
2512  0051 23            	dc.b	page(f_UART_Resieved_Handler)
2513  0052 0023          	dc.w	f_UART_Resieved_Handler
2514  0054 82            	dc.b	130
2516  0055 00            	dc.b	page(f_NonHandledInterrupt)
2517  0056 0000          	dc.w	f_NonHandledInterrupt
2518  0058 82            	dc.b	130
2520  0059 00            	dc.b	page(f_NonHandledInterrupt)
2521  005a 0000          	dc.w	f_NonHandledInterrupt
2522  005c 82            	dc.b	130
2524  005d 00            	dc.b	page(f_NonHandledInterrupt)
2525  005e 0000          	dc.w	f_NonHandledInterrupt
2526  0060 82            	dc.b	130
2528  0061 00            	dc.b	page(f_NonHandledInterrupt)
2529  0062 0000          	dc.w	f_NonHandledInterrupt
2530  0064 82            	dc.b	130
2532  0065 00            	dc.b	page(f_NonHandledInterrupt)
2533  0066 0000          	dc.w	f_NonHandledInterrupt
2534  0068 82            	dc.b	130
2536  0069 00            	dc.b	page(f_NonHandledInterrupt)
2537  006a 0000          	dc.w	f_NonHandledInterrupt
2538  006c 82            	dc.b	130
2540  006d 00            	dc.b	page(f_NonHandledInterrupt)
2541  006e 0000          	dc.w	f_NonHandledInterrupt
2542  0070 82            	dc.b	130
2544  0071 00            	dc.b	page(f_NonHandledInterrupt)
2545  0072 0000          	dc.w	f_NonHandledInterrupt
2546  0074 82            	dc.b	130
2548  0075 00            	dc.b	page(f_NonHandledInterrupt)
2549  0076 0000          	dc.w	f_NonHandledInterrupt
2550  0078 82            	dc.b	130
2552  0079 00            	dc.b	page(f_NonHandledInterrupt)
2553  007a 0000          	dc.w	f_NonHandledInterrupt
2554  007c 82            	dc.b	130
2556  007d 00            	dc.b	page(f_NonHandledInterrupt)
2557  007e 0000          	dc.w	f_NonHandledInterrupt
2608                     	xdef	__vectab
2609                     	xdef	f_timer1_capture1_handler
2610                     	xdef	f_timer2_overflow_handler
2611                     	xdef	f_UART_Resieved_Handler
2612                     	xdef	f_timer2_compare_handler
2613                     	xref	__stext
2614                     	xdef	f_NonHandledInterrupt
2615                     	xref	_timer2_compare3
2616                     	xref	_timer2_overflow
2617                     	xref	_timer1_capture1
2618                     	xref	_UART_Resieved
2619                     	xref.b	c_x
2620                     	xref.b	c_y
2639                     	end
