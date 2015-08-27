#coding=utf-8

import eyeD3
import datetime
import os
import sys

################################################################################
currentDir = os.getcwd()
print currentDir

tag=sys.argv[1]
#image_file=currentDir+"/pic/"+str(datetime.datetime.now().year)+"-"+str(datetime.datetime.now().month)+"-ada.jpg"
image_file=currentDir+"/pic/"+datetime.datetime.now().strftime('%Y')+"-"+datetime.datetime.now().strftime('%m')+"-"+tag+".jpg"
print image_file
#20150803ada.mp3
#mp3_file=str(datetime.datetime.now().year)+str(datetime.datetime.now().month)+str(datetime.datetime.now().day)+"ada.mp3"
file_format=datetime.datetime.now().strftime('%Y')+datetime.datetime.now().strftime('%m')+datetime.datetime.now().strftime('%d')
if len(sys.argv) == 3: 
    file_format=sys.argv[2]
mp3_file=file_format+tag+".mp3"
print mp3_file
title=file_format+tag
tracknum=str(datetime.datetime.now().strftime('%d'))

if sys.argv[1] == "ada":
    artist="彭蒙惠英語"
elif sys.argv[1] == "baa":
    artist="空中英語教室"
elif sys.argv[1] == "lta":
    artist="大家說英語"

album=artist+"-"+datetime.datetime.now().strftime('%m')
################################################################################
tag = eyeD3.Tag()
tag.link(mp3_file)
#print tag.getArtist()
#print tag.getAlbum()
#print tag.getTitle()
#print tag.getDate()
#print tag.getTrackNum()

# 支援中文
tag.encoding = '\x01'

tag.removeImages()
tag.addImage(0x08, image_file)
tag.setArtist(artist)
#tag.setArtist(unicode("作者")) //fail
tag.setAlbum(album)
tag.setTitle(title)
tag.setTrackNum((int(tracknum),None))
#tag.frames.removeFramesByID('TYER')
#tag.setDate("2016","09")
#tag.setDate(('2016','09'))
#tag.setDate((2016))
#tag.setDate(datetime.datetime.now().year+1)
#tag.setDate(datetime.datetime.now().year+1, None)
#print datetime.datetime.now().year+1
tag.update()
