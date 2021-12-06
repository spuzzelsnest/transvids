#!/bin/bash
# mp4 to MOV

if [[ $# -eq 0 ]] ; then
    echo 'arguments needed!\example:\nmp4-2-mov.mp DIR'
    exit 0
fi

dir=$1
EXT="mp4"

mkdir -p "$dir""Converted"

for i in "$dir"*; do

	if [ "${i}" != "${i%.${EXT}}" ];then
		f="$(basename -- "$i")"
        	echo "Converting file  $f"
    		ffmpeg -i "$i" -c:v dnxhd -profile:v dnxhr_hq -pix_fmt yuv422p -c:a pcm_s16le -f mov "$dir"Converted/covert_$f".mov"
	fi
done
