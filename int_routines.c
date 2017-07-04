 #include "stm8s.h"
 #include "iostm8s103.h"
#include "sources/usart.h"
void UART_Resieved (void)
{
	usart_send("\nResieved ", 10);
	usart_send_byte(UART1_DR);
}
