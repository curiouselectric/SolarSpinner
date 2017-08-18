EESchema Schematic File Version 2
LIBS:SolarSpinner-rescue
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:matts_components
LIBS:SolarSpinner-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Solar Motor Controller"
Date "2017-04-24"
Rev "1"
Comp "The Curious Electric Compnay"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L CP C1
U 1 1 58A49EA0
P 3100 2050
F 0 "C1" H 3125 2150 50  0000 L CNN
F 1 "0.47F" H 3125 1950 50  0000 L CNN
F 2 "REInnovationFootprint:C_0_47F_SuperCap" H 3138 1900 50  0001 C CNN
F 3 "" H 3100 2050 50  0000 C CNN
F 4 "~" H 3100 2050 60  0001 C CNN "Notes"
F 5 "~" H 3100 2050 60  0001 C CNN "Description"
F 6 "~" H 3100 2050 60  0001 C CNN "Manufacturer"
F 7 "~" H 3100 2050 60  0001 C CNN "Manufacturer Part No"
F 8 "Aliexpress" H 3100 2050 60  0001 C CNN "Supplier 1"
F 9 "~" H 3100 2050 60  0001 C CNN "Supplier 1 Part No"
F 10 "0.4" H 3100 2050 60  0001 C CNN "Supplier 1 Cost"
F 11 "~" H 3100 2050 60  0001 C CNN "Supplier 2"
F 12 "~" H 3100 2050 60  0001 C CNN "Supplier 2 Part No"
F 13 "~" H 3100 2050 60  0001 C CNN "Supplier 2 Cost"
F 14 "~" H 3100 2050 60  0001 C CNN "Cost"
	1    3100 2050
	1    0    0    -1  
$EndComp
$Comp
L Solar_Cells SC1
U 1 1 58A49F68
P 2050 2050
F 0 "SC1" H 2150 2150 50  0000 L CNN
F 1 "PV_CELL" H 2150 2050 50  0000 L CNN
F 2 "REInnovationFootprint:PV_50x30mm" V 2050 2110 50  0001 C CNN
F 3 "" V 2050 2110 50  0000 C CNN
F 4 "~" H 2050 2050 60  0000 C CNN "Notes"
F 5 "53x30mm 30mA 5V PV module" H 2050 2050 60  0001 C CNN "Description"
F 6 "~" H 2050 2050 60  0001 C CNN "Manufacturer"
F 7 "~" H 2050 2050 60  0001 C CNN "Manufacturer Part No"
F 8 "Aliexpress" H 2050 2050 60  0001 C CNN "Supplier 1"
F 9 "~" H 2050 2050 60  0001 C CNN "Supplier 1 Part No"
F 10 "0.7" H 2050 2050 60  0001 C CNN "Supplier 1 Cost"
F 11 "~" H 2050 2050 60  0001 C CNN "Supplier 2"
F 12 "~" H 2050 2050 60  0001 C CNN "Supplier 2 Part No"
F 13 "~" H 2050 2050 60  0001 C CNN "Supplier 2 Cost"
	1    2050 2050
	1    0    0    -1  
$EndComp
$Comp
L D_Schottky D1
U 1 1 58A4A198
P 2500 1600
F 0 "D1" H 2500 1700 50  0000 C CNN
F 1 "1N5819" H 2500 1500 50  0000 C CNN
F 2 "REInnovationFootprint:TH_Diode_1" H 2500 1600 50  0001 C CNN
F 3 "" H 2500 1600 50  0000 C CNN
F 4 "~" H 2500 1600 60  0000 C CNN "Notes"
F 5 "~" H 2500 1600 60  0001 C CNN "Description"
F 6 "~" H 2500 1600 60  0001 C CNN "Manufacturer"
F 7 "~" H 2500 1600 60  0001 C CNN "Manufacturer Part No"
F 8 "RS" H 2500 1600 60  0001 C CNN "Supplier 1"
F 9 "~" H 2500 1600 60  0001 C CNN "Supplier 1 Part No"
F 10 "0.03" H 2500 1600 60  0001 C CNN "Supplier 1 Cost"
F 11 "~" H 2500 1600 60  0001 C CNN "Supplier 2"
F 12 "~" H 2500 1600 60  0001 C CNN "Supplier 2 Part No"
F 13 "~" H 2500 1600 60  0001 C CNN "Supplier 2 Cost"
	1    2500 1600
	-1   0    0    1   
