#!/bin/bash
     
if [ ! -f "/opt/p3xx/cgtimer/res/r4.sh" ]; then
   #echo "File $FILE does not exist."
   
echo "#!/bin/bash" > r3.sh
echo "/home/pi/timer/timer.sh --full --blink" >> r3.sh
echo "/opt/p3xx/timer/timer.sh --full --blink" >> r3.sh
echo "/opt/p3xx/cgwatch/cgwatch -f" >> r3.sh
#echo "rm -rf r3.sh" >> r3.sh
echo "CGTimer is next reboot" > r4.sh
chmod +x r3.sh
bash r3.sh
exit
else
rm -rf r4.sh
echo "#!/bin/bash" > r3.sh
echo "/home/pi/timer/timer.sh --full --blink" >> r3.sh
echo "/opt/p3xx/timer/timer.sh --full --blink" >> r3.sh
echo "/opt/p3xx/cgtimer/cgtimer -f" >> r3.sh
chmod +x r3.sh
bash r3.sh
exit
fi;




