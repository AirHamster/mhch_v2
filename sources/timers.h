#include "stm8s.h"
#include <stdio.h>
#include <stdlib.h>



void timer1_setup(uint16_t prescaler, uint16_t top);
void timer2_setup(uint8_t prescaler, uint16_t top);
void timer4_setup (void);
void timer2_start(void);
void timer1_start(void);
void timer1_capture1(void);
void timer2_compare3 (void);
void timer4_stop (void);
void timer4_start (uint16_t cycles);
void timer4_overflow(void);
