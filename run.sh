#!/bin/bash

RED='\033[0;31m'	# Red Color
NC='\033[0m'		# No Color

read -p $'\e[31m>>> Perform system update and upgrade first? (Reboot required) \e[0m' -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
	sudo apt update && sudo apt upgrade -y
	sudo reboot
fi

echo -e "${RED}>>> No update. Installing development packages in 5 seconds.${NC}"
sleep 5

sudo apt install unzip libudev-dev automake gobjc -y

echo -e "${RED}>>> Downloading SDL2 version 2.0.14 in 5 seconds.${NC}"
sleep 5

# Original HOW-TO used SDL2 version 2.0.7

mkdir -p ~/src/sdl2 &&
wget https://www.libsdl.org/release/SDL2-2.0.14.tar.gz -O - | tar -xz -C ~/src/sdl2

echo -e "${RED}>>> Compiling and installing SDL2 (without X11) in 5 seconds.${NC}"
sleep 5

# SDL2 version 2.0.10 removed the Mir video driver in favor of Wayland.

cd ~/src/sdl2/SDL2-2.0.14 &&

./configure --host=arm-raspberry-linux-gnueabihf \
            --disable-video-opengl \
            --disable-video-x11 \
            --disable-pulseaudio \
            --disable-esd \
            --disable-video-wayland &&
make -j3

sudo make install

echo -e "${RED}>>> Downloading Basilisk II in 5 seconds.${NC}"
sleep 5

cd ~/src
git clone https://github.com/kanjitalk755/macemu

echo -e "${RED}>>> Compiling and installing Basilisk II in 5 seconds.${NC}"
sleep 5

cd macemu/BasiliskII/src/Unix

NO_CONFIGURE=1 ./autogen.sh &&
./configure --enable-sdl-audio --enable-sdl-framework \
            --enable-sdl-video --disable-vosf \
            --without-mon --without-esd --without-gtk --disable-jit-compiler --disable-nls &&
make -j3

sudo make install

echo -e "${RED}>>> Setting up some Basilisk II preferences.${NC}"

echo "rom /home/pi/Quadra800.ROM
disk /home/pi/HD200MB
ramsize 142606336
frameskip 0
modelid 14
cpu 4
fpu true
screen win/640/480
displaycolordepth 8" | tee -a ~/.basilisk_ii_prefs

cd
unzip HD200MB-POP.zip

echo -e "${RED}>>> Done. Starting BasiliskII...${NC}"
sleep 5

sudo modprobe snd-pcm-oss
BasiliskII
