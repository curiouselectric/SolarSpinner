EESchema Schematic File Version 4
LIBS:SolarSpinner-rescue
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
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
LIBS:SolarSpinner-cache
EELAYER 29 0
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
L SolarSpinner-rescue:CP-Device-SolarSpinner-rescue C1
U 1 1 58A49EA0
P 2800 1850
F 0 "C1" H 2825 1950 50  0000 L CNN
F 1 "0.47F" H 2825 1750 50  0000 L CNN
F 2 "REInnovationFootprint:C_0_47F_SuperCap_2POS" H 2838 1700 50  0001 C CNN
F 3 "" H 2800 1850 50  0000 C CNN
F 4 "~" H 2800 1850 60  0001 C CNN "Notes"
F 5 "~" H 2800 1850 60  0001 C CNN "Description"
F 6 "~" H 2800 1850 60  0001 C CNN "Manufacturer"
F 7 "~" H 2800 1850 60  0001 C CNN "Manufacturer Part No"
F 8 "Aliexpress" H 2800 1850 60  0001 C CNN "Supplier 1"
F 9 "~" H 2800 1850 60  0001 C CNN "Supplier 1 Part No"
F 10 "0.4" H 2800 1850 60  0001 C CNN "Supplier 1 Cost"
F 11 "~" H 2800 1850 60  0001 C CNN "Supplier 2"
F 12 "~" H 2800 1850 60  0001 C CNN "Supplier 2 Part No"
F 13 "~" H 2800 1850 60  0001 C CNN "Supplier 2 Cost"
F 14 "~" H 2800 1850 60  0001 C CNN "Cost"
	1    2800 1850
	1    0    0    -1  
$EndComp
$Comp
L SolarSpinner-rescue:D_Schottky-Device-SolarSpinner-rescue D1
U 1 1 58A4A198
P 2200 1400
F 0 "D1" H 2200 1500 50  0000 C CNN
F 1 "1N5819" H 2200 1300 50  0000 C CNN
F 2 "REInnovationFootprint:TH_Diode_1" H 2200 1400 50  0001 C CNN
F 3 "" H 2200 1400 50  0000 C CNN
F 4 "~" H 2200 1400 60  0000 C CNN "Notes"
F 5 "~" H 2200 1400 60  0001 C CNN "Description"
F 6 "~" H 2200 1400 60  0001 C CNN "Manufacturer"
F 7 "~" H 2200 1400 60  0001 C CNN "Manufacturer Part No"
F 8 "RS" H 2200 1400 60  0001 C CNN "Supplier 1"
F 9 "~" H 2200 1400 60  0001 C CNN "Supplier 1 Part No"
F 10 "0.03" H 2200 1400 60  0001 C CNN "Supplier 1 Cost"
F 11 "~" H 2200 1400 60  0001 C CNN "Supplier 2"
F 12 "~" H 2200 1400 60  0001 C CNN "Supplier 2 Part No"
F 13 "~" H 2200 1400 60  0001 C CNN "Supplier 2 Cost"
	1    2200 1400
	-1   0    0    1   
$EndComp
$Comp
L SolarSpinner-rescue:Conn_01x01_Male-Connector-SolarSpinner-rescue P6
U 1 1 58A4A9B1
P 10300 6100
F 0 "P6" H 10300 6200 50  0000 C CNN
F 1 "LOGO1" V 10150 6100 50  0000 C CNN
F 2 "CuriousElectric3:2019_011_16_CuriousElectricCompany_Logo_Round_Logo_No_words_KiCAD_10mm_PCBLogo" H 10300 6100 50  0001 C CNN
F 3 "" H 10300 6100 50  0000 C CNN
	1    10300 6100
	0    -1   1    0   
$EndComp
$Comp
L SolarSpinner-rescue:Conn_01x01_Male-Connector-SolarSpinner-rescue P7
U 1 1 58A4AA34
P 10600 6100
F 0 "P7" H 10600 6200 50  0000 C CNN
F 1 "LOGO2" V 10450 6100 50  0000 C CNN
F 2 "CuriousElectric3:TCEC_Words_13mm" H 10600 6100 50  0001 C CNN
F 3 "" H 10600 6100 50  0000 C CNN
	1    10600 6100
	0    -1   1    0   
$EndComp
$Comp
L matts_components:GND #PWR05
U 1 1 58A4AEF1
P 3450 2250
F 0 "#PWR05" H 3450 2000 50  0001 C CNN
F 1 "GND" H 3450 2100 50  0000 C CNN
F 2 "" H 3450 2250 50  0000 C CNN
F 3 "" H 3450 2250 50  0000 C CNN
	1    3450 2250
	1    0    0    -1  
$EndComp
Wire Wire Line
	1750 1650 1750 1400
Wire Wire Line
	1750 2050 1750 2150
Wire Wire Line
	2800 1700 2800 1400
