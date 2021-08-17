# OpenOCD with Raspberry Picoprobe for macOS

<div>
<img src="https://raw.githubusercontent.com/chipcode-nl/picoprobe-mac/master/images/macOS.png" alt="macOS" width="40%">
<img src="https://raw.githubusercontent.com/chipcode-nl/picoprobe-mac/master/images/Raspberry_Picoprobe_512.png" alt="Raspberry Picoprobe" width="40%">
</div>

In January 2021 the Raspberry Pi Foundation launched their first microcontroller 
board, the Raspberry Pi Pico. A small development board with a brand new 
microcontroller chip the RP2040 designed by Raspberry Pi in the UK. 

Debugging the code inside the RP2040 chip may be done with another Raspberry Pi 
Pico board. A new version of the Open On-Chip Debugger (OpenOCD) is needed to 
use the development board as debug probe. 

The source code for OpenOCD is available at the 
[Raspberry Pi github](https://github.com/raspberrypi/openocd).

This Visual Studio Code extension is a convenient way to use the correct OpenOCD 
version without building the code yourself.

# Install
In Visual Studio Code goto extensions (shift+cmd+x), search for 'chipcode-nl' and install the extension that is suited for your operating system.

The extension has paths for OpenOCD. You can use it in the tasks.json.

- openocd.bin

Download the Picoprobe UF2 file from 
[Raspberry Pi Pico getting started](https://www.raspberrypi.org/documentation/pico/getting-started/) website 
and copy it to the Raspberry Pi Pico board.

## Picoprobe Wiring
<img src="https://raw.githubusercontent.com/chipcode-nl/picoprobe-mac/master/images/Raspberry_Picoprobe_wiring_512.png" alt="Raspberry Picoprobe wiring">

Wiring between the Picoprobe (left) and the target development board (right).

| Picoprobe (left) | Raspberry Pi Pico (right) | Description  |
|------------------|---------------------------|--------------|
| GND              | GND                       | Ground       |
| GP2              | SWCLK                     | Debug clock  |
| GP3              | SWDIO                     | Debug data   |
| GP4 / UART1 TX   | GP1 / UART0 RX            | Serial port  |
| GP5 / UART1 RX   | GP0 / UART0 TX            | Serial port  |

Optional power the target development board from the USB port.

| Picoprobe (left) | Raspberry Pi Pico (right) | Description  |
|------------------|---------------------------|--------------|
| VSYS             | VSYS                      | System power |
