/*

  Ultra Low Power Led Flasher
  with AtTiny85 @ 1Mhz
  by Luca Soltoggio
  06/01/2014

  http://www.arduinoelettronica.com

*/

#include <avr/sleep.h>
//#include <avr/wdt.h>
//#include <avr/interrupt.h>
//#include <avr/power.h>

//#ifndef cbi
//#define cbi(sfr, bit) (_SFR_BYTE(sfr) &= ~_BV(bit))
//#endif
//#ifndef sbi
//#define sbi(sfr, bit) (_SFR_BYTE(sfr) |= _BV(bit))
//#endif

int pinLED0 = 0;  // convert to arduino digital pins
int pinLED1 = 1;
int pinLED2 = 3;
int pinLED3 = 4;
int sw = 2; // This sets it running - otherwise sleep
volatile boolean f_wdt = 1;

int n = 0;

void setup() {


  //setup_watchdog(3); // approximately 1 seconds sleep
  randomSeed(analogRead(A0)); // Sets up a random seed
  pinMode(sw, INPUT);
  
  MCUCR &= ~(_BV(ISC01) | _BV(ISC00));      //INT0 on low level
  GIMSK |= _BV(INT0);                       //enable INT0
  sei();                                    //enable interrupts

}

void loop() {

  if (f_wdt == 1) {
    // WAKE UP
    //cli();          // Clear interrupts
    f_wdt = 0;     // reset flag
    
    long int timer = millis();
    int randTime = random(100, 1000);

    while (millis() <= timer + randTime)
    {
      setLED(n);
      delay(2);   // Flash the LED
      clearLED();
      n++;
      if (n >= 8)
      {
        n = 0;
      }
    }
    setLED(n);
    delay(500);
    clearLED();
    //sei();                                    //enable interrupts    
    system_sleep();
  }
}

void system_sleep()
{
  ADCSRA &= ~_BV(ADEN);// Switch Analog to Digital converter OFF
  set_sleep_mode(SLEEP_MODE_PWR_DOWN); // Set sleep mode
  sleep_mode(); // System sleeps here
  ADCSRA |= _BV(ADEN); // Switch Analog to Digital converter ON
}

ISR(INT0_vect)
{
  f_wdt=1;
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
