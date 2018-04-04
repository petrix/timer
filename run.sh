#!/bin/bash
sudo rm -rf /home/pi/timer/r2.sh
cd /home/pi/timer/
sudo wget https://github.com/petrix/timer/raw/master/r2.sh
sudo chmod a+x r2.sh
sudo /home/pi/timer/r2.sh
