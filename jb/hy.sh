#!/bin/bash
#换源
sudo sed -i 's#raspbian.raspberrypi.org/raspbian/#mirrors.aliyun.com/raspbian/raspbian/#g' /etc/apt/sources.list
sudo apt update

