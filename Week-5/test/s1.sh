#!/bin/bash   # interpreter

# How to run this script?
# sourcing
## source s1.sh
# or
## . s1.sh
# executing
## chmod 755 s1.sh; ./s1.sh

#==============================#
#	First bash script : line 6 #
#==============================#
# echo "Hello World"


################################
#	Modified (1) s1.sh 
# lines 14,21,22
#==============================#
## uncomment line 14
# echo the PID of the process running this script is:
# echo $$

################################
#	Modified (2) s1.sh
# line 14,21,22,27
#==============================#
## uncomment lines 14,21,22
# ps --forest

################################
#	Modified (3) s1.sh 
# line 14,21,22,27,33,34
#==============================#
# export myvar=MYVAR
# echo $myvar


################################
#	Modified (4) s1.sh 
#  line 44, 45
#==============================#
# echo I am invoked as:
# echo $0


################################
#	Modified (5) s1.sh 
#  line 44, 45,52-57
#==============================#
# echo Number of arguments passed:
# echo $#
# echo First argument passed:
# echo $1
# echo Second argument passed
# echo $2

################################
#       Modified (6) s1.sh 
#  line 44, 45,52-57, 62-68
#==============================#
# if test $# -ge 2; 
# then
# 	if test $1 = $2;
#	then
#		echo The two arguments are same.
#	fi
# fi
