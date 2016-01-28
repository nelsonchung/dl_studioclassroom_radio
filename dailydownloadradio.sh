#for 空中英語教室
DATE=`date +"%Y-%m-%d"`
echo "Date is $DATE"

#get radio file
get_image.sh
dl_ad.sh $DATE
dl_ba.sh $DATE
dl_lt.sh $DATE

#get video file
cd video
./dailydownloadvideo.sh
cd ../

ok.sh
sync_baidu.sh 