Connection ~ 2800 1400
Wire Wire Line
	2800 2000 2800 2150
Connection ~ 2800 2150
Wire Wire Line
	3450 2150 3450 2250
NoConn ~ 10300 6300
NoConn ~ 10600 6300
Wire Wire Line
	2350 1400 2800 1400
$Comp
L SolarSpinner-rescue:VCC-power-SolarSpinner-rescue #PWR04
U 1 1 58FDDFB1
P 3400 1400
F 0 "#PWR04" H 3400 1250 50  0001 C CNN
F 1 "VCC" H 3400 1550 50  0000 C CNN
F 2 "" H 3400 1400 50  0000 C CNN
F 3 "" H 3400 1400 50  0000 C CNN
	1    3400 1400
	1    0    0    -1  
$EndComp
$Comp
L matts_components:ATTINY85-P IC1
U 1 1 58FDDFEF
P 3700 5500
F 0 "IC1" H 3800 5550 60  0000 C CNN
F 1 "ATTINY85-P" H 5700 4750 60  0000 C CNN
F 2 "REInnovationFootprint:DIP-8_300_ELL" H 3800 4750 60  0001 C CNN
F 3 "http://www.farnell.com/datasheets/1744708.pdf?_ga=2.238630600.937687315.1494695229-1523402957.1422198431" H 3700 5500 60  0001 C CNN
F 4 "~" H 3700 5500 60  0001 C CNN "Notes"
F 5 "8 Bit uP 20MHz" H 3700 5500 60  0001 C CNN "Description"
F 6 "ATMEL" H 3700 5500 60  0001 C CNN "Manufacturer"
F 7 "ATTINY85-20PU" H 3700 5500 60  0001 C CNN "Manufacturer Part No"
F 8 "Farnell" H 3700 5500 60  0001 C CNN "Supplier 1"
F 9 "1455162" H 3700 5500 60  0001 C CNN "Supplier 1 Part No"
F 10 "1.12" H 3700 5500 60  0001 C CNN "Supplier 1 Cost"
F 11 "~" H 3700 5500 60  0001 C CNN "Supplier 2"
F 12 "~" H 3700 5500 60  0001 C CNN "Supplier 2 Part No"
F 13 "~" H 3700 5500 60  0001 C CNN "Supplier 2 Cost"
F 14 "~" H 3700 5500 60  0001 C CNN "Cost"
	1    3700 5500
	1    0    0    -1  
$EndComp
$Comp
L SolarSpinner-rescue:C-Device-SolarSpinner-rescue C2
U 1 1 58FDE0E2
P 6400 5850
F 0 "C2" H 6425 5950 50  0000 L CNN
F 1 "100n" H 6425 5750 50  0000 L CNN
F 2 "REInnovationFootprint:C1_wide_lg_pad_2" H 6438 5700 50  0001 C CNN
F 3 "" H 6400 5850 50  0000 C CNN
F 4 "~" H 6400 5850 60  0001 C CNN "Notes"
F 5 "~" H 6400 5850 60  0001 C CNN "Description"
F 6 "~" H 6400 5850 60  0001 C CNN "Manufacturer"
F 7 "~" H 6400 5850 60  0001 C CNN "Manufacturer Part No"
F 8 "Rapid" H 6400 5850 60  0001 C CNN "Supplier 1"
F 9 "~" H 6400 5850 60  0001 C CNN "Supplier 1 Part No"
F 10 "0.07" H 6400 5850 60  0001 C CNN "Supplier 1 Cost"
F 11 "~" H 6400 5850 60  0001 C CNN "Supplier 2"
F 12 "~" H 6400 5850 60  0001 C CNN "Supplier 2 Part No"
F 13 "~" H 6400 5850 60  0001 C CNN "Supplier 2 Cost"
F 14 "~" H 6400 5850 60  0001 C CNN "Cost"
	1    6400 5850
	1    0    0    -1  
$EndComp
$Comp
L SolarSpinner-rescue:R-Device-SolarSpinner-rescue R3
U 1 1 58FDE1C5
P 2450 2800
F 0 "R3" V 2530 2800 50  0000 C CNN
F 1 "1M" V 2450 2800 50  0000 C CNN
F 2 "REInnovationFootprint:TH_Resistor_1" V 2380 2800 50  0001 C CNN
F 3 "" H 2450 2800 50  0000 C CNN
F 4 "~" H 2450 2800 60  0000 C CNN "Notes"
F 5 "~" H 2450 2800 60  0001 C CNN "Description"
F 6 "~" H 2450 2800 60  0001 C CNN "Manufacturer"
F 7 "~" H 2450 2800 60  0001 C CNN "Manufacturer Part No"
F 8 "~" H 2450 2800 60  0001 C CNN "Supplier 1"
F 9 "~" H 2450 2800 60  0001 C CNN "Supplier 1 Part No"
F 10 "0.01" H 2450 2800 60  0001 C CNN "Supplier 1 Cost"
F 11 "~" H 2450 2800 60  0001 C CNN "Supplier 2"
F 12 "~" H 2450 2800 60  0001 C CNN "Supplier 2 Part No"
F 13 "~" H 2450 2800 60  0001 C CNN "Supplier 2 Cost"
	1    2450 2800
	-1   0    0    1   
