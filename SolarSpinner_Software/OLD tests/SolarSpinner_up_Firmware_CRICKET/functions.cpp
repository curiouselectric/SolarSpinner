#include <avr/sleep.h>
#include <avr/wdt.h>
#include <Arduino.h>
#include <util/delay.h>    // Adds delay_ms and delay_us functions
#include "config.h"
#include "functions.h"

void system_sleep()
{
  // set system into the sleep state
  // system wakes up when wtchdog is timed out
  cbi(ADCSRA, ADEN);                   // switch Analog to Digitalconverter OFF
  set_sleep_mode(SLEEP_MODE_PWR_DOWN); // sleep mode is set here
  //set_sleep_mode(SLEEP_MODE_IDLE);   // sleep mode is set here
  sleep_enable();
  sleep_mode();                        // System sleeps here
  sleep_disable();                     // System continues execution here when watchdog timed out
  sbi(ADCSRA, ADEN);                   // switch Analog to Digitalconverter ON
}

float return_voltage(int _read_pin)
{
  float _local_v;
  _local_v = analogRead(_read_pin) * (1.1 / 1024.0) * (110.0 / 10.0);   //Turn into a real (ish) voltage
  //Using 1M and 100k resistors. Vinternal Ref =approx 1.1
  return (_local_v);
}

void setup_watchdog(int ii) {
  // 0=16ms, 1=32ms,2=64ms,3=128ms,4=250ms,5=500ms
  // 6=1 sec,7=2 sec, 8=4 sec, 9= 8sec
  byte bb;
  int ww;
  if (ii > 9 ) ii = 9;
  bb = ii & 7;
  if (ii > 7) bb |= (1 << 5);
  bb |= (1 << WDCE);
  ww = bb;

  MCUSR &= ~(1 << WDRF);
  // start timed sequence
  WDTCR |= (1 << WDCE) | (1 << WDE);
  // set new watchdog timeout value
  WDTCR = bb;
  WDTCR |= _BV(WDIE);
}

void buzz_flash(int _flash, int _pin_buzzer)
{
  for (int i = 1; i <= _flash; i++)
  {
    tone(_pin_buzzer, 1000);       // This needs to be 8 x actual frequency - as clock is 1MHz
    delay(50);
    noTone(_pin_buzzer);
    delay(50);
  }
}

void flash(int _flash, int _pin_flash)
{
  for (int i = 1; i <= _flash; i++)
  {
    digitalWrite(_pin_flash, HIGH);    // let led blink
    delay(10);
    digitalWrite(_pin_flash, LOW);    // let led blink
    delay(50);
  }
}


void chirpHigh(int _pin_buzzer)  // Not enough water
{
  for (int i = 1000; i < 3000; i += 200)
  {
    tone(_pin_buzzer, i);
    _delay_ms(5);
  }
  noTone();
}

void chirpLow(int _pin_buzzer)  // Too much water
{
  for (int i = 3000; i > 1000; i -= 200)
  {
    tone(_pin_buzzer, i);
    _delay_ms(5);
  }
  noTone();
}
