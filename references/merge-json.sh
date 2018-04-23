#!/usr/bin/env bash
# @author Nikolas Lahtinen <nikolas.lahtinen@gmail.com>
#
# Merge json files with jq-1.5
# Usage:
# ./merge-json.sh *.json


DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $DIR/auto-jq.sh # https://gist.github.com/Hallian/a3f53d247a92f4ace621

function readFiles {
    for FILE in "${BASH_ARGV[@]}"
    do
        JSONS="$JSONS`cat $FILE`"
    done
}
readFiles
echo $JSONS | $JQ -sr 'reduce .[] as $item ({}; . * $item)'
