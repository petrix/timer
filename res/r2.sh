#!/bin/bash


function addtocrontab () {
  local frequency=$1
  local command=$2
  local job="$frequency $command"
  cat <(fgrep -i -v "$command" <(crontab -l)) <(echo "$job") | crontab -
}
addtocrontab "0 3,11 * * * reboot >/dev/null 2>&1"


#crontab <<EOF
#0 3 * * * reboot >/dev/null 2>&1
#EOF
# /home/pi/timer/timer.sh --full --blink
sudo /opt/p3xx/cgclock/cgclock -f
