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
int Vcap = A3;
int Vsolar = A2;
volatile boolean f_wdt = 1;

float Vlow = 3.8;
float Vhigh = 4.0;
float Vpower;   // This stores the calculated voltage
int motorPWM = 0; // This is the motor PWM value

void setup() {
  pinMode(pinLed, OUTPUT);
  pinMode(pinMotor, OUTPUT);  
  setup_watchdog(4); // approximately 0.25 seconds sleep
  analogReference(INTERNAL);
}

void loop() {
  if (f_wdt == 1) { // wait for timed out watchdog / flag is set when a watchdog timeout occurs
    f_wdt = 0;     // reset flag

    // Want to check the voltage
    // If its higher than Vhigh then increment the motor PWM
    // If its lower than Vlow then decrement the motor PWM
    
    Vpower = analogRead(Vcap) *(1.1/1024.0)*(110.0/10.0);   //Turn into a real (ish) voltage

    if(Vpower>=Vhigh)
    {  
      digitalWrite(pinLed, HIGH); // LED ON      
      
      motorPWM++;
      if(motorPWM>255)
      {
        motorPWM = 255;    
      }
    }   
    else if(Vpower<=Vlow)
    {
      digitalWrite(pinLed, LOW); // LED OFF
      
      motorPWM--;
      if(motorPWM<0)
      {
        motorPWM = 0;    
      }      
    }
    
    analogWrite(pinMotor, motorPWM); // Set Motor to run at PWM level     
    system_sleep();
  }
}

// set system into the sleep state
// system wakes up when wtchdog is timed out
void system_sleep() {
  cbi(ADCSRA, ADEN);                   // switch Analog to Digitalconverter OFF

  set_sleep_mode(SLEEP_MODE_IDLE); // sleep mode is set here
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