$EndComp
$Comp
L CONN_01X01 P7
U 1 1 58A4A9B1
P 5350 3600
F 0 "P7" H 5350 3700 50  0000 C CNN
F 1 "LOGO1" V 5450 3600 50  0000 C CNN
F 2 "CuriousElectric3:CEC_Globe_10mm_FCU" H 5350 3600 50  0001 C CNN
F 3 "" H 5350 3600 50  0000 C CNN
	1    5350 3600
	0    -1   -1   0   
$EndComp
$Comp
L CONN_01X01 P8
U 1 1 58A4AA34
P 5650 3600
F 0 "P8" H 5650 3700 50  0000 C CNN
F 1 "LOGO2" V 5750 3600 50  0000 C CNN
F 2 "CuriousElectric3:TCEC_Words_13mm" H 5650 3600 50  0001 C CNN
F 3 "" H 5650 3600 50  0000 C CNN
	1    5650 3600
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR01
U 1 1 58A4AEF1
P 3750 2450
F 0 "#PWR01" H 3750 2200 50  0001 C CNN
F 1 "GND" H 3750 2300 50  0000 C CNN
F 2 "" H 3750 2450 50  0000 C CNN
F 3 "" H 3750 2450 50  0000 C CNN
	1    3750 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	2050 1850 2050 1600
Wire Wire Line
	1700 1600 2350 1600
Wire Wire Line
	2050 2250 2050 2350
Wire Wire Line
	3100 1900 3100 1600
Connection ~ 3100 1600
Wire Wire Line
	3100 2200 3100 2350
Connection ~ 3100 2350
Wire Wire Line
	3750 2350 3750 2450
NoConn ~ 5350 3800
NoConn ~ 5650 3800
$Comp
L CONN_01X02 P2
U 1 1 58B44224
P 3950 1150
F 0 "P2" H 3950 1300 50  0000 C CNN
F 1 "SOLAR_V" V 4050 1150 50  0000 C CNN
F 2 "matts_components:SIL-2_wide_lg_pad" H 3950 1150 50  0001 C CNN
F 3 "" H 3950 1150 50  0000 C CNN
	1    3950 1150
	1    0    0    -1  
$EndComp
Wire Wire Line
	3750 1200 3500 1200
Wire Wire Line
	3500 1200 3500 2350
Connection ~ 3500 2350
Wire Wire Line
	3750 1100 3400 1100
Wire Wire Line
	3400 1100 3400 1600
Connection ~ 3400 1600
Wire Wire Line
	1700 2350 3750 2350
Wire Wire Line
	2650 1600 3700 1600
$Comp
L VCC #PWR02
U 1 1 58FDDFB1
P 3700 1600
F 0 "#PWR02" H 3700 1450 50  0001 C CNN
F 1 "VCC" H 3700 1750 50  0000 C CNN
F 2 "" H 3700 1600 50  0000 C CNN
F 3 "" H 3700 1600 50  0000 C CNN
	1    3700 1600
	1    0    0    -1  
