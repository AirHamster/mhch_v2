   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
2172                     .const:	section	.text
2173  0000               _help_msg:
2174  0000 506c617a6d61  	dc.b	"Plazma probe contr"
2175  0012 6f6c6c65720a  	dc.b	"oller",10
2176  0018 205573616765  	dc.b	" Usage:",10
2177  0020 202020207374  	dc.b	"    start - start "
2178  0032 6d6561737572  	dc.b	"measurements",10
2179  003f 202020207374  	dc.b	"    stop - finish "
2180  0051 6d6561737572  	dc.b	"measurements",10
2181  005e 202020207365  	dc.b	"    set <voltage> "
2182  0070 2d2070726f62  	dc.b	"- probe voltage se"
2183  0082 7475700a      	dc.b	"tup",10
2184  0086 202020206e61  	dc.b	"    native - non-f"
2185  0098 6f726d617465  	dc.b	"ormated output",10
2186  00a7 202020206173  	dc.b	"    ascii - output"
2187  00b9 20696e206173  	dc.b	" in ascii presenta"
2188  00cb 74696f6e0a00  	dc.b	"tion",10,0
2221                     ; 10 void usart_setup(void)
2221                     ; 11 {
2223                     	switch	.text
2224  0000               _usart_setup:
2228                     ; 14 	UART1_BRR2 = 0x05;
2230  0000 35055233      	mov	_UART1_BRR2,#5
2231                     ; 15 	UART1_BRR1 = 0x04;     //9600 bod
2233  0004 35045232      	mov	_UART1_BRR1,#4
2234                     ; 17 	UART1_CR2 |= UART1_CR2_REN; //reseiving
2236  0008 72145235      	bset	_UART1_CR2,#2
2237                     ; 18 	UART1_CR2 |= UART1_CR2_TEN; //transmiting 
2239  000c 72165235      	bset	_UART1_CR2,#3
2240                     ; 19 	UART1_CR2 |= UART1_CR2_RIEN; //reseive int
2242  0010 721a5235      	bset	_UART1_CR2,#5
2243                     ; 20 	UART1_SR = 0;
2245  0014 725f5230      	clr	_UART1_SR
2246                     ; 21 }
2249  0018 81            	ret
2287                     ; 23 void process_command(char *cmd)
2287                     ; 24 {
2288                     	switch	.text
2289  0019               _process_command:
2291  0019 89            	pushw	x
2292       00000000      OFST:	set	0
2295                     ; 29 	if(strncmp(cmd, "set", 3) == 0)
2297  001a ae0003        	ldw	x,#3
2298  001d 89            	pushw	x
2299  001e ae00e2        	ldw	x,#L1641
2300  0021 89            	pushw	x
2301  0022 1e05          	ldw	x,(OFST+5,sp)
2302  0024 cd0000        	call	_strncmp
2304  0027 5b04          	addw	sp,#4
2305  0029 a30000        	cpw	x,#0
2306                     ; 35 	if(strncmp(cmd, "help", 4) == 0)
2308  002c ae0004        	ldw	x,#4
2309  002f 89            	pushw	x
2310  0030 ae00dd        	ldw	x,#L5641
2311  0033 89            	pushw	x
2312  0034 1e05          	ldw	x,(OFST+5,sp)
2313  0036 cd0000        	call	_strncmp
2315  0039 5b04          	addw	sp,#4
2316  003b a30000        	cpw	x,#0
2317  003e 260a          	jrne	L3641
2318                     ; 37 		usart_send(help_msg, sizeof(help_msg)-1);
2320  0040 ae00d0        	ldw	x,#208
2321  0043 89            	pushw	x
2322  0044 ae0000        	ldw	x,#_help_msg
2323  0047 ad12          	call	_usart_send
2325  0049 85            	popw	x
2326  004a               L3641:
2327                     ; 39 }
2330  004a 85            	popw	x
2331  004b 81            	ret
2367                     ; 40 void usart_send_byte(int byte)
2367                     ; 41 {
2368                     	switch	.text
2369  004c               _usart_send_byte:
2371  004c 89            	pushw	x
2372       00000000      OFST:	set	0
2375  004d               L7051:
2376                     ; 44 	while((UART1_SR & 0x80) == 0x00);
2378  004d c65230        	ld	a,_UART1_SR
2379  0050 a580          	bcp	a,#128
2380  0052 27f9          	jreq	L7051
2381                     ; 45 	UART1_DR = byte;
2383  0054 7b02          	ld	a,(OFST+2,sp)
2384  0056 c75231        	ld	_UART1_DR,a
2385                     ; 47 }
2388  0059 85            	popw	x
2389  005a 81            	ret
2435                     ; 48 void usart_send(unsigned char *BufferPtr, unsigned short Length )
2435                     ; 49 {
2436                     	switch	.text
2437  005b               _usart_send:
2439  005b 89            	pushw	x
2440       00000000      OFST:	set	0
2443  005c 201b          	jra	L7351
2444  005e               L5451:
2445                     ; 54 		while((UART1_SR & 0x80) == 0x00);
2447  005e c65230        	ld	a,_UART1_SR
2448  0061 a580          	bcp	a,#128
2449  0063 27f9          	jreq	L5451
2450                     ; 55 		UART1_DR = *BufferPtr;;
2452  0065 1e01          	ldw	x,(OFST+1,sp)
2453  0067 f6            	ld	a,(x)
2454  0068 c75231        	ld	_UART1_DR,a
2455                     ; 56 		BufferPtr++;
2458  006b 1e01          	ldw	x,(OFST+1,sp)
2459  006d 1c0001        	addw	x,#1
2460  0070 1f01          	ldw	(OFST+1,sp),x
2461                     ; 57 		Length--;
2463  0072 1e05          	ldw	x,(OFST+5,sp)
2464  0074 1d0001        	subw	x,#1
2465  0077 1f05          	ldw	(OFST+5,sp),x
2466  0079               L7351:
2467                     ; 52 	while ( Length != 0 )
2469  0079 1e05          	ldw	x,(OFST+5,sp)
2470  007b 26e1          	jrne	L5451
2471                     ; 61 	return;
2474  007d 85            	popw	x
2475  007e 81            	ret
2564                     ; 66 double atof(const char *s)
2564                     ; 67 {
2565                     	switch	.text
2566  007f               _atof:
2568  007f 89            	pushw	x
2569  0080 5211          	subw	sp,#17
2570       00000011      OFST:	set	17
2573                     ; 70 	double a = 0.0;
2575  0082 ce00db        	ldw	x,L3261+2
2576  0085 1f0e          	ldw	(OFST-3,sp),x
2577  0087 ce00d9        	ldw	x,L3261
2578  008a 1f0c          	ldw	(OFST-5,sp),x
2579                     ; 71 	int e = 0;
2581  008c 5f            	clrw	x
2582  008d 1f0a          	ldw	(OFST-7,sp),x
2583                     ; 73 	uint8_t neg_flag = 0;
2585  008f 0f09          	clr	(OFST-8,sp)
2586                     ; 74 	if ((c = *s) == '-')
2588  0091 1e12          	ldw	x,(OFST+1,sp)
2589  0093 f6            	ld	a,(x)
2590  0094 5f            	clrw	x
2591  0095 97            	ld	xl,a
2592  0096 1f10          	ldw	(OFST-1,sp),x
2593  0098 1e10          	ldw	x,(OFST-1,sp)
2594  009a a3002d        	cpw	x,#45
2595  009d 263b          	jrne	L3361
2596                     ; 76 		neg_flag = 1;
2598  009f a601          	ld	a,#1
2599  00a1 6b09          	ld	(OFST-8,sp),a
2600                     ; 77 		*s++;
2602  00a3 1e12          	ldw	x,(OFST+1,sp)
2603  00a5 1c0001        	addw	x,#1
2604  00a8 1f12          	ldw	(OFST+1,sp),x
2605  00aa 1d0001        	subw	x,#1
2606  00ad f6            	ld	a,(x)
2607  00ae 202a          	jra	L3361
2608  00b0               L1361:
2609                     ; 80 		a = a*10.0 + (c - '0');
2611  00b0 1e10          	ldw	x,(OFST-1,sp)
2612  00b2 1d0030        	subw	x,#48
2613  00b5 cd0000        	call	c_itof
2615  00b8 96            	ldw	x,sp
2616  00b9 1c0001        	addw	x,#OFST-16
2617  00bc cd0000        	call	c_rtol
2619  00bf 96            	ldw	x,sp
2620  00c0 1c000c        	addw	x,#OFST-5
2621  00c3 cd0000        	call	c_ltor
2623  00c6 ae00d5        	ldw	x,#L3461
2624  00c9 cd0000        	call	c_fmul
2626  00cc 96            	ldw	x,sp
2627  00cd 1c0001        	addw	x,#OFST-16
2628  00d0 cd0000        	call	c_fadd
2630  00d3 96            	ldw	x,sp
2631  00d4 1c000c        	addw	x,#OFST-5
2632  00d7 cd0000        	call	c_rtol
2634  00da               L3361:
2635                     ; 79 	while ((c = *s++) != '\0' && isdigit(c)) {
2637  00da 1e12          	ldw	x,(OFST+1,sp)
2638  00dc 1c0001        	addw	x,#1
2639  00df 1f12          	ldw	(OFST+1,sp),x
2640  00e1 1d0001        	subw	x,#1
2641  00e4 f6            	ld	a,(x)
2642  00e5 5f            	clrw	x
2643  00e6 97            	ld	xl,a
2644  00e7 1f10          	ldw	(OFST-1,sp),x
2645  00e9 1e10          	ldw	x,(OFST-1,sp)
2646  00eb 2710          	jreq	L7461
2648  00ed 9c            	rvf
2649  00ee 1e10          	ldw	x,(OFST-1,sp)
2650  00f0 a30030        	cpw	x,#48
2651  00f3 2f08          	jrslt	L7461
2653  00f5 9c            	rvf
2654  00f6 1e10          	ldw	x,(OFST-1,sp)
2655  00f8 a3003a        	cpw	x,#58
2656  00fb 2fb3          	jrslt	L1361
2657  00fd               L7461:
2658                     ; 82 	if (c == '.') {
2660  00fd 1e10          	ldw	x,(OFST-1,sp)
2661  00ff a3002e        	cpw	x,#46
2662  0102 2656          	jrne	L3561
2664  0104 2031          	jra	L7561
2665  0106               L5561:
2666                     ; 84 			a = a*10.0 + (c - '0');
2668  0106 1e10          	ldw	x,(OFST-1,sp)
2669  0108 1d0030        	subw	x,#48
2670  010b cd0000        	call	c_itof
2672  010e 96            	ldw	x,sp
2673  010f 1c0001        	addw	x,#OFST-16
2674  0112 cd0000        	call	c_rtol
2676  0115 96            	ldw	x,sp
2677  0116 1c000c        	addw	x,#OFST-5
2678  0119 cd0000        	call	c_ltor
2680  011c ae00d5        	ldw	x,#L3461
2681  011f cd0000        	call	c_fmul
2683  0122 96            	ldw	x,sp
2684  0123 1c0001        	addw	x,#OFST-16
2685  0126 cd0000        	call	c_fadd
2687  0129 96            	ldw	x,sp
2688  012a 1c000c        	addw	x,#OFST-5
2689  012d cd0000        	call	c_rtol
2691                     ; 85 			e = e-1;
2693  0130 1e0a          	ldw	x,(OFST-7,sp)
2694  0132 1d0001        	subw	x,#1
2695  0135 1f0a          	ldw	(OFST-7,sp),x
2696  0137               L7561:
2697                     ; 83 		while ((c = *s++) != '\0' && isdigit(c)) {
2699  0137 1e12          	ldw	x,(OFST+1,sp)
2700  0139 1c0001        	addw	x,#1
2701  013c 1f12          	ldw	(OFST+1,sp),x
2702  013e 1d0001        	subw	x,#1
2703  0141 f6            	ld	a,(x)
2704  0142 5f            	clrw	x
2705  0143 97            	ld	xl,a
2706  0144 1f10          	ldw	(OFST-1,sp),x
2707  0146 1e10          	ldw	x,(OFST-1,sp)
2708  0148 2710          	jreq	L3561
2710  014a 9c            	rvf
2711  014b 1e10          	ldw	x,(OFST-1,sp)
2712  014d a30030        	cpw	x,#48
2713  0150 2f08          	jrslt	L3561
2715  0152 9c            	rvf
2716  0153 1e10          	ldw	x,(OFST-1,sp)
2717  0155 a3003a        	cpw	x,#58
2718  0158 2fac          	jrslt	L5561
2719  015a               L3561:
2720                     ; 88 	if (c == 'e' || c == 'E') {
2722  015a 1e10          	ldw	x,(OFST-1,sp)
2723  015c a30065        	cpw	x,#101
2724  015f 270a          	jreq	L1761
2726  0161 1e10          	ldw	x,(OFST-1,sp)
2727  0163 a30045        	cpw	x,#69
2728  0166 2703          	jreq	L61
2729  0168 cc020d        	jp	L3171
2730  016b               L61:
2731  016b               L1761:
2732                     ; 89 		int sign = 1;
2734  016b ae0001        	ldw	x,#1
2735  016e 1f05          	ldw	(OFST-12,sp),x
2736                     ; 90 		int i = 0;
2738  0170 5f            	clrw	x
2739  0171 1f07          	ldw	(OFST-10,sp),x
2740                     ; 91 		c = *s++;
2742  0173 1e12          	ldw	x,(OFST+1,sp)
2743  0175 1c0001        	addw	x,#1
2744  0178 1f12          	ldw	(OFST+1,sp),x
2745  017a 1d0001        	subw	x,#1
2746  017d f6            	ld	a,(x)
2747  017e 5f            	clrw	x
2748  017f 97            	ld	xl,a
2749  0180 1f10          	ldw	(OFST-1,sp),x
2750                     ; 92 		if (c == '+')
2752  0182 1e10          	ldw	x,(OFST-1,sp)
2753  0184 a3002b        	cpw	x,#43
2754  0187 2611          	jrne	L3761
2755                     ; 93 			c = *s++;
2757  0189 1e12          	ldw	x,(OFST+1,sp)
2758  018b 1c0001        	addw	x,#1
2759  018e 1f12          	ldw	(OFST+1,sp),x
2760  0190 1d0001        	subw	x,#1
2761  0193 f6            	ld	a,(x)
2762  0194 5f            	clrw	x
2763  0195 97            	ld	xl,a
2764  0196 1f10          	ldw	(OFST-1,sp),x
2766  0198 2041          	jra	L3071
2767  019a               L3761:
2768                     ; 94 		else if (c == '-') {
2770  019a 1e10          	ldw	x,(OFST-1,sp)
2771  019c a3002d        	cpw	x,#45
2772  019f 263a          	jrne	L3071
2773                     ; 95 			c = *s++;
2775  01a1 1e12          	ldw	x,(OFST+1,sp)
2776  01a3 1c0001        	addw	x,#1
2777  01a6 1f12          	ldw	(OFST+1,sp),x
2778  01a8 1d0001        	subw	x,#1
2779  01ab f6            	ld	a,(x)
2780  01ac 5f            	clrw	x
2781  01ad 97            	ld	xl,a
2782  01ae 1f10          	ldw	(OFST-1,sp),x
2783                     ; 96 			sign = -1;
2785  01b0 aeffff        	ldw	x,#65535
2786  01b3 1f05          	ldw	(OFST-12,sp),x
2787  01b5 2024          	jra	L3071
2788  01b7               L1071:
2789                     ; 99 			i = i*10 + (c - '0');
2791  01b7 1e10          	ldw	x,(OFST-1,sp)
2792  01b9 1d0030        	subw	x,#48
2793  01bc 1f03          	ldw	(OFST-14,sp),x
2794  01be 1e07          	ldw	x,(OFST-10,sp)
2795  01c0 90ae000a      	ldw	y,#10
2796  01c4 cd0000        	call	c_imul
2798  01c7 72fb03        	addw	x,(OFST-14,sp)
2799  01ca 1f07          	ldw	(OFST-10,sp),x
2800                     ; 100 			c = *s++;
2802  01cc 1e12          	ldw	x,(OFST+1,sp)
2803  01ce 1c0001        	addw	x,#1
2804  01d1 1f12          	ldw	(OFST+1,sp),x
2805  01d3 1d0001        	subw	x,#1
2806  01d6 f6            	ld	a,(x)
2807  01d7 5f            	clrw	x
2808  01d8 97            	ld	xl,a
2809  01d9 1f10          	ldw	(OFST-1,sp),x
2810  01db               L3071:
2811                     ; 98 		while (isdigit(c)) {
2813  01db 9c            	rvf
2814  01dc 1e10          	ldw	x,(OFST-1,sp)
2815  01de a30030        	cpw	x,#48
2816  01e1 2f08          	jrslt	L7071
2818  01e3 9c            	rvf
2819  01e4 1e10          	ldw	x,(OFST-1,sp)
2820  01e6 a3003a        	cpw	x,#58
2821  01e9 2fcc          	jrslt	L1071
2822  01eb               L7071:
2823                     ; 102 		e += i*sign;
2825  01eb 1e07          	ldw	x,(OFST-10,sp)
2826  01ed 1605          	ldw	y,(OFST-12,sp)
2827  01ef cd0000        	call	c_imul
2829  01f2 72fb0a        	addw	x,(OFST-7,sp)
2830  01f5 1f0a          	ldw	(OFST-7,sp),x
2831  01f7 2014          	jra	L3171
2832  01f9               L1171:
2833                     ; 105 		a *= 10.0;
2835  01f9 ae00d5        	ldw	x,#L3461
2836  01fc cd0000        	call	c_ltor
2838  01ff 96            	ldw	x,sp
2839  0200 1c000c        	addw	x,#OFST-5
2840  0203 cd0000        	call	c_fgmul
2842                     ; 106 		e--;
2844  0206 1e0a          	ldw	x,(OFST-7,sp)
2845  0208 1d0001        	subw	x,#1
2846  020b 1f0a          	ldw	(OFST-7,sp),x
2847  020d               L3171:
2848                     ; 104 	while (e > 0) {
2850  020d 9c            	rvf
2851  020e 1e0a          	ldw	x,(OFST-7,sp)
2852  0210 2ce7          	jrsgt	L1171
2854  0212 2014          	jra	L1271
2855  0214               L7171:
2856                     ; 109 		a *= 0.1;
2858  0214 ae00d1        	ldw	x,#L1371
2859  0217 cd0000        	call	c_ltor
2861  021a 96            	ldw	x,sp
2862  021b 1c000c        	addw	x,#OFST-5
2863  021e cd0000        	call	c_fgmul
2865                     ; 110 		e++;
2867  0221 1e0a          	ldw	x,(OFST-7,sp)
2868  0223 1c0001        	addw	x,#1
2869  0226 1f0a          	ldw	(OFST-7,sp),x
2870  0228               L1271:
2871                     ; 108 	while (e < 0) {
2873  0228 9c            	rvf
2874  0229 1e0a          	ldw	x,(OFST-7,sp)
2875  022b 2fe7          	jrslt	L7171
2876                     ; 112 	if (neg_flag == 1)
2878  022d 7b09          	ld	a,(OFST-8,sp)
2879  022f a101          	cp	a,#1
2880  0231 2607          	jrne	L5371
2881                     ; 113 		a = a*(-1);
2883  0233 96            	ldw	x,sp
2884  0234 1c000c        	addw	x,#OFST-5
2885  0237 cd0000        	call	c_fgneg
2887  023a               L5371:
2888                     ; 114 	return a;
2890  023a 96            	ldw	x,sp
2891  023b 1c000c        	addw	x,#OFST-5
2892  023e cd0000        	call	c_ltor
2896  0241 5b13          	addw	sp,#19
2897  0243 81            	ret
2922                     	xdef	_help_msg
2923                     	xdef	_process_command
2924                     	xdef	_usart_send
2925                     	xdef	_usart_send_byte
2926                     	xdef	_usart_setup
2927                     	xdef	_atof
2928                     	xref	_strncmp
2929                     	switch	.const
2930  00d1               L1371:
2931  00d1 3dcccccc      	dc.w	15820,-13108
2932  00d5               L3461:
2933  00d5 41200000      	dc.w	16672,0
2934  00d9               L3261:
2935  00d9 00000000      	dc.w	0,0
2936  00dd               L5641:
2937  00dd 68656c7000    	dc.b	"help",0
2938  00e2               L1641:
2939  00e2 73657400      	dc.b	"set",0
2940                     	xref.b	c_x
2960                     	xref	c_fgneg
2961                     	xref	c_fgmul
2962                     	xref	c_imul
2963                     	xref	c_fadd
2964                     	xref	c_rtol
2965                     	xref	c_itof
2966                     	xref	c_fmul
2967                     	xref	c_ltor
2968                     	end
