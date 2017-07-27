# SolarSpinner
Solar powered Motor controller with circuit diagram, PCB and code

## Files Included:

* PCB files (KiCAD required)
* Software (Arduino IDE with ATTiny extension required)
* HArdware (DXF files)

## Pin out#

ATTiny85 Arduino Pins:

|IC Pin:       |Arduino Ref: | Attached:  |
|--------------|-------------|------------|
|1             |   5/A0/RST  |            |
|2             |   3/A3      | Vsolar     |
|3             |   4/A2      | Vcap       |
|4             |  GND        |            |
|5             |   0 - PWM   |            |
|6             |   1 - PWM   | Motor      |
|7             |  2/A1       | LED        |
|8             |   +Supply   |            |

## Software Modes

### Motor Control

This runs a motor using stored power in the capacitor.
When the Vcap voltage is above a certain amount the motor is run unit the voltage drops.

### LED Nightlight

Automatically switches on an LED when the solar input is low. This will run until the capacitor voltage is too low.

### Solar Cricket

'Chrips' a noise (using a piezo element attached to the motor connections) when there is sunlight. Rate and pitch of chirping depends upon solar input. Lower solar = lower pitch chirp and lower rate of chirp.

### Nighttime Cricket

'Chirps' a noise (using a piezo element attached to the motor connections) when the solar voltage is low (dark). Does this until the capacitor runs out.
