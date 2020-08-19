#! /bin/sh
cd .termux/tasker/
usr=$(cat user.txt)
gnuplot -e "usr='$usr'" ./draw.plt
eog draw.png &
#mspaint draw.png &
