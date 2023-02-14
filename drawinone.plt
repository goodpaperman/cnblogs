#! /usr/bin/gnuplot
set terminal png size 1080,720   #建立空白图片
set title usr.": score (".y1range.") rank (".y2range.")"  #注明曲线图标题
set output "draw.png"   #设置文件名
set key left
set grid

set xdata time
# set locale "zh_CN.utf-8"
set timefmt "%Y-%m-%d"
# set format x "%Y年%b"
set format x "%Y/%m"
set xtic rotate by -45 
set rmargin 8

set tics out
set xtics nomirror
set xtics 86400*28 # 4 weeks (1 month) a big tic
set mxtics 4 # every week a small tic
#set xtics 86400*7 # 7 days (a week) a big tic
#set mxtics 7 # every day a small tic

# plot in double Y axises
set xlabel "day(s)"
set ylabel "score/rank"
set ytics 10000
set mytics 10

plot "score.txt" using 1:2 with lp pt 13 title "score", "score.txt" using 1:3 with lp pt 3 title "rank"

quit   #退出软件
