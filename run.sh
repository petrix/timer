#!/bin/bash
sudo rm -rf /opt/p3xx/timer/r2.sh
cd /opt/p3xx/timer/res/
sudo wget https://github.com/petrix/timer/raw/master/res/r2.sh
sudo chmod a+x r2.sh
sudo /opt/p3xx/timer/res/r2.sh
