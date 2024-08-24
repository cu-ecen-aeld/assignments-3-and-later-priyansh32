#!/bin/sh

filesdir=$1
searchstr=$2

if [ $# -lt 2 ]
then
    echo "Usage: $0 <filesdir> <searchstr>"
    exit 1
fi

if [ ! -d "$filesdir" ]
then
    echo "Directory $filesdir does not exist"
    exit 1
fi

if [ ! -n "$searchstr" ]
then
    echo "Search string is empty"
    exit 1
fi

# find all files in $filesdir that contain $searchstr
files=$(grep -l "$searchstr" $filesdir/*)

# iterate over each file and count the number of lines that contain $searchstr
total=0
for file in $files
do
    count=$(grep -c "$searchstr" $file)
    total=$((total + count))
done

echo "The number of files are $(echo $files | wc -w) and the number of matching lines are $total"