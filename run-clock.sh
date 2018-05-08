#!/bin/bash

hwclock -s
sudo /etc/init.d/ntp stop
sudo ntpd -gq
sudo /etc/init.d/ntp start
hwclock -w
#if [ ! -f "/opt/p3xx/r2.sh" ]; then
#sudo ntpd -gq
#sudo hwclock -w
#cd /opt/p3xx
#sudo rm -rf /opt/p3xx/r2.sh
#sudo wget https://github.com/petrix/timer/raw/cgwatch/res/r2.sh
#sudo chmod a+x r2.sh
#sudo chmod 777 r2.sh
#sudo bash /opt/p3xx/r2.sh


#exit
#else

sudo rm -rf /opt/p3xx/r2.sh
sudo ntpd -gq
#sudo hwclock -w
cd /opt/p3xx
sudo rm -rf /opt/p3xx/r2.sh
sudo wget https://github.com/petrix/timer/raw/cgwatch/res/r2.sh
sudo chmod a+x r2.sh
sudo chmod 777 r2.sh
sudo bash /opt/p3xx/r2.sh

#exit
#fi;
