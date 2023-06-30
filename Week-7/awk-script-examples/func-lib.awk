function myfunc1() # this is how functions are defined in awk
{
	printf "%f\n", 2*$1   # pretty printing using print
}
function myfunc2(a)
{
	b=a+0
	return sin(b)   # return sin of a
}
