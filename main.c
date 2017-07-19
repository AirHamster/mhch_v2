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
@eeprom default_top_val_h = 4000 >> 8;
@eeprom default_top_val_l = 4000 & 0xFF;

@eeprom default_bot_val_h = 2000 >> 8;
@eeprom default_bot_val_l = 2000 & 0xFF;

@eeprom default_top_in_val_h = 6400 >> 8;
@eeprom default_top_in_val_l = 6400 & 0xFF;

@eeprom default_bot_in_val_h = 3500 >> 8;
@eeprom default_bot_in_val_l = 3500 & 0xFF;

@eeprom default_divider = 40;

//----- Non-defaul values
@eeprom ee_top_val_h = 4000 >> 8;
@eeprom ee_top_val_l = 4000 & 0xFF;

@eeprom ee_bot_val_h = 2000 >> 8;
@eeprom ee_bot_val_l = 2000 & 0xFF;

@eeprom ee_top_in_val_h = 6400 >> 8;
@eeprom ee_top_in_val_l = 6400 & 0xFF;

@eeprom ee_bot_in_val_h = 3500 >> 8;
@eeprom ee_bot_in_val_l = 3500 & 0xFF;

@eeprom ee_divider = 41;
/*
uint16_t top_val = 4000;
uint16_t bot_val = 2000;
uint16_t med_val = 3000;
uint16_t top_in_val = 6400;
uint16_t bot_in_val = 3500;
uint16_t med_in_val;
uint16_t step = 0;
uint16_t divider = 40;
uint16_t in_pwm = 0;
uint8_t increasing = 1;
uint8_t usart_counter = 0;
uint8_t startup;
uint8_t buttons_status;
uint16_t tim4_cycles;
*/
uint16_t i = 0;
uint16_t top_val = 4000;
uint16_t bot_val = 2000;
uint16_t med_val = 3000;
uint16_t top_in_val = 6400;
uint16_t bot_in_val = 3500;
uint16_t med_in_val;
uint16_t step = 0;
uint16_t divider;
uint16_t in_pwm = 0;
uint8_t increasing = 1;
uint8_t usart_counter = 0;
uint8_t startup;
uint8_t buttons_status;
uint16_t tim4_cycles;
extern void set_position(uint16_t val);
char buff[5];
char buff2[5];


void calculate(uint16_t width)
{
	if (width < bot_val)
		width = bot_in_val;
	if (width > top_in_val)
		width = top_in_val;
		if (in_pwm < (bot_in_val + 200)){
			if (buttons_status == 0)
				set_position(med_val);
				
			step = 0;
		}else{
			step = (width - bot_in_val) / divider;
		}	
}

void reset_all(void)
{
		ee_top_val_l = default_top_val_l;
		ee_top_val_h = default_top_val_h;
		
		ee_bot_val_l = default_bot_val_l;
		ee_bot_val_h = default_bot_val_h;
		
		ee_top_in_val_l = default_top_in_val_l;
		ee_top_in_val_h = default_top_in_val_h;
		
		ee_bot_in_val_l = default_bot_in_val_l;
		ee_bot_in_val_h = default_bot_in_val_h;
		
		ee_divider = default_divider;
		
		WWDG_CR = 0xff;
		WWDG_CR &= 0xBF;
}
main()
{
	//	Clock setup	================
		CLK_CKDIVR=0;                //	no dividers
		startup = 100;
		
		for (i == 0; i < 60000; i++);
		
		top_val = ee_top_val_l;
		top_val |= ee_top_val_h << 8;
		
		bot_val = ee_bot_val_l;
		bot_val |= ee_bot_val_h << 8;
		
		top_in_val = ee_top_in_val_l;
		top_in_val |= ee_top_in_val_h << 8;
		
		bot_in_val = ee_bot_in_val_l;
		bot_in_val |= ee_bot_in_val_h << 8;
		
		divider = ee_divider;
		med_in_val = (top_in_val - bot_in_val) / 2 + bot_in_val;
		//for (i = 0; i < 0xFFFF; i++);	//hotfix for usart
		
		CLK_PCKENR1=0xff;//0x8B;     //0b10001011;        //clocking for TIM1, UART1, SPI i I2C
		
		PA_CR1 = 1 << 3;
		PA_CR2 = 1 << 3;
		PA_DDR = 1<<3;
		PA_ODR = 1<<3;
		
		PC_CR1 = 1 << 6;
		
		PD_CR2 = 1 << 3;
		PC_CR2 = 1 << 5;
		
		EXTI_CR1 = (2 << 6) | (2 << 4);
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
		timer4_setup();
		usart_setup();
		usart_send("Hello", 5);
		timer2_start();
		timer1_start();
_asm ("RIM");  //on interupts
	while (1)
	{
		/*
		if ( () && ())
		{
		}else if ( () )
		{
		}else if ( () )
		{
		}
		*/
	}
}