#!/usr/bin/gawk -f
BEGIN{
	print "BEGIN action is processed";
}
{
	print "Default action is processed";
}
END{
	print "END action is processed";
}

# line 1 : ingterpreter
# line 2-4 : BEGIN block runs before processing file.
# line 5-8 : General block runs for all records
# line 9-11 : END block runs after all recoreds are processed.
# line 3,6,9 : print statement, similar to echo in bash
