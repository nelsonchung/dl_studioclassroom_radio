STUDIOCLASSROOM_VIDEO="http://digichannel.go2school.com.tw"
USER_AGENT="Windows-Media-Player/11.0.5721.5280"
HEADER_FILE="header.html"
MMS_HEADER_FILE="mms_header.html"
MMS_FILE="mms.html"
MMS_RESULT_FILE="mms_link.html"

DATE=`date +"%Y-%m-%d"`
#TYPE="$1"
#DL_INDEX="$2"
TYPE="lt"
DL_INDEX="$1"
WMV_FILE_NAME="$DATE-$TYPE-$DL_INDEX.wmv"

#clear data
rm $HEADER_FILE
rm $MMS_HEADER_FILE
rm $MMS_FILE
rm $MMS_RESULT_FILE

#get cookie
curl -D $HEADER_FILE -A $USER_AGENT "$STUDIOCLASSROOM_VIDEO/$TYPE/main01.asp?no=$DL_INDEX&sec=1"
cookie=`cat $HEADER_FILE | grep "Set-Cookie" | awk -F" " '{print $2}' | awk -F";" '{print $1}'`
echo "==================================================================================="
echo $cookie

#get mms link
##############fail#################################
#curl -D $MMS_HEADER_FILE -o $MMS_FILE -A "Windows-Media-Player/11.0.5721.5280" -b $cookie -e "http://digichannel.go2school.com.tw/lt/main01.asp?no=1&sec=1" "http://digichannel.go2school.com.tw/lt/play.asp?media=1&no=1"
#curl -A "Windows-Media-Player/11.0.5721.5280" -b $cookie -e "http://digichannel.go2school.com.tw/lt/main01.asp?no=1&sec=1" http://digichannel.go2school.com.tw/lt/play.asp?media=1&no=1 > $MMS_FILE 
#curl -D $MMS_HEADER_FILE -A "Windows-Media-Player/11.0.5721.5280" -b $cookie -e "http://digichannel.go2school.com.tw/lt/main01.asp?no=1&sec=1" "http://digichannel.go2school.com.tw/lt/play.asp?media=1&no=1" > $MMS_FILE 
curl -D $MMS_HEADER_FILE -o $MMS_FILE -A $USER_AGENT -b $cookie -e "$STUDIOCLASSROOM_VIDEO/$TYPE/main01.asp?no=$DL_INDEX&sec=1" "$STUDIOCLASSROOM_VIDEO/$TYPE/play.asp?media=1&no=$DL_INDEX" > $MMS_RESULT_FILE

#get mms file
mms_http_link=`cat $MMS_FILE`
#Connecting ...libmms error: libmms connection error
#mimms $mms_http_link $WMV_FILE_NAME
#Can't output file
#mplayer $mms_http_link -dumpfile $WMV_FILE_NAME
mplayer $mms_http_link -dumpstream -dumpfile $WMV_FILE_NAME
