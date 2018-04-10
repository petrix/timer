#!/bin/bash

FILE=$r3.sh     
if [ $FILE does not exist ]; then
   #echo "File $FILE does not exist."
   
echo "#!/bin/bash" > r3.sh
echo "/home/pi/timer/timer.sh --full --blink" >> r3.sh
echo "/opt/p3xx/timer/timer.sh --full --blink" >> r3.sh
echo "/opt/p3xx/cgwatch/cgwatch -f" >> r3.sh
#echo "rm -rf r3.sh" >> r3.sh
chmod +x r3.sh
bash r3.sh
else
echo "#!/bin/bash" > r4.sh
echo "/home/pi/timer/timer.sh --full --blink" >> r4.sh
echo "/opt/p3xx/timer/timer.sh --full --blink" >> r4.sh
echo "/opt/p3xx/cgtimer/cgtimer -f" >> r4.sh
echo "rm -rf /opt/p3xx/cgtimer/r3.sh" >> r4.sh
echo "rm -rf /opt/p3xx/cgtimer/r4.sh" >> r4.sh
chmod +x r4.sh
bash r4.sh

fi




