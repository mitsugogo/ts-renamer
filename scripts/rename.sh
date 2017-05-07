#!/bin/bash

# output mp4 directory
outputmp4dir=/usr/local/chinachu/recorded/mp4/


basedir=`dirname "$0"`

while [ "$#" -gt 0 ]; do
    echo -e "\n### \"$1\""

    
    afterFilePath=`node "$basedir/../cli.js" --input "$1" --dir '${firstStartYYYY}${firstStartMM}_${title}' --file '${title}([ #${count2}])([ 「${subTitle}」])([ (${channelUserName} 1280x720 x264 ${YYYY}${MM}${DD}${hh}${mm})])'`
    
    # todo: debug
    echo $afterFilePath

    # ts HandBrakeCLI -i "{$afterFilePath}" -t 1 -o "{$outputmp4dir}{$finalDirName}/{$afterFileName}.mp4" -f mp4 --detelecine --decomb -w 1280 -l 720 --crop 0:0:0: -e x264 -q 21 --pfr -a 1,2 -E fdk_aac,fdk_aac -6 stereo,stereo -R Auto,Auto -B 256,224 -D 0,0 --gain 0,0 --crop 0:0:0:0 -x merange=32:deblock=-2,-2:b-adapt=2:rc-lookahead=50:ref=6:bframes=6:me=umh:analyse=all:trellis=2:no-fast-pskip=1:scenecut=70:b-pyramid=strict --x264-preset=fast --verbose=1

    if [ "$?" -eq 0 ]; then
        echo "OK: $1" >> "$basedir/../log/rename.log"
    else
        echo "NG: $1" >> "$basedir/../log/rename.log"
    fi

    shift
done

echo done
read wait
