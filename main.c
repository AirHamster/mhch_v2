/*
	Firmware for rc model wings controller "mhch_v2"
	Air_Hamster
	2017
	*/
#include "stm8s.h"
#include <stdio.h>
#include <stdlib.h>
#include "iostm8s103.h"
//#include "sources\timers.c"
#include "varables.h"
#include "sources/timers.h"

main()
{
	//	Clock setup	================
		CLK_CKDIVR=0;                //	no dividers
		
		//for (i = 0; i < 0xFFFF; i++);	//hotfix for usart
		
		CLK_PCKENR1=0xff;//0x8B;     //0b10001011;        //clocking for TIM1, UART1, SPI i I2C

	// Watchdog setup =============
	/*	Later
		IWDG_KR = KEY_ACCESS;         //  Allow the IWDG registers to be programmed.
    IWDG_PR = 0x06;         //  Prescaler is 6 => ~1 sec 
    IWDG_RLR = 0xFF;        //  Counter for 1 sec.
    IWDG_KR = KEY_REFRESH;         //  Reset the counter.
		IWDG_KR = KEY_ENABLE;         //  Start the independent watchdog.
*/
	//Timers setup ================
		timer1_setup(TIM1_PRESCALER, TIM1_TOP);
		timer2_setup(TIM2_PRESCALER, TIM2_TOP);
		
		timer1_start();

	while (1);
}