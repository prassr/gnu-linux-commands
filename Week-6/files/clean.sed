/[[:alpha:]]{2}[[:digit:]]{2}[[:alpha:]][[:digit:]]+/!d # delete lines which do not match the roll number pattern given in address.
s/[ ]+/ /g # search for multiple occurrences of spaces and replace them with single space.
s/ ([[:digit:]]+).*/ \1/g # search for digits `([[:digit:]]+)` followed by any character and replace them with the digits `([[:digit:]]+) <- \1.