$EndComp
$Comp
L SolarSpinner-rescue:R-Device-SolarSpinner-rescue R4
U 1 1 58FDE28B
P 2450 3250
F 0 "R4" V 2530 3250 50  0000 C CNN
F 1 "100k" V 2450 3250 50  0000 C CNN
F 2 "REInnovationFootprint:TH_Resistor_1" V 2380 3250 50  0001 C CNN
F 3 "" H 2450 3250 50  0000 C CNN
F 4 "~" H 2450 3250 60  0000 C CNN "Notes"
F 5 "~" H 2450 3250 60  0001 C CNN "Description"
F 6 "~" H 2450 3250 60  0001 C CNN "Manufacturer"
F 7 "~" H 2450 3250 60  0001 C CNN "Manufacturer Part No"
F 8 "~" H 2450 3250 60  0001 C CNN "Supplier 1"
F 9 "~" H 2450 3250 60  0001 C CNN "Supplier 1 Part No"
F 10 "0.01" H 2450 3250 60  0001 C CNN "Supplier 1 Cost"
F 11 "~" H 2450 3250 60  0001 C CNN "Supplier 2"
F 12 "~" H 2450 3250 60  0001 C CNN "Supplier 2 Part No"
F 13 "~" H 2450 3250 60  0001 C CNN "Supplier 2 Cost"
	1    2450 3250
	-1   0    0    1   
$EndComp
$Comp
L SolarSpinner-rescue:VCC-power-SolarSpinner-rescue #PWR02
U 1 1 58FDE2CD
P 2450 2550
F 0 "#PWR02" H 2450 2400 50  0001 C CNN
F 1 "VCC" H 2450 2700 50  0000 C CNN
F 2 "" H 2450 2550 50  0000 C CNN
F 3 "" H 2450 2550 50  0000 C CNN
	1    2450 2550
	1    0    0    -1  
$EndComp
$Comp
L matts_components:GND #PWR03
U 1 1 58FDE2FC
P 2450 3500
F 0 "#PWR03" H 2450 3250 50  0001 C CNN
F 1 "GND" H 2450 3350 50  0000 C CNN
F 2 "" H 2450 3500 50  0000 C CNN
F 3 "" H 2450 3500 50  0000 C CNN
	1    2450 3500
	1    0    0    -1  
$EndComp
$Comp
L SolarSpinner-rescue:VCC-power-SolarSpinner-rescue #PWR013
U 1 1 58FDE32B
P 6400 5550
F 0 "#PWR013" H 6400 5400 50  0001 C CNN
F 1 "VCC" H 6400 5700 50  0000 C CNN
F 2 "" H 6400 5550 50  0000 C CNN
F 3 "" H 6400 5550 50  0000 C CNN
	1    6400 5550
	1    0    0    -1  
$EndComp
$Comp
L matts_components:GND #PWR014
U 1 1 58FDE35A
P 6400 6200
F 0 "#PWR014" H 6400 5950 50  0001 C CNN
F 1 "GND" H 6400 6050 50  0000 C CNN
F 2 "" H 6400 6200 50  0000 C CNN
F 3 "" H 6400 6200 50  0000 C CNN
	1    6400 6200
	1    0    0    -1  
$EndComp
$Comp
L SolarSpinner-rescue:Q_NPN_CBE-Device-SolarSpinner-rescue Q1
U 1 1 58FDE37F
P 6550 2250
F 0 "Q1" H 6850 2300 50  0000 R CNN
F 1 "BC547" H 7000 2200 50  0000 R CNN
F 2 "REInnovationFootprint:TO92-EBC_large_pad" H 6750 2350 50  0001 C CNN
F 3 "" H 6550 2250 50  0000 C CNN
	1    6550 2250
	1    0    0    -1  
$EndComp
$Comp
L SolarSpinner-rescue:R-Device-SolarSpinner-rescue R5
U 1 1 58FDE43D
P 6000 2250
F 0 "R5" V 6080 2250 50  0000 C CNN
F 1 "120" V 6000 2250 50  0000 C CNN
F 2 "REInnovationFootprint:TH_Resistor_1" V 5930 2250 50  0001 C CNN
F 3 "" H 6000 2250 50  0000 C CNN
F 4 "~" H 6000 2250 60  0000 C CNN "Notes"
F 5 "~" H 6000 2250 60  0001 C CNN "Description"
F 6 "~" H 6000 2250 60  0001 C CNN "Manufacturer"
F 7 "~" H 6000 2250 60  0001 C CNN "Manufacturer Part No"
F 8 "~" H 6000 2250 60  0001 C CNN "Supplier 1"
F 9 "~" H 6000 2250 60  0001 C CNN "Supplier 1 Part No"
F 10 "0.01" H 6000 2250 60  0001 C CNN "Supplier 1 Cost"
F 11 "~" H 6000 2250 60  0001 C CNN "Supplier 2"
F 12 "~" H 6000 2250 60  0001 C CNN "Supplier 2 Part No"
F 13 "~" H 6000 2250 60  0001 C CNN "Supplier 2 Cost"
	1    6000 2250
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6200 5600 6400 5600
Wire Wire Line
	6400 5550 6400 5600
