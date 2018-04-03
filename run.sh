#!/bin/bash
rm -rf /home/pi/timer/res/autostart.conf
wget https://raw.githubusercontent.com/petrix/timer/master/res/autostart.conf /home/pi/timer/res/
cp /home/pi/timer/res/autostart.conf /home/pi/.config/lxsession/LXDE-pi/autostart
/home/pi/timer/timer.sh --full --blink
