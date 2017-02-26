   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
2204                     ; 14 main()
2204                     ; 15 {
2206                     	switch	.text
2207  0000               _main:
2211                     ; 17 		CLK_CKDIVR=0;                //	no dividers
2213  0000 725f50c6      	clr	_CLK_CKDIVR
2214                     ; 21 		CLK_PCKENR1=0xff;//0x8B;     //0b10001011;        //clocking for TIM1, UART1, SPI i I2C
2216  0004 35ff50c7      	mov	_CLK_PCKENR1,#255
2217                     ; 32 		timer1_setup(TIM1_PRESCALER, TIM1_TOP);
2219  0008 aefa00        	ldw	x,#64000
2220  000b 89            	pushw	x
2221  000c ae0005        	ldw	x,#5
2222  000f cd0000        	call	_timer1_setup
2224  0012 85            	popw	x
2225                     ; 33 		timer2_setup(TIM2_PRESCALER, TIM2_TOP);
2227  0013 aefa00        	ldw	x,#64000
2228  0016 89            	pushw	x
2229  0017 a605          	ld	a,#5
2230  0019 cd0000        	call	_timer2_setup
2232  001c 85            	popw	x
2233                     ; 35 		timer1_start();
2235  001d cd0000        	call	_timer1_start
2237  0020               L1441:
2238                     ; 37 	while (1);
2240  0020 20fe          	jra	L1441
2253                     	xdef	_main
2254                     	xref	_timer1_start
2255                     	xref	_timer2_setup
2256                     	xref	_timer1_setup
2275                     	end
