#!/usr/bin/gawk -f
BEGIN{
	print "BEGIN action is processed";
}
/[[:alpha:]]/ {
	print "alpha record:" FNR ":" $0;
	print "number of fields in the current record:" NF;
}
/[[:alnum:]]/ {
	print "alnum record:" FNR ":" $0;
	print "number of fields in the current record:" NF;
}
/[[:digit:]]/ {
	print "digit record:" FNR ":" $0;
	print "number of fields in the current record:" NF;
}
END{
	print "END action is processed";
}

# line 5 : process only lines which match the regex [[:alpha:]], which stands for alphabetic characters
# line 9 : process lines which has alphanumeric characters ([[:alnum:]]) in them
# line 13 : process lines which has digits ([[:digit:]]) in them