Connection ~ 6400 5600
Wire Wire Line
	6200 6100 6400 6100
Wire Wire Line
	6400 6000 6400 6100
Connection ~ 6400 6100
$Comp
L SolarSpinner-rescue:VCC-power-SolarSpinner-rescue #PWR011
U 1 1 58FDEAEB
P 6650 1300
F 0 "#PWR011" H 6650 1150 50  0001 C CNN
F 1 "VCC" H 6650 1450 50  0000 C CNN
F 2 "" H 6650 1300 50  0000 C CNN
F 3 "" H 6650 1300 50  0000 C CNN
	1    6650 1300
	1    0    0    -1  
$EndComp
$Comp
L matts_components:GND #PWR012
U 1 1 58FDEB29
P 6650 2550
F 0 "#PWR012" H 6650 2300 50  0001 C CNN
F 1 "GND" H 6650 2400 50  0000 C CNN
F 2 "" H 6650 2550 50  0000 C CNN
F 3 "" H 6650 2550 50  0000 C CNN
	1    6650 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	6650 2550 6650 2450
Wire Wire Line
	6650 2050 6650 2000
Wire Wire Line
	6650 1850 6700 1850
Wire Wire Line
	6700 1750 6650 1750
Wire Wire Line
	6150 2250 6250 2250
Wire Wire Line
	2450 2550 2450 2650
Wire Wire Line
	2450 2950 2450 3000
Wire Wire Line
	2450 3400 2450 3500
Text HLabel 2650 3000 2    60   Output ~ 0
Vin
Text HLabel 5650 2250 0    60   Input ~ 0
MOTOR
Wire Wire Line
	5650 2250 5850 2250
Wire Wire Line
	2450 3000 2650 3000
Connection ~ 2450 3000
Connection ~ 1750 1400
$Comp
L SolarSpinner-rescue:VCC-power-SolarSpinner-rescue #PWR08
U 1 1 58FDF957
P 4550 4900
F 0 "#PWR08" H 4550 4750 50  0001 C CNN
F 1 "VCC" H 4550 5050 50  0000 C CNN
F 2 "" H 4550 4900 50  0000 C CNN
F 3 "" H 4550 4900 50  0000 C CNN
	1    4550 4900
	1    0    0    -1  
$EndComp
$Comp
L matts_components:GND #PWR09
U 1 1 58FDF995
P 4750 5200
F 0 "#PWR09" H 4750 4950 50  0001 C CNN
F 1 "GND" H 4750 5050 50  0000 C CNN
F 2 "" H 4750 5200 50  0000 C CNN
F 3 "" H 4750 5200 50  0000 C CNN
	1    4750 5200
	1    0    0    -1  
$EndComp
Wire Wire Line
	4450 5150 4750 5150
Wire Wire Line
	4450 4950 4550 4950
Wire Wire Line
	4550 4950 4550 4900
Wire Wire Line
	4450 5050 4650 5050
Wire Wire Line
	4650 5350 3400 5350
Wire Wire Line
	3400 5350 3400 5600
Text HLabel 2950 5900 0    60   Input ~ 0
Vin
Text HLabel 2950 5700 0    60   Input ~ 0
MOTOR
Wire Wire Line
	3500 5900 3200 5900
$Comp
L SolarSpinner-rescue:VCC-power-SolarSpinner-rescue #PWR06
U 1 1 58FE0109
P 3950 6650
F 0 "#PWR06" H 3950 6500 50  0001 C CNN
F 1 "VCC" H 3950 6800 50  0000 C CNN
F 2 "" H 3950 6650 50  0000 C CNN
F 3 "" H 3950 6650 50  0000 C CNN
	1    3950 6650
	1    0    0    -1  
$EndComp
$Comp
L matts_components:GND #PWR07
U 1 1 58FE014A
P 3950 7350
F 0 "#PWR07" H 3950 7100 50  0001 C CNN
F 1 "GND" H 3950 7200 50  0000 C CNN
F 2 "" H 3950 7350 50  0000 C CNN
F 3 "" H 3950 7350 50  0000 C CNN
	1    3950 7350
	1    0    0    -1  
$EndComp
Wire Wire Line
	4050 7250 3950 7250
Wire Wire Line
	4050 6650 3950 6650
