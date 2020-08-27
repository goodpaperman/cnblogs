#! /bin/sh
cd .termux/tasker/
usr=$(cat user.txt)
firstline=$(cat ./score.txt | head -1)
y1min=$(echo $firstline | awk '{ print $2 }')
y2max=$(echo $firstline | awk '{ print $3 }')
lastline=$(cat ./score.txt | tail -1)
y1max=$(echo $lastline | awk '{ print $2 }')
y2min=$(echo $lastline | awk '{ print $3 }')
echo "y1 range [$y1min,$y1max], y2 range [$y2max,$y2min]"
#y1min=$(($y1min-50))
#y2max=$(($y2max+500))
gnuplot -e "usr='$usr'" -e "y1min='$y1min'" -e "y1max='$y1max'" -e "y2max='$y2max' " -e "y2min='$y2min'" ./draw.plt
eog draw.png &
mspaint draw.png &
