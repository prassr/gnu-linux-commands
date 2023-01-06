#!/bin/bash

echo shell scripts in /bin directory
for f in $(ls /bin) 
do
	# echo $f
	file /bin/$f | grep  -e 'ASCII text executable'
	# file /bin/$f | grep  -e 'shell script'
done # > file1 ## writing these to a file.

# wc -l file1 ## number of executables matched.
# rm file1  > /dev/null  ## removing file1
