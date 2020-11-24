/*

  Solar Spinner - Solar ATTiny85 Motor Control Unit
  with AtTiny85 @ 1Mhz  (??)

  By:   Matt Little
  Date: 19/11/2020
        heelo@curiouselectric.co.uk

  This code sends the ATTiny85 to sleep using the watchdog timer
  The Capacitor voltage is checked and if >VOLT_HIGH then the unit will switch on
  Until Capacitor voltage < VOLT_LOW

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
boolean modeRun = LOW;
int local_mode;

void setup()
{
  pinMode(PIN_LED, OUTPUT);
  pinMode(PIN_MOTOR, OUTPUT);
  pinMode(PIN_BUZZER, OUTPUT);

  setup_watchdog(WDT_MODE); // approximately 0.5 seconds sleep
  analogReference(INTERNAL);
  //randomSeed(analogRead(PIN_VCAP)); // Sets up a random seed
  local_mode = MODE;
}

void loop() {

  if (f_wdt == 1)
  {
    // Woken up on Watch Dog Timer
    f_wdt = 0;     // reset flag

    Vpower = return_voltage(PIN_VCAP);
    Vsolar = return_voltage(PIN_VPV);

    switch (local_mode)
    {
      case 0:
        // In this case we are in solar motor mode
        if (Vpower > VOLT_HIGH)
        {
          // Set motor running
          modeRun = HIGH;
          motorPWM = MAX_SPEED;
        }
        else if (Vpower < VOLT_LOW)
        {
          // Too low - switch off everything and go to sleep!
          modeRun = LOW;
          analogWrite(PIN_MOTOR, 0);     // Set Motor to run at PWM level
          digitalWrite(PIN_LED, LOW);  // Switch OFF led
        }
        else if (Vpower < Vpower_previous)
        {
          motorPWM--;   // Ramp down the motorPWM
          if (motorPWM <= MIN_SPEED)
          {
            motorPWM = MIN_SPEED;
          }
        }
        else if (Vpower > Vpower_previous)
        {
          motorPWM++;   // Ramp down the motorPWM
          if (motorPWM > MAX_SPEED)
          {
            motorPWM = MAX_SPEED;
          }
        }
        if (modeRun == HIGH)
        {
          analogWrite(PIN_MOTOR, motorPWM);     // Set Motor to run at PWM level
          flash(1, PIN_LED);
        }
        Vpower_previous = Vpower;     // Store the prvious power value for next time analysis
        break;

      case 1:
        // In this case we are in solar cricket mode (daytime)
        // This will chirp at a frequency related to the PV voltage
        if (Vpower > VOLT_HIGH)
        {
          modeRun = HIGH;
          //chirpHigh(PIN_BUZZER);
        }
        else if (Vpower < VOLT_LOW)
        {
          // Too low - switch off everything and go to sleep!
          modeRun = LOW;
          digitalWrite(PIN_MOTOR, LOW);     // Switch OFF motor
          digitalWrite(PIN_LED, LOW);  // Switch OFF led
        }
        
        if (Vsolar < Vpower_previous)
        {
          chirpLow(PIN_BUZZER);
        }
        else if (Vsolar > Vpower_previous)
        {
          chirpHigh(PIN_BUZZER);
        }
        if (modeRun == HIGH)
        {
          flash(2, PIN_LED);
        }
        Vpower_previous = Vsolar;     // Store the prvious power value for next time analysis
        break;  
    }

    //pinMode(PIN_LED, INPUT); // set all used port to intput to save power
    //pinMode(PIN_MOTOR, INPUT); // set all used port to intput to save power
    system_sleep(local_mode);
    //pinMode(PIN_LED, OUTPUT); // set all ports into state before sleep
    //pinMode(PIN_MOTOR, OUTPUT); // set all ports into state before sleep
    //pinMode(PIN_BUZZER, OUTPUT);
  }
}

// Watchdog Interrupt Service / is executed when watchdog timed out
ISR(WDT_vect) {
  f_wdt = 1; // set global flag
}
