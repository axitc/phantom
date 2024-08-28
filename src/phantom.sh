#!/bin/bash

# Author : Akshit Chhikara
# phantom : auto download images from search engines with input automation

# rename images to avoid naming collision
rename () {
        num=$1
        den=1
        iter=0
        while [[ $(( num / den )) -gt 0 ]]; do
                den=$(( den * 10 ))
                iter=$(( iter + 1 ))
        done

        while [[ $iter -gt 0 ]]; do
                den=$(( den / 10 ))
                xdotool key $(( num / den ))
                sleep 0.1
                num=$(( num % den ))
                iter=$(( iter - 1 ))
        done
}

# tab change from terminal to browser
xdotool keydown alt key Tab; xdotool keyup alt

# using xdotool getmouseposition, we get:
# google image position
xdotool mousemove 825 310

i=1		# start of range. dont start with 0
nimg=1000	# end of range
while [[ $i -le $nimg ]]; do
	sleep 2.5
	xdotool click 3
	sleep 1
	xdotool key v
	sleep 1
	rename $i
	xdotool key Return
	sleep 2
	xdotool key Right

	i=$((i + 1))
	echo $i / $nimg
done

echo -terminated-
