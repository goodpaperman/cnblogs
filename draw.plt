#! /usr/bin/gnuplot
set terminal png size 1080,720   #建立空白图片
set title usr   #注明曲线图标题
set output "draw.png"   #设置文件名
set grid

set xdata time
set timefmt "%Y-%m-%d"
set format x "%m/%d"
set xtic rotate by 315 # 270 + 45
set xtics 86400*3 # three day a big tic
set mxtics 3 # every day a small tic

# plot in double Y axises
set xlabel "day(s)"
set ylabel "score"
set y2label "rank"
set y2tics
set ytics nomirror

#try to fit but failed
#y(x)=a*x+b
#fit y(x) "score.txt" using 1:2 via a,b

#plot "score.txt" using 1:2:(stringcolumn(2)) with labels title "score" axis x1y1, "score.txt" using 1:3:(stringcolumn(3)) with labels title "rank" axis x1y2
plot "score.txt" using 1:($2-y1min) with lp pt 5 title "score" axis x1y1, "score.txt" using 1:(y2max-$3) with lp pt 7 title "rank" axis x1y2

#plot y(x) with l lw 2 lt 2  notitle axis x1y1

quit   #退出软件
