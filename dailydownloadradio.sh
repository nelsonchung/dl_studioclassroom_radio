#for 空中英語教室
DATE=`date +"%Y%m%d"`
echo "Date is $DATE"
YEAR=`echo $DATE | cut -c 1-4`
MONTH=`echo $DATE | cut -c 5-6`
DAY=`echo $DATE | cut -c 7-8`

get_image.sh
dl_ad.sh $DATE
dl_ba.sh $DATE
dl_lt.sh $DATE
ok.sh $YEAR $MONTH $DAY 
sync_baidu.sh 
