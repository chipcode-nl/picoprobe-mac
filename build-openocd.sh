#!/bin/sh
# Build OpenOCD on macOS
# Changed --enable-picoprobe to --enable-cmsis-dap --enable-cmsis-dap-v2 to support the RP2040

PREFIX=/Users/Carl/icloud/git/picoprobe-mac

rm -rf bin
rm -rf share

# libraries
brew install libusb libusb-compat libftdi hidapi
# tools
brew install libtool automake wget pkg-config gcc texinfo node 

export PATH="/usr/local/opt/texinfo/bin:$PATH"

npm install -g vsce

cd ~
rm -rf openocd
git clone https://github.com/raspberrypi/openocd.git --recursive --branch rp2040 --depth=1
cd openocd
./bootstrap
./configure --enable-ftdi --enable-cmsis-dap --enable-cmsis-dap-v2 --disable-werror --prefix=$PREFIX CAPSTONE_CFLAGS="$(pkg-config capstone --cflags | sed s/.capstone\$//)"
make clean 
make install 

