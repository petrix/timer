#!/bin/bash


function addtocrontab () {
  local frequency=$1
  local command=$2
  local job="$frequency $command"
  cat <(fgrep -i -v "$command" <(crontab -l)) <(echo "$job") | crontab -
}
addtocrontab "0 3 * * * reboot >/dev/null 2>&1"
if [ ! -f "/opt/p3xx/cgtimer" ]; then
git clone -b cgtimer https://github.com/petrix/timer.git /opt/p3xx/cgtimer

cd /opt/p3xx/cgtimer
qmake && make
cp /opt/p3xx/cgtimer/timer /opt/p3xx/cgclock/cgtimer
#sudo chmod a+x r2.sh
#sudo chmod 777 r2.sh
#sudo bash /opt/p3xx/r2.sh
#exit
#else

#exit
fi;



#crontab <<EOF
#0 3 * * * reboot >/dev/null 2>&1
#EOF
# /home/pi/timer/timer.sh --full --blink
sudo /opt/p3xx/cgclock/cgtimer -f
