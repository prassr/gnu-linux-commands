#!/bin/bash


#echo use of for loop

#==============================#
#	First bash script :
# lines 4, 9-13
#==============================#

#for i in arg1 arg2 arg3
#do 
# 	echo $i
#done
 

#==============================#
#	modified (1) script
# lines 4, 21-25
#==============================#

#for i in file_{1..9}
## for i in file_{A..D}{1.9} # comment 22 and uncomment 23 and vice-versa
#do 
# 	echo $i
#done

#==============================#
#	modified (2) script
# lines 4, 33-36
#==============================#
# try following with command substitution using `command`
#for i in $(ls /bin) 
## for i in $(ls /bin/z*)   # comment 33 and uncomment 34 and vice-versa
#do
#	echo $i
#done
