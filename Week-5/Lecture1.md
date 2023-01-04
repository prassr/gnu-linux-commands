# Scripts

In this lecture we will discuss creating our own commands.

### Software Tools Principles

* Do one thing well
* Process lines of text, not binary
* Use regular expressions
* Default to standard I/O
* Don't be chatty
* Generate same output format accepted as input
* Let omeone else do the hard part
* Detour to build specialized tools

Ref: Classic Shell Scripting - Arnold Robbins & Nelson H.F. Beebe

### Script Components
	
```bash
#! interpreter
# comments
commands
loops
variables
case statements
functions
```

### Types of Scripts

#### Based on Languages

* shell
* awk
* sed
* python
* ruby
* perl
* Other scripting languages

#### Based on invocation
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
	

### Script Location

* Use absolute path or relative path while executing script
* Keep the script in folder listed in ` $PATH `
* Watch out for the sequence of directories in ` $PATH `
<!-- using aliases, setting up .bashrc file. -->
<!-- write how to add a directory to $PATH -->

### Bash Environment

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
	
### Output from Shell Scripts
The following commands can be used for output.

* ` echo `
	- simple
	- terminates with a newline if ` -n ` option not given.
	- ` echo My home is $HOME `

* ` printf `
	- supports format specifiers like in C.
	- ` printf "My home is %s\n" $HOME `
	
### Input to Shell Scripts

* ` read var `
	- String read from command line is stored in ` $var `
	
	
	
### Shell Script Arguments

` ./myscript.sh -l arg2 -v arg4 `

* ` $0 ` - name of the shell program, ` myscript.sh `
* ` $# ` - number of arguments passed, 4
* ` $1 ` or ` ${1} ` - first argument, ` -l `
* ` ${11} ` - eleventh argument
* ` $* ` or ` $@ ` - all arguments at once, ` -l arg2 -v arg4 `
* ` "$*" ` - all arguments as a **single** string, "-l arg2 -v arg4"
* ` "$@" ` - all arguments as a **separate** strings, "-l" "arg2" "-v" "arg4"


### Command Substitution

```bash
var=`command`

var=$(command)
```

* ` command ` is executed and the output is substituted.
* Here, the variable ` var ` will be assigned with that output




### Loops and Statements

#### for do loop

```bash
for var ib list
do
	commands
done
```
	
- ` commands ` are executed once for each item in the ` list `
- space is the field delimiter
- set ` IFS ` (Internal Field Separator) environment variable if required.


#### case statement

```bash
case var in
pattern1)
	commands
	;;
pattern2)
	commands
	;;
esac
```
	
- ` commands ` are executed each ` pattern ` matched for ` var ` in the options.
	
#### if statement
	
```bash
if condition
then
	commands
fi
```

```bash
if condition; then
	commands
fi
```

- ` commands ` are exectuted only if ` condition ` returns *true*.

#### while do loop
	
```bash
while condition
do
	commands
done
```

- ` commands ` are executed only if ` condition ` is *true*.

#### until do loop

```bash
until condition
do
	commands
done
```

- ` commands ` are executed only if ` condition ` returns *false*.

### Conditions

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
	- ` expression ` is any complex condiional arithmetic expression.
	- only integers supported.
	- e.g. ` (( $v ** 2 > 10 )) `

* ` command `
	- If the command is successful, conditional statement is executed.
	- e.g. ` wc -l file `

* pipeline
	- If the exit status of pipelined commands is ` 0 `, then the conditional statement is executed.
	- e.g. ` who | grep "joy" > /dev/null `
	
### Types of Expressions
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



### Functions

definition

```bash
myfunction()
{
	commands
}
```
or 
```bash
function myfunction
{
	commands
}
```

call 
	
```bash
myfunction
```

- ` commands ` are executed each time ` myfunction ` is called.
- Definitions must be before calls.





