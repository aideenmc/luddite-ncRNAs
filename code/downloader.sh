#!/bin/bash

while getopts f:c:n: flag
do
	case "$flag" in
		f) FILENAME="${OPTARG:-datasets.txt}";;
		c) CREDENTIALS="${OPTARG:-CREDENTIALS_FILE.json}";;
		n) N_PARALLEL="${OPTARG:-1}";;
	esac
done

LINES=$(cat $FILENAME)
for LINE in $LINES; do
	pyega3 -cf $CREDENTIALS -c $N_PARALLEL fetch $LINE
done
