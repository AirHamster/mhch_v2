#include "iostm8s103.h"
#include "sources/timers.h"
#include "sources/usart.h"
#include "sources/keys.h"
#define AMP_MAX 5000
#define AMP_MIN 1000
#define AMP_STEP 40
#define DIVIDER_MAX 200
char *itoa(int value, char *sp, int radix);
extern void reset_all(void);
extern uint8_t buttons_status;
extern uint16_t top_val;
extern uint16_t bot_val;
extern uint16_t step;
extern uint16_t divider;
extern uint8_t increasing;
extern uint16_t in_pwm;
extern char buff[5];
extern char buff2[5];
extern uint8_t usart_counter;
extern uint8_t startup;
extern uint16_t med_val;
extern uint16_t med_in_val;
extern uint16_t top_in_val;
extern uint16_t bot_in_val;
extern uint16_t tim4_cycles;
extern void calculate(uint16_t width);

extern @eeprom ee_top_in_val_h;
extern @eeprom ee_top_in_val_l;

extern @eeprom ee_bot_in_val_h;
extern @eeprom ee_bot_in_val_l;

void set_position(uint16_t val)
{
TIM2_CCR3H = val >> 8;
	TIM2_CCR3L = val & 0xFF;
}
/*Input PWM timer */
void timer1_setup(uint16_t prescaler, uint16_t top)
{
	TIM1_ARRH = (top >> 8);
	TIM1_ARRL = top & 0xFF;
	TIM1_PSCRH = prescaler >> 8; // clock/5
	TIM1_PSCRL = prescaler & 0xFF;
	
	//Capture initializing
	TIM1_CCMR1 = (1 << 0);
	TIM1_CCMR1 |= (4 << 4);	//filter
	
	TIM1_CCER1 |= (0 << 1);	//rising edge
	TIM1_CCER1 |= (1 << 0);	//1 ch enable
	
	TIM1_CCMR2 = (2	<< 0);	//falling edge
	TIM1_CCMR2 |= (4 << 4);	//filter
	TIM1_CCER1 |= (1 << 5); //2 ch polaryty
	TIM1_CCER1 |= (1 << 4);	//2 ch enable
	TIM1_SMCR = (5 << 4) | (4 << 0);
	TIM1_IER = (1 << 1) | (1 << 2);
}

/* Output PWM timer */
void timer2_setup(uint8_t prescaler, uint16_t top)
{
	TIM2_ARRH = (top >> 8);
	TIM2_ARRL = top & 0xFF;
	TIM2_CCR3H = 3000 >> 8;
	TIM2_CCR3L = 3000 & 0xFF;
	TIM2_PSCR = prescaler; // clock/8
	TIM2_CCMR3 = (6 << 4) | (1 << 3); //PWM and preload buffer
	TIM2_CCER2 = 1;
	TIM2_IER |= (1 << 0);
	TIM2_IER |= (1 << 3);
}

/* Buttons 500hz timer  */
void timer4_setup(void)
{
	TIM4_ARR = 249;
	TIM4_CR1 = 1 << 7;
	TIM4_IER = 1;
	TIM4_PSCR = 7;	
}

void timer1_start(void)
{
	TIM1_CR1 |= TIM1_CR1_CEN;
}

void timer2_start(void)
{
	TIM2_CR1 |= TIM2_CR1_CEN;
}
void timer4_start(uint16_t cycles)
{
	tim4_cycles = cycles;
	TIM4_CR1 |= TIM4_CR1_CEN;
}

void timer4_stop (void)
{
	TIM4_CR1 &= ~TIM4_CR1_CEN;
}

