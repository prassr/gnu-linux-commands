#!/usr/bin/gawk -f
BEGIN{
	ndays=5
	dformat="+%d/%b/%Y"   # dateformat
	for (i=0; i<ndays; i++) { # loop over 5 iterations
		cmdstr=sprintf("date --date=\"%d days ago\" %s", i, dformat) # create date command string using sprintf
		cmdstr | getline mydate   # the date command in cmdstr is executed on shell and output is stored in variable mydate using getline
		dates[i]=mydate     # storing the date for last five days in array dates as loop is run
	}
	dstring = ""
	for (i in dates) {
		dstring = dstring " " dates[i] # create a space separated string of dates
	}
	print "date string=" dstring # print the date string
}
{
	ldate=substr($4,2,11) # from fourth field of the record pick 11 characters starting from character 2 using substring function
	w = match(dstring,ldate) # match the date from ldate with dstring, return 1 if it's part of it otherwise return 0.
	if(w != 0) {  # if w is non-zeor, i.e. ldate is part of dstring
		#print ldate " " $1 " " $7
		print ldate " " $1  # print the date and first field
		ipcount[$1]++ # count of each ip address visit
	}
}
END{
	print "ip stats-----------------------------------"
	for (j in ipcount) {
		print j " "ipcount[j] # print the count of ip address and the count
	}
}

