#!/bin/bash

echo (0 3  * * * root  reboot) >> /etc/crontab
echo (0 5  * * * root  /home/pi/timer/res/time-update.sh) >> /etc/crontab
echo (0 10  * * * root  /home/pi/timer/res/time-update.sh) >> /etc/crontab
echo (0 15  * * * root  /home/pi/timer/res/time-update.sh) >> /etc/crontab
echo (0 20  * * * root  /home/pi/timer/res/time-update.sh) >> /etc/crontab
