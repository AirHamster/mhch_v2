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
2374                     .const:	section	.text
2375  0000               __vectab:
2376  0000 82            	dc.b	130
2378  0001 00            	dc.b	page(__stext)
2379  0002 0000          	dc.w	__stext
2380  0004 82            	dc.b	130
2382  0005 00            	dc.b	page(f_NonHandledInterrupt)
2383  0006 0000          	dc.w	f_NonHandledInterrupt
2384  0008 82            	dc.b	130
2386  0009 00            	dc.b	page(f_NonHandledInterrupt)
2387  000a 0000          	dc.w	f_NonHandledInterrupt
2388  000c 82            	dc.b	130
2390  000d 00            	dc.b	page(f_NonHandledInterrupt)
2391  000e 0000          	dc.w	f_NonHandledInterrupt
2392  0010 82            	dc.b	130
2394  0011 00            	dc.b	page(f_NonHandledInterrupt)
2395  0012 0000          	dc.w	f_NonHandledInterrupt
2396  0014 82            	dc.b	130
2398  0015 00            	dc.b	page(f_NonHandledInterrupt)
2399  0016 0000          	dc.w	f_NonHandledInterrupt
2400  0018 82            	dc.b	130
2402  0019 00            	dc.b	page(f_NonHandledInterrupt)
2403  001a 0000          	dc.w	f_NonHandledInterrupt
2404  001c 82            	dc.b	130
2406  001d 00            	dc.b	page(f_NonHandledInterrupt)
2407  001e 0000          	dc.w	f_NonHandledInterrupt
2408  0020 82            	dc.b	130
2410  0021 00            	dc.b	page(f_NonHandledInterrupt)
2411  0022 0000          	dc.w	f_NonHandledInterrupt
2412  0024 82            	dc.b	130
2414  0025 00            	dc.b	page(f_NonHandledInterrupt)
2415  0026 0000          	dc.w	f_NonHandledInterrupt
2416  0028 82            	dc.b	130
2418  0029 00            	dc.b	page(f_NonHandledInterrupt)
2419  002a 0000          	dc.w	f_NonHandledInterrupt
2420  002c 82            	dc.b	130
2422  002d 00            	dc.b	page(f_NonHandledInterrupt)
2423  002e 0000          	dc.w	f_NonHandledInterrupt
2424  0030 82            	dc.b	130
2426  0031 00            	dc.b	page(f_NonHandledInterrupt)
2427  0032 0000          	dc.w	f_NonHandledInterrupt
2428  0034 82            	dc.b	130
2430  0035 00            	dc.b	page(f_NonHandledInterrupt)
2431  0036 0000          	dc.w	f_NonHandledInterrupt
2432  0038 82            	dc.b	130
2434  0039 00            	dc.b	page(f_NonHandledInterrupt)
2435  003a 0000          	dc.w	f_NonHandledInterrupt
2436  003c 82            	dc.b	130
2438  003d 45            	dc.b	page(f_timer2_overflow_handler)
2439  003e 0045          	dc.w	f_timer2_overflow_handler
2440  0040 82            	dc.b	130
2442  0041 01            	dc.b	page(f_timer2_compare_handler)
2443  0042 0001          	dc.w	f_timer2_compare_handler
2444  0044 82            	dc.b	130
2446  0045 00            	dc.b	page(f_NonHandledInterrupt)
2447  0046 0000          	dc.w	f_NonHandledInterrupt
2448  0048 82            	dc.b	130
2450  0049 00            	dc.b	page(f_NonHandledInterrupt)
2451  004a 0000          	dc.w	f_NonHandledInterrupt
2452  004c 82            	dc.b	130
2454  004d 00            	dc.b	page(f_NonHandledInterrupt)
2455  004e 0000          	dc.w	f_NonHandledInterrupt
2456  0050 82            	dc.b	130
2458  0051 23            	dc.b	page(f_UART_Resieved_Handler)
2459  0052 0023          	dc.w	f_UART_Resieved_Handler
2460  0054 82            	dc.b	130
2462  0055 00            	dc.b	page(f_NonHandledInterrupt)
2463  0056 0000          	dc.w	f_NonHandledInterrupt
2464  0058 82            	dc.b	130
2466  0059 00            	dc.b	page(f_NonHandledInterrupt)
2467  005a 0000          	dc.w	f_NonHandledInterrupt
2468  005c 82            	dc.b	130
2470  005d 00            	dc.b	page(f_NonHandledInterrupt)
2471  005e 0000          	dc.w	f_NonHandledInterrupt
2472  0060 82            	dc.b	130
2474  0061 00            	dc.b	page(f_NonHandledInterrupt)
2475  0062 0000          	dc.w	f_NonHandledInterrupt
2476  0064 82            	dc.b	130
2478  0065 00            	dc.b	page(f_NonHandledInterrupt)
2479  0066 0000          	dc.w	f_NonHandledInterrupt
2480  0068 82            	dc.b	130
2482  0069 00            	dc.b	page(f_NonHandledInterrupt)
2483  006a 0000          	dc.w	f_NonHandledInterrupt
2484  006c 82            	dc.b	130
2486  006d 00            	dc.b	page(f_NonHandledInterrupt)
2487  006e 0000          	dc.w	f_NonHandledInterrupt
2488  0070 82            	dc.b	130
2490  0071 00            	dc.b	page(f_NonHandledInterrupt)
2491  0072 0000          	dc.w	f_NonHandledInterrupt
2492  0074 82            	dc.b	130
2494  0075 00            	dc.b	page(f_NonHandledInterrupt)
2495  0076 0000          	dc.w	f_NonHandledInterrupt
2496  0078 82            	dc.b	130
2498  0079 00            	dc.b	page(f_NonHandledInterrupt)
2499  007a 0000          	dc.w	f_NonHandledInterrupt
2500  007c 82            	dc.b	130
2502  007d 00            	dc.b	page(f_NonHandledInterrupt)
2503  007e 0000          	dc.w	f_NonHandledInterrupt
2554                     	xdef	__vectab
2555                     	xdef	f_timer2_overflow_handler
2556                     	xdef	f_UART_Resieved_Handler
2557                     	xdef	f_timer2_compare_handler
2558                     	xref	__stext
2559                     	xdef	f_NonHandledInterrupt
2560                     	xref	_timer2_compare3
2561                     	xref	_timer2_overflow
2562                     	xref	_UART_Resieved
2563                     	xref.b	c_x
2564                     	xref.b	c_y
2583                     	end
