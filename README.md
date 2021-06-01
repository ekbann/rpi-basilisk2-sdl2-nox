# rpi-basilisk2-sdl2-nox

This script will automatically download and compile all the necessary source code to have a fully functional Basilisk II emulator running with SDL2 and without X Windows for maximum performance. In order to have an extremely light Linux system the Raspberry Pi OS Lite was chosen as the base for this project. As of this writing the following versions were used:

    Raspberry Pi OS Lite version 2021-01-11-raspios-buster-armhf-lite
    SDL2 version 2.0.14
    Basilisk II version by kanjitalk755

Due to graphics hardware incompatibilities between RPi3 (VideoCore 4) and RPi4 (VideoCore VI), this script recommends running on a RPi versions 1, 2, or 3.

A 200MB disk image is also included here with pre-installed Mac OS 7.6.1 and Prince of Persia 1 for a quick demonstration of sound and graphics at 640x480 and 256 colors.

To install, boot into your freshly created Raspberry Pi OS Lite and login with the default user "pi" (password "raspberry"). Then run the following commands:

    sudo apt install git
    git clone https://github.com/ekbann/rpi-basilisk2-sdl2-nox .
    ./run.sh

When the script ends, it will run Basilisk II automatically but you can also manually start with the commands below. Enjoy!

NOTE: Whenever you reboot your Pi, you need to reload the snd-pcm-oss module before running Basilisk II for sound output. snd-pcm-oss is a kernel module from ALSA's OssEmulation which emulates the old OSS audio devices /dev/dsp and /dev/audio.

    sudo modprobe snd-pcm-oss
    BasiliskII
    
You can change the screen resolution by editing the .basilisk_ii_prefs and change the "screen" parameter. For some serious work, you can try the following:

    screen win/1024/768
    displaycolordepth 16

Then go to Mac OS 7.6.1 Control Panel and under Monitors, select "Thousands" of colors.
