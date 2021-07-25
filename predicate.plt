#! /usr/bin/gnuplot
set terminal png size 1080,720   #建立空白图片
set title usr.": score (".y1max.") rank (".y2min.")"  #注明曲线图标题
set output "predicate.png"   #设置文件名
set key left reverse Left spacing 1.2
set grid

set xlabel "score"
set ylabel "rank"
# to prevent predicating value pollute our x-axis
#set xrange [y1min-100:y1max+100]


plot "predicate_binomial.data" using 1:2 with lp pt 12 lt 2 title "f1-pred", \
     "predicate_reciprocal.data" using 1:2 with lp pt 11 lt 3 title "f2-pred", \
     "predicate_logarithm.data" using 1:2 with lp pt 10 lt 4 title "f3-pred", \
     "predicate_merged.data" using 1:($2/3+$4*2/3) with lp pt 9 lt 5 title "pred-merged", \
     "score.txt" using 2:3 with lp pt 13 lt 6 title "score-rank"

quit   #退出软件
