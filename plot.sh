#! /bin/sh
usr=$(cat user.txt)
gnuplot -e "usr='$usr'" ./draw.plt
mspaint draw.png &
