#!/usr/bin/gawk -f
BEGIN{
	print "BEGIN action is processed";
}
$1 ~ /[[:alpha:]]/ {
	print "alpha record:" FNR ":" $0;
	print "number of fields in the current record:" NF;
}
$1 ~ /[[:alnum:]]/ {
	print "alnum record:" FNR ":" $0;
	print "number of fields in the current record:" NF;
}
$1 ~ /[[:digit:]]/ {
	print "digit record:" FNR ":" $0;
	print "number of fields in the current record:" NF;
}
END{
	print "END action is processed";
}

# line 5 : process records whose first field ($1) matches the alphabetic characters ([[:alpha:]]) 
# line 9 : process records whose first field matches alphanumeric characters ([[:alnum:]])
# line 13 : process records whose first field matches digits ([[:digit:]])
