/*

  Solar Spinner - Solar ATTiny85 Motor Control Unit
  with AtTiny85 @ 1Mhz  (??)

  By:   Matt Little
  Date: 19/11/2020
        heelo@curiouselectric.co.uk

  This code sends the ATTiny85 to sleep using the watchdog timer
  The Capacitor voltage is checked and if >VOLT_HIGH then the unit will switch on
  Until Capacitor voltage < VOLT_LOW

  The speed of the motor is set with a random PWM?

*/

#include "config.h"
#include "functions.h"

// Program variables
volatile boolean f_wdt = 1;
float Vpower;
float Vsolar;
int motorPWM = 0; // This is the motor PWM value
boolean LEDstate = LOW;
boolean motorRun = LOW;


void setup() 
{
  pinMode(PIN_LED, OUTPUT);
  pinMode(PIN_MOTOR, OUTPUT);
  setup_watchdog(6); // approximately 1 seconds sleep
  analogReference(INTERNAL);
  randomSeed(analogRead(PIN_VCAP)); // Sets up a random seed
}

void loop() {
  
  if (f_wdt == 1) 
  {
    // wait for timed out watchdog / flag is set when a watchdog timeout occurs
    // WAKE UP
    f_wdt = 0;     // reset flag

    //Vpower = analogRead(PIN_VCAP) * (1.1 / 1024.0) * (110.0 / 10.0); //Turn into a real (ish) voltage
    //Vsolar = analogRead(PIN_VPV)  * (1.1 / 1024.0) * (110.0 / 10.0); //Turn into a real (ish) voltage

    Vpower = return_voltage(PIN_VCAP);
    Vsolar = return_voltage(PIN_VPV);

    if (Vpower > VOLT_HIGH)
    {
      // Set motor running
      motorRun = HIGH;
    }
    else if (Vpower < VOLT_LOW)
    {
      //stop motor
      motorRun = LOW;
      digitalWrite(PIN_MOTOR, LOW); // Switch OFF motor
      LEDstate = LOW;
      digitalWrite(PIN_LED, LEDstate); // let led blink
    }
    
    if (motorRun == HIGH)
    {
      //analogWrite(PIN_MOTOR, random(150, 255)); // Set Motor to run at PWM level
      digitalWrite(PIN_MOTOR, HIGH); // Switch ON motor
      LEDstate = !LEDstate;
      digitalWrite(PIN_LED, LEDstate); // let led blink
      delay(50);
    }

    //pinMode(pinLed, INPUT); // set all used port to intput to save power
    //pinMode(pinMotor, INPUT); // set all used port to intput to save power
    system_sleep();
    //pinMode(pinLed, OUTPUT); // set all ports into state before sleep
    //(pinMotor, OUTPUT); // set all ports into state before sleep
  }
}

//// set system into the sleep state
//// system wakes up when wtchdog is timed out
//void system_sleep() {
//
//  cbi(ADCSRA, ADEN);                   // switch Analog to Digitalconverter OFF
//
//  set_sleep_mode(SLEEP_MODE_PWR_DOWN); // sleep mode is set here
//  //set_sleep_mode(SLEEP_MODE_IDLE); // sleep mode is set here
//
//  sleep_enable();
//
//  sleep_mode();                        // System sleeps here
//
//  sleep_disable();                     // System continues execution here when watchdog timed out
//  sbi(ADCSRA, ADEN);                   // switch Analog to Digitalconverter ON
//}

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
