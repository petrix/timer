#!/bin/bash
crontab <<EOF
0 3 * * * reboot >/dev/null 2>&1
EOF
# /home/pi/timer/timer.sh --full --blink
sudo /opt/p3xx/cgclock/cgclock -f
