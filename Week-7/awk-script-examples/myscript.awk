BEGIN
{
  a=1
}
{
  myfunc1() # call to function myfunc1
  b = myfunc2(a) # call to function myfunc2
  print b
}
