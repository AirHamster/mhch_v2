#include <string.h>
#include "stm8s.h"
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include "iostm8s103.h"
#include "sources/usart.h"
const char help_msg[] = "Plazma probe controller\n Usage:\n    start - start measurements\n    stop - finish measurements\n    set <voltage> - probe voltage setup\n    native - non-formated output\n    ascii - output in ascii presentation\n";

void usart_setup(void)
{
	UART1_BRR1=0x68;     //9600 bod
	UART1_BRR2=0x03;
	UART1_CR2 |= UART1_CR2_REN; //reseiving
	UART1_CR2 |= UART1_CR2_TEN; //transmiting 
	UART1_CR2 |= UART1_CR2_RIEN; //reseive int
	UART1_SR = 0;
}

void process_command(char *cmd)
{
	uint16_t num;
	uint8_t lenth;
	double input;
	/* Voltage setup  */
	if(strncmp(cmd, "set", 3) == 0)
	{

	}

	/* Manual  */
	if(strncmp(cmd, "help", 4) == 0)
	{
		usart_send(help_msg, sizeof(help_msg)-1);
	}
}
void usart_send_byte(int byte)
{

	/* U0IER &= ~(1 << RBR_Enable );     // Disable RBR */
	while((UART1_SR & 0x80) == 0x00);
	UART1_DR = byte;
	/* U0IER |= (1 << RBR_Enable );      // Re-enable RBR  */
}
void usart_send(unsigned char *BufferPtr, unsigned short Length )
{
	/* U0IER &= ~(1 << RBR_Enable );     // Disable RBR */

	while ( Length != 0 )
	{
		while((UART1_SR & 0x80) == 0x00);
		UART1_DR = *BufferPtr;;
		BufferPtr++;
		Length--;
	}
	/* U0IER |= (1 << RBR_Enable );      // Re-enable RBR  */

	return;
}



double atof(const char *s)
{
	// This function stolen from either Rolf Neugebauer or Andrew Tolmach. 
	// Probably Rolf.
	double a = 0.0;
	int e = 0;
	int c;
	uint8_t neg_flag = 0;
	if ((c = *s) == '-')
	{
		neg_flag = 1;
		*s++;
	}
	while ((c = *s++) != '\0' && isdigit(c)) {
		a = a*10.0 + (c - '0');
	}
	if (c == '.') {
		while ((c = *s++) != '\0' && isdigit(c)) {
			a = a*10.0 + (c - '0');
			e = e-1;
		}
	}
	if (c == 'e' || c == 'E') {
		int sign = 1;
		int i = 0;
		c = *s++;
		if (c == '+')
			c = *s++;
		else if (c == '-') {
			c = *s++;
			sign = -1;
		}
		while (isdigit(c)) {
			i = i*10 + (c - '0');
			c = *s++;
		}
		e += i*sign;
	}
	while (e > 0) {
		a *= 10.0;
		e--;
	}
	while (e < 0) {
		a *= 0.1;
		e++;
	}
	if (neg_flag == 1)
		a = a*(-1);
	return a;
}

