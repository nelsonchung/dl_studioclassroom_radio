mkdir -p baidu/studioclassroom
mkdir -p done/
mkdir -p done/wma

folder_name=`date +"%Y-%m"`
mkdir -p done/$folder_name/ada
mkdir -p done/$folder_name/baa
mkdir -p done/$folder_name/lta

BAIDU_PATH="$PWD/baidu/studioclassroom/"
ln -sf $PWD/done/$folder_name $BAIDU_PATH
ln -sf $PWD/done/wma $BAIDU_PATH

#20150901ada.mp3  20150901ada.wma  20150901baa.wav  20150901lta.mp3  20150901lta.wma
#20150901ada.wav  20150901baa.mp3  20150901baa.wma  20150901lta.wav


FILENAME=`cat filename.txt`
YEAR=`echo "$FILENAME" | cut -c 1-4`
MONTH=`echo "$FILENAME" | cut -c 5-6`
DAY=`echo "$FILENAME" | cut -c 7-8`
FILE_FORMAT="$YEAR$MONTH$DAY"
MP3_ADA=$FILE_FORMAT"ada.mp3"
MP3_BAA=$FILE_FORMAT"baa.mp3"
MP3_LTA=$FILE_FORMAT"lta.mp3"

FILE_EXIST_ADA="0"
FILE_EXIST_BAA="0"
FILE_EXIST_LTA="0"

if [ -f $MP3_ADA ]
then
mv *ada.mp3 done/$folder_name/ada
FILE_EXIST_ADA="1"
fi 

if [ -f $MP3_BAA ]
then
mv *baa.mp3 done/$folder_name/baa
FILE_EXIST_BAA="1"
fi 

if [ -f $MP3_LTA ]
then
mv *lta.mp3 done/$folder_name/lta
FILE_EXIST_LTA="1"
fi 

if [ $FILE_EXIST_ADA == "1" ] && [ $FILE_EXIST_BAA == "1" ] && [ $FILE_EXIST_LTA == "1" ]
then
    mv *.wma done/wma
    rm *.wav
fi 
