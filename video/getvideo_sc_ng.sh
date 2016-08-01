
DOWNLOAD_WEB_PAGE="index.html"
DOWNLOAD_LINK_PREFIX="http://scvod1.goodtv.org"
M3U8_KEYWORD="host.replace"
VIDEO_FILE_NAME="quality.m3u8"
OUTPUT_RESULT_FILE="result.txt"

rm index.*
rm *.m3u8
rm $OUTPUT_RESULT_FILE

wget http://w2.goodtv.org/studio_classroom/ -O $DOWNLOAD_WEB_PAGE

#//var sc_m3u8   = host.replace(/w2/g,"http://scvod1")+"/hls-vod/sc/X902001_6104.m3u8";   //default stream url
#var sc_m3u8   = host.replace(/w2/g,"http://scvod1")+"/hls-vod/sc/X902001_6104.m3u8";   //default stream url
#var sc_m3u8_2 = host.replace(/w2/g,"http://scvod2")+"/hls-vod/sc/X902001_6104.m3u8";  //for redundant backup stream http://svoc2 ...

#cat index.html | grep "host.replace" | sed -n '2,2p' | cut -d '"' -f 4

m3u8_file_path=`cat $DOWNLOAD_WEB_PAGE | grep $M3U8_KEYWORD | sed -n '2,2p' | cut -d '"' -f 4`
#get /fls-vod/sc
DOWNLOAD_LINK_PREFIX_SUB_PATH=`dirname $m3u8_file_path`

echo ${m3u8_file_path}

#/hls-vod/sc/X902001_6104.m3u8

m3u8_web_path="${DOWNLOAD_LINK_PREFIX}${m3u8_file_path}"

echo $m3u8_web_path

wget $m3u8_web_path -O $VIDEO_FILE_NAME

#有四種等級可以選
quality_1200K=`cat $VIDEO_FILE_NAME | sed -n '5,5p'`
quality_2000K=`cat $VIDEO_FILE_NAME | sed -n '9,9p'`
quality_350K=`cat $VIDEO_FILE_NAME | sed -n '13,13p'`
quality_500K=`cat $VIDEO_FILE_NAME | sed -n '17,17p'`

#預設是1200K
m3u8_web_path="${DOWNLOAD_LINK_PREFIX}${quality_1200K}"

echo $m3u8_web_path

wget $m3u8_web_path -O $VIDEO_FILE_NAME

cat $VIDEO_FILE_NAME | grep "#" -v > $OUTPUT_RESULT_FILE
dos2unix $OUTPUT_RESULT_FILE

#create folder
folder_name=`date +"%Y-%m"`
DATE=`date +"%Y-%m-%d"`
baa_high_quality_foldername="$DATE-baa"
baa_high_quality_local_path="../done/$folder_name/video/baa-high-quality_1200K"
baa_high_quality_local_path_with_filename="$baa_high_quality_local_path/$baa_high_quality_foldername"
mkdir -p $baa_high_quality_local_path
mkdir -p $baa_high_quality_local_path_with_filename
cp $VIDEO_FILE_NAME $baa_high_quality_local_path_with_filename
cd $FOLDERNAME


#get real file now
while read file_name 
do 
    wget ${DOWNLOAD_LINK_PREFIX}${DOWNLOAD_LINK_PREFIX_SUB_PATH}/${file_name}
    #echo ${DOWNLOAD_LINK_PREFIX}${DOWNLOAD_LINK_PREFIX_SUB_PATH}/${file_name}
done <../$OUTPUT_RESULT_FILE
