#! /usr/bin/gnuplot
set terminal png size 1080,720   #建立空白图片
set title usr.": score (".y1range.") rank (".y2range.")"  #注明曲线图标题
set output "fit.png"   #设置文件名
set key left
set grid

set xlabel "score"
set ylabel "rank"

y1(x)=a*x**2+b*x+c
fit y1(x) "score.txt" using 2:3 via a,b,c

y2(x)=f/x+g
fit y2(x) "score.txt" using 2:3 via f,g

y3(x)=j*atan(x)+k
fit y3(x) "score.txt" using 2:3 via j,k

y4(x)=m*log(x)+n
fit y4(x) "score.txt" using 2:3 via m,n

plot "score.txt" using 2:3 with lp pt 13 title "score-rank", \
    y1(x) with l lw 2 lt 2 title "f(x)=ax^2+bx+c", \
    y2(x) with l lw 3 lt 3 title "f(x)=a/x+b", \
    y3(x) with l lw 1 lt 4 title "f(x)=a*atan(x)+b", \
    y4(x) with l lw 2 lt 5 title "f(x)=a*log(x)+b"

quit   #退出软件
