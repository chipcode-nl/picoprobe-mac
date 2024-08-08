# OpenOCD with Raspberry debugprobe for macOS

<div>
<img src="https://raw.githubusercontent.com/chipcode-nl/picoprobe-mac/master/images/macOS.png" alt="macOS" width="40%">
<img src="https://raw.githubusercontent.com/chipcode-nl/picoprobe-mac/master/images/Raspberry_Debugprobe_512.png" alt="Raspberry Debugprobe" width="40%">
</div>

In January 2021, the Raspberry Pi Foundation launched its first microcontroller
board, the Raspberry Pi Pico. A small development board with a brand new 
microcontroller chip, the RP2040 was designed by Raspberry Pi in the UK. 

Debugging the code inside the RP2040 chip may be done with another Raspberry Pi 
Pico board. A new version of the Open On-Chip Debugger (OpenOCD) is needed to use 
the development board as debug probe. 


The source code for OpenOCD is available at the 
[Raspberry Pi Github](https://github.com/raspberrypi/openocd).

This Visual Studio Code extension contains the compiled version of OpenOCD with
support for the Raspberry Pi Pico probe.

# Install

## Prerequisite
OpenOCD needs a few libraries to run. Install the libraries with homebrew.

### Install homebrew
If you did not install homebrew install it first. 
```console
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### Install libraries with homebrew 
```console
brew install libusb libusb-compat libftdi hidapi
```

## OpenOCD version with debugprobe
In Visual Studio Code goto extensions (shift+cmd+x), search for 'chipcode-nl' and install the extension suitable for your operating system.

The extension has paths for OpenOCD. You can use it in tasks.json.

- openocd.bin

```javascript
"server": "${config:openocd.bin}/openocd",
"serverArgs": [
  "-f", "interface/picoprobe.cfg",
  "-f", "target/rp2040.cfg",
],
```


Download the debugprobe UF2 file at the
[Raspberry Pi Pico getting started](https://www.raspberrypi.org/documentation/pico/getting-started/) website 
and copy it to the Raspberry Pi Pico board.

## Debugprobe Wiring
<img src="https://raw.githubusercontent.com/chipcode-nl/picoprobe-mac/master/images/Raspberry_Debugprobe_wiring_512.png" alt="Raspberry Debugprobe wiring">

Wiring between the debugprobe (left) and the target development board (right).

| Debugprobe (left) | Raspberry Pi Pico (right) | Description  |
|-------------------|---------------------------|--------------|
| GND               | GND                       | Ground       |
| GP2               | SWCLK                     | Debug clock  |
| GP3               | SWDIO                     | Debug data   |
| GP4 / UART1 TX    | GP1 / UART0 RX            | Serial port  |
| GP5 / UART1 RX    | GP0 / UART0 TX            | Serial port  |

Optional power the target development board from the USB port.

| Debugprobe (left) | Raspberry Pi Pico (right) | Description  |
|-------------------|---------------------------|--------------|
| VSYS              | VSYS                      | System power |
