#!/bin/bash
sudo apt-get install curl dos2unix mimms mplayer lame id3v2 git
sudo apt-get install python-setuptools
sudo easy_install pip
sudo pip install -U eyeD3

git clone https://github.com/houtianze/bypy.git
cd bypy
sudo cp bypy.py /usr/bin/
cd -

PWD=`pwd`
echo "export PATH=\"\$PATH:$PWD\"" >> $HOME/.bashrc
