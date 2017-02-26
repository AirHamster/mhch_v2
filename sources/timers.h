#include "stm8s.h"
#include <stdio.h>
#include <stdlib.h>


void timer1_setup(uint16_t prescaler, uint16_t top);
void timer2_setup(uint8_t prescaler, uint16_t top);
void timer2_start(void);
void timer1_start(void);
void timer1_capture1(void);


