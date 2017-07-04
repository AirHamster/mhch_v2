   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
2211                     ; 14 main()
2211                     ; 15 {
2213                     	switch	.text
2214  0000               _main:
2218                     ; 17 		CLK_CKDIVR=0;                //	no dividers
2220  0000 725f50c6      	clr	_CLK_CKDIVR
2221                     ; 21 		CLK_PCKENR1=0xff;//0x8B;     //0b10001011;        //clocking for TIM1, UART1, SPI i I2C
2223  0004 35ff50c7      	mov	_CLK_PCKENR1,#255
2224                     ; 23 		PA_CR1 = 1 << 3;
2226  0008 35085003      	mov	_PA_CR1,#8
2227                     ; 24 		PA_CR2 = 1 << 3;
2229  000c 35085004      	mov	_PA_CR2,#8
2230                     ; 25 		PA_DDR = 1<<3;
2232  0010 35085002      	mov	_PA_DDR,#8
2233                     ; 26 		PA_ODR = 1<<3;
2235  0014 35085000      	mov	_PA_ODR,#8
2236                     ; 36 		timer1_setup(TIM1_PRESCALER, TIM1_TOP);
2238  0018 aebb80        	ldw	x,#48000
2239  001b 89            	pushw	x
2240  001c ae0002        	ldw	x,#2
2241  001f cd0000        	call	_timer1_setup
2243  0022 85            	popw	x
2244                     ; 37 		timer2_setup(TIM2_PRESCALER, TIM2_TOP);
2246  0023 ae9c40        	ldw	x,#40000
2247  0026 89            	pushw	x
2248  0027 a603          	ld	a,#3
2249  0029 cd0000        	call	_timer2_setup
2251  002c 85            	popw	x
2252                     ; 38 		usart_setup();
2254  002d cd0000        	call	_usart_setup
2256                     ; 39 		usart_send("Hello", 5);
2258  0030 ae0005        	ldw	x,#5
2259  0033 89            	pushw	x
2260  0034 ae0000        	ldw	x,#L1441
2261  0037 cd0000        	call	_usart_send
2263  003a 85            	popw	x
2264                     ; 40 		timer2_start();
2266  003b cd0000        	call	_timer2_start
2268                     ; 41 _asm ("RIM");  //on interupts
2271  003e 9a            RIM
2273  003f               L3441:
2274                     ; 42 	while (1);
2276  003f 20fe          	jra	L3441
2289                     	xdef	_main
2290                     	xref	_usart_send
2291                     	xref	_usart_setup
2292                     	xref	_timer2_start
2293                     	xref	_timer2_setup
2294                     	xref	_timer1_setup
2295                     .const:	section	.text
2296  0000               L1441:
2297  0000 48656c6c6f00  	dc.b	"Hello",0
2317                     	end
