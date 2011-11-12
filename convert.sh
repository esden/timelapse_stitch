#!/bin/bash

mkdir convert

amount=$(ls -l GOPR*.JPG | wc -l)
povray_amount=$(ls -l GOPR*.JPG | wc -l)

counter=10000
H=100
M=100
S=100
for f in GOPR*.JPG; do
	let "counter+=1"
	et "S+=10"
	if [ $S == 160 ] ; then
		S=100;
		let "M+=1"
	fi
	if [ $M == 160 ] ; then
		M=100;
		let "H+=1"
	fi
	echo "Converting image ${counter:1} of $amount worktime ${H:1}:${M:1}:${S:1}"
	convert $f -fill 'black' -draw 'rectangle 0,0 2592,80' -fill 'white' -pointsize '70' -gravity north -annotate 0 "Runtime ${H:1}:${M:1}:${S:1}" -scale 1280x720 convert/frame${counter:1}.jpg
done

ffmpeg -r 30 -sameq -i convert/frame%04d.jpg quadshot_endurance.mp4
