#pragma once

//#define F_CPU 8000000  // This is used by delay.h library
#define F_CPU 1000000  // This is used by delay.h library

#include <avr/sleep.h>
#include <avr/wdt.h>
#include <stdlib.h>
#include <EEPROM.h>        // For writing values to the EEPROM
#include <avr/eeprom.h>    // For writing values to EEPROM
#include <avr/io.h>        // Adds useful constants
#include <util/delay.h>    // Adds delay_ms and delay_us functions
#include <Arduino.h>

#ifndef cbi
#define cbi(sfr, bit) (_SFR_BYTE(sfr) &= ~_BV(bit))
#endif
#ifndef sbi
#define sbi(sfr, bit) (_SFR_BYTE(sfr) |= _BV(bit))
#endif

// Pin Definitions

#define PIN_BUZZER  0
#define PIN_MOTOR   1
#define PIN_LED     2       // Cant do PWM on  D2.
#define PIN_VCAP    A3      // D3
#define PIN_VPV     A2      // D4


// Control parameters
#define VOLT_LOW    2.0
#define VOLT_HIGH   4.5
#define MAX_SPEED   75
#define MIN_SPEED   25

#define MODE        0       // This sets what the unit does: 0 = solar motor, 1 = solar cricket (day) 2 = solar cricket (night)

#define WDT_MODE    5       // 0=16ms, 1=32ms,2=64ms,3=128ms,4=250ms,5=500ms
                            // 6=1 sec,7=2 sec, 8=4 sec, 9= 8sec