$EndComp
$Comp
L ATTINY85-P-RESCUE-SolarSpinner IC1
U 1 1 58FDDFEF
P 3600 5150
F 0 "IC1" H 3700 5200 60  0000 C CNN
F 1 "ATTINY85-P" H 5600 4400 60  0000 C CNN
F 2 "REInnovationFootprint:DIP-8_300_ELL" H 3700 4400 60  0001 C CNN
F 3 "http://www.farnell.com/datasheets/1744708.pdf?_ga=2.238630600.937687315.1494695229-1523402957.1422198431" H 3600 5150 60  0001 C CNN
F 4 "~" H 3600 5150 60  0001 C CNN "Notes"
F 5 "8 Bit uP 20MHz" H 3600 5150 60  0001 C CNN "Description"
F 6 "ATMEL" H 3600 5150 60  0001 C CNN "Manufacturer"
F 7 "ATTINY85-20PU" H 3600 5150 60  0001 C CNN "Manufacturer Part No"
F 8 "Farnell" H 3600 5150 60  0001 C CNN "Supplier 1"
F 9 "1455162" H 3600 5150 60  0001 C CNN "Supplier 1 Part No"
F 10 "1.12" H 3600 5150 60  0001 C CNN "Supplier 1 Cost"
F 11 "~" H 3600 5150 60  0001 C CNN "Supplier 2"
F 12 "~" H 3600 5150 60  0001 C CNN "Supplier 2 Part No"
F 13 "~" H 3600 5150 60  0001 C CNN "Supplier 2 Cost"
F 14 "~" H 3600 5150 60  0001 C CNN "Cost"
	1    3600 5150
	1    0    0    -1  
$EndComp
$Comp
L C C2
U 1 1 58FDE0E2
P 6300 5500
F 0 "C2" H 6325 5600 50  0000 L CNN
F 1 "100n" H 6325 5400 50  0000 L CNN
F 2 "matts_components:C1_wide_lg_pad" H 6338 5350 50  0001 C CNN
F 3 "" H 6300 5500 50  0000 C CNN
F 4 "~" H 6300 5500 60  0001 C CNN "Notes"
F 5 "~" H 6300 5500 60  0001 C CNN "Description"
F 6 "~" H 6300 5500 60  0001 C CNN "Manufacturer"
F 7 "~" H 6300 5500 60  0001 C CNN "Manufacturer Part No"
F 8 "Rapid" H 6300 5500 60  0001 C CNN "Supplier 1"
F 9 "~" H 6300 5500 60  0001 C CNN "Supplier 1 Part No"
F 10 "0.07" H 6300 5500 60  0001 C CNN "Supplier 1 Cost"
F 11 "~" H 6300 5500 60  0001 C CNN "Supplier 2"
F 12 "~" H 6300 5500 60  0001 C CNN "Supplier 2 Part No"
F 13 "~" H 6300 5500 60  0001 C CNN "Supplier 2 Cost"
F 14 "~" H 6300 5500 60  0001 C CNN "Cost"
	1    6300 5500
	1    0    0    -1  
$EndComp
$Comp
L R R3
U 1 1 58FDE1C5
P 2750 3000
F 0 "R3" V 2830 3000 50  0000 C CNN
F 1 "100k" V 2750 3000 50  0000 C CNN
F 2 "REInnovationFootprint:TH_Resistor_1" V 2680 3000 50  0001 C CNN
F 3 "" H 2750 3000 50  0000 C CNN
F 4 "~" H 2750 3000 60  0000 C CNN "Notes"
F 5 "~" H 2750 3000 60  0001 C CNN "Description"
F 6 "~" H 2750 3000 60  0001 C CNN "Manufacturer"
F 7 "~" H 2750 3000 60  0001 C CNN "Manufacturer Part No"
F 8 "~" H 2750 3000 60  0001 C CNN "Supplier 1"
F 9 "~" H 2750 3000 60  0001 C CNN "Supplier 1 Part No"
F 10 "0.01" H 2750 3000 60  0001 C CNN "Supplier 1 Cost"
F 11 "~" H 2750 3000 60  0001 C CNN "Supplier 2"
F 12 "~" H 2750 3000 60  0001 C CNN "Supplier 2 Part No"
F 13 "~" H 2750 3000 60  0001 C CNN "Supplier 2 Cost"
	1    2750 3000
	-1   0    0    1   
