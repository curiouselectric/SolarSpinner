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

int pinLed = 2; // Cant do PWM on pin 2!!
int pinMotor = 1;
int Vcap = A3;
int Vpv = A2;

volatile boolean f_wdt = 1;

float Vlow = 2.1 ;
float Vhigh = 4.7;
float Vpower;
float Vsolar;

int motorPWM = 0; // This is the motor PWM value

boolean LEDstate = LOW;
boolean motorRun = LOW;

void setup() {
  pinMode(pinLed, OUTPUT);
  pinMode(pinMotor, OUTPUT);
  setup_watchdog(6); // approximately 1 seconds sleep
  analogReference(INTERNAL);
  randomSeed(analogRead(Vcap)); // Sets up a random seed
}

void loop() {
  
  if (f_wdt == 1) {
    // wait for timed out watchdog / flag is set when a watchdog timeout occurs
    // WAKE UP
    f_wdt = 0;     // reset flag

    Vpower = analogRead(Vcap) * (1.1 / 1024.0) * (110.0 / 10.0); //Turn into a real (ish) voltage
    Vsolar = analogRead(Vpv) * (1.1 / 1024.0) * (110.0 / 10.0); //Turn into a real (ish) voltage

    if (Vpower > Vhigh)
    {
      // Set motor running
      motorRun = HIGH;

    }
    else if (Vpower < Vlow)
    {
      //stop motor
      motorRun = LOW;
      digitalWrite(pinMotor, LOW); // Switch OFF motor
      LEDstate = LOW;
      digitalWrite(pinLed, LEDstate); // let led blink

    }

    if (motorRun == HIGH)
    {
      //analogWrite(pinMotor, random(100, 255)); // Set Motor to run at PWM level
      digitalWrite(pinMotor, HIGH); // Switch OFF motor
      LEDstate = !LEDstate;
      digitalWrite(pinLed, LEDstate); // let led blink
      
    }

    //pinMode(pinLed, INPUT); // set all used port to intput to save power
    //pinMode(pinMotor, INPUT); // set all used port to intput to save power
    system_sleep();
    //pinMode(pinLed, OUTPUT); // set all ports into state before sleep
    //(pinMotor, OUTPUT); // set all ports into state before sleep
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
