---
layout: default
title: Introduction
has_children: false
nav_order: 1
---

# STeMCell

STeMCell is an open source [Pro Micro](https://www.sparkfun.com/products/12640) / [Elite C](https://deskthority.net/wiki/Elite-C) replacement using STM32F4 chips, tailored specifically for mechanical keyboards.

A lot of ergonomic mechanical keyboards designed during the past years, have been created with promicro
as the controller. The never ending features of the keyboard firmware demands more power and memory
than ATmega32U4 can provide. STeMCell attempts to bridge the gap by providing same pinout as that of
Pro Micro and using STM32F4 chips with memory.

STeMCell cannot be considered as a full replacement for Pro Micro, since the later can run in 5V mode also.

Current tested revision is v1.0.0


## Features:

* Pro Micro/Elite C footprint
* STM32F411 series MCU
* Support half duplex USART communication in any of D0, D1, D2, D3 using jumpers
* Inbuilt TX pullup for UART half duplex communication
* Onboard switch to boot into USB DFU bootloader
* User LED on PA8
* 1A max current output
* Extra 5 pinout on bottom like Elite C
* Supports QMK and ZMK
* JLCPCB assembly supported

warning
{: .label .label-yellow }
Current revision v1.0.0 does not contain fuse, esd protection or reverse current protection.
There is an untested revision v1.0.1 and v1.0.2, which adds fuse and reverse current protection

