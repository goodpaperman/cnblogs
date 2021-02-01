#! /bin/awk
BEGIN {
	max=0; 
	maxt=0;
	#print strftime ("%Y %m", systime())
} 

{
	str=$1 " " $2 " 01 00 00 00";  # remove day
	#print str
	t=mktime(str)
	#print strftime ("%Y %m: ", t)
	count[t]++; 
	if (count[t] > max) {
		max=count[t];
		maxt=t; 
	}
}

END {
	for (i in count) {
		#print i, count[i]
		print strftime ("%Y/%m", i), count[i]
	}

	print "max elapse is " max " at " strftime ("%Y/%m", maxt)
}
