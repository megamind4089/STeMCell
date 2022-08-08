---
layout: default
title: Introduction
has_children: false
nav_order: 1
---

# STeMCell
CERN Open Hardware Licence Version 2 - Strongly Reciprocal
{: .label}


STeMCell is an open source [Pro Micro](https://www.sparkfun.com/products/12640) / [Elite C](https://deskthority.net/wiki/Elite-C) replacement using STM32F4 chips, tailored for mechanical keyboards.

Most split ergonomic mechanical keyboards designed on recent days, uses Pro Micro as the controller. But the never ending features of keyboard firmware, demands more power and memory
than Pro Micro can provide. STeMCell attempts to bridge the gap, by using STM32F4 chip with memory and hacing same pinout as that of Pro Micro.

STeMCell cannot be considered as a full replacement for Pro Micro, since the later can run in 5V mode also.


## Features:

* Pro Micro/Elite C footprint
* STM32F411 series MCU
* Support half duplex USART communication in any of D0, D1, D2, D3 using jumpers
* Inbuilt TX pullup for UART half duplex communication
* Onboard switch to boot into USB DFU bootloader
* User LED on PA8
* Extra 5 pinout on bottom like Elite C
* Supports QMK and ZMK
* JLCPCB assembly supported
* Reverse current protection
* 1A max current output
* 1A fuse

