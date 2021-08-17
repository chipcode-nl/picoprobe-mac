#!/bin/sh
# Build OpenOCD on macOS
cd ~
brew install libtool automake libusb wget pkg-config gcc texinfo
git clone https://github.com/raspberrypi/openocd.git --branch picoprobe --depth=1
cd openocd
./bootstrap
./configure --enable-picoprobe --disable-werror --prefix=/Users/Carl/icloud/git/picoprobe-mac
make -j4
make install 