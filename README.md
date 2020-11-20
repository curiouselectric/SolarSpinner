# SolarSpinner
Solar powered Motor controller with circuit diagram, PCB and code.
This is based upon the ATTiny85, with code written and uploaded via the Arduino IDE.

This design is for a reporgrammable unit which can do different tasks, powered by a small solar PV cell and an ultra-capacitor.

The unit has an LED output, a Motor control output and a Piezo buzzer output.

## Files Included:

* PCB files (KiCAD required)
* Software (Arduino IDE with ATTiny extension required)
* Hardware (DXF files)
* Instructions (for the final device!)

## Pin out#

ATTiny85 Arduino Pins:

|IC Pin:       |Arduino Ref: | Attached:  |
|--------------|-------------|------------|
|1             |   5/A0/RST  |            |
|2             |   3/A3      | Vsolar     |
|3             |   4/A2      | Vcap       |
|4             |  GND        |            |
|5             |   0 - PWM   | Piezo      |
|6             |   1 - PWM   | Motor      |
|7             |  2/A1       | LED        |
|8             |   +Supply   |            |

## Software Modes

Note: There are only 3 sleep modes for the ATTiny25/45/85

These are: IDLE, ADC power down and Power-Down

If we want to use the PWM to give an output then we need to use IDLE.

See datasheet for more details: http://www.atmel.com/images/atmel-2586-avr-8-bit-microcontroller-attiny25-attiny45-attiny85_datasheet.pdf

### Motor Control

This runs a motor using stored power in the capacitor.
When the Vcap voltage is above a certain amount the motor is run unit the voltage drops.

Control is as follows:

* Wake up on Watch Dog Timer (every set time (0.5 or 1 second)
* If Vcap > Vhigh start with PWM = 255 (fully on) & set motor = ON
* If Vcap < Vhigh & motor is ON then reduce the PWM from 255 by 1 (down to a minimum speed)
* If Vcap < Vlow then switch off the unit & set motor = OFF
* Enter sleep

### LED Nightlight

Automatically switches on an LED when the solar input is low. This will run until the capacitor voltage is too low.

Control is as follows:

* Wake up on Watch Dog Timer (every set time (0.5 or 1 second)
* If Vcap > Vhigh && Vpv < Von setpoint then LED = ON
* If Vpv > V off set point then LED = OFF
* If Vcap < Vlow then switch off LED = OFF
* Enter sleep

### Solar Cricket

'Chrips' a noise (using a piezo element attached to the motor connections) when there is sunlight. Rate and pitch of chirping depends upon solar input. Lower solar = lower pitch chirp and lower rate of chirp.
Control is as follows:

* Wake up on Watch Dog Timer (every set time (0.5 or 1 second)
* If Vcap > Vhigh start 'chirp'. 'chirp' frequency is set by Vpv
* 
* If Vcap < Vlow then switch off the unit & set motor = OFF
* Enter sleep


### Nighttime Cricket

'Chirps' a noise (using a piezo element attached to the motor connections) when the solar voltage is low (dark). Does this until the capacitor runs out.
Control is as follows:

* Wake up on Watch Dog Timer (every set time (0.5 or 1 second)
* If Vcap > Vhigh start with PWM = 255 (fully on) & set motor = ON
* If Vcap < Vhigh & motor is ON then reduce the PWM from 255 by 1 (down to a minimum speed)
* If Vcap < Vlow then switch off the unit & set motor = OFF
* Enter sleep


### Ultrasonic Bug Repeller

Some animals (cats, dogs, rats) and insects (mosquittos) respond to different ultrasonic frequencies of sound.
https://en.wikipedia.org/wiki/Electronic_pest_control
Some people question the effectiveness of this, so this is here for a bit of a trial, really - see what you think!

Control is as follows:

* Wake up on Watch Dog Timer (every set time (0.5 or 1 second)
* If Vcap > Vhigh start repller = ON
* If repeller = ON  then Set PWM = random time between 40-255
* If Vcap < Vlow then switch off the unit & set motor = OFF
* Enter sleep


