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
float Vpower_previous;
int motorPWM = 0; // This is the motor PWM value
boolean LEDstate = LOW;
boolean motorRun = LOW;


void setup()
{
  pinMode(PIN_LED, OUTPUT);
  pinMode(PIN_MOTOR, OUTPUT);
  setup_watchdog(5); // approximately 0.5 seconds sleep
  analogReference(INTERNAL);
  randomSeed(analogRead(PIN_VCAP)); // Sets up a random seed
}

void loop() {

  if (f_wdt == 1)
  {
    // Woken up on Watch Dog Timer
    f_wdt = 0;     // reset flag

    Vpower = return_voltage(PIN_VCAP);
    Vsolar = return_voltage(PIN_VPV);

    if (Vpower > VOLT_HIGH)
    {
      // Set motor running
      motorRun = HIGH;
      motorPWM = 255;
    }
    else if (Vpower < VOLT_LOW)
    {
      //stop motor
      motorRun = LOW;
      digitalWrite(PIN_MOTOR, LOW);     // Switch OFF motor
      LEDstate = LOW;
      digitalWrite(PIN_LED, LEDstate);  // Switch OFF led
    }
    else if (Vpower < Vpower_previous)
    {
      motorPWM--;   // Ramp down the motorPWM
      if (motorPWM <= 0)
      {
        motorPWM = 0;
      }
    }
    else if (Vpower > Vpower_previous)
    {
      motorPWM++;   // Ramp down the motorPWM
      if (motorPWM > 255)
      {
        motorPWM = 255;
      }
    }

    Vpower_previous = Vpower;

    if (motorRun == HIGH)
    {
      analogWrite(PIN_MOTOR, motorPWM);     // Set Motor to run at PWM level
      //digitalWrite(PIN_MOTOR, HIGH);      // Switch ON motor
      LEDstate = !LEDstate;
      digitalWrite(PIN_LED, LEDstate);    // let led blink
      delay(5);
    }

    //pinMode(PIN_LED, INPUT); // set all used port to intput to save power
    //pinMode(PIN_MOTOR, INPUT); // set all used port to intput to save power
    system_sleep();
    //pinMode(PIN_LED, OUTPUT); // set all ports into state before sleep
    //pinMode(PIN_MOTOR, OUTPUT); // set all ports into state before sleep
  }
}

// Watchdog Interrupt Service / is executed when watchdog timed out
ISR(WDT_vect) {
  f_wdt = 1; // set global flag
}