$EndComp
$Comp
L R R4
U 1 1 58FDE28B
P 2750 3450
F 0 "R4" V 2830 3450 50  0000 C CNN
F 1 "10k" V 2750 3450 50  0000 C CNN
F 2 "REInnovationFootprint:TH_Resistor_1" V 2680 3450 50  0001 C CNN
F 3 "" H 2750 3450 50  0000 C CNN
F 4 "~" H 2750 3450 60  0000 C CNN "Notes"
F 5 "~" H 2750 3450 60  0001 C CNN "Description"
F 6 "~" H 2750 3450 60  0001 C CNN "Manufacturer"
F 7 "~" H 2750 3450 60  0001 C CNN "Manufacturer Part No"
F 8 "~" H 2750 3450 60  0001 C CNN "Supplier 1"
F 9 "~" H 2750 3450 60  0001 C CNN "Supplier 1 Part No"
F 10 "0.01" H 2750 3450 60  0001 C CNN "Supplier 1 Cost"
F 11 "~" H 2750 3450 60  0001 C CNN "Supplier 2"
F 12 "~" H 2750 3450 60  0001 C CNN "Supplier 2 Part No"
F 13 "~" H 2750 3450 60  0001 C CNN "Supplier 2 Cost"
	1    2750 3450
	-1   0    0    1   
$EndComp
$Comp
L VCC #PWR03
U 1 1 58FDE2CD
P 2750 2750
F 0 "#PWR03" H 2750 2600 50  0001 C CNN
F 1 "VCC" H 2750 2900 50  0000 C CNN
F 2 "" H 2750 2750 50  0000 C CNN
F 3 "" H 2750 2750 50  0000 C CNN
	1    2750 2750
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR04
U 1 1 58FDE2FC
P 2750 3700
F 0 "#PWR04" H 2750 3450 50  0001 C CNN
F 1 "GND" H 2750 3550 50  0000 C CNN
F 2 "" H 2750 3700 50  0000 C CNN
F 3 "" H 2750 3700 50  0000 C CNN
	1    2750 3700
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR05
U 1 1 58FDE32B
P 6300 5200
F 0 "#PWR05" H 6300 5050 50  0001 C CNN
F 1 "VCC" H 6300 5350 50  0000 C CNN
F 2 "" H 6300 5200 50  0000 C CNN
F 3 "" H 6300 5200 50  0000 C CNN
	1    6300 5200
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR06
U 1 1 58FDE35A
P 6300 5850
F 0 "#PWR06" H 6300 5600 50  0001 C CNN
F 1 "GND" H 6300 5700 50  0000 C CNN
F 2 "" H 6300 5850 50  0000 C CNN
F 3 "" H 6300 5850 50  0000 C CNN
	1    6300 5850
	1    0    0    -1  
$EndComp
$Comp
L Q_NPN_CBE Q1
U 1 1 58FDE37F
P 5750 2450
F 0 "Q1" H 6050 2500 50  0000 R CNN
F 1 "BC547" H 6200 2400 50  0000 R CNN
F 2 "REInnovationFootprint:TO92-EBC_large_pad" H 5950 2550 50  0001 C CNN
F 3 "" H 5750 2450 50  0000 C CNN
	1    5750 2450
	1    0    0    -1  
$EndComp
$Comp
L R R5
U 1 1 58FDE43D
P 5200 2450
F 0 "R5" V 5280 2450 50  0000 C CNN
F 1 "330" V 5200 2450 50  0000 C CNN
F 2 "REInnovationFootprint:TH_Resistor_1" V 5130 2450 50  0001 C CNN
F 3 "" H 5200 2450 50  0000 C CNN
F 4 "~" H 5200 2450 60  0000 C CNN "Notes"
F 5 "~" H 5200 2450 60  0001 C CNN "Description"
F 6 "~" H 5200 2450 60  0001 C CNN "Manufacturer"
F 7 "~" H 5200 2450 60  0001 C CNN "Manufacturer Part No"
F 8 "~" H 5200 2450 60  0001 C CNN "Supplier 1"
F 9 "~" H 5200 2450 60  0001 C CNN "Supplier 1 Part No"
F 10 "0.01" H 5200 2450 60  0001 C CNN "Supplier 1 Cost"
F 11 "~" H 5200 2450 60  0001 C CNN "Supplier 2"
F 12 "~" H 5200 2450 60  0001 C CNN "Supplier 2 Part No"
F 13 "~" H 5200 2450 60  0001 C CNN "Supplier 2 Cost"
	1    5200 2450
	0    -1   -1   0   
