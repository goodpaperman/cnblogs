#! /bin/awk
BEGIN {
	# must passin N parameter
	#N=1000;
	max=0; 
	maxs=0;
	#print strftime ("%Y %m", systime())
	print "N = " N
} 

{
	s=int($3/N);
	count[s]++; 
	#print $3, s
	if (count[s] > max) {
		max=count[s]; 
		#maxs=s*N;
		maxs=$3;
	}
}

END {
	for (i in count) {
		print i*N, count[i]
	}

	print "max days for rank to grow is " max " at " maxs
}
