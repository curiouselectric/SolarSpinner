/*
   Solar Dice and 8Ball Unit code
   by:    Matt Little
   date:  9/4/2020
   w:     www.curiouselectric.co.uik
   e:     hello@curiouselectric.co.uk

   This ciode is for an ATTiny85 unit
   Charlie-plexed LEDs (7 or 8 of them) on pins D0,D1,D3,D4
   Interrupt on pin D2 (INT0). This uses a viration switch to set the unit off
   8 Ball code: runs through all 8 LEDs in order. Stop after a random time on a random number
   Dice code:   runs through 7 LEDs to show working. Stop on random 1-6 dice display.
   Unit goes to sleep until INT0 set low
   PCB is solar powered - ultracapacitor to hold charge for when its needed.

   TO DO:

*/

#include <avr/sleep.h>

#define pinLED0 PB0  // convert to arduino digital pins
#define pinLED1 PB1
#define pinLED2 PB3
#define pinLED3 PB4
#define sw      PB2

#define DICE   1   // Set this 1 = DICE and 0 = 8 BALL

int n = 0;
int displayTime = 3000;  // The time to display the dice number
int flashTime = 25;  // The time to display the dice number
long int timer1;
long int timer2;

void setup() {
  randomSeed(analogRead(A0)); // Sets up a random seed
  pinMode(sw, INPUT);         // Sets the sw (INT0) as an interrupt input
  clearLED();
  MCUCR &= ~(_BV(ISC01) | _BV(ISC00));      //INT0 on falling level
}

void loop() {

  // go to sleep here.
  // zzzzz.
  system_sleep();
  // Wake up after this here

  timer1 = millis();
  int randTime = random(500, 2000);     // This gives a random time for the 'shake'
  n = 0;
  while (millis() <= timer1 + randTime)
  {
    timer2 = millis();
    while (millis() <= timer2 + flashTime)  // This is the length of time the LEDs flash for
    {
      setLED(n);      // This scrolls through the LEDs to show a 'shake'
    }
    n++;
    if (DICE == 1)
    {
      if (n >= 7)
      {
        n = 0;
      }
    }
    else
    {
      if (n >= 8)
      {
        n = 0;
      }
    }
  }

  timer1 = millis();
  int randNumber;

  if (DICE == 1)
  {
    randNumber  = random(1, 7);
  }
  else
  {
    randNumber  = random(0, 8);
  }
  while (millis() <= timer1 + displayTime)
  {
    // Display the number for displayTime
    if (DICE == 1)
    {
      numberToDice(randNumber);
    }
    else
    {
      //Do not need to do anything here - just wait for the display
    }
  }
  clearLED();

}

void system_sleep()
{
  // Want to enable interrupts here:
  GIMSK |= _BV(INT0);     //enable INT0
  ADCSRA &= ~_BV(ADEN);   // Switch Analog to Digital converter OFF

  set_sleep_mode(SLEEP_MODE_PWR_DOWN); // Set sleep mode
  sleep_mode(); // System sleeps here
  ADCSRA |= _BV(ADEN);    // Switch Analog to Digital converter ON
  // Want to disable interrupts here:
  GIMSK &= ~(_BV(INT0));  //disable INT0
}

ISR(INT0_vect)
{
  //Wakes up here - goes to main loop to carry on
}

void setLED(int LED)
{
  switch (LED)
  {
    case 0:
      DDRB &= ~(1 << pinLED2);
      DDRB &= ~(1 << pinLED3);
      DDRB  |= (1 << pinLED0) | (1 << pinLED1);
      PORTB &= ~(1 << pinLED1);
      PORTB &= ~(1 << pinLED2);
      PORTB &= ~(1 << pinLED3);
      PORTB |=  (1 << pinLED0);
      break;
    case 1:
      DDRB &= ~(1 << pinLED2);
      DDRB &= ~(1 << pinLED3);
      DDRB  |= (1 << pinLED0) | (1 << pinLED1);
      PORTB &= ~(1 << pinLED0);
      PORTB &= ~(1 << pinLED2);
      PORTB &= ~(1 << pinLED3);
      PORTB |=  (1 << pinLED1);
      break;
    case 2:
      DDRB &= ~(1 << pinLED0);
      DDRB &= ~(1 << pinLED3);
      DDRB  |= (1 << pinLED1) | (1 << pinLED2);
      PORTB &= ~(1 << pinLED0);
      PORTB &= ~(1 << pinLED2);
      PORTB &= ~(1 << pinLED3);
      PORTB |=  (1 << pinLED1);
      break;
    case 3:
      DDRB &= ~(1 << pinLED0);
      DDRB &= ~(1 << pinLED3);
      DDRB  |= (1 << pinLED1) | (1 << pinLED2);
      PORTB &= ~(1 << pinLED0);
      PORTB &= ~(1 << pinLED1);
      PORTB &= ~(1 << pinLED3);
      PORTB |=  (1 << pinLED2);
      break;
    case 4:
      DDRB &= ~(1 << pinLED0);
      DDRB &= ~(1 << pinLED1);
      DDRB  |= (1 << pinLED2) | (1 << pinLED3);
      PORTB &= ~(1 << pinLED0);
      PORTB &= ~(1 << pinLED1);
      PORTB &= ~(1 << pinLED3);
      PORTB |=  (1 << pinLED2);
      break;
    case 5:
      DDRB &= ~(1 << pinLED0);
      DDRB &= ~(1 << pinLED1);
      DDRB  |= (1 << pinLED2) | (1 << pinLED3);
      PORTB &= ~(1 << pinLED0);
      PORTB &= ~(1 << pinLED1);
      PORTB &= ~(1 << pinLED2);
      PORTB |=  (1 << pinLED3);
      break;
    case 6:
      DDRB &= ~(1 << pinLED1);
      DDRB &= ~(1 << pinLED2);
      DDRB  |= (1 << pinLED0) | (1 << pinLED3);
      PORTB &= ~(1 << pinLED0);
      PORTB &= ~(1 << pinLED1);
      PORTB &= ~(1 << pinLED2);
      PORTB |=  (1 << pinLED3);
      break;
    case 7:
      DDRB &= ~(1 << pinLED1);
      DDRB &= ~(1 << pinLED2);
      DDRB  |= (1 << pinLED0) | (1 << pinLED3);
      PORTB &= ~(1 << pinLED1);
      PORTB &= ~(1 << pinLED2);
      PORTB &= ~(1 << pinLED3);
      PORTB |=  (1 << pinLED0);
      break;
  }
}

void clearLED()
{
  DDRB &= ~(1 << pinLED0);
  DDRB &= ~(1 << pinLED1);
  DDRB &= ~(1 << pinLED2);
  DDRB &= ~(1 << pinLED3);

  PORTB &= ~(1 << pinLED0);
  PORTB &= ~(1 << pinLED1);
  PORTB &= ~(1 << pinLED2);
  PORTB &= ~(1 << pinLED3);
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
      setLED(6);
      break;
    case 2:
      setLED(1);
      setLED(4);
      break;
    case 3:
      setLED(0);
      setLED(5);
      setLED(6);
      break;
    case 4:
      setLED(0);
      setLED(1);
      setLED(4);
      setLED(5);
      break;
    case 5:
      setLED(0);
      setLED(1);
      setLED(4);
      setLED(5);
      setLED(6);
      break;
    case 6:
      setLED(0);
      setLED(1);
      setLED(2);
      setLED(3);
      setLED(4);
      setLED(5);
      break;
  }
}
