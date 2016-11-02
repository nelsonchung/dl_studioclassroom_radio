#for 大家說英語
#$1 2015-08-10
curl -o test.html -e http://lt.studioclassroom.com/LT-RaDio.php http://lt.studioclassroom.com/index3.php?day=$1 -D header.html
#FILENAME=`cat header.html | grep Location | awk -F 'studio/' '{print $2}'`
cat header.html | grep Location | awk -F 'studio/' '{print $2}' > filename.txt
dos2unix filename.txt
FILENAME=`cat filename.txt`
echo "FILENAME is $FILENAME"

#FILENAME=$1
YEAR=`echo $FILENAME | cut -c 1-4`
MONTH=`echo $FILENAME | cut -c 5-6`
DAY=`echo $FILENAME | cut -c 7-8`
TRACK=$DAY
RENAME_WMA=`echo $FILENAME | cut -c 1-11`.wma
RENAME_WAV=`echo $FILENAME | cut -c 1-11`.wav
RENAME_MP3=`echo $FILENAME | cut -c 1-11`.mp3
echo "RENAME_WAV is $RENAME_WAV"
echo "RENAME_MP3 is $RENAME_MP3"

#mimms mms://203.69.69.81/studio/20150807baaaca2c29c61254d44f0c9a3d7c913fdf2e43ac2a3609f3811296280760775630b.wma
echo "run command: mimms mms://203.69.69.81/studio/$FILENAME"
MMS_PATH="mms://203.69.69.81/studio/$FILENAME"
#mimms mms://203.69.69.81/studio/$FILENAME
mimms $MMS_PATH
mv $FILENAME $RENAME_WMA
#sleep 1
sync
mplayer $RENAME_WMA -ao pcm:file=$RENAME_WAV
lame -ms $RENAME_WAV -o $RENAME_MP3
#id3v2 --TYER $YEAR --TRCK $TRACK --TPE1 大家說英語 --TALB 大家說英語-$MONTH $RENAME_MP3
#id3v2 --TYER $YEAR $RENAME_MP3
#python parseid3.py lta 
./parseid3.sh lta $YEAR $MONTH $DAY
