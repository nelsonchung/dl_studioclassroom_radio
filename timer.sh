DATE=`date +"%Y-%m-%d"`
HOUR_RUN=02
MINUTE_RUN=00
#echo $DATE

while [ 1 ]
do
    HOUR=`date +"%H"`
    MINUTE=`date +"%M"`
    DAY_OF_WEEK=`date +"%u"`
    #echo "Now time is $HOUR:$MINUTE $DAY_OF_WEEK"
    #echo "Alert time is $HOUR_RUN:$MINUTE_RUN "

    if [ "$HOUR" == "$HOUR_RUN" ] && [ "$MINUTE" == "$MINUTE_RUN" ]; then
        if [ "$DAY_OF_WEEK" == "1" ] || [ "$DAY_OF_WEEK" == "2" ] || [ "$DAY_OF_WEEK" == "3" ] || [ "$DAY_OF_WEEK" == "4" ] || [ "$DAY_OF_WEEK" == "5" ] || [ "$DAY_OF_WEEK" == "6" ]; then
        echo "Run script - dailydownloadradio.sh" 
        ./dailydownloadradio.sh
        fi
    fi
    sleep 60
done
