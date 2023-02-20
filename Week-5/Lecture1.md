# Scripts

Creating your own commands.

## Software Tools Principles

* Do one thing well
* Process lines of text, not binary
* Use regular expressions
* Default to standard I/O
* Don't be chatty
* Generate same output format accepted as input
* Let omeone else do the hard part
* Detour to build specialized tools

Ref: Classic Shell Scripting - Arnold Robbins & Nelson H.F. Beebe

## Script Components
	
```bash
#! interpreter
# comments
commands
loops
variables
case statements
functions
```

## Types of Scripts

### Based on Languages

* shell
* awk
* sed
* python
* ruby
* perl
* Other scripting languages

### Based on invocation
* sourced
	- ` . scriptname ` or ` source scriptname `
	- execute permission is not needed
	- PID is same as the current shell
	- Commands are executed one after the other
	- Shell environment continues
	- Used to prepare environment

* executed
	- ` ./scriptname `
	- Needs execution permission
	- New process gets created to run script
	- PID is not same as the shell
	- Commands are executed one after the other
	- New environment is lost after return
	- Used to create a new functionality
	

## Script Location

* Use absolute path or relative path while executing script
* Keep the script in folder listed in ` $PATH `
* Watch out for the sequence of directories in ` $PATH `
<!-- using aliases, setting up .bashrc file. -->
<!-- write how to add a directory to $PATH -->

## Bash Environment

* **Login shell**
	- Shell that asks you for login credentials, e.g. ssh.
	- Files used in a login shell
		+ ` /etc/profile `
		+ ` ~/.bash_profile `
		+ ` ~/.bash_login `
		+ ` ~/.profile `

* **Non-login shell**
	- Shell that does not ask for login credentials, e.g. normally opening a terminal
	- Files used in a non-login shell
		+ ` /etc/bashrc `
		+ ` ~/.bashrc `
	
## Output from Shell Scripts
The following commands can be used for output.

* ` echo `
	- simple
	- terminates with a newline if ` -n ` option not given.
	- ` echo My home is $HOME `

* ` printf `
	- supports format specifiers like in C.
	- ` printf "My home is %s\n" $HOME `
	
## Input to Shell Scripts

* ` read var `
	- String read from command line is stored in ` $var `
	
	
	
## Shell Script Arguments

` ./myscript.sh -l arg2 -v arg4 `

* ` $0 ` - name of the shell program, ` myscript.sh `
* ` $# ` - number of arguments passed, 4
* ` $1 ` or ` ${1} ` - first argument, ` -l `
* ` ${11} ` - eleventh argument
* ` $* ` or ` $@ ` - all arguments at once, ` -l arg2 -v arg4 `
* ` "$*" ` - all arguments as a **single** string, "-l arg2 -v arg4"
* ` "$@" ` - all arguments as a **separate** strings, "-l" "arg2" "-v" "arg4"
* example script : [s1.sh](/Week-5/test/s1.sh)

## Command Substitution

```bash
var=`command`

var=$(command)
```

* ` command ` is executed and the output is substituted.
* Here, the variable ` var ` will be assigned with that output


## Conditions
While writing scripts we use conditional statements or loops, hence it is important to know the syntax.
Bash uses a wide variety of conditions.
These conditions can be checked directly on the command line.

* Use ` ! condition ` for negation.

* ` test expression `
	- ` test ` evaluates ` expression ` to true or false.
	- It can be used to check for file types, integer and string comparisons.
	- e.g. ` test -e file ` check if ` file ` exists.

* ` [ expression ] `
	- this is other way to use ` test ` expressions.
	- Command line special characters needs to be escaped.
	- e.g. ` [ -e file ] ` check if ` file ` exists.
	
* ` [[ expression ]] `
	- supports expressions supported by ` test ` command
	- It also helps to evaluate regular expressions.
	- e.g. ` [[ $var == 5.* ]] `

* ` (( expression )) `
	- ` expression ` is any complex conditional arithmetic expression.
	- only integers supported.
	- e.g. ` (( $v ** 2 > 10 )) `

* ` command `
	- If the command is successful, conditional statement is executed.
	- e.g. ` wc -l file `

* pipeline
	- If the exit status of pipelined commands is ` 0 `, then the conditional statement is executed.
	- e.g. ` who | grep "joy" > /dev/null `
	
## Types of Expressions
The expressions can have one operand ( unary ) or 2 operands (binary)
* string comparisons
* numeric comparisons
* file comparision

## ` test `
* Check file type and compare values.
* Without expression, defaults to false.
* You can combile multiple expressions using ` -a ` ( logical AND ) or ` -r ` ( logical OR ) ( Not supported by ` [[ ]] `)


### ` test ` numeric comparisons

| expression | description |
| :--------: | :--------   |
| ` $n1 -eq $n2 ` | Check if n1 is equal to n2 |
| ` $n1 -ge $n2 ` | Check if n1 is greater than or equal to n2 |
| ` $n1 -gt $n2 ` | Check if n1 is greater than n2 |
| ` $n1 -le $n2 ` | Check if n1 is less than or equalt to n2 |
| ` $n1 -lt $n2 ` | Check if n1 is less than n2 |
| ` $n1 -ne $n2 ` | Check if n1 is not equal to n2 |
 

### ` test ` string comparisons

