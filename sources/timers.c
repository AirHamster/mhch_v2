#include "iostm8s103.h"
#include "sources/timers.h"
#include "sources/usart.h"

/*Input PWM timer */
void timer1_setup(uint16_t prescaler, uint16_t top)
{

}

/* Output PWM timer */
void timer2_setup(uint8_t prescaler, uint16_t top)
{
	TIM2_ARRH = (top >> 8);
	TIM2_ARRL = top & 0xFF;
		TIM2_CCR3H = 6000 >> 8;
	TIM2_CCR3L = 6000 & 0xFF;
	TIM2_PSCR = prescaler; // clock/8
	TIM2_CCMR3 = (6 << 4) | (1 << 3); //PWM and preload buffer
	TIM2_CCER2 = 1;
	TIM2_IER |= (1 << 0);
	TIM2_IER |= (1 << 3);


	//TIM2_IER |=	TIM2_IER_CC3IE | TIM2_IER_UIE;	//overflow int and compare 1  

}

/* Buttons antidrebezg timer  */
void timer4_setup(uint8_t prescaler, uint8_t top)
{

}

void timer1_start(void)
{
	TIM1_CR1 |= TIM1_CR1_CEN;
}

void timer2_start(void)
{
	TIM2_CR1 |= TIM2_CR1_CEN;

}
void timer4_start(void)
{

}

void timer1_capture1(void)
{


}

void timer2_compare3(void)
{
	TIM2_SR1 &= ~TIM2_SR1_CC3IF;
	//usart_send("t", 1);
}
void timer2_overflow (void)
{
	TIM2_SR1 &= ~TIM2_SR1_UIF;
	return;
}