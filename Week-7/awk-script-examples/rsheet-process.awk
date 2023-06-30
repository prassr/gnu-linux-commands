#!/usr/bin/gawk -f 
BEGIN{
	OFS=" " # output field separator spearates the records with space (" ")
	FS=" "  # space is the default field separator
}
{
	a = $1*$2   #  multiply field 1 and field 2 and store in a
	b = $1+$2   # add field 1 and field 2 and store in b 
	printf("%f %f %f %f\n", $1, $2, a, b) # a formatted printing just like C. Creates four fields in the output
}
END{
}
