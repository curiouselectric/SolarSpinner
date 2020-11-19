/*

  Ultra Low Power Led Flasher
  with AtTiny85 @ 1Mhz
  by Luca Soltoggio
  06/01/2014

  http://www.arduinoelettronica.com

*/

#include <avr/sleep.h>
#include <avr/wdt.h>

#ifndef cbi
#define cbi(sfr, bit) (_SFR_BYTE(sfr) &= ~_BV(bit))
#endif
#ifndef sbi
#define sbi(sfr, bit) (_SFR_BYTE(sfr) |= _BV(bit))
#endif

int pinLED0 = 0;  // convert to arduino digital pins
int pinLED1 = 1;
int pinLED2 = 3;
int pinLED3 = 4;
int sw = 2; // This sets it runnign - otherwise sleep
volatile boolean f_wdt = 1;

int n = 0;

void setup() {
  setup_watchdog(3); // approximately 1 seconds sleep
  randomSeed(analogRead(A0)); // Sets up a random seed
  //attachInterrupt(digitalPinToInterrupt(sw), ISR, falling)

}

void loop() {


  if (f_wdt == 1) {
    // wait for timed out watchdog / flag is set when a watchdog timeout occurs
    // WAKE UP
    f_wdt = 0;     // reset flag
    
    setLED(n);
    delay(100);   // Flash the LED
    clearLED();
    n++;
    if (n >= 8)
    {
      n = 0;
    }




//    long int timer = millis();
//    int randTime = random(100, 1000);
//
//    while (millis() <= timer + randTime)
//    {
//      setLED(n);
//      delay(2);   // Flash the LED
//      clearLED();
//      n++;
//      if (n >= 8)
//      {
//        n = 0;
//      }
//    }
//    setLED(n);
//    delay(500);

    system_sleep();
  }
}

// set system into the sleep state
// system wakes up when wtchdog is timed out
void system_sleep() {

  cbi(ADCSRA, ADEN);                   // switch Analog to Digitalconverter OFF

  set_sleep_mode(SLEEP_MODE_PWR_DOWN); // sleep mode is set here
  //set_sleep_mode(SLEEP_MODE_IDLE); // sleep mode is set here

  sleep_enable();

  sleep_mode();                        // System sleeps here

  sleep_disable();                     // System continues execution here when watchdog timed out
  sbi(ADCSRA, ADEN);                   // switch Analog to Digitalconverter ON
}

// 0=16ms, 1=32ms,2=64ms,3=128ms,4=250ms,5=500ms
// 6=1 sec,7=2 sec, 8=4 sec, 9= 8sec
void setup_watchdog(int ii) {

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

// Watchdog Interrupt Service / is executed when watchdog timed out
ISR(WDT_vect) {
  f_wdt = 1; // set global flag
}

void setLED(int LED)
{
  if (LED == 0)
  { //OK
    pinMode(pinLED0, OUTPUT);
    digitalWrite(pinLED0, HIGH);    
    pinMode(pinLED1, OUTPUT);
    digitalWrite(pinLED1, LOW);
    pinMode(pinLED2, INPUT);
    digitalWrite(pinLED2, LOW);
    pinMode(pinLED3, INPUT);
    digitalWrite(pinLED3, LOW);

  }
  else if (LED == 1)
  { //OK
    pinMode(pinLED0, OUTPUT);
    digitalWrite(pinLED0, LOW);    
    pinMode(pinLED1, OUTPUT);
    digitalWrite(pinLED1, HIGH);
    pinMode(pinLED2, INPUT);
    digitalWrite(pinLED2, LOW);
    pinMode(pinLED3, INPUT);
    digitalWrite(pinLED3, LOW);
  }
  else if (LED == 2)
  { //OK
    pinMode(pinLED0, INPUT);
    digitalWrite(pinLED0, LOW);    
    pinMode(pinLED1, OUTPUT);
    digitalWrite(pinLED1, HIGH);
    pinMode(pinLED2, OUTPUT);
    digitalWrite(pinLED2, LOW);
    pinMode(pinLED3, INPUT);
    digitalWrite(pinLED3, LOW);
  }
  else if (LED == 3)
  { //OK
    pinMode(pinLED0, INPUT);
    digitalWrite(pinLED0, LOW);    
    pinMode(pinLED1, OUTPUT);
    digitalWrite(pinLED1, LOW);
    pinMode(pinLED2, OUTPUT);
    digitalWrite(pinLED2, HIGH);
    pinMode(pinLED3, INPUT);
    digitalWrite(pinLED3, LOW);
  }
  else if (LED == 4)
  {
    pinMode(pinLED0, INPUT);
    digitalWrite(pinLED0, LOW);    
    pinMode(pinLED1, INPUT);
    digitalWrite(pinLED1, LOW);
    pinMode(pinLED2, OUTPUT);
    digitalWrite(pinLED2, HIGH);
    pinMode(pinLED3, OUTPUT);
    digitalWrite(pinLED3, LOW);
  }
  else if (LED == 5)
  { //OK
    pinMode(pinLED0, INPUT);
    digitalWrite(pinLED0, LOW);    
    pinMode(pinLED1, INPUT);
    digitalWrite(pinLED1, LOW);
    pinMode(pinLED2, OUTPUT);
    digitalWrite(pinLED2, LOW);
    pinMode(pinLED3, OUTPUT);
    digitalWrite(pinLED3, HIGH);
  }
  else if (LED == 6)
  { //OK
    pinMode(pinLED0, OUTPUT);
    digitalWrite(pinLED0, LOW);    
    pinMode(pinLED1, INPUT);
    digitalWrite(pinLED1, LOW);
    pinMode(pinLED2, INPUT);
    digitalWrite(pinLED2, LOW);
    pinMode(pinLED3, OUTPUT);
    digitalWrite(pinLED3, HIGH);
  }
  else if (LED == 7)
  { //OK
    pinMode(pinLED0, OUTPUT);
    digitalWrite(pinLED0, HIGH);    
    pinMode(pinLED1, INPUT);
    digitalWrite(pinLED1, LOW);
    pinMode(pinLED2, INPUT);
    digitalWrite(pinLED2, LOW);
    pinMode(pinLED3, OUTPUT);
    digitalWrite(pinLED3, LOW);
  }
  else
  {
    clearLED();
  }

}

void clearLED()
{
  digitalWrite(pinLED0, LOW);
  digitalWrite(pinLED1, LOW);
  digitalWrite(pinLED2, LOW);
  digitalWrite(pinLED3, LOW);
}
