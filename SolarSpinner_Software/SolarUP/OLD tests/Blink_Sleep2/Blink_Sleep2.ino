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

int pinLed = 2;
int pinMotor = 1;
int Vin = A3;
volatile boolean f_wdt = 1;

float Vlow = 3.0;
float Vhigh = 4.0;
float Vpower;

boolean LEDstate = LOW;

void setup() {
  pinMode(pinLed, OUTPUT);
  pinMode(pinMotor, OUTPUT);  
  setup_watchdog(6); // approximately 4 seconds sleep
  analogReference(INTERNAL);
}

void loop() {

  
  if (f_wdt == 1) { // wait for timed out watchdog / flag is set when a watchdog timeout occurs
    f_wdt = 0;     // reset flag

    // Want to check the voltage
    // If its higher than 4.5V (Vhigh) then switch on the motor
    // Stay switched on until voltage lower than 3.5 (Vlow)
    
    Vpower = analogRead(Vin) *(1.1/1024.0)*(110.0/10.0);   //Turn into a real (ish) voltage

    if(Vpower>=Vhigh)
    {
      while(Vpower>Vlow)
      {
        LEDstate = !LEDstate;
        digitalWrite(pinLed, LEDstate); // let led blink
        //digitalWrite(pinMotor, HIGH); // let led blink
        //delay(500);    
        Vpower = analogRead(Vin) *(1.1/1024.0)*(110.0/10.0);   //Turn into a real (ish) voltage
      }
    }

    //digitalWrite(pinMotor, LOW); // let led blink
    
//    while(analogRead(Vin)> 350)
//    {
//      digitalWrite(pinLed, HIGH); // let led blink
//      delay(100);
//      digitalWrite(pinLed, LOW);
//      delay(100);
//    }
//    else
//    {
//      digitalWrite(pinLed, LOW);
//    }
//    digitalWrite(pinLed, HIGH); // let led blink
//    delay(30);
//    digitalWrite(pinLed, LOW);
    
    pinMode(pinLed, INPUT); // set all used port to intput to save power
    pinMode(pinMotor, INPUT); // set all used port to intput to save power
    system_sleep();
    pinMode(pinLed, OUTPUT); // set all ports into state before sleep
    pinMode(pinMotor, OUTPUT); // set all ports into state before sleep
  }
}

// set system into the sleep state
// system wakes up when wtchdog is timed out
void system_sleep() {
  cbi(ADCSRA, ADEN);                   // switch Analog to Digitalconverter OFF

  set_sleep_mode(SLEEP_MODE_PWR_DOWN); // sleep mode is set here
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
