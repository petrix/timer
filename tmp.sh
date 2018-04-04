#!/bin/bash

sudo mount /dev/mmcblk0p1 /mnt

@echo off

    (echo disable_overscan=0) >> /mnt/config.txt
    (echo hdmi_group=1) >> /mnt/config.txt
    (hdmi_hot_plug=1) >> /mnt/config.txt
    (hdmi_mode=33) >> /mnt/config.txt
    (disable_splash=1) >> /mnt/config.txt
    (boot_delay=0) >> /mnt/config.txt
    exit
    
