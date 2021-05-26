# rpi-basilisk2-sdl2-nox

This script will automatically download and compile all the necessary source code to have a fully functional Basilisk II emulator running with SDL2 and without X Windows for maximum performance. In order to have an extremely light Linux system the Raspberry Pi OS Lite was chosen as the base for this project. As of this writing the following versions were used:

2021-01-11-raspios-buster-armhf-lite
SDL2
Basilisk II

Due to graphics hardware incompatibilities between RPi3 (VideoCore 4) and RPi4 (VideoCore VI), this script recommends running on a RPi versions 1, 2, or 3.

A 200MB disk image is also included here with pre-installed Mac OS 7.6.1 and Prince of Persia 1 for a quick demonstration.