Connection ~ 3250 5700
Connection ~ 3300 5800
Wire Wire Line
	2950 6000 3250 6000
Connection ~ 3400 5600
$Comp
L SolarSpinner-rescue:R-Device-SolarSpinner-rescue R1
U 1 1 59172111
P 1550 2800
F 0 "R1" V 1630 2800 50  0000 C CNN
F 1 "1M" V 1550 2800 50  0000 C CNN
F 2 "REInnovationFootprint:TH_Resistor_1" V 1480 2800 50  0001 C CNN
F 3 "" H 1550 2800 50  0000 C CNN
F 4 "~" H 1550 2800 60  0000 C CNN "Notes"
F 5 "~" H 1550 2800 60  0001 C CNN "Description"
F 6 "~" H 1550 2800 60  0001 C CNN "Manufacturer"
F 7 "~" H 1550 2800 60  0001 C CNN "Manufacturer Part No"
F 8 "~" H 1550 2800 60  0001 C CNN "Supplier 1"
F 9 "~" H 1550 2800 60  0001 C CNN "Supplier 1 Part No"
F 10 "0.01" H 1550 2800 60  0001 C CNN "Supplier 1 Cost"
F 11 "~" H 1550 2800 60  0001 C CNN "Supplier 2"
F 12 "~" H 1550 2800 60  0001 C CNN "Supplier 2 Part No"
F 13 "~" H 1550 2800 60  0001 C CNN "Supplier 2 Cost"
	1    1550 2800
	-1   0    0    1   
$EndComp
$Comp
L SolarSpinner-rescue:R-Device-SolarSpinner-rescue R2
U 1 1 59172117
P 1550 3250
F 0 "R2" V 1630 3250 50  0000 C CNN
F 1 "100k" V 1550 3250 50  0000 C CNN
F 2 "REInnovationFootprint:TH_Resistor_1" V 1480 3250 50  0001 C CNN
F 3 "" H 1550 3250 50  0000 C CNN
F 4 "~" H 1550 3250 60  0000 C CNN "Notes"
F 5 "~" H 1550 3250 60  0001 C CNN "Description"
F 6 "~" H 1550 3250 60  0001 C CNN "Manufacturer"
F 7 "~" H 1550 3250 60  0001 C CNN "Manufacturer Part No"
F 8 "~" H 1550 3250 60  0001 C CNN "Supplier 1"
F 9 "~" H 1550 3250 60  0001 C CNN "Supplier 1 Part No"
F 10 "0.01" H 1550 3250 60  0001 C CNN "Supplier 1 Cost"
F 11 "~" H 1550 3250 60  0001 C CNN "Supplier 2"
F 12 "~" H 1550 3250 60  0001 C CNN "Supplier 2 Part No"
F 13 "~" H 1550 3250 60  0001 C CNN "Supplier 2 Cost"
	1    1550 3250
	-1   0    0    1   
$EndComp
$Comp
L matts_components:GND #PWR01
U 1 1 59172123
P 1550 3500
F 0 "#PWR01" H 1550 3250 50  0001 C CNN
F 1 "GND" H 1550 3350 50  0000 C CNN
F 2 "" H 1550 3500 50  0000 C CNN
F 3 "" H 1550 3500 50  0000 C CNN
	1    1550 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 2950 1550 3000
Wire Wire Line
	1550 3400 1550 3500
Text HLabel 1750 3000 2    60   Output ~ 0
Vsolar
Wire Wire Line
	1550 3000 1750 3000
Connection ~ 1550 3000
Wire Wire Line
	1550 2650 1550 1400
Text HLabel 2950 6000 0    60   Input ~ 0
Vsolar
$Comp
L SolarSpinner-rescue:Conn_01x07_Male-Connector-SolarSpinner-rescue P3
U 1 1 59173C75
P 4250 6950
F 0 "P3" H 4250 7350 50  0000 C CNN
F 1 "IO" V 4150 6950 50  0000 C CNN
F 2 "REInnovationFootprint:SIL-7_DIO" H 4250 6950 50  0001 C CNN
F 3 "" H 4250 6950 50  0000 C CNN
	1    4250 6950
	-1   0    0    -1  
$EndComp
Wire Wire Line
	4050 7150 3100 7150
Wire Wire Line
	3100 7150 3100 5600
Wire Wire Line
	4050 7050 3050 7050
Wire Wire Line
	3050 7050 3050 5700
Wire Wire Line
	3150 6950 4050 6950
Wire Wire Line
	3150 6950 3150 5800
Wire Wire Line
	4050 6850 3200 6850
Wire Wire Line
	3200 6850 3200 5900
Connection ~ 3200 5900
Wire Wire Line
	3350 6100 3500 6100
Wire Wire Line
	4050 6750 3250 6750
