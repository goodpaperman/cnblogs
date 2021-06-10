#! /usr/bin/gnuplot
set terminal png size 1080,720   #建立空白图片
set title usr.": score (".y1range.") rank (".y2range.")"  #注明曲线图标题
set output "fit.png"   #设置文件名
set key left
set grid

#set xdata time
#set timefmt "%Y-%m-%d"
#set format x "%m/%d"
#set xtic rotate by 315 # 270 + 45
#set xtics 86400*28 # 4 weeks (1 month) a big tic
#set mxtics 4 # every week a small tic

set xlabel "score"
set ylabel "rank"
#set y2label "rank"
#set y2tics
#set ytics nomirror

#try to fit
y(x)=a*x*x+b*x+c
fit y(x) "score.txt" using 2:3 via a,b,c

plot "score.txt" using 2:3 with lp pt 13 title "score-rank", y(x) with l lw 2 lt 2 title "fit"
quit   #退出软件
