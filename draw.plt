#! /usr/bin/gnuplot
set terminal png size 1080,720   #建立1080*720空白图片
set title "cnblogs/goodcitizen"   #注明曲线图标题
set output "goodcitizen.png"   #设置文件名
set grid

set xdata time
set timefmt "%Y-%m-%d"
set format x "%m/%d"

# plot in double Y axises
set xlabel "day(s)"
set ylabel "score"
set y2label "rank"
set y2tics
set ytics nomirror

#set yrange [0:6000]
#set y2range [0:120000]
set yrange [y1min:y1max]
set y2range [y2min:y2max]
#set ytics ("0" 0,"1" 1000,"2" 2000,"3" 3000,"4" 4000,"5" 5000,"6" 6000)   #设置y轴范围、刻度参数
#set y2tics ("0" 0,"0.2" 20000,"0.4" 40000,"0.6" 60000,"0.8" 80000,"1.0" 100000,"1.2" 120000)   #设置y轴范围、刻度参数

plot "score.txt" using 1:2 w lp pt 5 title "score" axis x1y1, "score.txt" using 1:3 w lp pt 7 title "rank" axis x1y2
quit   #退出软件
