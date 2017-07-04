   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
2212                     ; 14 main()
2212                     ; 15 {
2214                     	switch	.text
2215  0000               _main:
2219                     ; 17 		CLK_CKDIVR=0;                //	no dividers
2221  0000 725f50c6      	clr	_CLK_CKDIVR
2222                     ; 21 		CLK_PCKENR1=0xff;//0x8B;     //0b10001011;        //clocking for TIM1, UART1, SPI i I2C
2224  0004 35ff50c7      	mov	_CLK_PCKENR1,#255
2225                     ; 23 		PA_CR1 = 1 << 3;
2227  0008 35085003      	mov	_PA_CR1,#8
2228                     ; 24 		PA_CR2 = 1 << 3;
2230  000c 35085004      	mov	_PA_CR2,#8
2231                     ; 25 		PA_DDR = 1<<3;
2233  0010 35085002      	mov	_PA_DDR,#8
2234                     ; 26 		PA_ODR = 1<<3;
2236  0014 35085000      	mov	_PA_ODR,#8
2237                     ; 28 		PC_CR1 = 1 << 6;
2239  0018 3540500d      	mov	_PC_CR1,#64
2240                     ; 39 		timer1_setup(TIM1_PRESCALER, TIM1_TOP);
2242  001c aefa00        	ldw	x,#64000
2243  001f 89            	pushw	x
2244  0020 ae0005        	ldw	x,#5
2245  0023 cd0000        	call	_timer1_setup
2247  0026 85            	popw	x
2248                     ; 40 		timer2_setup(TIM2_PRESCALER, TIM2_TOP);
2250  0027 ae9c40        	ldw	x,#40000
2251  002a 89            	pushw	x
2252  002b a603          	ld	a,#3
2253  002d cd0000        	call	_timer2_setup
2255  0030 85            	popw	x
2256                     ; 41 		usart_setup();
2258  0031 cd0000        	call	_usart_setup
2260                     ; 42 		usart_send("Hello", 5);
2262  0034 ae0005        	ldw	x,#5
2263  0037 89            	pushw	x
2264  0038 ae0000        	ldw	x,#L1441
2265  003b cd0000        	call	_usart_send
2267  003e 85            	popw	x
2268                     ; 43 		timer2_start();
2270  003f cd0000        	call	_timer2_start
2272                     ; 44 _asm ("RIM");  //on interupts
2275  0042 9a            RIM
2277  0043               L3441:
2278                     ; 45 	while (1);
2280  0043 20fe          	jra	L3441
2293                     	xdef	_main
2294                     	xref	_usart_send
2295                     	xref	_usart_setup
2296                     	xref	_timer2_start
2297                     	xref	_timer2_setup
2298                     	xref	_timer1_setup
2299                     .const:	section	.text
2300  0000               L1441:
2301  0000 48656c6c6f00  	dc.b	"Hello",0
2321                     	end
