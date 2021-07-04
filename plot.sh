#! /bin/sh
usr=$(cat user.txt)
eval $(cat ./score.txt | head -1 | awk '{ print "y1min="$2; print "y2max="$3 }')
eval $(cat ./score.txt | tail -1 | awk '{ print "y1max="$2; print "y2min="$3 }')
#firstline=$(cat ./score.txt | head -1)
#y1min=$(echo $firstline | awk '{ print $2 }')
#y2max=$(echo $firstline | awk '{ print $3 }')
#lastline=$(cat ./score.txt | tail -1)
#y1max=$(echo $lastline | awk '{ print $2 }')
#y2min=$(echo $lastline | awk '{ print $3 }')

echo "y1 range [$y1min,$y1max], y2 range [$y2max,$y2min]"
gnuplot -e "usr='$usr'" -e "y1range='$(($y1max-$y1min))'" -e "y2range='$(($y2max-$y2min))'" ./draw.plt

# clear log to get generated values
rm fit.log 2>/dev/null
gnuplot -e "usr='$usr'" -e "y1min='$y1min'" -e "y1max='$y1max'" -e "y2min='$y2min'" -e "y2max='$y2max'" ./fit.plt

#if [ $# -gt 0 ]; then 
#    # collect fit parameters
#    # variable 'line' contains line number of the marker, we will got parameters after this line (line+2..line+4)
#    # jump empty line by condition '!NF'
#    awk -v line=$(awk '/Final set of parameters/{print NR}' fit.log) '{if(NR>line+1 && NR<line+6){if(!NF)next;print $3}}' fit.log | tr "\n" "\t" >> fit.data
#    echo "" >> fit.data
#fi

if [ $# -gt 0 ]; then 
    # don't know how to print out parameter (a,b,c,f,g,m,n) from gnuplot script, so here extract them from fit.log (that's why we clear fit.log before calling fit.plt)
    eval $(sed -n '/[abcfgmn] *=.*/p' fit.log  | awk '{print $1,$2,$3+0}' | sed 's/ //g')
    # after that line, a/b/c/f/g/m/n takes effect, now calculate predicating values
    
    # predicate x*2, round result to integer
    xval=$(($y1max*2))
    eval $(awk -v a=$a -v b=$b -v c=$c -v f=$f -v g=$g -v m=$m -v n=$n -v xval=$xval 'BEGIN { print "y1="int(a*xval*xval+b*xval+c+0.5); print "y2="int(f/xval+g+0.5); print "y3="int(m*log(xval)+n+0.5) }')
    
    # dump results to data files
    echo "$xval $y1" >> predicate_binomial.data
    echo "$xval $y2" >> predicate_reciprocal.data
    echo "$xval $y3" >> predicate_logarithm.data
else
    # for centos
    type eog > /dev/null 2>&1
    if [ $? -eq 0 ]; then 
        eog draw.png &
        eog fit.png &
        exit 0
    fi
    
    # for mac
    type open > /dev/null 2>&1
    if [ $? -eq 0 ]; then 
        open draw.png &
        open fit.png &
        exit 0
    fi
    
    # for windows msys2
    type mspaint > /dev/null 2>&1
    if [ $? -eq 0 ]; then 
        mspaint draw.png &
        mspaint fit.png &
        exit 0
    fi
fi

exit 1