void timer4_overflow(void)
{
	TIM4_SR &= ~TIM4_SR1_UIF;
	if (--tim4_cycles == 0)
	{
		if(buttons_status == TOP_RELEASED | buttons_status == BOT_RELEASED)
		{
			if (in_pwm < med_in_val)
			set_position(med_val);
			buttons_status = 0;
			//restore wings & write eeprom
		}
		else if (buttons_status == TOP_PRESSED)
		{
			tim4_cycles = 150;
			if (in_pwm < med_in_val){
				if (top_val < AMP_MAX){
				top_val += AMP_STEP;
				bot_val -= AMP_STEP;
				set_position(top_val);
				}
			}else{
					if (divider > 1){
						divider--;
						divider--;
					}
				}
		}else if (buttons_status == BOT_PRESSED)
		{
			tim4_cycles = 150;
				if (in_pwm < med_in_val)
			{
				if (top_val > AMP_MIN)
				{
				top_val -= AMP_STEP;
				bot_val += AMP_STEP;
				set_position(top_val);
				}
			}else{
				if (divider < DIVIDER_MAX){
						divider++;
						divider++;
					}
			}
		}else if (buttons_status == BOTH_PRESSED)
		{
			set_position(top_val);
			reset_all();
//			set_defaults();
			//reset
		}
	}
}
void timer1_capture1(void)
{
	uint16_t result;
	if ((TIM1_SR1 & TIM1_SR1_CC1IF))
	{
			TIM1_SR1 &= ~TIM1_SR1_CC1IF;
	}else if ((TIM1_SR1 & TIM1_SR1_CC2IF))
	{
	TIM1_SR1 &= ~TIM1_SR1_CC2IF;
		in_pwm = TIM1_CCR2H << 8;
	in_pwm |= TIM1_CCR2L & 0xFF;
	if (startup == 0)
	{
		calculate(in_pwm);
	}
		else if (startup == 100)
		{ 
				if (in_pwm > med_in_val)
				{
					startup--;
					
				}else{
					startup = 0;
				}
		}else if ((startup > 50) && (startup < 100)){
		startup--;
		}else if (startup == 50)
		{
			TIM2_CCR3H = top_val >> 8;
			TIM2_CCR3L = top_val & 0xFF;
			top_in_val = in_pwm;
			startup--;
		}else if(startup == 49){
					if (in_pwm < med_in_val)
					{
						startup--;
					}
			}else if ((startup > 1) && (startup < 49))
			{
				startup--;
			}else if (startup == 1)
			{
				startup = 0;
				bot_in_val = in_pwm;
				FLASH_DUKR = 0xAE;
				FLASH_DUKR = 0x56;
				ee_top_in_val_h = top_in_val >> 8;
				ee_top_in_val_l = top_in_val & 0xFF;
				
				ee_bot_in_val_h = bot_in_val >> 8;
				ee_bot_in_val_l = bot_in_val & 0xFF;
				
				TIM2_CCR3H = med_val >> 8;
				TIM2_CCR3L = med_val & 0xFF;
			}

	
}
}
void timer1_capture2(void)
{
	uint16_t result;
	TIM1_SR1 &= ~TIM1_SR1_CC2IF;
	
	
}

void timer1_trigger(void)
{
	TIM1_SR1 &= ~TIM1_SR1_TIF;
	if (!(PC_IDR & (1 << 6)))
	{

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

if (usart_counter++ == 3)
	{
		usart_counter = 0;
		usart_send("\nOUT: ", 6);
		
	itoa(timval, &buff[0], 10);
		usart_send(&buff[0], 5);
		
		usart_send("   IN: ", 7);
		itoa(in_pwm, &buff2[0], 10);
		usart_send(&buff2[0], 5);
	}
	//usart_counter++;
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

// Yet, another good itoa implementation
// returns: the length of the number string
char *itoa(int value, char *sp, int radix)
{
    char tmp[16];// be careful with the length of the buffer
    char *tp = tmp;
    int i;
		int len;
    unsigned v;

    int sign = (radix == 10 && value < 0);    
    if (sign)
        v = -value;
    else
        v = (unsigned)value;

    while (v || tp == tmp)
    {
        i = v % radix;
        v /= radix; // v/=radix uses less CPU clocks than v=v/radix does
        if (i < 10)
          *tp++ = i+'0';
        else
          *tp++ = i + 'a' - 10;
    }

    len = tp - tmp;

    if (sign) 
    {
        *sp++ = '-';
        len++;
    }

    while (tp > tmp)
        *sp++ = *--tp;

    return sp;
}

