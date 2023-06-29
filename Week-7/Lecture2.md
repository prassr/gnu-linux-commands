# AWK Demonstration

* ` awk ` points to ` gawk `
  - ` awk ` -> ` /usr/bin/awk ` -> ` /etc/alternatives/awk ` -> ` /usr/bin/gawk `

* The files used are there in folder [awk-script-examples](/Week-7/awk-script-examples/)
* All .awk files have the comments which can be used to understand the code in them.

### The basic block structure

* Files: 
  - script - [block-ex-1.awk](awk-script-examples/block-ex-1.awk)
  - input - [block-ex-1.input](awk-script-examples/block-ex-1.input)
* Run the script on input file and see the output.

```terminal
~$ ./block-ex-1.awk block-ex-1.input
```

or 

```terminal
~$ awk -f block-ex-1.awk block-ex-1.input
```

or

```terminal
~$ cat block-ex-1.input | awk -f block-ex-1.awk
```

###  Uses of ` NF ` ` FNR ` and ` $0 `

* Files: 
  - script - [block-ex-2.awk](awk-script-examples/block-ex-2.awk)
  - input - [block-ex-2.input](awk-script-examples/block-ex-2.input)

### Filtering using regex over general block

* Use of ` /regex/ { procedure } `
* Files: 
  - script - [block-ex-3.awk](awk-script-examples/block-ex-3.awk)
  - input - [block-ex-3.input](awk-script-examples/block-ex-3.input)

### Conditional filtering using field matching regex over general block

* Use of ` $n ~ /regex/ { procedure } ` where ` $n ` is nth field
* Files: 
  - script - [block-ex-4.awk](awk-script-examples/block-ex-4.awk)
  - input - [block-ex-4.input](awk-script-examples/block-ex-4.input)


### Conditional filtering using ` NF `, uses of ` FS `

* Use of ` NF < NUM { procedure } `
* Use of ` FS `, specifying multiple field separators
* Files:
  - script - [block-ex-5.awk](awk-script-examples/block-ex-5.awk)
  - input - [block-ex-5.input](awk-script-examples/block-ex-5.input)

### array, ` if ` Conditional filtering and using ` for ` loop for aggregation

* Aggregation if any is done in ` END ` block
* Getting Report
* Files: 
  - script - [block-ex-6.awk](awk-script-examples/block-ex-6.awk)
  - input - [block-ex-6.input](awk-script-examples/block-ex-6.input)

### Functions

* Definition of mathematical and user-defined functions, function call, pretty printing
* Files: 
  - library - [func-lib.awk](awk-script-examples/func-lib.awk)
  - script - [func-example.awk](awk-script-examples/func-example.awk)

```terminal
~$ echo "12.5" | awk -f func-lib.awk -f func-example.awk
```

  - Replace 12.5 with ""
  - Replace echo "12.5" with ` cat xaa `, where xaa is empty file
  - Notice the difference in output
  - What do you observe?

### The power of awk in terms of speed

* Files: 
  - script-1 - [rsheet-create.awk](awk-script-examples/rsheet-create.awk)
  - script-2 - [rsheet-process.awk](awk-script-examples/rsheet-process.awk)

* The script-1 creates random data sheet.
* Can be invoked by passing empty string as input. (use ` time ` command to time the script)
* Store the output in file *rsheet-data.txt*
* Run the script-2 on *rsheet-data.txt*, note the time.

```terminal
~$ time ./rsheet-process.awk rsheet-data.txt > rsheet-pdata.txt
```

* You can see that awk processes data very quickly. Try to load the data in LibreOffice and see the result.

## Processing log

* File:
  - script-1 - [apache-log-example-1.awk](awk-script-examples/apache-log-example-1.awk)
  - script-1a - [apache-log-example-1a.awk](awk-script-examples/apache-log-example-1a.awk)
  - script-2 - [apache-log-example-2.awk](awk-script-examples/apache-log-example-2.awk)
  - script-3 - [apache-log-example-3.awk](awk-script-examples/apache-log-example-3.awk)
  - input - [access-full.log](awk-script-examples/access-full.log) contains log from web server, the requests.
  - Create files *access-head.log* and *access-tail.log* using ` head ` and ` tail ` commands respectively. 

* awk on command line

```terminal
~$ awk 'BEGIN {FS=" "} {print $1}' access-head.log # prints the ip address
```

```terminal
~$ awk 'BEGIN {FS=" "} {d=substr($4,2,11); print d}' access-head.log #print date field which is 4th field
```

```terminal
~$ awk 'BEGIN {FS=" "} {d=substr($4,2,11); print d, $1}' access-head.log #print date and ip address
```

  - Run the same commands on *access-tail.log* and see the output
  - Run the same commands on input file and see the time.


* See [date](#date) command to follow further

* Using ` getline `, ` sprintf ` and getting log summary for 5 days
  - We will use script-1 which has code written to get the date and ip address along with the log summary ip and it's count.
  - Run the script on input file and see the time
  - To only get only the ip stats run the script-1a on input file
  - The sorted output can be obtained using ` sort -n ` on output of previous action.

* Using [` dig `](/Week-8/Lecture2.md/#dig) to find the DNS of the ip address along with the count stats

  - Time run script-2 on input file.
  - See the output. 

## ` date `

* Getting date of 5 days ago from today.

```terminal
~$ date --date="5 days ago" +%d/%m/%Y
```