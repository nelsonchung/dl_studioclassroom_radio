#!/bin/bash
#http://www.studioclassroom.com/img/cover/201509_cover_lt.jpg
DATE=`date +"%Y%m"`
#echo "Date is $DATE"
PATH_PIC="http://www.studioclassroom.com/img/cover"
FILENAME_ad=$DATE"_cover_ad.jpg"
FILENAME_sc=$DATE"_cover_sc.jpg"
FILENAME_lt=$DATE"_cover_lt.jpg"

#pic/2015-09-ada.jpg
RENAME_date=`date +"%Y-%m"`
RENAME_ad="pic/"$RENAME_date"-ada.jpg"
RENAME_sc="pic/"$RENAME_date"-baa.jpg"
RENAME_lt="pic/"$RENAME_date"-lta.jpg"

#wget $PATH_ad -o $RENAME_ad
#wget $PATH_sc -o $RENAME_sc
#wget $PATH_lt -o $RENAME_lt

if [ ! -f $RENAME_ad ]
then
wget $PATH_PIC/$FILENAME_ad
mv $FILENAME_ad $RENAME_ad
fi

if [ ! -f $RENAME_sc ]
then
wget $PATH_PIC/$FILENAME_sc
mv $FILENAME_sc $RENAME_sc
fi

if [ ! -f $RENAME_lt ]
then
wget $PATH_PIC/$FILENAME_lt
mv $FILENAME_lt $RENAME_lt
fi
