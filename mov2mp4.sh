#!/bin/bash
# MOV to MP4

if [[ $# -eq 0 ]] ; then
    printf 'arguments needed!\nexample:\nmov2mp4.mp DIR\n'
    exit 0
fi

dir=$1
EXT="mov"

mkdir -p "$dir""Converted"

for i in "$dir"*; do

	if [ "${i}" != "${i%.${EXT}}" ];then
		f="$(basename -- "$i")"
        	echo "Converting file  $f"
    		ffmpeg -i "$i" -c:v libx264 -preset ultrafast -crf 0 "$dir"Converted/covert_$f".mp4"
	fi
done
