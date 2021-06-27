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
    y1(x) with l lw 6 lt 2 title sprintf("f1(x)=%.8fx^2%+fx%+.0f",a,b,c), \
    y2(x) with l lw 5 lt 3 title sprintf("f2(x)=%.2f/x%+.0f",f,g), \
    y3(x) with l lw 2 lt 4 title sprintf("f3(x)=%.2fatan(x)%+.0f",j,k), \
    y4(x) with l lw 2 lt 5 title sprintf("f4(x)=%.2flog(x)%+.0f",m,n)

quit   #退出软件
