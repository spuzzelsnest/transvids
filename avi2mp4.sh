#!/bin/bash
# avi to mp4

if [[ $# -eq 0 ]] ; then
    printf 'arguments needed!\n    example:\navi2mp4.sh DIR\n'
    exit 0
fi

dir=$1
EXT="avi"

mkdir -p "$dir""Converted"

for i in "$dir"*; do

	if [ "${i}" != "${i%.${EXT}}" ];then
		f="$(basename -- "$i")"
        	echo "Converting file  $f"
    		ffmpeg -i "$i" -c:v libx264 -crf 19 -preset slow -c:a aac -b:a 192k -ac 2 "$dir"Converted/covert_$f."mp4"
	fi
done