| expression | description |
| :--------: | :--------   |
| ` $str1 = $str2 ` | Check if str1 is same as str2 |
| ` $str1 != $str2 ` | Check if str1 is not same as str2 |
| ` $str1 < $str2 ` | Check if str1 less than str2 |
| ` $str1 > $str2 ` | Check if str1 greater than str2 |
| ` -n $str ` | Check if str has length greater than zero |
| ` -z $str ` | Check if str has length zero |

### ` test ` unary file comparisons

| expression | description |
| :--------: | :--------   |
| ` -e file ` | Check if file exists |
| ` -d file ` | Check if file exists and is a directory |
| ` -b file ` | Check file exists and is block special |
| ` -c file ` | Check file exists and is character special |
| ` -f file ` | Check if file exists and is a regular file |
| ` -h file ` | Check file exists and is symbolic link ( also ` -L ` can be used) |
| ` -p file ` | Check if file exists and is a named pipe |
| ` -S file ` | Check if file exists and is a socket |
| ` -r file ` | Check if file exists and is readable |
| ` -w file ` | Check if file exists and is writable |
| ` -x file ` | Check if file exists and is executable |
| ` -s file ` | Check if file exists and is not empty |
| ` -O file ` | Check if file exists and is owened by current user |
| ` -G file ` | Check if file exists and default group is same as that of current user |

### ` test ` binary file comparisons
* Check files based on modification date.

| expression | description |
| :--------: | :--------   |
| ` file1 -nt file2 ` | Check if file1 is newer than file2 |
| ` file1 -ot file2 ` | Check if file1 is older than file2 |

<!-- part from lecture 2B -->

## Debugging

```bash
set -x
./myscript.sh
```

```bash
bash -x ./myscript.sh
```

- Print the command before executing it.
- Place ` set -x ` inside the script.
	
	
## Combining conditions

* Using ` && ` (logical AND operator)
	
	```bash
	[ $a -gt 3 ] && [ $a -lt 7 ]
	```	
	
* Using ` || ` (logical OR operator)
	
	```bash
	[ $a -le 3 ] || [ $a -ge 7 ]
	```

* Example Script : 
	- [condition-examples.sh](/Week-5/shell-scripts/condition-examples.sh)


## Shell Arithmetic

* ` let `
	```bash
	let a=$1+5	# no spaces around operators = and + 
	# or
	let "a = $1 + 5"
	```

* [` expr `](#expr-command-operators)
	
	```bash
	expr $a + 20
	# or 
	expr "$a + 20"
	# or
	b=$( expr $a + 20 )
	```

* ` $[ expression ] `
	
	```bash
	b=$[ $a + 10 ]
	```

* ` $(( expression )) `
	
	```bash
	b=$(( $a + 10 ))
	(( b++ )) # increment b by 1
	```

* Example Scripts 
	- [arithmetic-example-1.sh](/Week-5/shell-scripts/arithmetic-example-1.sh)
		Try with different arguments, numeric or string
	- [expr-examples.sh](/Week-5/shell-scripts/expr-examples.sh) 
		(also demonstrates ` set -x ` )

### ` bc `

 
### ` expr ` command operators

* Escape command line special characters.

| expression |  Description |
| :---------:| :----------  |
| ` a + b ` | Return arithmetic *sum* of a and b |
| ` a - b ` | Return arithmetic *difference* of a and b |
| ` a * b ` | Return arithmetic *product* of a and b |
| `a / b ` | Return arithmetic *quotient* of a divided by b |
| ` a % b ` | Return arithmetic *remainder* of a divided by b |
| ` a > b ` | Return *1* if a greater than b; else return *0* |
| ` a >= b ` | Return *1* if a greater than or equal to b; else return *0* |
| ` a < b ` | Return *1* if a less than b; else return *0* |
| ` a <= b ` | Return *1* if a less than or equal to b; else return *0* |
| ` a = b ` | Return *1* if a equals b; else return *0* |
| ` a \| b ` | Return *a* if neither argument is null or 0; else return *b* |
| ` a & b ` | Return *a* if neither argument is null or 0; else return *0* |
| ` a != b ` | Return *1* if a is not equal to b; else return *0* | 
| ` str : reg ` | Return the position upto anchored pattern *match* with BRE str |
| ` match str reg ` | Return the pattern *match* if reg matches pattern in str |
| ` substr str n m ` | Return the *substring* m chars in length starting at position n |
| ` index str chars ` | Return *position* in str where any one of chars is found first<; else return 0 |
| ` length str ` | Return numeric *length* of string str |
| ` + token ` | Interpret token as string even if it's a keyword |
| ` (exprn) ` | Return the value of expression exprn |


## Heredoc Feature

* A here document is used to redirect input into an interactive shell script or program.
* Using here document it is possible to supply input and to run a shell script from another program without user interaction.
* Thus, the input is here as opposed to somwhere else, hence the name.

	```bash
	program_name << LABEL
	program_input1
	program_input2
	...
	program_input#
	LABEL
	```
	
	- A ` LABEL ` can be anything.
		
	or
	
	```bash
	program_name <<- LABEL
		program_input1
		program_input2
		...
		program_input#
		LABEL
	```
	
	- A hyphen tells to ignore leading tabs.
	
* Example Scripts
	- [heredoc-example-1.sh](/Week-5/shell-scripts/heredoc-example-1.sh)
	- [heredoc-example-2.sh](/Week-5/shell-scripts/heredoc-example-2.sh)
