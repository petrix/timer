#!/bin/bash
     
if [ ! -f "/opt/p3xx/cgtimer/res/r2.sh" ]; then
   #echo "File $FILE does not exist."
echo "CGTimer will start on next reboot" > /opt/p3xx/cgtimer/res/r2.sh
sudo /opt/p3xx/cgtimer/cgtimer -f

exit
else

rm -rf /opt/p3xx/cgtimer/res/r2.sh
sudo /opt/p3xx/cgtimer/cgclock -f

exit
fi;
