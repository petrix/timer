#!/bin/bash

echo elevator=deadline quiet datadev=mmcblk0p2 bootmenutimeout=0 logo.nologo console=tty3 splash loglevel=3 vt.global_cursor_default=0 plymouth.ignore-serial-consoles > /mnt/cmdline.txt
