#!/bin/bash
#sudo su
dpkg-reconfigure tzdata
sudo ntpd -gq
apt-get update
apt-get -y install python-smbus i2c-tools
apt-get -y purge fake-hwclock
sudo update-rc.d -f fake-hwclock remove
mount /dev/mmcblk0p1 /mnt
echo disable_overscan=0 >> /mnt/config.txt
echo hdmi_group=1 >> /mnt/config.txt
echo hdmi_hot_plug=1 >> /mnt/config.txt
echo hdmi_mode=33 >> /mnt/config.txt
echo disable_splash=1 >> /mnt/config.txt
echo boot_delay=0 >> /mnt/config.txt

echo elevator=deadline quiet datadev=mmcblk0p2 bootmenutimeout=0 logo.nologo console=tty3 splash loglevel=3 vt.global_cursor_default=0 plymouth.ignore-serial-consoles > /mnt/cmdline.txt

echo dtparam=i2c_arm=on >> /mnt/config.txt
echo dtoverlay=i2c-rtc,ds3231 >> /mnt/config.txt
echo i2c-bcm2708 >> /etc/modules
echo i2c-dev >> /etc/modules
echo rtc-ds1307 >> /etc/modules

mkdir /opt/p3xx
cd /opt/p3xx

wget https://github.com/petrix/timer/raw/master/res/autorst-1st
cp /opt/p3xx/autorst-1st /home/pi/.config/lxsession/LXDE-pi/autostart

wget https://github.com/petrix/timer/raw/master/rasp-inst2.sh
chmod -755 /opt/p3xx/rasp-inst2.sh
reboot
