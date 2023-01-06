# Shell Programming

## Control Structures

### if...then statement

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

- ` commands ` are exectuted only if ` condition ` is *true*.
- Example Scripts
	- The file [s1.sh](/Week-5/test/s1.sh) can be used to explore some basics and if statement. 


### if...then...else statement

```bash
if condition
then
	commands
else
	commands
fi
```

### if...then...elif...(else) statement

```bash
if condition_1
then
	commands
elif condition_2
then
	commands
.
.
.
elif condition_#
then
	commands
else 		# optional
	commands
fi
```

* If a condition fails, the program moves to next elif block, as long as a condition becomes true.
* else block is optional.
* Example Scripts
	- [if-elif-else-example.sh](/Week-5/shell-scripts/if-elif-else-example.sh)

### case statement

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

or 

```bash
case $var in
	op1)
		commandset1;;
	op2 | op3)		# | is for OR.
		commandset2;;
	op4 | op5 | op6)
		commandset3;;
	*)		# default
		commandset4;;
esac
```
	
* ` commands ` are executed each ` pattern ` matched for ` var ` in the options.
* ` *) ` is the default statement, which can match any value of ` $var ` not matched earlier.
* Example Scripts
	 - [case-example.sh](/Week-5/shell-scripts/case-example.sh)
	 
### for...in loop

```bash
for var in list
do
	commands
done
```

- ` commands ` are executed once for each item in the ` list `
- space is the field delimiter
- set ` IFS ` (Internal Field Separator) environment variable if required.
- Example Scripts
	- [s21.sh](/Week-5/test/s21.sh)
	- [s22.sh](/Week-5/test/s22.sh) to better understand for loop.
	- Setting ` IFS ` - [path-example.sh](/Week-5/shell-scripts/path-example.sh)


### C style for loop

* One variable
	
	```bash
	begin=1
	finish=10
	for (( a = $begin; a < $finish; a++ ))
	do
		echo $a
	done
	```
	
* Two variables

	```bash
	begin1=1
	begin2=10
	finish=10
	for (( a=$begin1, b=$begin2; a < $finish; a++, b-- ))
	do
		echo $a $b
	done
	```

	- Note: Only one condition to close the for loop.

* Example Scripts
	- One variable : [c-for-loop-example-1.sh](/Week-5/shell-scripts/c-for-loop-example-1.sh)
	- Two variables : [c-for-loop-example-2.sh](/Week-5/shell-scripts/c-for-loop-example-2.sh)

		
### while loop

```bash
while condition
do
	commands
done
```

- ` commands ` are executed only if ` condition ` is *true*.

### until loop

```bash
until condition
do
	commands
done
```

- ` commands ` are executed only if ` condition ` returns *false*.


### Processing Output of a Loop

* The output of any loop can be saved to a file using ` > filename ` directive succeeding ` done `  
* The file can be then used for further processing.

	```bash
	filename=tmp.$$
	begin=1
	finish=10
	for (( a = $begin; a < $finish; a++ ))
	do
		echo $a
	done > $filename
	```
	
	- Note : Output of the loop is redirected to the tmp file

* Example Script
	- [loop-output.sh](/Week-5/shell-scripts/loop-output.sh)
	

### Using ` break `

` break ` is used to exit the loop halting further iteration.

```bash
while condition
do
	commands
	if condition_b
	then
		break	# break out of inner loop
	fi
done
```

* Example Script
	- [break-example-1.sh](/Week-5/shell-scripts/break-example-1.sh)

```bash
while condition_outer
do
	while condition_inner
	do
		commands
		if condition_b
		then
			break 2		# break out of outer loop
		fi
	done
done
```

* Example Script
	- [break-example-2.sh](/Week-5/shell-scripts/break-example-2.sh)

### Using continue

` continue ` is used to skip an iteration and go to next iteration.

```bash
while condition
do
	commands
	if condition
	then
		continue
	fi
done
```

* Example Script
	- [continue-example.sh](/Week-5/shell-scripts/continue-example.sh)


### Using ` shift `

* ` shift ` will shift the command line arguments by one to the left, except ` $0 `.
* As the arguments are shifted, they are lost and can not be accessed later.

```bash
i=1
while [ -n "$1" ]
do
	echo argument $i is $1
	shift
	(( i++ ))
done
```

* Example Script
	- [shift-example.sh](/Week-5/shell-scripts/shift-example.sh)

## Functions

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
- Libraries needs be sourced. 
- Example Script
	- [function-example.sh](/Week-5/shell-scripts/function-example.sh)

	
## ` exec `

```bash
exec ./my-executable --my-options --my-args
```

* To replace shell with a new program or to change
i/o settings
* If new program is launched successfully, it will not
return control to the shell
* If new program fails to launch, the shell continues	
* Example Script
	- [exec-example.sh ](/Week-5/shell-scripts/exec-example.sh)

## ` eval `

```bash
eval my-arg
```

* Execute argument as a shell command
* Combines arguments into a single string
* Returns control to the shell with exit status
* WARNING: As a security practice to avoid evaluation of user input strings
* Example Script
	- [eval-example.sh](/Week-5/shell-scripts/eval-example.sh)


## ` getopts `
* It is a command to parse positional parameters to scripts as options.

	```bash
	getopts OPTSTRING NAME [arg...]
	```

* ` OPTSTRING ` has option letters to be recognized.
* If option letter follows ` : ` character, it requires an argument which must follow the letter and should be separated by white space.
* Each time ` getopts ` is called, the next option is stored in shell variable ` NAME `, and the index of the next argument to be procesed in ` OPTIND `
* ` OPTIND ` is initialized to 1 each time the shell script is invoked.
* If option requires an argument, it is stored in shell variable ` OPTARG `
* ` : ` as firstcharacter of ` OPTSTRING ` suppresses error.
* ` OPTERR ` switches errors on or off.
* ` OPTERR=0 ` errors off even without ` : ` as first character of ` OPTSTRING `
* By default ` OPTERR=1 ` means errors on.
* Example Script
	- [getopts-example.sh](/Week-5/shell-scripts/getopts-example.sh)
	

## ` select `

* Select words from a list and execute commands. 
* It's a simple text menu.
 
	```bash
	select NAME [in WORDS ... ;] do COMMANDS; done
	```
	
	```bash
	select x in 1 2 3 q; do echo $x; if [ "$x" = "q" ]; then break; fi; done
	```

* Example Script
	- [select-example.sh](/Week-5/shell-scripts/select-example.sh)
	


##  Security Tips
* Do not give set uid permission to the scripts.
* Make sure that processing user input is safe.
