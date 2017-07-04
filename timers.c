#include "iostm8s103.h"
#include "sources/timers.h"
#include "sources/usart.h"
extern uint16_t top_val;
extern uint16_t bot_val;
extern uint16_t step;
extern uint16_t divider;
extern uint8_t increasing;
extern uint16_t in_pwm;

extern void calculate(uint8_t hight, uint8_t low);
/*Input PWM timer */
void timer1_setup(uint16_t prescaler, uint16_t top)
{
	TIM1_ARRH = (top >> 8);
	TIM1_ARRL = top & 0xFF;
	TIM1_PSCRH = prescaler >> 8; // clock/5
	TIM1_PSCRL = prescaler & 0xFF;
	
	//Capture initializing
	//1
	TIM1_CCMR1 = (2 << 4) | (1 << 0);	//filter and tim1 ch1 mapping (not a optional byte!!)
	TIM1_CCMR2 = (2 << 4) | (3 << 0);	//for second trigger
	//TIM1_CCER1 = (0 << 1);	//rising edge triggering for first input trigger
//	TIM1_CCER1 = (1 << 5);	//falling edge triggering for second input trigger
	TIM1_SMCR = (5 << 4) | (5 << 0);
	TIM1_CCER1 = (1 << 0) | (1 << 4); //capture enable
	TIM1_IER = (1 << 1) | (1 << 6);	//interrupts
	TIM1_CR1 |= TIM1_CR1_CEN;
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
	uint16_t result;
	TIM1_SR1 &= ~TIM1_SR1_CC1IF;
	result = TIM1_CCR1H << 8;
	result |= TIM1_CCR1L; 
	
	
}

void timer1_trigger(void)
{
	TIM1_SR1 &= ~TIM1_SR1_TIF;
	if (!(PC_IDR & (1 << 6)))
	{
//		in_width = TIM1_CNTRH << 8;
//		in_width = TIM1_CNTRL & 0xFF;
		calculate(TIM1_CNTRH, TIM1_CNTRL);
		in_pwm = TIM1_CNTRH << 8;
		in_pwm |= TIM1_CNTRL & 0xFF;
		TIM1_CNTRH = 0;
		TIM1_CNTRL = 0;
		
	}
}
void timer2_compare3(void)
{
	uint16_t timval, newval;
	TIM2_SR1 &= ~TIM2_SR1_CC3IF;
	timval = TIM2_CCR3H << 8;
	timval |= TIM2_CCR3L & 0xFF;
	if (!increasing)
	{
		timval -= step;
		if (timval <= bot_val)
		{
			increasing = 1;
		}
	}else{
		timval += step;
		if (timval >= top_val)
		{
			increasing = 0;
		}
	}
	TIM2_CCR3H = timval >> 8;
	TIM2_CCR3L = timval & 0xFF;
	
	
	//usart_send("t", 1);
}
void timer2_overflow (void)
{
	TIM2_SR1 &= ~TIM2_SR1_UIF;
	return;
}