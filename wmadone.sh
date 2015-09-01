#!/bin/bash
#解決有時候wma下載完成後，後面出現問題而造成中斷，可以手動完成產生mp3檔案

#How to use
#If you have one wma file named 20150827ada.wma
#Run command
#wmadone.sh 20150827ada

YEAR=`echo $1 | cut -c 1-4`
RENAME_WMA=`echo $1 | cut -c 1-11`.wma
RENAME_WAV=`echo $1 | cut -c 1-11`.wav
RENAME_MP3=`echo $1 | cut -c 1-11`.mp3
TYPE=`echo $1 | cut -c 9-11`

mplayer $RENAME_WMA -ao pcm:file=$RENAME_WAV
lame -ms $RENAME_WAV -o $RENAME_MP3
id3v2 --TYER $YEAR $RENAME_MP3
python parseid3.py $TYPE 
