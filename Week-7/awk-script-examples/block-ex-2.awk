#!/usr/bin/gawk -f
BEGIN{
	print "BEGIN action is processed";
}
{
	print "record:" $0;
	print "processing record number:" FNR;
	print "number of fields in the current record:" NF;
}
END{
	print "END action is processed";
}

# line 6 : print the record ($0)
# line 7 : print the Record Number for Current processing file - FNR - (when many files are input, FNR resets to 1 when next file comes to process)
# line 8 : print the number of fields (NF) in the record under process 
