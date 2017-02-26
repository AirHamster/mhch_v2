#include "iostm8s103.h"
#include "sources\timers.h"

/* PWM timer */
void timer1_setup(uint16_t prescaler, uint16_t top)
 {
  TIM1_PSCRH = prescaler >> 8;
  TIM1_PSCRL = prescaler & 0xFF;
  TIM1_ARRH = (top) >> 8; //	overflow frequency = 16Ì / 8 / 1000 = 2000 Ãö
  TIM1_ARRL = (top)& 0xFF;

	TIM1_IER |= TIM1_IER_CC1IE;	//compare  int for recalculation
	TIM1_CCMR1 |= (6<<4) | TIM1_CCMR_OCxPE;	//PWM mode1
/*
	TIM1_CCMR1 |= TIM1_CCMR_CCxS;
	TIM1_CCER1 &= ~TIM1_CCER1_CC1P;
	TIM1_CCMR2 |= 2; //(CC2S = 0b10)
	TIM1_CCER1 |= TIM1_CCER1_CC2P;
	TIM1_SMCR |= (4<<0)|(5<<4);
	TIM1_CCER1 |= TIM1_CCER1_CC1E | TIM1_CCER1_CC2E;
	*/
//  TIM1_CR1 |= TIM1_CR1_URS; //only overflow int
//  TIM1_EGR |= TIM1_EGR_UG;  //call Update Event
//  TIM1_IER |= TIM1_IER_UIE; //int enable
 }
 
 
 void timer2_setup(uint8_t prescaler, uint16_t top)
 {
	 TIM2_PSCR = prescaler;
	 TIM2_ARRH = (top) >> 8; //	overflow frequency = 16Ì / 8 / 1000 = 2000 Ãö
	 TIM2_ARRL = (top)& 0xFF;
 }
 
 void timer4_setup(uint8_t prescaler, uint8_t top)
 {
	 
 }
 
 void timer1_start(void)
 {
	 TIM2_CR1 |= TIM1_CR1_CEN;
 }
 
 void timer1_capture1(void)
 {
	 
	 
 }
 
 void timer2_compare1(void)
 {
	 
 }