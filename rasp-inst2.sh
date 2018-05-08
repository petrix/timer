#!/bin/bash


modprobe i2c-bcm2708
ntpd -gq
hwclock -w
apt-get update
#mkdir /opt/p3xx
#sudo mount /dev/mmcblk0p1 /mnt
#echo disable_overscan=0 >> /mnt/config.txt
#echo hdmi_group=1 >> /mnt/config.txt
#echo hdmi_hot_plug=1 >> /mnt/config.txt
#echo hdmi_mode=33 >> /mnt/config.txt
#echo disable_splash=1 >> /mnt/config.txt
#echo boot_delay=0 >> /mnt/config.txt
#echo dtparam=i2c_arm=on >> /mnt/config.txt
#echo dtoverlay=i2c-rtc,ds3231 >> /mnt/config.txt

#echo elevator=deadline quiet datadev=mmcblk0p2 bootmenutimeout=0 logo.nologo console=tty3 splash loglevel=3 vt.global_cursor_default=0 plymouth.ignore-serial-consoles > /mnt/cmdline.txt
#echo "* 4 * * * reboot >/dev/null 2>&1" >> /etc/crontab
#echo "* 5,10,15,20 * * * /opt/p3xx/timer/res/time-update.sh >/dev/null 2>&1" >> /etc/crontab
#echo i2c-bcm2708 >> /etc/modules
#echo i2c-dev >> /etc/modules
#echo rtc-ds1307 >> /etc/modules


cd /opt/p3xx
apt-get install -y qt5-qmake qt5-default libqt5svg5-dev git unclutter


git clone https://github.com/petrix/oscpack.git
#git clone -b cgtimer https://github.com/petrix/timer.git cgtimer
git clone -b cgwatch https://github.com/petrix/timer.git cgclock

cp /usr/share/plymouth/themes/pix/splash.png /usr/share/plymouth/themes/pix/splash_backup.png
cp /opt/p3xx/cgclock/res/casparcg_boot.png /usr/share/plymouth/themes/pix/splash.png
cp /opt/p3xx/cgclock/res/autostart.conf /home/pi/.config/lxsession/LXDE-pi/autostart
chmod +x /opt/p3xx/cgclock/run.sh
chmod +x /opt/p3xx/cgclock/res/time-update.sh

cd /opt/p3xx/oscpack

make && make install

sudo /sbin/ldconfig -v

#cd /opt/p3xx/cgtimer

#qmake && make

#cp timer cgtimer

cd /opt/p3xx/cgclock

qmake && make

#cp /opt/p3xx/cgclock/timer /opt/p3xx/cgclock/cgclock
chmod a+x run-clock.sh
chmod 777 run-clock.sh
#cp /opt/p3xx/cgclock/run-clock.sh /etc/init.d/
#update-rc.d run-clock.sh defaults


#rm -rf /opt/p3xx/cgclock
#rm -rf /home/pi/raspbian-installation
reboot

//
