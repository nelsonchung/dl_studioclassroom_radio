#!/bin/bash
#mp3 file name
#20151015ada.mp3
#cover file name
#2015-10-ada.jpg

echo "==============================Enter parseid3.sh==========================================================="
TYPE=$1
YEAR=`date +"%Y"`
MONTH=`date +"%m"`
DAY=`date +"%d"`
echo $YEAR
echo $MONTH
echo $DAY
TRACK_NUM=$DAY
DATE_mp3=`date +"%Y%m%d$TYPE"`
echo $DATE_mp3
DATE_cover=`date +"%Y-%m-$TYPE"`
echo $DATE_cover

MP3_FILE=$DATE_mp3".mp3"
echo $MP3_FILE
COVER_FILE=$DATE_cover".jpg"
echo $COVER_FILE


if [ $1 == "ada" ]; then
    ALBUM_NAME="彭蒙惠英語-$MONTH"
    ARTIST_NAME="彭蒙惠英語"
    TITLE_NAME="彭蒙惠英語-$YEAR-$MONTH-$DAY"
fi
if [ $1 == "baa" ]; then
    ALBUM_NAME="空中英語教室-$MONTH"
    ARTIST_NAME="空中英語教室"
    TITLE_NAME="空中英語教室-$YEAR-$MONTH-$DAY"
fi
if [ $1 == "lta" ]; then
    ALBUM_NAME="大家說英語-$MONTH"
    ARTIST_NAME="大家說英語"
    TITLE_NAME="大家說英語-$YEAR-$MONTH-$DAY"
fi
echo $ALBUM_NAME
echo $ARTIST_NAME
echo $TITLE_NAME

echo $YEAR
#修正eyeD3設定年份，無法正確從easytag顯示的問題
id3v2 --year $YEAR $MP3_FILE
eyeD3 --add-image ./pic/$COVER_FILE:FRONT_COVER -a $ARTIST_NAME -A $ALBUM_NAME -n $TRACK_NUM -Y $YEAR -t $TITLE_NAME $MP3_FILE 
echo "==============================Exit parseid3.sh==========================================================="
