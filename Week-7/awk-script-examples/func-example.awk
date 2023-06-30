#!/usr/bin/gawk -f
BEGIN {
	FS=":"
	print "-----------begin----------"
	c=atan2(1,1)    # calling an inbuilt function atan2
	print "c=" c
	print "--------------------------"
}
{
	print $0
	myfunc1()   # calling a user-defined function myfunc1
	a=$1
	b=myfunc2(a) # calling a user-defined function myfunc2
	print "b=" b
}
END {
	print "------------end-----------"
	d=myfunc2(c)
	print "d=" d
	print "--------------------------"
}
