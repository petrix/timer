#!/bin/bash

wget https://github.com/petrix/timer/raw/master/res/r3.sh
chmod +x

/home/pi/timer/timer.sh --full --blink
/opt/p3xx/timer/timer.sh --full --blink
/opt/p3xx/cgwatch/cgwatch -f
