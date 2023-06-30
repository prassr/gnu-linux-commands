#!/usr/bin/gawk -f
BEGIN{
	print "BEGIN action is processed";
	FS="[ .;:-]"
}
NF > 2 {
	print "acceptable record:" FNR ":" $0;
	print "number of fields in the current record:" NF;
}
NF <= 2 {
	print "not acceptable record:" FNR ":" $0;
	print "number of fields in the current record:" NF;
}
END{
	print "END action is processed";
}

# line 4 : field separator (FS) can be anything within square brackets
# line 6-9 : If NF is more than 2 then this block will be executed.
# line 10-13 : If NF is at most 2 then this block will be executed.
