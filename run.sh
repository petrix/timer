#!/bin/bash
sudo rm -rf /home/pi/timer/run2.sh
cd /home/pi/timer/
sudo wget https://github.com/petrix/timer/raw/master/run2.sh
sudo chmod a+x run2.sh
sudo /home/pi/timer/run2.sh
