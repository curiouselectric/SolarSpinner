/*

  Ultra Low Power Led Flasher
  with AtTiny85 @ 1Mhz
  by Luca Soltoggio
  06/01/2014

  http://www.arduinoelettronica.com

*/

#include <avr/sleep.h>

int pinLED0 = 0;  // convert to arduino digital pins
int pinLED1 = 1;
int pinLED2 = 3;
int pinLED3 = 4;
int sw = 2; // This sets it running - otherwise sleep
volatile boolean f_wdt = 1;

int n = 0;

void setup() {
  randomSeed(analogRead(A0)); // Sets up a random seed
  pinMode(sw, INPUT);

  MCUCR &= ~(_BV(ISC01) | _BV(ISC00));      //INT0 on low level
  GIMSK |= _BV(INT0);                       //enable INT0
  sei();                                    //enable interrupts
}

void loop() {

  if (f_wdt == 1) {
    // WAKE UP
    f_wdt = 0;     // reset flag

    long int timer = millis();
    int randTime = random(100, 500);

    while (millis() <= timer + randTime)
    {
      setLED(n);
      delay(2);   // Flash the LED
      clearLED();
      n++;
      if (n >= 7)
      {
        n = 0;
      }
    }
    timer = millis();
    int diceNumber = random(1, 6);
    int displayTime = 500;  // The time to display the dice number
    while (millis() <= timer + displayTime)
    {
      // Display the number for displayTime
      //numberToDice(diceNumber);
      numberToDice(2);
    }
    clearLED();
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
  f_wdt = 1;
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
    pinMode(pinLED2, INPUT);
    digitalWrite(pinLED2, LOW);
    pinMode(pinLED3, INPUT);
    digitalWrite(pinLED3, LOW);
    pinMode(pinLED0, OUTPUT);
    digitalWrite(pinLED0, LOW);
    pinMode(pinLED1, OUTPUT);
    digitalWrite(pinLED1, HIGH);

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
    pinMode(pinLED2, OUTPUT);
    digitalWrite(pinLED2, HIGH);
    pinMode(pinLED3, OUTPUT);
    digitalWrite(pinLED3, LOW);
    pinMode(pinLED0, INPUT);
    digitalWrite(pinLED0, LOW);
    pinMode(pinLED1, INPUT);
    digitalWrite(pinLED1, LOW);
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
  pinMode(pinLED0, OUTPUT);
  pinMode(pinLED1, OUTPUT);
  pinMode(pinLED2, OUTPUT);
  pinMode(pinLED3, OUTPUT);
  digitalWrite(pinLED3, LOW);
  digitalWrite(pinLED0, LOW);
  digitalWrite(pinLED1, LOW);
  digitalWrite(pinLED2, LOW);
}
void numberToDice(int n)
{
  // This converts the dice number into the display LEDs
  //  Dice  LEDs to light
  //  1     6
  //  2     1,4
  //  3     0,6,5
  //  4     0,1,4,5
  //  5     0,1,4,5,6
  //  6     0,1,2,3,4,5

  // Need to do some clever control of bits here to speed it up!!

  //clearLED();
  switch (n)
  {
    case 1:
      pinMode(pinLED0, OUTPUT);
      digitalWrite(pinLED0, LOW);
      pinMode(pinLED1, INPUT);
      digitalWrite(pinLED1, LOW);
      pinMode(pinLED2, INPUT);
      digitalWrite(pinLED2, LOW);
      pinMode(pinLED3, OUTPUT);
      digitalWrite(pinLED3, HIGH);
      clearLED();
      break;
    case 2:

      //Port direction
      //0b00000000 = 5 4 3 2 1 0 X X 
      //pinLED0 = 0;  // convert to arduino digital pins
      //pinLED1 = 1;
      //pinLED2 = 3;
      //pinLED3 = 4;     
      DDRB  |= 0b00001100;
      PORTB |= 0b00001000;

//      pinMode(pinLED0, OUTPUT);
//      digitalWrite(pinLED0, LOW);
//      pinMode(pinLED1, OUTPUT);
//      digitalWrite(pinLED1, HIGH);
//      pinMode(pinLED2, INPUT);
//      digitalWrite(pinLED2, LOW);
//      pinMode(pinLED3, INPUT);
//      digitalWrite(pinLED3, LOW);
//
//      pinMode(pinLED1, OUTPUT);
//      digitalWrite(pinLED1, LOW);
//      pinMode(pinLED2, OUTPUT);
//      digitalWrite(pinLED2, LOW);
//      pinMode(pinLED3, OUTPUT);
//      digitalWrite(pinLED3, LOW);
//           
//      pinMode(pinLED0, INPUT);
//      digitalWrite(pinLED0, LOW);
//      pinMode(pinLED1, INPUT);
//      digitalWrite(pinLED1, LOW);     
//      pinMode(pinLED2, OUTPUT);
//      digitalWrite(pinLED2, HIGH);
//      pinMode(pinLED3, OUTPUT);
//      digitalWrite(pinLED3, LOW);
      
      break;
    case 3:
      setLED(0);
      clearLED();
      setLED(5);
      clearLED();
      setLED(6);
      clearLED();
      break;
    case 4:
      setLED(0);
      clearLED();
      setLED(1);
      clearLED();
      setLED(4);
      clearLED();
      setLED(5);
      clearLED();
      break;
    case 5:
      setLED(0);
      clearLED();
      setLED(1);
      clearLED();
      setLED(4);
      clearLED();
      setLED(5);
      clearLED();
      setLED(6);
      clearLED();
      break;
    case 6:
      setLED(0);
      clearLED();
      setLED(1);
      clearLED();
      setLED(2);
      clearLED();
      setLED(3);
      clearLED();
      setLED(4);
      clearLED();
      setLED(5);
      clearLED();
      break;
  }
}