$EndComp
$Comp
L CONN_01X02 P3
U 1 1 58FDE4BD
P 6100 2000
F 0 "P3" H 6100 2150 50  0000 C CNN
F 1 "MOTOR" V 6200 2000 50  0000 C CNN
F 2 "matts_components:SIL-2_screw_terminal" H 6100 2000 50  0001 C CNN
F 3 "" H 6100 2000 50  0000 C CNN
	1    6100 2000
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X02 P1
U 1 1 58FDE60A
P 1500 2000
F 0 "P1" H 1500 2150 50  0000 C CNN
F 1 "SOLAR" V 1600 2000 50  0000 C CNN
F 2 "matts_components:SIL-2_screw_terminal" H 1500 2000 50  0001 C CNN
F 3 "" H 1500 2000 50  0000 C CNN
	1    1500 2000
	-1   0    0    -1  
$EndComp
$Comp
L CONN_02X03 P4
U 1 1 58FDE7A4
P 4100 4700
F 0 "P4" H 4100 4900 50  0000 C CNN
F 1 "ISP" H 4100 4500 50  0000 C CNN
F 2 "REInnovationFootprint:ISP_3x2" H 4100 3500 50  0001 C CNN
F 3 "" H 4100 3500 50  0000 C CNN
F 4 "~" H 4100 4700 60  0000 C CNN "Notes"
F 5 "~" H 4100 4700 60  0001 C CNN "Description"
F 6 "~" H 4100 4700 60  0001 C CNN "Manufacturer"
F 7 "~" H 4100 4700 60  0001 C CNN "Manufacturer Part No"
F 8 "~" H 4100 4700 60  0001 C CNN "Supplier 1"
F 9 "~" H 4100 4700 60  0001 C CNN "Supplier 1 Part No"
F 10 "0.05" H 4100 4700 60  0001 C CNN "Supplier 1 Cost"
F 11 "~" H 4100 4700 60  0001 C CNN "Supplier 2"
F 12 "~" H 4100 4700 60  0001 C CNN "Supplier 2 Part No"
F 13 "~" H 4100 4700 60  0001 C CNN "Supplier 2 Cost"
	1    4100 4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	6100 5250 6300 5250
Wire Wire Line
	6300 5200 6300 5350
Connection ~ 6300 5250
Wire Wire Line
	6100 5750 6300 5750
Wire Wire Line
	6300 5650 6300 5850
Connection ~ 6300 5750
$Comp
L VCC #PWR07
U 1 1 58FDEAEB
P 5850 1850
F 0 "#PWR07" H 5850 1700 50  0001 C CNN
F 1 "VCC" H 5850 2000 50  0000 C CNN
F 2 "" H 5850 1850 50  0000 C CNN
F 3 "" H 5850 1850 50  0000 C CNN
	1    5850 1850
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR08
U 1 1 58FDEB29
P 5850 2750
F 0 "#PWR08" H 5850 2500 50  0001 C CNN
F 1 "GND" H 5850 2600 50  0000 C CNN
F 2 "" H 5850 2750 50  0000 C CNN
F 3 "" H 5850 2750 50  0000 C CNN
	1    5850 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	5850 2750 5850 2650
Wire Wire Line
	5850 2250 5850 2050
Wire Wire Line
	5850 2050 5900 2050
Wire Wire Line
	5900 1950 5850 1950
Wire Wire Line
	5850 1950 5850 1850
Wire Wire Line
	5350 2450 5550 2450
Wire Wire Line
	2750 2750 2750 2850
Wire Wire Line
	2750 3150 2750 3300
Wire Wire Line
	2750 3600 2750 3700
Text HLabel 2950 3200 2    60   Output ~ 0
Vin
Text HLabel 4850 2450 0    60   Input ~ 0
MOTOR
Wire Wire Line
	4850 2450 5050 2450
Wire Wire Line
	2750 3200 2950 3200
Connection ~ 2750 3200
Wire Wire Line
	1700 1950 1700 1600
Connection ~ 2050 1600
Wire Wire Line
	1700 2050 1700 2350
Connection ~ 2050 2350
Wire Wire Line
	3850 4600 3150 4600
Wire Wire Line
	2750 5350 3400 5350
