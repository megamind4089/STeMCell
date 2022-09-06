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

Freshly assembled STeMCell boards will only have STM32 inbuilt DFU bootloader.

Steps to upload TinyUF2 bootloader:
  1. Download bootloader bin file from above link
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

Troubleshooting:
```bash
If there is some trouble getting into bootloader, try connecting
the pin B2 to ground and follow the above steps again.

Reason:
Pin B2 is Boot1 pin which has to be pull down, to start DFU bootloader.
But B2 pin is break out in STeMCell and is thus floating, which may cause this.
So far, at least one person has faced this issue, without this pull down on B2.
```


## QMK Firmware:

QMK supports STeMCell v2.0.0 and above. To setup, please follow qmk docs below:

[QMK Converters](https://docs.qmk.fm/#/feature_converters?id=stemcell)


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

