#for 空中英語教室
DATE=`date +"%Y-%m-%d"`
echo "Date is $DATE"

get_image.sh
dl_ad.sh $DATE
dl_ba.sh $DATE
dl_lt.sh $DATE
ok.sh
sync_baidu.sh 
