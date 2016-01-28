./getvideo_lt.sh 01
./getvideo_lt.sh 02
./getvideo_sc.sh 01
./getvideo_sc.sh 02
#./getvideo_ad.sh 01
#./getvideo_ad.sh 02

folder_name=`date +"%Y-%m"`
#mkdir -p ../done/$folder_name/ada
mkdir -p ../done/$folder_name/video/baa
mkdir -p ../done/$folder_name/video/lta

mv *sc*.wmv ../done/$folder_name/video/baa 
mv *lt*.wmv ../done/$folder_name/video/lta 
