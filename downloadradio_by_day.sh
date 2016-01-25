
DAY="$1"

if [ "$DAY" == "" ]; then
    echo "The command format is: $0 2016-01-23"
    exit
fi

dl_ad.sh $DAY
dl_ba.sh $DAY
dl_lt.sh $DAY
