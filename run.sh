#!/bin/bash
sudo rm -rf /home/pi/timer/r2.sh
cd /home/pi/timer/res/
sudo wget https://github.com/petrix/timer/raw/master/res/r2.sh
sudo chmod a+x r2.sh
sudo /home/pi/timer/res/r2.sh
