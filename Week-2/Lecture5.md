# Linux Process Management
* Helps to switch between tasks while we are in the command line environment.
## ` sleep `
* Delay for a specified amount (` NUMBER `) of time.
```bash
sleep NUMBER
```
* To ` sleep ` for 10 seconds.
```terminal
~$ sleep 10

```

We will use ` sleep ` a simple process to demonstrate Linux process management.

## ` & `
*  A process is run in the background.
```bash
command &
```

```terminal
~$ sleep 30 &
[1] 5477
```
* ` [1] ` denotes the command number that is pushed to background. Not to be confused with ` 5477 ` which is ` PID `

## ` coproc `
* Bash builtin command to create interactive asynchronous process.
* The program runs asynchronously and can listen to standard input and give back standard output on need.

* Run command(s) in an executing shell. ` NAME ` is optional, default name is ` COPROC `
```bash
coproc [NAME] { command; }
```
* Write to a specific coprocess stdin
```bash
echo "input" >&"${NAME[1]}"
```
* Read from a specific coprocess stdout
```bash
read varname <&"${NAME[0]}"
```

* Create a coprocess running `bc`
```terminal
~$ coproc BC { bc --mathlib; };	# creates a coprocess
[1] 3820
~$ echo "22/7" >&"${BC[1]}" 	# write input to coprocess  
~$ read output <&"${BC[0]}"	# read output from coprocess
~$ echo $output	# echo the read output.
3.14285714285714285714
```
- run ` ps --forest ` to see the process tree.
	
* Run command `sleep 10` as a coprocess.
	- command run within the same shell.
	- process name can not be given.
	- default name is used.
```terminal
~$ coproc sleep 10
[1] 5499
~$ 
[1]+	Done				coproc COPROC sleep 10
```


## ` fg `
* Bring a recent process running in the background to the foreground.
```terminal
~$ sleep 30 &
[1]	5510
~$ fg
sleep 30

```

## ` jobs `
* List the processes running in the background by the user.
```terminal
~$ coproc sleep 30
[1] 5583
~$ jobs
[1]+  Running                 coproc COPROC sleep 30 &
```


## ` top `
* Prints summary and live snapshots of processes running onto the screen.
* It is in decreasing order of CPU utilization ` %CPU `.
* Use ` q ` key or ` ^C ` to quit, ` ^Z ` to suspend it (move to background).  
```bash
top
```

## ` kill `
* Kill a command using it's process id.
```bash
kill -9 <process id>
```
```terminal
~$ coproc sleep 10
[1] 5507
~$ kill -9 5530
~$
[1]+	Killed				coproc COPROC sleep 10		
```

## ` $! `
* It's an environment variable which stores the ` PID ` of the last process that is running/has run in the background.
* The value persits even if the process is finished.


# More on [Program Exit Codes](/Week_2/Lecture2.md#program-exit-codes)

*  If a command is run successfully then error code is ` 0 `.
```
~$ echo hello
hello
~$ echo $? 
0
```

* If a program/command has failed (like permission error) then error code is ` 1 `.
```terminal
/$ touch file1
touch: cannot touch 'file1': Permission denied
/$ echo $?
1

```

* If there is misuse of shell builtins, then error code is ` 2 `
```terminal
~$ ls -w
ls: option requires an argument -- 'w'
Try 'ls --help' for more information.
~$ echo $?
2
~$ help -h
bash: help: -h: invalid option
help: usage: help [-dms] [pattern ...]
~$ echo $?
2
```

* If the command can not be executed then error code is ` 126 `
	- ` file1 ` is not executable.
```terminal
~$ stat -c "%A" file1
-rw-rw-r--
~$ ./file1; echo $?
bash: ./file1: Permission denied
126
```

* If the command is not found then the error code is ` 127 `
```terminal
~$ daet
```
Very big output.
```terminal
~$ echo $?
127
```

* If the command is killed/inturrupted with ` ^C `, then the error code is `130`
```terminal
~$ sleep 30
^C
~$ echo $?
130
```

* If the process in some other shell is killed using ` kill -9 ` command, then the error code is ` 137 ` 

Terminal 1 : Iterative output of ` top ` command	
```terminal
~$ top
```
Terminal 2 : Kill command ` top ` running in Terminal 1.
```terminal
~$ kill -9 2267
~$
```

Terminal 1 : Response
```terminal
Killed
~$ echo $?
137
```

* Other exit codes
	- Returns exit code modulo 256 on exit code greater than 255.
```terminal
~$ bash -c "echo \$$; exit 3243;"
6669
~$ echo $?
171
```

Exit codes are useful when in a program you want to run a process based on exit code of other process.


# More on [Flags Set in Bash](/Week_2/Lecture2.md#flags-set-in-bash)

## ` $- `
* Special variable to print the flags set in bash.

```terminal
~$ echo $-
himBHs
```

* Let's run a command to check if there can be less number of flags.
	- ` bash ` : spawn a childshell
	- ` -c `  : consider first non-option argument as command
	- ` \ ` : escape character to stop early interpretation of ` $- `
```terminal
~$ bash -c "echo \$-"
hBc
```

* Check the pid of childshell and printing the forest view using ` ps `. 
	- Commands are separated with ` ; `
```terminal
~$ bash -c "echo \$$; echo \$-; ps --forest"
```

## ` history ` command

* Stores commands run so far as history.
* ` !NUMBER ` (bang) is used to refer `NUMBER`th command. 
	- This is enabled when ` H ` flag is set.
```bash
history
```
* To run ` echo $0 ` at position `2023` 
```terminal
~$ !2023
echo $0
bash
```

## Brace Expnasion
* Enabled using ` B ` flag.
* Expand ` {start..stop} ` into list of values between ` start ` and ` stop ` inclusive.
```terminal
~$ echo {a..d}
a b c d
~$ echo {5..1}
5 4 3 2 1
```

## Other Expansions
* A wildcard ` * ` matches all files.
```terminal
~$ echo *
Desktop Documents Music Pictures Public snap Templates Videos
~$ echo D*
Desktop Documents Downloads
```

# Multiple Commands on a Line
* Use semicolon ` ; ` to separate commands.
* Combining ` ls `, ` date ` and ` wc ` commands on same line.
* ` ; ` in the end is optional.
```terminal
~$ ls; date; wc -l /etc/profile;
Desktop Documents Music Pictures Public snap Templates Videos
Friday 23 December 2022 01:36:49 PM EET
27 /etc/profile
```


