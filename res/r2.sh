#!/bin/bash
echo "#!/bin/bash" > r3.sh
echo "/home/pi/timer/timer.sh --full --blink" >> r3.sh
echo "/opt/p3xx/timer/timer.sh --full --blink" >> r3.sh
echo "/opt/p3xx/cgwatch/cgwatch -f" >> r3.sh
chmod +x r3.sh
bash r3.sh

