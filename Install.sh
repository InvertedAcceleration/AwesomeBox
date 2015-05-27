#!/bin/bash
# source <(wget -qO- https://git.io/vTPeH)

echo -e "\e[0;34m • Removing older versions of AwesomeBox.\033[0m"

rm -rf ~/AwesomeBox

echo -e "\e[0;34m • Downloading the newest version of AwesomeBox.\033[0m"

git clone -q git@github.com:InvertedAcceleration/AwesomeBox.git ~/AwesomeBox > /dev/null 2>&1

echo -e "\e[0;34m • Launching AwesomeBox.\033[0m"

source ~/AwesomeBox/AwesomeBox.sh