Wire Wire Line
	3850 4700 3200 4700
Wire Wire Line
	3850 4800 3250 4800
$Comp
L VCC #PWR09
U 1 1 58FDF957
P 4450 4550
F 0 "#PWR09" H 4450 4400 50  0001 C CNN
F 1 "VCC" H 4450 4700 50  0000 C CNN
F 2 "" H 4450 4550 50  0000 C CNN
F 3 "" H 4450 4550 50  0000 C CNN
	1    4450 4550
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR010
U 1 1 58FDF995
P 4650 4850
F 0 "#PWR010" H 4650 4600 50  0001 C CNN
F 1 "GND" H 4650 4700 50  0000 C CNN
F 2 "" H 4650 4850 50  0000 C CNN
F 3 "" H 4650 4850 50  0000 C CNN
	1    4650 4850
	1    0    0    -1  
$EndComp
Wire Wire Line
	4350 4800 4650 4800
Wire Wire Line
	4350 4600 4450 4600
Wire Wire Line
	4450 4600 4450 4550
Wire Wire Line
	4350 4700 4550 4700
Wire Wire Line
	4550 5000 3300 5000
Wire Wire Line
	3300 5000 3300 5250
Text HLabel 2850 5550 0    60   Input ~ 0
Vin
Text HLabel 2750 5350 0    60   Input ~ 0
MOTOR
Wire Wire Line
	3400 5550 2850 5550
$Comp
L VCC #PWR011
U 1 1 58FE0109
P 3850 6300
F 0 "#PWR011" H 3850 6150 50  0001 C CNN
F 1 "VCC" H 3850 6450 50  0000 C CNN
F 2 "" H 3850 6300 50  0000 C CNN
F 3 "" H 3850 6300 50  0000 C CNN
	1    3850 6300
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR012
U 1 1 58FE014A
P 3850 6900
F 0 "#PWR012" H 3850 6650 50  0001 C CNN
F 1 "GND" H 3850 6750 50  0000 C CNN
F 2 "" H 3850 6900 50  0000 C CNN
F 3 "" H 3850 6900 50  0000 C CNN
	1    3850 6900
	1    0    0    -1  
$EndComp
Wire Wire Line
	3950 6900 3850 6900
Wire Wire Line
	3950 6300 3850 6300
Connection ~ 3150 5350
Connection ~ 3200 5450
Wire Wire Line
	2850 5650 3400 5650
Wire Wire Line
	2150 5250 3400 5250
Connection ~ 3300 5250
$Comp
L R R1
U 1 1 59172111
P 1850 3000
F 0 "R1" V 1930 3000 50  0000 C CNN
F 1 "100k" V 1850 3000 50  0000 C CNN
F 2 "REInnovationFootprint:TH_Resistor_1" V 1780 3000 50  0001 C CNN
F 3 "" H 1850 3000 50  0000 C CNN
F 4 "~" H 1850 3000 60  0000 C CNN "Notes"
F 5 "~" H 1850 3000 60  0001 C CNN "Description"
F 6 "~" H 1850 3000 60  0001 C CNN "Manufacturer"
F 7 "~" H 1850 3000 60  0001 C CNN "Manufacturer Part No"
F 8 "~" H 1850 3000 60  0001 C CNN "Supplier 1"
F 9 "~" H 1850 3000 60  0001 C CNN "Supplier 1 Part No"
F 10 "0.01" H 1850 3000 60  0001 C CNN "Supplier 1 Cost"
F 11 "~" H 1850 3000 60  0001 C CNN "Supplier 2"
F 12 "~" H 1850 3000 60  0001 C CNN "Supplier 2 Part No"
F 13 "~" H 1850 3000 60  0001 C CNN "Supplier 2 Cost"
	1    1850 3000
	-1   0    0    1   
