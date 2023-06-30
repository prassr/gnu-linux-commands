#!/usr/bin/gawk -f
BEGIN{
	print "Report of fee paid:";
	totfee=0    #  initialize a variable totfee, stores total fee
	FS=" "      # space is default field separator
}
{
	# print $0
	if ($1 ~ /[[:alpha:]]{2}[[:digit:]]{2}[[:alpha:]][[:digit:]]{3}+/) { # check if first field matches the regex alphabetic character twice, digits twice, alphabetic character once, digit thrice, possibly a roll number
		roll=$1     # store first field in variable roll
		fee=$2      # store second field in variable fee
		rf[roll]=fee  # In array rf, store fee with key roll
		totfee += fee # add the fee to variable totfee
		print roll " paid " fee # print the fee paid by each roll.
	}
}
END{
	cutoff=21500    # initialize a variable cutoff
	print "List of students who paid less than " cutoff # print the cutoff
	ns=0    # ns, a variable to store the number students who paid above the cutoff
	for (r in rf) # we iterate over the keys in associative arrya rf
	{
		ns++  # increment the student count
		if(rf[r] < cutoff) print "check ", r, " paid only " rf[r]   # if the fees paud is less then cutoff, we print a warnong
	}
	avg = totfee/ns   # avg stores the average fee paid
	print "Total fee collected:" totfee   # print the total fee
	print "Average fee collected:" avg    # print the average
}
