#!/bin/bash
sudo apt-get install curl dos2unix mimms mplayer lame id3v2 git
sudo pip install -U eyeD3

mkdir -p bypy
cd bypy
git clone https://github.com/houtianze/bypy.git
cd bypy
sudo cp bypy.py /usr/bin/
cd -

PWD=`pwd`
echo "export PATH=\$\"PATH:$PWD\"" >> /home/nelson/.bashrc