$EndComp
$Comp
L R R2
U 1 1 59172117
P 1850 3450
F 0 "R2" V 1930 3450 50  0000 C CNN
F 1 "10k" V 1850 3450 50  0000 C CNN
F 2 "REInnovationFootprint:TH_Resistor_1" V 1780 3450 50  0001 C CNN
F 3 "" H 1850 3450 50  0000 C CNN
F 4 "~" H 1850 3450 60  0000 C CNN "Notes"
F 5 "~" H 1850 3450 60  0001 C CNN "Description"
F 6 "~" H 1850 3450 60  0001 C CNN "Manufacturer"
F 7 "~" H 1850 3450 60  0001 C CNN "Manufacturer Part No"
F 8 "~" H 1850 3450 60  0001 C CNN "Supplier 1"
F 9 "~" H 1850 3450 60  0001 C CNN "Supplier 1 Part No"
F 10 "0.01" H 1850 3450 60  0001 C CNN "Supplier 1 Cost"
F 11 "~" H 1850 3450 60  0001 C CNN "Supplier 2"
F 12 "~" H 1850 3450 60  0001 C CNN "Supplier 2 Part No"
F 13 "~" H 1850 3450 60  0001 C CNN "Supplier 2 Cost"
	1    1850 3450
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR013
U 1 1 59172123
P 1850 3700
F 0 "#PWR013" H 1850 3450 50  0001 C CNN
F 1 "GND" H 1850 3550 50  0000 C CNN
F 2 "" H 1850 3700 50  0000 C CNN
F 3 "" H 1850 3700 50  0000 C CNN
	1    1850 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	1850 3150 1850 3300
Wire Wire Line
	1850 3600 1850 3700
Text HLabel 2050 3200 2    60   Output ~ 0
Vsolar
Wire Wire Line
	1850 3200 2050 3200
Connection ~ 1850 3200
Wire Wire Line
	1850 2850 1850 1600
Connection ~ 1850 1600
Text HLabel 2850 5650 0    60   Input ~ 0
Vsolar
$Comp
L CONN_01X07 P5
U 1 1 59173C75
P 4150 6600
F 0 "P5" H 4150 7000 50  0000 C CNN
F 1 "HEADER" V 4250 6600 50  0000 C CNN
F 2 "REInnovationFootprint:SIL-7_DIO" H 4150 6600 50  0001 C CNN
F 3 "" H 4150 6600 50  0000 C CNN
	1    4150 6600
	1    0    0    -1  
$EndComp
Wire Wire Line
	3950 6800 3000 6800
Wire Wire Line
	3000 6800 3000 5250
Wire Wire Line
	3950 6700 2950 6700
Wire Wire Line
	2950 6700 2950 5350
Connection ~ 2950 5350
Wire Wire Line
	3050 6600 3950 6600
Wire Wire Line
	3050 6600 3050 5450
Wire Wire Line
	3950 6500 3100 6500
Wire Wire Line
	3100 6500 3100 5550
Connection ~ 3100 5550
Wire Wire Line
	3250 5750 3400 5750
Wire Wire Line
	3950 6400 3150 6400
$Comp
L CONN_01X01 P10
U 1 1 5917491E
P 5050 3600
F 0 "P10" H 5050 3700 50  0000 C CNN
F 1 "HOLES" V 5150 3600 50  0000 C CNN
F 2 "REInnovationFootprint:PCB_Holes_40x50" H 5050 3600 50  0001 C CNN
F 3 "" H 5050 3600 50  0000 C CNN
F 4 "~" H 5050 3600 60  0001 C CNN "Description"
F 5 "~" H 5050 3600 60  0001 C CNN "Notes"
F 6 "~" H 5050 3600 60  0001 C CNN "Manufacturer"
F 7 "~" H 5050 3600 60  0001 C CNN "Manufacturer Part No"
F 8 "~" H 5050 3600 60  0001 C CNN "Supplier 1"
F 9 "~" H 5050 3600 60  0001 C CNN "Supplier 1 Part No"
F 10 "~" H 5050 3600 60  0001 C CNN "Supplier 2"
F 11 "~" H 5050 3600 60  0001 C CNN "Supplier 2 Part No"
F 12 "~" H 5050 3600 60  0001 C CNN "Cost"
	1    5050 3600
	0    -1   -1   0   
$EndComp
NoConn ~ 5050 3800
Wire Wire Line
	3150 6400 3150 5650
