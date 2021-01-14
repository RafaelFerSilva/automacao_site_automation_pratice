#!/usr/bin/env bash

# Versions
CHROME_DRIVER_VERSION=`curl -sS https://chromedriver.storage.googleapis.com/LATEST_RELEASE`

echo $'This Script is about:
\n1 - Update packages
2 - Install ChromeDriver
3 - Install PIP
4 - Install dependencies
5 - Install Robot Framework
6 - Install Selenium2library
7 - Install FakerLibrary'

echo $'\nStart Update Packages'
sudo apt-get -y update

echo $'\nInstall ChromeDriver'
wget -N https://chromedriver.storage.googleapis.com/$CHROME_DRIVER_VERSION/chromedriver_linux64.zip -P ~/
unzip ~/chromedriver_linux64.zip -d ~/
rm ~/chromedriver_linux64.zip
sudo mv -f ~/chromedriver /usr/local/bin/chromedriver
sudo chown root:root /usr/local/bin/chromedriver
sudo chmod 0755 /usr/local/bin/chromedriver

echo $'\nInstall dependencies'
sudo apt install -y build-essential libssl-dev libffi-dev python3-dev

echo $'\nInstall PIP'
sudo apt install -y python3-pip
pip3 install --upgrade setuptools
pip3 install --upgrade pip

echo $'\nInstall Robot Framework'
pip3 install robotframework

echo $'\nInstall Selenium2library'
pip3 install --upgrade robotframework-seleniumlibrary

echo $'\nInstall FakerLibrary'
pip3 install robotframework-faker
