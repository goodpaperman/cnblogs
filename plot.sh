#! /bin/sh
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
gnuplot -e "usr='$usr'" -e "y1range='$(($y1max-$y1min))'" -e "y2range='$(($y2max-$y2min))'" ./draw.plt
# for centos
if [ $(type eog) -eq 0 ]; then 
    eog draw.png &
    exit
fi

# for mac
if [ $(type open) -eq 0 ]; then 
    open draw.png &
    exit
fi

# for windows msys2
mspaint draw.png &