$Comp
L SolarSpinner-rescue:Conn_01x01_Male-Connector-SolarSpinner-rescue P5
U 1 1 5917491E
P 10000 6100
F 0 "P5" H 10000 6200 50  0000 C CNN
F 1 "HOLES" V 9850 6100 50  0000 C CNN
F 2 "REInnovationFootprint:PCB_Holes_40x50" H 10000 6100 50  0001 C CNN
F 3 "" H 10000 6100 50  0000 C CNN
F 4 "~" H 10000 6100 60  0001 C CNN "Description"
F 5 "~" H 10000 6100 60  0001 C CNN "Notes"
F 6 "~" H 10000 6100 60  0001 C CNN "Manufacturer"
F 7 "~" H 10000 6100 60  0001 C CNN "Manufacturer Part No"
F 8 "~" H 10000 6100 60  0001 C CNN "Supplier 1"
F 9 "~" H 10000 6100 60  0001 C CNN "Supplier 1 Part No"
F 10 "~" H 10000 6100 60  0001 C CNN "Supplier 2"
F 11 "~" H 10000 6100 60  0001 C CNN "Supplier 2 Part No"
F 12 "~" H 10000 6100 60  0001 C CNN "Cost"
	1    10000 6100
	0    -1   1    0   
$EndComp
NoConn ~ 10000 6300
Wire Wire Line
	3250 6750 3250 6000
Connection ~ 3250 6000
$Comp
L SolarSpinner-rescue:R-Device-SolarSpinner-rescue R7
U 1 1 591769AF
P 8300 2050
F 0 "R7" V 8380 2050 50  0000 C CNN
F 1 "330" V 8300 2050 50  0000 C CNN
F 2 "REInnovationFootprint:TH_Resistor_1" V 8230 2050 50  0001 C CNN
F 3 "" H 8300 2050 50  0000 C CNN
F 4 "~" H 8300 2050 60  0000 C CNN "Notes"
F 5 "~" H 8300 2050 60  0001 C CNN "Description"
F 6 "~" H 8300 2050 60  0001 C CNN "Manufacturer"
F 7 "~" H 8300 2050 60  0001 C CNN "Manufacturer Part No"
F 8 "~" H 8300 2050 60  0001 C CNN "Supplier 1"
F 9 "~" H 8300 2050 60  0001 C CNN "Supplier 1 Part No"
F 10 "0.01" H 8300 2050 60  0001 C CNN "Supplier 1 Cost"
F 11 "~" H 8300 2050 60  0001 C CNN "Supplier 2"
F 12 "~" H 8300 2050 60  0001 C CNN "Supplier 2 Part No"
F 13 "~" H 8300 2050 60  0001 C CNN "Supplier 2 Cost"
	1    8300 2050
	1    0    0    -1  
$EndComp
$Comp
L matts_components:GND #PWR015
U 1 1 59176BF9
P 8300 2900
F 0 "#PWR015" H 8300 2650 50  0001 C CNN
F 1 "GND" H 8300 2750 50  0000 C CNN
F 2 "" H 8300 2900 50  0000 C CNN
F 3 "" H 8300 2900 50  0000 C CNN
	1    8300 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	4650 5050 4650 5350
Wire Wire Line
	3350 5150 3350 6100
Wire Wire Line
	3300 5050 3300 5800
Wire Wire Line
	3250 4950 3250 5700
Wire Notes Line
	500  3950 11200 3950
Wire Notes Line
	4300 3950 4300 500 
Text Notes 1150 5250 0    60   ~ 0
ATTiny85 Arduino Pins:\nIC Pin:       Arduino Ref:\n1                5/A0/RST\n2                3/A3\n3                4/A2\n4                GND\n5                0 - PWM\n6                1 - PWM\n7                2/A1\n8                +Supply
$Comp
L SolarSpinner-rescue:LED-Device-SolarSpinner-rescue D3
U 1 1 5968E412
P 8300 2500
F 0 "D3" H 8300 2600 50  0000 C CNN
F 1 "LED" H 8300 2400 50  0000 C CNN
F 2 "REInnovationFootprint:TH_LED-5MM_larg_pad" H 8300 2500 50  0001 C CNN
F 3 "" H 8300 2500 50  0000 C CNN
F 4 "~" H 8300 2500 60  0000 C CNN "Notes"
F 5 "5mm White LED ?" H 8300 2500 60  0001 C CNN "Description"
F 6 "~" H 8300 2500 60  0001 C CNN "Manufacturer"
F 7 "~" H 8300 2500 60  0001 C CNN "Manufacturer Part No"
F 8 "Aliexpress" H 8300 2500 60  0001 C CNN "Supplier 1"
F 9 "~" H 8300 2500 60  0001 C CNN "Supplier 1 Part No"
F 10 "0.1" H 8300 2500 60  0001 C CNN "Supplier 1 Cost"
F 11 "~" H 8300 2500 60  0001 C CNN "Supplier 2"
F 12 "~" H 8300 2500 60  0001 C CNN "Supplier 2 Part No"
F 13 "~" H 8300 2500 60  0001 C CNN "Supplier 2 Cost"
	1    8300 2500
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8300 1700 8300 1900
Wire Wire Line
	3150 5800 3300 5800
