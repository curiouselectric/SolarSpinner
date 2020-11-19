#include "functions.h"
#include <avr/sleep.h>
#include <avr/wdt.h>
#include <Arduino.h>
#include "config.h"


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
  _local_v = analogRead(_read_pin) * (1.1 / 1024.0) * (110.0 / 10.0); //Turn into a real (ish) voltage
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
