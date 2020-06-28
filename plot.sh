#! /bin/sh
y1min=$(cat ./score.txt | sort -n -t ' ' -k 2 | head -1 | awk '{ print $2 }')
y1max=$(cat ./score.txt | sort -n -t ' ' -k 2 | tail -1 | awk '{ print $2 }')
y2min=$(cat ./score.txt | sort -n -t ' ' -k 3 | head -1 | awk '{ print $3 }')
y2max=$(cat ./score.txt | sort -n -t ' ' -k 3 | tail -1 | awk '{ print $3 }')
echo "y1 range [$y1min, $y1max], y2 range [$y2min, $y2max]"
y1min=$(($y1min-50))
y1max=$(($y1max+50))
y2min=$(($y2min-500))
y2max=$(($y2max+500))
gnuplot -e "y1min=$y1min" -e "y1max=$y1max" -e "y2min=$y2min" -e "y2max=$y2max" ./draw.plt
eog goodcitizen.png &