Text Notes 5100 5100 0    60   ~ 0
ISP Connections:\n1 - MISO\n2 - Vcc\n3 - SCK\n4 - MOSI\n5 - RESET\n6 - GND\n
Wire Wire Line
	4750 5150 4750 5200
Wire Wire Line
	6400 5600 6400 5700
Wire Wire Line
	6400 6100 6400 6200
Wire Wire Line
	2450 3000 2450 3100
Wire Wire Line
	1750 1400 2050 1400
Wire Wire Line
	1750 2150 2800 2150
Wire Wire Line
	3250 5700 3500 5700
Wire Wire Line
	3300 5800 3500 5800
Wire Wire Line
	3400 5600 3500 5600
Wire Wire Line
	1550 3000 1550 3100
Wire Wire Line
	1550 1400 1750 1400
Wire Wire Line
	3050 5700 3250 5700
Wire Wire Line
	3200 5900 2950 5900
Wire Wire Line
	3250 6000 3500 6000
Wire Wire Line
	3100 5600 3400 5600
Text HLabel 2950 5800 0    60   Input ~ 0
LED
Text HLabel 2950 5600 0    60   Input ~ 0
PIEZO
Wire Wire Line
	2950 5600 3100 5600
Connection ~ 3100 5600
Wire Wire Line
	2950 5700 3050 5700
Connection ~ 3050 5700
Wire Wire Line
	2950 5800 3150 5800
Connection ~ 3150 5800
Text HLabel 8200 1700 0    60   Input ~ 0
LED
Wire Wire Line
	8200 1700 8300 1700
$Comp
L SolarSpinner-rescue:Solar_Cells-Device-SolarSpinner-rescue P1
U 1 1 58A49F68
P 1750 1850
F 0 "P1" H 1850 1950 50  0000 L CNN
F 1 "PV_IN" H 1850 1850 50  0000 L CNN
F 2 "REInnovationFootprint:SIL-2_screw_terminal" V 1750 1910 50  0001 C CNN
F 3 "" V 1750 1910 50  0000 C CNN
F 4 "~" H 1750 1850 60  0000 C CNN "Notes"
F 5 "53x30mm 30mA 5V PV module" H 1750 1850 60  0001 C CNN "Description"
F 6 "~" H 1750 1850 60  0001 C CNN "Manufacturer"
F 7 "~" H 1750 1850 60  0001 C CNN "Manufacturer Part No"
F 8 "Aliexpress" H 1750 1850 60  0001 C CNN "Supplier 1"
F 9 "~" H 1750 1850 60  0001 C CNN "Supplier 1 Part No"
F 10 "0.7" H 1750 1850 60  0001 C CNN "Supplier 1 Cost"
F 11 "~" H 1750 1850 60  0001 C CNN "Supplier 2"
F 12 "~" H 1750 1850 60  0001 C CNN "Supplier 2 Part No"
F 13 "~" H 1750 1850 60  0001 C CNN "Supplier 2 Cost"
	1    1750 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	3950 7350 3950 7250
$Comp
L SolarSpinner-rescue:Conn_01x02_Male-Connector-SolarSpinner-rescue P4
U 1 1 58FDE4BD
P 6900 1750
F 0 "P4" H 6900 1900 50  0000 C CNN
F 1 "MOTOR" V 6800 1700 50  0000 C CNN
F 2 "REInnovationFootprint:SIL-2_screw_terminal" H 6900 1750 50  0001 C CNN
F 3 "" H 6900 1750 50  0000 C CNN
	1    6900 1750
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3650 4950 3250 4950
Wire Wire Line
	3650 5150 3350 5150
Wire Wire Line
	3650 5050 3300 5050
$Comp
L matts_components:ISP_3X2 P2
U 1 1 5F3F13F1
P 4050 5100
F 0 "P2" H 4050 5450 50  0000 C CNN
F 1 "ISP" H 4050 5366 40  0000 C CNN
F 2 "REInnovationFootprint:ISP_3x2" H 4050 5100 60  0001 C CNN
F 3 "" H 4050 5100 60  0000 C CNN
	1    4050 5100
	1    0    0    -1  
$EndComp
$Comp
L matts_components:DIODE D2
U 1 1 5F409EC2
P 6300 1800
F 0 "D2" V 6338 1722 40  0000 R CNN
F 1 "1N4001" V 6262 1722 40  0000 R CNN
F 2 "REInnovationFootprint:TH_Diode_1" H 6300 1800 60  0001 C CNN
F 3 "" H 6300 1800 60  0000 C CNN
	1    6300 1800
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6650 2000 6300 2000
Connection ~ 6650 2000
Wire Wire Line
	6650 2000 6650 1850
Wire Wire Line
	6300 1600 6650 1600
