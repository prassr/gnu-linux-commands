# $HELL Variables
* The variables defined within shell in the command line environment.
* $hell variables are efficient medium of communication for two processes.
* They can also be made available to it's child processes.
* They are private to the shell they are defined in.
* $hell variables can also be used to store information in an intermediate form during processes.
* Commercial softwares can use shell variables to to know ports for which license is available.
* Hence, it is important to study them.
* Let's start.
* Before going ahead look at command below.

----------------------
### ` echo `
* Display a line of text or value of a variable.
* Ignores multiple spaces when string is without quotes.
* Use quotes for string with multiple spaces.
* Use double quotes for variables.
* Accepts multi-line input.
* Print strings to screen.
```terminal
~$ echo hello, world
hello, world
```
* Print values of variables.
```terminal
~$ echo $HOME
/home/groot
~$ echo "$HOME"
/home/groot
```
* To suppress trailing newline, use ` -n ` option.
```terminal
~$ echo -n "Hello"
Hello~$
```

* To enable interpretation of [backslash escapes](#backslash-escapes) use ` -e ` option.

----------------------

* Conventionally shell variables are defined in uppercase.
* To refer to a shell variable use ` $ `.

## Frequently Used Shell Variables

* ` $USERNAME `  or ` $USER `
	- Stores username of the logged in user.

```terminal
~$ echo $USERNAME
groot
~$ echo "User logged into the shell is: $USER"
User logged into the shell is: groot
```

* ` $HOME `       
	- Stores the path of the home directory.
```terminal
~$ echo $HOME
/home/groot
```
* ` $HOSTNAME `
	- Stores host name or name of the machine given in the file ` /etc/hostname `.
	- This a static file, if configured the network setting the file can be made dynamic. 
```terminal
~$ echo $HOSTNAME
rich-linux
```
* ` $PWD ` 
	- Stores the path of current directory. Same as [` pwd `](/Week_1/Lecture2-3.md#pwd)
```terminal
~$ echo $PWD
/home/groot
```
* ` $PATH ` 
	- Stores the path of commands used.
	- Value is list of directories with ` : ` as delimiter.
```terminal
~$ echo $PATH
/home/sanr/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/snap/bin
```
* Escaping ` $ ` 
	- make ` $ ` an ordinary character using ` \ `
```terminal
~$ echo  "hostname is \$HOSTNAME and user is $USERNAME"
hostname is $HOSTNAME and user is groot
```
 
## Commands to Inspect Shell Variables

### ` printenv `
* Print all o part of environment.
```terminal
~$ printenv HOME
/home/groot
```
### ` env `
* Print the variables defined in shell
### ` set `
* Display the names and values of shell variables.
* set or unset values of set variables.


# Different Ways of Executing a Command
* Using command itself 
```terminal
~$ date
Wednesday 21 December 2022 06:20:23 PM EET
~$ date -R
Wed, 21 Dec 2022 18:21:43 +0200
```
* Using commads binary path.
```terminal
~$ /usr/bin/date
Wednesday 21 December 2022 06:23:34 PM EET
```
* Executing from ` /usr/bin `
```terminal
/usr/bin$ ./date
Wednesday 21 December 2022 06:25:50 PM EET
```
* Using alias
```
~$ alias date="date -R"
~$ date
Wed, 21 Dec 2022 18:22:10 +0200
```
* Escaping alias using ` \ `
```terminal
~$ \date
Wednesday 21 December 2022 06:26:10 PM EET
```

## Special Shell Variables
| VARIABLE    | description |
| :------:    | :---------  |
|  ` $0 `   |  name of the shell | 
|  ` $$ `   |  process ID of the shell |
|  ` $? `   |  exit/return code of previously run command/program |
|  ` $- `   |  flags set in the bash shell |

### ` $0 `
```terminal
~$ echo $0
bash
```
### ` $$ `
* see [ps](/Week_1/Lecture2-3.md#ps)
```terminal
~$ echo $$
3423
```

# [Process Control](/Week_2/Lecture5.md "Linux Process Management")
### [` & `](/Week_2/Lecture5.md#&)
* Use to run a program in the background.
### [` fg `](/Week_2/Lecture5.md#fg)
* Bring the program to the foreground.
### [` coproc `](/Week_2/Lecture5.md#coproc)
* Run a program while also being able to use the shell.
### [` jobs `](/Week_2/Lecture5.md#jobs)
* List all background jobs.
### [` top `](/Week_2/Lecture5.md#top)
* Live view of all running processes.
### [` kill `](/Week_2/Lecture5.md#kill)
* Kill running/stopped process or processes.

# [Program Exit Codes](/Week_2/Lecture5.md#more-on-program-exit-codes "More on Program Exit Codes")
* ` 0 ` - success
* ` 1 ` - failure
* ` 2 ` - misuse of shell builtins when the permissions are not adequate
* ` 126 ` - command can not be executed
* ` 127 ` - command not found
* ` 130 ` - processes killed using ` ctrl + C ` or ` ^C `
* ` 137 ` - processes killed using ` kill -9 <pid> `
* Exit codes have values between ` 0 ` and ` 255 `.
### ` $? `
```
~$ true
~$ echo $?
0
~$ false
~$ echo $?
1
```

# [Flags set in bash](/Week_2/Lecture5.md#more-on-flags-set-in-bash)
* ` h ` - locate and hash commands
* ` B ` - brace expansion enabled
* ` i ` - interactive mode
* ` m ` - job control enabled (jobs can be taken foreground or background)
* ` H ` - ` ! ` style history substitution enabled
* ` s ` - commands are read from stdin
* ` c ` - commands are read from arguments
` echo $- `



