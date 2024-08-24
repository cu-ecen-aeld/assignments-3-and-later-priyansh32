#!/bin/sh

writefile=$1
writestr=$2

if [ $# -lt 2 ]
then
    echo "Usage: $0 <filepath> <writestr>"
    exit 1
fi

if [ ! -n "$writefile" ]
then
    echo "File path is empty"
    exit 1
fi

filename=$(basename $writefile)
directory=$(dirname $writefile)

mkdir -p $directory
cd $directory

echo $writestr > $filename
