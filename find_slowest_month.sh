#! /bin/sh
if [ $# -lt 1 ]; then 
	echo "Usage: find_slowest_month.sh N (100/1000/10000...)"
	exit
fi

awk -v "N=$1" -f find_slowest_month.awk ./score.txt 
