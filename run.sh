#!/bin/bash
rm -rf /home/pi/timer/res/autostart.conf
cd /home/pi/timer/res/
wget https://raw.githubusercontent.com/petrix/timer/master/res/autostart.conf
cp /home/pi/timer/res/autostart.conf /home/pi/.config/lxsession/LXDE-pi/autostart
/home/pi/timer/timer.sh --full --blink
