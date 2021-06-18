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

rm fit.log 2>/dev/null
gnuplot -e "usr='$usr'" -e "y1range='$(($y1max-$y1min))'" -e "y2range='$(($y2max-$y2min))'" ./fit.plt

if [ $# -gt 0 ]; then 
    # collect fit parameters
    # variable 'line' contains line number of the marker, we will got parameters after this line (line+2..line+4)
    # jump empty line by condition '!NF'
    awk -v line=$(awk '/Final set of parameters/{print NR}' fit.log) '{if(NR>line+1 && NR<line+6){if(!NF)next;print $3}}' fit.log | tr "\n" "\t" >> fit.data
    #echo "\n" >> fit.data
fi

# for centos
type eog > /dev/null 2>&1
if [ $? -eq 0 ]; then 
    eog draw.png &
    eog fit.png &
    exit 0
fi

# for mac
type open > /dev/null 2>&1
if [ $? -eq 0 ]; then 
    open draw.png &
    open fit.png &
    exit 0
fi

# for windows msys2
type mspaint > /dev/null 2>&1
if [ $? -eq 0 ]; then 
    mspaint draw.png &
    mspaint fit.png &
    exit 0
fi

exit 1
