#@/usr/bin/sed -c
1i ----- header ----- # insert a header line before the first line
$a ---- footer ----- # append a footer line after the last line
1,5s/in place of/in lieu of/g # replace on line 1 to 5
6i ----- simpler stuff here onward ----- # insert before line 6
6,$s/in place of.*//g # substitute on line 6 onwards.

