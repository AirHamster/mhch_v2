   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
2202                     ; 4 void UART_Resieved (void)
2202                     ; 5 {
2204                     	switch	.text
2205  0000               _UART_Resieved:
2209                     ; 6 	usart_send("\nResieved ", 10);
2211  0000 ae000a        	ldw	x,#10
2212  0003 89            	pushw	x
2213  0004 ae0000        	ldw	x,#L1441
2214  0007 cd0000        	call	_usart_send
2216  000a 85            	popw	x
2217                     ; 7 	usart_send_byte(UART1_DR);
2219  000b c65231        	ld	a,_UART1_DR
2220  000e 5f            	clrw	x
2221  000f 97            	ld	xl,a
2222  0010 cd0000        	call	_usart_send_byte
2224                     ; 8 }
2227  0013 81            	ret
2240                     	xdef	_UART_Resieved
2241                     	xref	_usart_send
2242                     	xref	_usart_send_byte
2243                     .const:	section	.text
2244  0000               L1441:
2245  0000 0a5265736965  	dc.b	10,82,101,115,105,101
2246  0006 7665642000    	dc.b	"ved ",0
2266                     	end
