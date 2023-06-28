To illustrate the action code blocks:
./block-ex-1.awk block-ex-1.input

Use of variables in awk
./block-ex-2.awk block-ex-2.input

Use of patterns with action code blocks in awk
./block-ex-3.awk block-ex-3.input

Use of regex expression patterns with action code blocks in awk
./block-ex-4.awk block-ex-4.input

Use of arithmetic expression patterns with action code blocks in awk
./block-ex-5.awk block-ex-5.input

Case study of extracting fields from suitable records and arithmetic
./block-ex-6.awk block-ex-6.input

Function usage along with dummy input
touch xaa
ls -l xaa
gawk -f func-lib.awk -f func-example.awk xaa
echo " " | gawk -f func-lib.awk -f func-example.awk

Using awk to generate data file
echo " " | ./rsheet-create.awk > rsheet-data.txt

Using awk to process data file
./rsheet-process.awk rsheet-data.txt > rsheet.out.txt

Time the process for 2 million records
time ./rsheet-create.awk rsheet-data.txt > rsheet-data.txt

Explain format of apache2 access.log file
head access-full.log

Extract IP from apache2 log
head access-full.log | awk 'BEGIN{FS=" "}{print $1}'

To print IP and URL:
awk '{print $1 " " $7}' access-head.log

Extract date from apache2 log
head access-full.log | awk 'BEGIN{FS=" "}{d=substr($4,2,11); print d}'

To print IP and date:
awk '{d=substr($4,2,11); print $1 " " d}' access-head.log

Print both date and IP
head access-full.log | awk 'BEGIN{FS=" "}{d=substr($4,2,11); print d,$1}'

Get date strings of last 5 days
date --date="5 days ago" +%d/%b/%Y

Case study of IP logs for last n days with IP stats
./apache-log-example-1.awk access-full.log
Create smaller files for testing codes
head access-full.log > access-head.log
tail access-full.log > access-tail.log

Sorting the IP stats
./apache-log-example-1a.awk access-full.log > ip-stats.txt
cat ip-stats.txt | sort -n

Use of dig to extract name of the m/c from IP address
dig -x 54.209.123.136
man dig
dig +noall +answer -x 54.209.123.136

Case study of IP logs for last n days with IP stats and m/c names
./apache-log-example-2.awk access-full.log

Time the awk process to process full log for last n days with IP stats
wc -l access-full.log
time ./apache-log-example-3.awk access-full.log

