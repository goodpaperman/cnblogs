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

# same with f/x+g
#y2(x)=j*atan(x)+k
#fit y2(x) "score.txt" using 2:3 via j,k

y3(x)=m*log(x)+n
fit y3(x) "score.txt" using 2:3 via m,n

xval=40000
y1val=a*xval**2+b*xval+c
y2val=f/xval+g
#y2val=j*atan(xval)+k
y3val=m*log(xval)+n

set label 1 sprintf("f1(%.0f)=%.0f",xval,y1val) at graph 0.6,0.7 left
set label 2 sprintf("f2(%.0f)=%.0f",xval,y2val) at graph 0.6,0.65 left
#set label 3 sprintf("f2(%.0f)=%.0f",xval,y2val) at graph 0.6,0.6 left
set label 3 sprintf("f3(%.0f)=%.0f",xval,y3val) at graph 0.6,0.6 left

plot "score.txt" using 2:3 with lp pt 13 title "score-rank", \
    y1(x) with l lw 4 lt 2 title sprintf("f1(x)=%.8fx^2%+fx%+.0f",a,b,c), \
    y2(x) with l lw 3 lt 3 title sprintf("f2(x)=%.2f/x%+.0f",f,g), \
    y3(x) with l lw 2 lt rgb "red" title sprintf("f3(x)=%.2flog(x)%+.0f",m,n)
    #y2(x) with l lw 2 lt 3 title sprintf("f2(x)=%.2fatan(x)%+.0f",j,k), \


quit   #退出软件
