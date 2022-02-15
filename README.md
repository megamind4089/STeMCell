# STeMCell
 STM32 breakout in promicro footprint


## Features:

* Pro micro footprint
* STM32F4x1 series MCU
* 2 layers
* Support half duplex USART communication in any of D0, D1, D2, D3 using jumpers
* Onboard switch to enable/disable USB DFU bootloader
* Inbuilt TX pullup for UART half duplex communication
* User LED on PA8
* Extra 5 pinout on bottom like Elite C
* Supports QMK and ZMK
* JLCPCB assembly supported


## v1.0.2

<p align="center">
  <img alt="Front" src="images/v1.0.0_front.png" width="45%">
&nbsp; &nbsp; &nbsp; &nbsp;
  <img alt="Back" src="images/v1.0.0_back.png" width="45%">
</p>

## In Real Life

<p align="center">
  <img alt="irl1" src="images/v1.0.0_irl2.jpeg" width="30%">
&nbsp; &nbsp; &nbsp; &nbsp;
  <img alt="irl2" src="images/v1.0.0_irl1.jpeg" width="60%">
</p>


## Working:

* Voltage regulator
* User LED
* All pinouts
* I2C - with OLED
* UART - Split communication
* UART Half duplex on D0, D1, D2, D3
* VUSB sense

## UnTested:

* With RGB lights


Pictures are generated using pcbdraw:

```
pcbdraw --dpi 1024 -s set-blue-enig -l lib\pcbdraw_footprints\,default stemcell.kicad_pcb images\v1.0.0_front.png
pcbdraw --dpi 1024 -s set-blue-enig -l lib\pcbdraw_footprints\,default -b stemcell.kicad_pcb images\v1.0.0_back.png
```
