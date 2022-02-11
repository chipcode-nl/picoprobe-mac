#!/bin/sh
# Build OpenOCD on macOS

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
./configure --enable-ftdi --enable-picoprobe --disable-werror --prefix=$PREFIX
make clean 
make install 

