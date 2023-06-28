# AWK

AWK is a language for processing fields and records.

## Introduction

* It is a programming language
* *AWK* is abbreviation of the three people who developed it:
  - *A*ho
  - *W*einberger
  - *K*ernighan

* It is a part of POSIX, IEEE 1003.1-2008
* Variants : nawk, gawk, mawk ...
* gawk contains features that extend POSIX

## Execution Model

* Input is a set of records
* Eg., using "\n" as separator, lines are records
* Each record is a sequence of fields
* Eg. using " " as fields separator, words are fields
* Splitting of records to fields is done automatically
* Each code block executes on one record at a time, as matched by the pattern of the block

## Usage

* Single line at the command line

```terminal
~$ cat /etc/passwd | awk -F":" '{print $1}'
```
 
* Script interpreted by awk

```terminal
~$ ./myscript.awk input_file
```

* Script reading from a file using ` -f `

```terminal
~$ cat /etc/passwd | awk -f myscript.awk
```

## Built-in Variables

| Variables   | Description    |
| :---------------: | :--------------- |
| ` ARGC `   | Number of arguments supplied on the command line (except those that came with -f & -v options) |
| ` ARGV `  | Array of command line arguments supplied; indexed from 0 to ARGC-1 |
| ` ENVIRON ` | Associative array of environment variables   |
| ` FILENAME `   | Current filename being processed   |
| ` FNR `   | Number of the current record, relative to the current file |
| ` FS `   |  Field separator, can use regex |
| ` NF `    | Number of fields in the current record  |
| ` NR `  | Number of the current record   |
| ` OFMT `| Output format for numbers |
| ` OFS ` | Output fields separator |
| ` ORS ` | Output record separator |
| ` RLENGTH ` | Record separator |
| ` RSTART ` | Length of string matched by match() function  |
| ` SUBSEP ` | First position in the string matched by match() function |
|  ` $0 ` | Entire input record |
| ` $n `   | *n*th field in the current record |

## AWK scripts

```syntax
[block] { procedure }
```

An awk script has to follow the syntax as shown above.

* There three types of *blocks* in awk.
  - BEGIN: ` BEGIN {procedure }`
  - General : ` [pattern] { procedure } `
    + expression 
    + regex
    + Relational expression
    + Pattern-matching expression
  - END: ` END { procedure } `

* A procedure is any of or all of the following:
  - Variable assignment
  - Array assignment
  - Input / Output commands
  - Built-in functions
  - Control loops.

* User defined functions needs to be defined before any block starts.
* Like python, one line comments in awk start with ` # `.

## Execution

* ` BEGIN { commands; } `
  - Executed once, before files are read
  - Can appear anywhere in the script
  - Can appear multiple times
  - Can contain program code


* ` END { commands } `
  - Executed once, after files are read
  - Can appear anywhere in the script 
  - Can appear multiple times
  - Can contain program code

* ` pattern { commands } `
  - Patterns can be combined with ` && `, ` || ` and ` ! `
  - Range of records can be specified using comma
  - Executed each record pattern evaluates to true
  - Script can have multiple blocks

* ` { commands } `
  - Executed for all records.
  - Can have multiple such blocks


## Operators

* Assignment
  - ` = ` ` += ` ` -= ` ` *= ` ` /= ` ` %= ` ` ^= ` ` **= `
* Logical
  - ` || ` ` && ` ` ! `
* Algebraic
  - ` + ` ` - ` ` * ` ` / ` ` % ` ` ^ ` ` ** `
* Relational
  - ` > ` ` <= ` ` > ` ` >= ` ` != ` ` == `

| Operators       | Description    |
| :---------:     | :--------------- |
| ` expr ? a : b `  | Conditional expression   |
| ` i in array `    |  Array index/key membership  |
| ` a ~ /regex/ `   | Regular expression match  |
| ` a !~ /regex/ `  |  Negation of regular expression match  |                          
| ` ++ `            |   Increment, both prefix and postfix     |
| ` -- `            |  Decrement, both prefix and postfix  |
| ` $ `             |  Field reference  |
| `   `             |  Blank is for concatenation |


## Functions and commands

| Type   | functions/commands    |
|--------------- | :--------------- |
| Arithmetic | ` atan2 ` ` cos ` ` exp ` ` int ` ` log ` ` rand ` ` sin ` ` sqrt ` ` srand ` |
| String   | ` asort ` ` asorti ` ` gsub ` ` index ` ` length ` ` match ` ` split ` ` sprintf ` ` strtonum ` ` sub ` ` substr ` ` tolower ` ` toupper `  |
| Control flow   | ` break ` ` continue ` ` do ` ` while ` ` exit ` ` for ` ` if ` ` else ` ` return `  |
| Input/Output   | ` close ` ` fflush ` ` getline ` ` next ` ` nextline ` ` print ` ` printf `  |
| Programming    | ` extension ` ` delete ` ` function ` ` system ` |
| bit-wise       | ` and ` ` compl ` ` lshift ` ` or ` ` rshift ` ` xor `|

## Arrays

* Associative arrays
* Sparse storage
* Index need not be integer
* ` arr[index]=value `
* ` for (index in arr ) `
* ` delete arr[index] `

## Conditionals and Loops

if:

```syntax
if (a > b)
{
  print a
}
```

for:

```awk
for (index in array)
{
  print array[index]
}
```

```awk
for (i=1;i<n;i++)
{
  print i
}
```

while:

```awk
while (a < n)
{
  print a
}
```

do ... while:

```awk
do
{
  print a
} while (a < n)
```

## Functions

* Invocation:

```terminal
~$ cat infile | awk -f mylib -f myscript.awk
```

Files : [mylib](awk-script-examples/mylib) [myscript.awk](awk-script-examples/myscript.awk)

## Pretty printing

```awk
printf "format", a, b, c 
```

* ` format ` has the following format
  - ` %[modifier]control-letter `

* Where ` modifier ` can be width, precision and -
* control-letter

| ctrl-letter | description |
| :----: | :---------  |
| ` c `  | ascii char |
| ` d ` | integer |
| ` i ` | integer |
| ` e ` | scientific notation |
| ` f ` | floating notation |
| ` g ` | shorter of scientific and float |
| ` o ` | octal value |
| ` s ` | string text |
| ` x ` | hexadecimal value |
| ` X ` | hexadecimal value in caps |

# bash + awk
* Including awk inside shell script
* heredoc feature
* Use with other shell scripts on command line using pipe

*awk is available everywhere !*

*awk is a programming language, quick to code and fast in execution*

*combine it on the command line with other scripts*
