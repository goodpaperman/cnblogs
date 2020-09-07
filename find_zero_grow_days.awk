#! /bin/awk
BEGIN {
	l="";
	s=0;
	t=0
} 

{
	if(s==$2) {
		print l "  " strftime ("%A", t)
	} 
	
	l=$0; 
	s=$2; 
	str=$1; 
	gsub("-", " ", str); 
	str=str " 00 00 00"; 
	t=mktime(str)
}
