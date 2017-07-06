/*
	Firmware for rc model wings controller "mhch_v2"
	Air_Hamster
	2017
	*/
	
#include "stm8s.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "iostm8s103.h"
#include "varables.h"
#include "sources/timers.h"
#include "sources/usart.h"
uint16_t top_val = 4000;
uint16_t bot_val = 2000;
uint16_t step = 0;
uint16_t divider = 40;
uint16_t in_pwm = 0;
uint8_t increasing;
uint8_t usart_counter = 0;
char buff[5];
char buff2[5];
// Yet, another good itoa implementation
// returns: the length of the number string

void calculate(uint8_t hight, uint8_t low)
{
	uint16_t result;
	
	result = hight << 8;
	result |= low;

	result -= 5000;
	step = result / divider;
	
}
main()
{
	//	Clock setup	================
		CLK_CKDIVR=0;                //	no dividers
		
		//for (i = 0; i < 0xFFFF; i++);	//hotfix for usart
		
		CLK_PCKENR1=0xff;//0x8B;     //0b10001011;        //clocking for TIM1, UART1, SPI i I2C
		
		PA_CR1 = 1 << 3;
		PA_CR2 = 1 << 3;
		PA_DDR = 1<<3;
		PA_ODR = 1<<3;
		
		PC_CR1 = 1 << 6;
		
//	Watchdog setup =============
	/*	Later
		IWDG_KR = KEY_ACCESS;         //  Allow the IWDG registers to be programmed.
    IWDG_PR = 0x06;         //  Prescaler is 6 => ~1 sec 
    IWDG_RLR = 0xFF;        //  Counter for 1 sec.
    IWDG_KR = KEY_REFRESH;         //  Reset the counter.
		IWDG_KR = KEY_ENABLE;         //  Start the independent watchdog.
*/
	//	Timers setup ================
		timer1_setup(TIM1_PRESCALER, TIM1_TOP);
		timer2_setup(TIM2_PRESCALER, TIM2_TOP);
		usart_setup();
		usart_send("Hello", 5);
		timer2_start();
		timer1_start();
_asm ("RIM");  //on interupts
	while (1);
}