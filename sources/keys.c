#include "iostm8s103.h"
#include "sources/keys.h"
#include "varables.h"
#include <stdio.h>
#include <stdlib.h>
#include "sources/timers.h"
extern void timer4_start (uint16_t cycles);
extern uint8_t buttons_status;

extern @eeprom ee_top_val_h;
extern @eeprom ee_top_val_l;

extern @eeprom ee_bot_val_h;
extern @eeprom ee_bot_val_l;
extern @eeprom ee_divider;

extern uint16_t top_val;
extern uint16_t bot_val;
extern uint16_t med_val;
extern uint16_t top_in_val;
extern uint16_t bot_in_val;
extern uint16_t med_in_val;
extern uint16_t step;
extern uint16_t divider;
extern uint16_t in_pwm;


extern set_position (uint16_t val);
void portc_event (void)
{
	if ((PC_IDR & (1 << 5)) == 0)
	{
		if ((PD_IDR & (1 << 3)) == 0)
		{
			timer4_start(1000);
			buttons_status = BOTH_PRESSED;
		}else{
			timer4_start(150);
			buttons_status = BOT_PRESSED;
		}
	}else{
			timer4_start(500);
			buttons_status = BOT_RELEASED;
			
			FLASH_DUKR = 0xAE;
			FLASH_DUKR = 0x56;
			if (in_pwm < med_in_val){
			//set_position(med_val);
			
			ee_top_val_h = top_val >> 8;
			ee_top_val_l |= top_val & 0xFF;
			
			ee_bot_val_h = bot_val >> 8;
			ee_bot_val_l |= bot_val & 0xFF;
			
		}else{
			ee_divider = divider;
		}
	}
}

void  portd_event(void)
{
		if ((PD_IDR & (1 << 3)) ==0)
	{
		if ((PC_IDR & (1 << 5)) == 0)
		{
			timer4_start(1000);
			buttons_status = BOTH_PRESSED;
		}else{
			timer4_start(150);
			buttons_status = TOP_PRESSED;
		}
	}else{
			timer4_start(500);
			buttons_status = TOP_RELEASED;
			
			FLASH_DUKR = 0xAE;
			FLASH_DUKR = 0x56;
			if (in_pwm < med_in_val){
			//set_position(med_val);
			
			ee_top_val_h = top_val >> 8;
			ee_top_val_l |= top_val & 0xFF;
			
			ee_bot_val_h = bot_val >> 8;
			ee_bot_val_l |= bot_val & 0xFF;
			
		}else{
			ee_divider = divider;
		}
	}
}