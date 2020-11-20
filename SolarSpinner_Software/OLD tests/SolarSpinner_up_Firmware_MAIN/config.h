#pragma once

#include <avr/sleep.h>
#include <avr/wdt.h>

#ifndef cbi
#define cbi(sfr, bit) (_SFR_BYTE(sfr) &= ~_BV(bit))
#endif
#ifndef sbi
#define sbi(sfr, bit) (_SFR_BYTE(sfr) |= _BV(bit))
#endif

// Pin Definitions
#define PIN_LED     2      // Cant do PWM on pin 2!!
#define PIN_MOTOR   1
#define PIN_VCAP    A3
#define PIN_VPV     A2

// Control parameters

#define VOLT_LOW    2.0
#define VOLT_HIGH   4.5
