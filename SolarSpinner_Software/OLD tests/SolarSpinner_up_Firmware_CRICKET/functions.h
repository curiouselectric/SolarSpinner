#pragma once

void system_sleep();
float return_voltage(int my_read_pin);
void setup_watchdog(int _ii); 
void buzz_flash(int my_flash, int my_pin_buzzer);
void flash(int my_flash, int my_pin_flash);
void chirpLow(int my_pin_buzzer);
void chirpHigh(int my_pin_buzzer);
