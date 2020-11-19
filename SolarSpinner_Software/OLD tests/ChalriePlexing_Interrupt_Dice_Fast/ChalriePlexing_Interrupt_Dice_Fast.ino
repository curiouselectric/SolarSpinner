/*

  Ultra Low Power Led Flasher
  with AtTiny85 @ 1Mhz
  by Luca Soltoggio
  06/01/2014

  http://www.arduinoelettronica.com

*/

#include <avr/sleep.h>

#define pinLED0 PB0  // convert to arduino digital pins
#define pinLED1 PB1
#define pinLED2 PB3
#define pinLED3 PB4
int sw = 2; // This sets it running - otherwise sleep
volatile boolean f_wdt = 1;

int n = 0;
int displayTime = 500;  // The time to display the dice number
int flashTime = 50;  // The time to display the dice number
long int timer1;
long int timer2;


void setup() {
  randomSeed(analogRead(A0)); // Sets up a random seed
  pinMode(sw, INPUT);

  MCUCR &= ~(_BV(ISC01) | _BV(ISC00));      //INT0 on low level
  GIMSK |= _BV(INT0);                       //enable INT0
  sei();                                    //enable interrupts

  clearLED();
}

void loop() {

  if (f_wdt == 1) {
    // WAKE UP
    f_wdt = 0;     // reset flag
    //clearLED();
    timer1 = millis();
    int randTime = random(100, 1000);
    n = 1;
    while (millis() <= timer1 + 1000)
    {
      timer2 = millis();
      while (millis() <= timer2 + flashTime)
      {
        // Display the number for displayTime
        //numberToDice(diceNumber);
        numberToDice(n);
      }
      clearLED();
      n++;
      if (n >= 7)
      {
        n = 1;
      }
    }
    //    timer1 = millis();
    //    int diceNumber = random(1, 6);
    //    while (millis() <= timer1 + displayTime)
    //    {
    //      // Display the number for displayTime
    //      //numberToDice(diceNumber);
    //      numberToDice(3);
    //    }
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
  switch (LED)
  {
    case 0:
      DDRB  |= (1 << pinLED0) | (1 << pinLED1) | (0 << pinLED2) | (0 << pinLED3);
      PORTB |= (1 << pinLED0) | (0 << pinLED1) | (0 << pinLED2) | (0 << pinLED3);
      break;
    case 1:
      DDRB  |= (1 << pinLED0) | (1 << pinLED1) | (0 << pinLED2) | (0 << pinLED3);
      PORTB |= (0 << pinLED0) | (1 << pinLED1) | (0 << pinLED2) | (0 << pinLED3);
      break;
    case 2:
      DDRB  |= (0 << pinLED0) | (1 << pinLED1) | (1 << pinLED2) | (0 << pinLED3);
      PORTB |= (0 << pinLED0) | (1 << pinLED1) | (0 << pinLED2) | (0 << pinLED3);
      break;
    case 3:
      DDRB  |= (0 << pinLED0) | (1 << pinLED1) | (1 << pinLED2) | (0 << pinLED3);
      PORTB |= (0 << pinLED0) | (0 << pinLED1) | (1 << pinLED2) | (0 << pinLED3);
      break;
    case 4:
      DDRB  |= (0 << pinLED0) | (0 << pinLED1) | (1 << pinLED2) | (1 << pinLED3);
      PORTB |= (0 << pinLED0) | (0 << pinLED1) | (1 << pinLED2) | (0 << pinLED3);
      break;
    case 5:
      DDRB  |= (0 << pinLED0) | (0 << pinLED1) | (1 << pinLED2) | (1 << pinLED3);
      PORTB |= (0 << pinLED0) | (0 << pinLED1) | (0 << pinLED2) | (1 << pinLED3);
      break;
    case 6:
      DDRB  |= (1 << pinLED0) | (0 << pinLED1) | (0 << pinLED2) | (1 << pinLED3);
      PORTB |= (0 << pinLED0) | (0 << pinLED1) | (0 << pinLED2) | (1 << pinLED3);
      break;
    case 7:
      DDRB  |= (1 << pinLED0) | (0 << pinLED1) | (0 << pinLED2) | (1 << pinLED3);
      PORTB |= (1 << pinLED0) | (0 << pinLED1) | (0 << pinLED2) | (0 << pinLED3);
      break;
  }
}

void clearLED()
{
  DDRB  &= (0 << pinLED0) | (0 << pinLED1) | (0 << pinLED2) | (0 << pinLED3);
  PORTB &= (0 << pinLED0) | (0 << pinLED1) | (0 << pinLED2) | (0 << pinLED3);
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
      DDRB &= ~(1 << pinLED1);
      DDRB &= ~(1 << pinLED2);
      DDRB  |= (1 << pinLED0) | (1 << pinLED3);
      PORTB &= ~(1 << pinLED0);
      PORTB &= ~(1 << pinLED1);
      PORTB &= ~(1 << pinLED2);
      PORTB |=  (1 << pinLED3);
      
      break;
    case 2:
      DDRB  |= (1 << pinLED0) | (1 << pinLED1) | (0 << pinLED2) | (0 << pinLED3);
      PORTB |= (0 << pinLED0) | (1 << pinLED1) | (0 << pinLED2) | (0 << pinLED3);
      DDRB  |= (0 << pinLED0) | (0 << pinLED1) | (1 << pinLED2) | (1 << pinLED3);
      PORTB |= (0 << pinLED0) | (0 << pinLED1) | (1 << pinLED2) | (0 << pinLED3);
      break;
    case 3:
      DDRB  |= (1 << pinLED0) | (1 << pinLED1) | (0 << pinLED2) | (0 << pinLED3);
      PORTB |= (1 << pinLED0) | (0 << pinLED1) | (0 << pinLED2) | (0 << pinLED3);
      DDRB &= ~ (1 << pinLED0);
      DDRB  |= (0 << pinLED0) | (0 << pinLED1) | (1 << pinLED2) | (1 << pinLED3);
      PORTB |= (0 << pinLED0) | (0 << pinLED1) | (0 << pinLED2) | (1 << pinLED3);

      clearLED();
      DDRB  |= (1 << pinLED0) | (0 << pinLED1) | (0 << pinLED2) | (1 << pinLED3);
      PORTB |= (0 << pinLED0) | (0 << pinLED1) | (0 << pinLED2) | (1 << pinLED3);
      break;
    case 4:


      DDRB  |= (1 << pinLED0) | (1 << pinLED1) | (0 << pinLED2) | (0 << pinLED3);
      PORTB |= (1 << pinLED0) | (0 << pinLED1) | (0 << pinLED2) | (0 << pinLED3);
      clearLED();
      DDRB  |= (1 << pinLED0) | (1 << pinLED1) | (0 << pinLED2) | (0 << pinLED3);
      PORTB |= (0 << pinLED0) | (1 << pinLED1) | (0 << pinLED2) | (0 << pinLED3);
      clearLED();
      DDRB  |= (0 << pinLED0) | (0 << pinLED1) | (1 << pinLED2) | (1 << pinLED3);
      PORTB |= (0 << pinLED0) | (0 << pinLED1) | (1 << pinLED2) | (0 << pinLED3);
      clearLED();
      DDRB  |= (0 << pinLED0) | (0 << pinLED1) | (1 << pinLED2) | (1 << pinLED3);
      PORTB |= (0 << pinLED0) | (0 << pinLED1) | (0 << pinLED2) | (1 << pinLED3);
      clearLED();
      break;
    case 5:

      DDRB  |= (1 << pinLED0) | (1 << pinLED1) | (0 << pinLED2) | (0 << pinLED3);
      PORTB |= (1 << pinLED0) | (0 << pinLED1) | (0 << pinLED2) | (0 << pinLED3);
      clearLED();
      DDRB  |= (1 << pinLED0) | (1 << pinLED1) | (0 << pinLED2) | (0 << pinLED3);
      PORTB |= (0 << pinLED0) | (1 << pinLED1) | (0 << pinLED2) | (0 << pinLED3);
      clearLED();
      DDRB  |= (0 << pinLED0) | (0 << pinLED1) | (1 << pinLED2) | (1 << pinLED3);
      PORTB |= (0 << pinLED0) | (0 << pinLED1) | (1 << pinLED2) | (0 << pinLED3);
      clearLED();
      DDRB  |= (0 << pinLED0) | (0 << pinLED1) | (1 << pinLED2) | (1 << pinLED3);
      PORTB |= (0 << pinLED0) | (0 << pinLED1) | (0 << pinLED2) | (1 << pinLED3);
      clearLED();
      DDRB  |= (1 << pinLED0) | (0 << pinLED1) | (0 << pinLED2) | (1 << pinLED3);
      PORTB |= (0 << pinLED0) | (0 << pinLED1) | (0 << pinLED2) | (1 << pinLED3);
      clearLED();
      break;
    case 6:

      DDRB  |= (1 << pinLED0) | (1 << pinLED1) | (0 << pinLED2) | (0 << pinLED3);
      PORTB |= (1 << pinLED0) | (0 << pinLED1) | (0 << pinLED2) | (0 << pinLED3);
      clearLED();
      DDRB  |= (1 << pinLED0) | (1 << pinLED1) | (0 << pinLED2) | (0 << pinLED3);
      PORTB |= (0 << pinLED0) | (1 << pinLED1) | (0 << pinLED2) | (0 << pinLED3);
      clearLED();
      DDRB  |= (0 << pinLED0) | (0 << pinLED1) | (1 << pinLED2) | (1 << pinLED3);
      PORTB |= (0 << pinLED0) | (0 << pinLED1) | (1 << pinLED2) | (0 << pinLED3);
      clearLED();
      DDRB  |= (0 << pinLED0) | (0 << pinLED1) | (1 << pinLED2) | (1 << pinLED3);
      PORTB |= (0 << pinLED0) | (0 << pinLED1) | (0 << pinLED2) | (1 << pinLED3);
      clearLED();
      DDRB  |= (1 << pinLED0) | (0 << pinLED1) | (0 << pinLED2) | (1 << pinLED3);
      PORTB |= (0 << pinLED0) | (0 << pinLED1) | (0 << pinLED2) | (1 << pinLED3);
      clearLED();
      break;
  }
}
