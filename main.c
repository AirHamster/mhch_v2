/*
	Firmware for rc model wings controller "mhch_v2"
	Air_Hamster
	2017
	*/
	
#include "stm8s.h"
#include <stdio.h>
#include <stdlib.h>
#include "iostm8s103.h"
#include "varables.h"
#include "sources/timers.h"
#include "sources/usart.h"
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
_asm ("RIM");  //on interupts
	while (1);
}