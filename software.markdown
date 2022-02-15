---
layout: default
title: Software
permalink: /software/
has_children: false
nav_order: 4
---

# Software

## Bootloader:

STeMCell uses TinyUF2 bootloader developed by Adafruit. Bootloader occupies 32KB of flash.
STM32F4 chips have 4 sectors of 16kb size at the beginning of the flash. Bootloader uses first
two sectors. The next two sectors are used for eeprom/storage in QMK and ZMK firmware.

TinyUF2 uses mass storage for upgrading images, which is driverless and convenient.
But it adds difficulty to upgrade images, using automated tools like QMK toolbox.

Github: [tinyuf2](https://github.com/megamind4089/tinyuf2)

[Bootloader](https://github.com/megamind4089/STeMCell/blob/main/bootloader/tinyuf2-stemcell.bin?raw=true){: .btn .btn-green }

New STeMCell boards will only have STM32 inbuilt DFU bootloader.

Steps to upload TinyUF2 bootloader:
  1. Download bootloader from above link
  1. Connect STeMCell to USB, while holding the Boot0 button
  1. PC/Mac will detect STM32 inbuilt DFU booloader.
  1. Upload the tinyUF2 bootloader using the following command:

```bash
dfu-util -a 0 -i 0 -s 0x08000000:leave -D tinyuf2-stemcell.bin
```

Hint:
{: .label}
To erase the entire flash, use this command
```bash
dfu-util -a 0 -i 0 -s 0x08000000:mass-erase:force
```


## QMK Firmware:

The following PR adds support for compiling QMK firmware with STeMCell controller.

PR: [16287](https://github.com/qmk/qmk_firmware/pull/16287)

Until the PR is merged, fork can be used for compilation.

Github: [qmk_firmware](https://github.com/megamind4089/qmk_firmware)

The PR defines the following makefile flags (similar to ProtonC).

- STMC - Enable compilation for STeMCell controller
- STMC_IS - Swap I2C pins
- STMC_US - Swap UART pins

For example, to compile lily58, use
```bash
make lily58:via STMC=yes STMC_US=yes
```

For A.Dux keyboard, use
```bash
make a_dux:via:dfu-util-split-right STMC=yes STMC_US=yes
```

Use dfu-util-split-right/dfu-til-split-left to generate firmware with handedness saved in EEPROM.
After compilation, make waits for dfu device to upload firmware. Since STeMCell uses tinyuf2, we can stop the make command and copy the uf2 firmware.

Changes are expected in this process, once qmk dev reviews the PR

## ZMK Firmware:

Board config files of STeMCell for ZMK is available here:

[ZMK STeMCell](https://github.com/megamind4089/zmk-config/tree/main/config/boards/arm/stemcell)

ZMK can be compiled directly using the above board config files for any non-split keyboards.

ZMK does not have support for wired split keyboards yet, since it started as a wireless first design.

Most wired split keyboards use single wire(data) to communicate between them. Luckily STM32 chips support half duplex UART communication using single wire.

I tried to use that feature to implement split communication with ZMK. An initial support for split wired support using UART is implemented in this PR:

[Wired support PR](https://github.com/zmkfirmware/zmk/pull/1117)

Zephyr support for STM32 half duplex UART communication has been added very recently. So I cherry-pick that changes from Zephyr main branch for split communication to my fork.

[Zephyr with STM32 fix](https://github.com/megamind4089/zephyr/tree/v2.5.0+zmk-fixes-stm32f4)

For compiling split keyboard, the west.yml inside app directory has to be changed, to point to the above fork. Once ZMK has been upgraded to latest zephyr, above changes are not needed.

Example command to compile ZMK for lily58:
```bash
west build -p -d build -b stemcell -- -DZMK_CONFIG=zmk-config/config/ -DSHIELD=lily58_left
west build -p -d build -b stemcell -- -DZMK_CONFIG=zmk-config/config/ -DSHIELD=lily58_right
```

