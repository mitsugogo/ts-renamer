#!/bin/bash

# output mp4 directory
outputmp4dir=/usr/local/chinachu/recorded/mp4/

basedir=`dirname "$0"`

while [ "$#" -gt 0 ]; do
    echo -e "\n### \"$1\""

    node "$basedir/../cli.js" --input "$1" --parent "$outputmp4dir" --dir '${firstStartYYYY}${firstStartMM}_${title}' --file '${title}([ #${count2}])([ 「${subTitle}」])([ (${channelUserName} 1280x720 x264 ${YYYY}${MM}${DD}${hh}${mm})])'

    if [ "$?" -eq 0 ]; then
        echo "OK: $1" >> "$basedir/../log/rename.log"
    else
        echo "NG: $1" >> "$basedir/../log/rename.log"
    fi

    shift
done

echo done
read wait
