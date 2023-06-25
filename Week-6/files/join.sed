#!/usr/bin/sed -f
:x /\\$/N # :x is the label, label x. Whenever there is \ followed by end of the line (/\\ $/), read the next line in the buffer (N command)
/\\/s/\\\n//g # on the lines which have \, if there is a \n after \, then replace it with empty string.
/\\$/bx # on the line which contain \ at the end of the line, branch (b) to label (x), and repeat the commands. (Watchout! it may run infinite loop!)
