#!/bin/bash
rm -rf /home/pi/timer/run2.sh
cd /home/pi/timer/
wget https://github.com/petrix/timer/raw/master/run2.sh
chmod a+x run2.sh
/home/pi/timer/run2.sh
