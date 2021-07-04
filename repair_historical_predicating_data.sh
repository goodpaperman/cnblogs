#! /bin/sh
# data should be parted into score.txt (with some basic historical data)
# and more.txt (with more recent data), 
# and then we will repair predicating data by moving more.txt data 
# into score.txt line by line and calling plot.sh without call png starter...

if [ ! -f "more.txt" ]; then 
    echo "you should split score.txt to score.txt & more.txt first before run this scripts..."
    exit 1
fi

while read line 
do
    echo "repair line $line"
    echo "$line" >> score.txt
    ./plot.sh "update_predicating_data"
done < more.txt

echo "repair done, now submit predicat_*.data !"
rm more.txt
