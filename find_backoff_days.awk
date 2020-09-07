#! /bin/awk
BEGIN {
	l="";
	s=1000000; # initial is 150000, the largest
	t=0
} 

{
	# rank is reducing always, find the one grow up
	if($3 > s) {
		print l "  " $3 "  " strftime ("%A", t)
	} 
	
	l=$0; 
	s=$3; 
	str=$1; 
	gsub("-", " ", str); 
	str=str " 00 00 00"; 
	t=mktime(str)
}
