#!/bin/bash
sudo su

apt-get update

cd /home/pi
rm -rf oscpack
rm -rf timer
apt-get install -y qt5-qmake qt5-default libqt5svg5-dev git unclutter

git clone https://github.com/dimitry-ishenko-casparcg/oscpack.git
git clone https://github.com/petrix/timer.git
cp /usr/share/plymouth/themes/pix/splash.png /usr/share/plymouth/themes/pix/splash_backup.png
cp /home/pi/timer/casparcg2.png /usr/share/plymouth/themes/pix/splash.png
cp /home/pi/timer/res/autostart.conf /home/pi/.config/lxsession/LXDE-pi/autostart

cd /home/pi/oscpack

make && make install

sudo /sbin/ldconfig -v

cd /home/pi/timer



qmake && make

cp timer timer.sh

./timer.sh