Connection ~ 3150 5650
$Comp
L R R6
U 1 1 591769AF
P 2150 5600
F 0 "R6" V 2230 5600 50  0000 C CNN
F 1 "330" V 2150 5600 50  0000 C CNN
F 2 "REInnovationFootprint:TH_Resistor_1" V 2080 5600 50  0001 C CNN
F 3 "" H 2150 5600 50  0000 C CNN
F 4 "~" H 2150 5600 60  0000 C CNN "Notes"
F 5 "~" H 2150 5600 60  0001 C CNN "Description"
F 6 "~" H 2150 5600 60  0001 C CNN "Manufacturer"
F 7 "~" H 2150 5600 60  0001 C CNN "Manufacturer Part No"
F 8 "~" H 2150 5600 60  0001 C CNN "Supplier 1"
F 9 "~" H 2150 5600 60  0001 C CNN "Supplier 1 Part No"
F 10 "0.01" H 2150 5600 60  0001 C CNN "Supplier 1 Cost"
F 11 "~" H 2150 5600 60  0001 C CNN "Supplier 2"
F 12 "~" H 2150 5600 60  0001 C CNN "Supplier 2 Part No"
F 13 "~" H 2150 5600 60  0001 C CNN "Supplier 2 Cost"
	1    2150 5600
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR014
U 1 1 59176BF9
P 2150 6450
F 0 "#PWR014" H 2150 6200 50  0001 C CNN
F 1 "GND" H 2150 6300 50  0000 C CNN
F 2 "" H 2150 6450 50  0000 C CNN
F 3 "" H 2150 6450 50  0000 C CNN
	1    2150 6450
	1    0    0    -1  
$EndComp
Wire Wire Line
	4550 4700 4550 5000
Wire Wire Line
	3250 4800 3250 5750
Wire Wire Line
	3200 4700 3200 5450
Wire Wire Line
	3150 4600 3150 5350
Wire Notes Line
	500  3950 11200 3950
Wire Notes Line
	4300 3950 4300 500 
Wire Wire Line
	2150 5750 2150 5850
Wire Wire Line
	2150 6250 2150 6450
Text Notes 1000 5200 0    60   ~ 0
ATTiny85 Arduino Pins:\nIC Pin:       Arduino Ref:\n1                5/A0/RST\n2                3/A3\n3                4/A2\n4                GND\n5                0 - PWM\n6                1 - PWM\n7                2/A1\n8                +Supply
$Comp
L LED D2
U 1 1 5968E412
P 2150 6050
F 0 "D2" H 2150 6150 50  0000 C CNN
F 1 "LED" H 2150 5950 50  0000 C CNN
F 2 "REInnovationFootprint:LED-5MM_larg_pad" H 2150 6050 50  0001 C CNN
F 3 "" H 2150 6050 50  0000 C CNN
F 4 "~" H 2150 6050 60  0000 C CNN "Notes"
F 5 "5mm White LED ?" H 2150 6050 60  0001 C CNN "Description"
F 6 "~" H 2150 6050 60  0001 C CNN "Manufacturer"
F 7 "~" H 2150 6050 60  0001 C CNN "Manufacturer Part No"
F 8 "Aliexpress" H 2150 6050 60  0001 C CNN "Supplier 1"
F 9 "~" H 2150 6050 60  0001 C CNN "Supplier 1 Part No"
F 10 "0.1" H 2150 6050 60  0001 C CNN "Supplier 1 Cost"
F 11 "~" H 2150 6050 60  0001 C CNN "Supplier 2"
F 12 "~" H 2150 6050 60  0001 C CNN "Supplier 2 Part No"
F 13 "~" H 2150 6050 60  0001 C CNN "Supplier 2 Cost"
	1    2150 6050
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2150 5250 2150 5450
Connection ~ 3000 5250
Wire Wire Line
	3050 5450 3400 5450
Text Notes 4850 4900 0    60   ~ 0
ISP Connections:\n1 - MISO\n2 - Vcc\n3 - SCK\n4 - MOSI\n5 - RESET\n6 - GND\n
Wire Wire Line
	4650 4800 4650 4850
$EndSCHEMATC
