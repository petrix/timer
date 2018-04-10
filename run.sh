#!/bin/bash
sudo rm -rf /opt/p3xx/cgtimer/res/r2.sh
cd /opt/p3xx/cgtimer/res/
sudo wget https://github.com/petrix/timer/raw/master/res/r2.sh
sudo chmod +x r2.sh
sudo /opt/p3xx/cgtimer/res/r2.sh
