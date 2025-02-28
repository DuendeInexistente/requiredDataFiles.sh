#!/bin/bash

echo "[" > requiredDataFiles.json
wholething=$(while read p; do
    filename=$(echo $p | grep content | sed 's/content=//' | grep -v '^#' | grep -v '^$')
    if [ -n "$filename" ]; then
    echo
    path=$(find settings/gamefiles -iname "$filename")
    #echo $filename: $path

    echo "{\"$filename\": ["
    hash=$(while IFS= read -r line
        do
            python hash.py "$line" | uniq
    done <<< "$path" | uniq)
    echo "$hash" | sed 's/^/"/' | sed 's/$/"/' | sed -e 's/$/,/' -e '$s/,$//'
    echo "]},"


else
    echo empty >/dev/null
fi
done < ./settings/home/openmw/openmw.cfg)

echo "$wholething"| sed '$ s/.$//' >> requiredDataFiles.json
echo "]" >>requiredDataFiles.json