Wire Wire Line
	6650 1600 6650 1750
Wire Wire Line
	6650 1600 6650 1300
Connection ~ 6650 1600
Wire Wire Line
	8300 2200 8300 2350
Wire Wire Line
	8300 2650 8300 2900
Wire Wire Line
	2800 2150 3450 2150
Wire Wire Line
	2800 1400 3400 1400
Wire Wire Line
	9550 2300 9550 2850
$Comp
L matts_components:GND #PWR016
U 1 1 5E8C2F6A
P 9550 2850
F 0 "#PWR016" H 9550 2600 50  0001 C CNN
F 1 "GND" H 9550 2700 50  0000 C CNN
F 2 "" H 9550 2850 50  0000 C CNN
F 3 "" H 9550 2850 50  0000 C CNN
	1    9550 2850
	1    0    0    -1  
$EndComp
Text HLabel 9350 1250 0    60   Input ~ 0
PIEZO
$Comp
L SolarSpinner-rescue:Speaker-Device-SolarSpinner-rescue LS1
U 1 1 5E8A140A
P 9750 2200
F 0 "LS1" H 9920 2196 50  0000 L CNN
F 1 "PIEZO" H 9920 2105 50  0000 L CNN
F 2 "REInnovationFootprint:TH_PIEZO_17x7" H 9750 2000 50  0001 C CNN
F 3 "~" H 9740 2150 50  0001 C CNN
	1    9750 2200
	1    0    0    -1  
$EndComp
$Comp
L SolarSpinner-rescue:R-Device-SolarSpinner-rescue R6
U 1 1 5FB81C53
P 6250 2550
F 0 "R6" V 6330 2550 50  0000 C CNN
F 1 "100k" V 6250 2550 50  0000 C CNN
F 2 "REInnovationFootprint:TH_Resistor_1" V 6180 2550 50  0001 C CNN
F 3 "" H 6250 2550 50  0000 C CNN
F 4 "~" H 6250 2550 60  0000 C CNN "Notes"
F 5 "~" H 6250 2550 60  0001 C CNN "Description"
F 6 "~" H 6250 2550 60  0001 C CNN "Manufacturer"
F 7 "~" H 6250 2550 60  0001 C CNN "Manufacturer Part No"
F 8 "~" H 6250 2550 60  0001 C CNN "Supplier 1"
F 9 "~" H 6250 2550 60  0001 C CNN "Supplier 1 Part No"
F 10 "0.01" H 6250 2550 60  0001 C CNN "Supplier 1 Cost"
F 11 "~" H 6250 2550 60  0001 C CNN "Supplier 2"
F 12 "~" H 6250 2550 60  0001 C CNN "Supplier 2 Part No"
F 13 "~" H 6250 2550 60  0001 C CNN "Supplier 2 Cost"
	1    6250 2550
	-1   0    0    1   
$EndComp
$Comp
L matts_components:GND #PWR010
U 1 1 5FB83DF1
P 6250 2800
F 0 "#PWR010" H 6250 2550 50  0001 C CNN
F 1 "GND" H 6250 2650 50  0000 C CNN
F 2 "" H 6250 2800 50  0000 C CNN
F 3 "" H 6250 2800 50  0000 C CNN
	1    6250 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	6250 2800 6250 2700
Wire Wire Line
	6250 2400 6250 2250
Connection ~ 6250 2250
Wire Wire Line
	6250 2250 6350 2250
$Comp
L SolarSpinner-rescue:R-Device-SolarSpinner-rescue R8
U 1 1 5FB96436
P 9550 1500
F 0 "R8" V 9630 1500 50  0000 C CNN
F 1 "120" V 9550 1500 50  0000 C CNN
F 2 "REInnovationFootprint:TH_Resistor_1" V 9480 1500 50  0001 C CNN
F 3 "" H 9550 1500 50  0000 C CNN
F 4 "~" H 9550 1500 60  0000 C CNN "Notes"
F 5 "~" H 9550 1500 60  0001 C CNN "Description"
F 6 "~" H 9550 1500 60  0001 C CNN "Manufacturer"
F 7 "~" H 9550 1500 60  0001 C CNN "Manufacturer Part No"
F 8 "~" H 9550 1500 60  0001 C CNN "Supplier 1"
F 9 "~" H 9550 1500 60  0001 C CNN "Supplier 1 Part No"
F 10 "0.01" H 9550 1500 60  0001 C CNN "Supplier 1 Cost"
F 11 "~" H 9550 1500 60  0001 C CNN "Supplier 2"
F 12 "~" H 9550 1500 60  0001 C CNN "Supplier 2 Part No"
F 13 "~" H 9550 1500 60  0001 C CNN "Supplier 2 Cost"
	1    9550 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	9350 1250 9550 1250
Wire Wire Line
	9550 1250 9550 1350
Wire Wire Line
	9550 1650 9550 2200
$EndSCHEMATC
