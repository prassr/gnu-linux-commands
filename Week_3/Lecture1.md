# Combining Commands and Files

* In GNU/Linux OS it is possible to combine multiple commands together a to achieve a task.

## Executing Multiple Commands

* ` command1; command2; command3; `
	- Command execution is independent of the exit status.
		```terminal
		~$ ls -d D* ; date; wc -l /etc/profile;
		Desktop  Documents  Downloads
		Saturday 24 December 2022 09:09:25 AM EET
		27 /etc/profile
		```
	- If any command fails it will not affect execution of other command.
		+ here ` ls /blah ` fails.
		```terminal
		~$ ls /blah ; date; wc -l /etc/profile;
		ls: cannot access '/blah': No such file or directory
		Saturday 24 December 2022 09:11:04 AM EET
		27 /etc/profile
		```
		
* ` command1 && command2 && command3 `
	- ` && ` is logical AND operator. 
	- A command is executed if exit status of previous command is ` true `.
	- ` command2 ` will be executed only if ` command1 ` succeeds.
	- If ` command2 ` succeeds ` command3 ` will be executed.
		```terminal
		~$ ls -d D* && date
		Desktop  Documents  Downloads
		Saturday 24 December 2022 09:40:19 AM EET
		```
	- If a command fails subsequent commands will not execute.
		```terminal
		/$ ls /blah && date
		ls: cannot access '/blah': No such file or directory
		```
		
* ` command1 || command2 || command3 `
	- ` || ` is logical OR operator.
	- A command is executed if exit status of previous command is ` false `
	- If ` command1 ` succeeds, the execution will stops.
		```terminal
		~$ ls -d D* || date
		Desktop  Documents  Downloads
		```
	- ` command2 ` will be executed if ` command1 ` fails. 
	- ` command3 ` will be executed if ` command2 ` fails.
		```terminal
		/$ ls /blah || date
		ls: cannot access '/blah': No such file or directory
		Saturday 24 December 2022 09:46:55 AM EET
		```
	
* ` ( command1; command2; command3 ) ` 
	- Execution of multiple commands by spawning subshells.
		```terminal
		~$ ( date; echo $BASH_SUBSHELL )
		Saturday 24 December 2022 09:26:57 AM EET
		1
		```
	- Nesting of the subshell commands
		+ Nesting increases the subshell level.
		+ It is useful when environment which runs a program needs to be closed.
		+ It is not a good practice to launch subshells indefinitely, as it is expensive to prepare environment, computationally.
		```terminal
		~$ echo $BASH_SUBSHELL; ( echo $BASH_SUBSHELL; (echo $BASH_SUBSHELL))
		0
		1
		2
		```
* ` && ` and ` || ` operators can be combined together to achieve fairly complex task.		


# File Descriptors
File Descriptors can be used to redirect output to either a file or a command.
The data is stream of characters.
There are 3 standard file descriptors.
* ` stdin `
	- Reference Number : ` 0 `
	- It is pointer to input stream coming from keyboard.
* ` stdout `
	- Reference Number : ` 1 `
	- refers to screen where the output is displayed.
* ` stderr `
	- Reference Number : ` 2 `
	- By default refers to screen the error is displayed.

# Redirection Operators
* ` command > file1 `
	- ` > ` is used to create an empty file or to empty the existing file.
		```terminal
		~$ > file.txt
		~$ ls -l file.txt
		-rw-rw-r-- 2 groot groot 0 Dec 24 10:14 file.txt
		```
	- ` > ` operator is used to redirect the standard output of ` command ` to ` file1 `.
	- New file1 will be created if it does not exist.
		```terminal
		~$ ls -1 /usr/bin > file1
		~$ ls -l file1
		-rw-rw-r-- 2 groot groot 13354 Dec 24 10:14 file1
		```
	- Contents of file1 will be overwritten.
	- Standard error is printed to the screen.
		```terminal
		~$ ls -1 /usr/blah > file1
		ls: cannot access '/usr/blah': No such file or directory
		~$ ls -l file1
		-rw-rw-r-- 2 groot groot 0 Dec 24 10:14 file1
		```
	- Since, you are creating a file write permission to the directory is required.
		```terminal
		/$ ls -1 /usr/bin > file1
		bash: file1: Permission denied
		```
	- Storing system hardware information in a file using [` hwinfo `]() command.
		```terminal
		~$  hwinfo > hwinfo.txt
		```

* ` command >> file1 `
	- ` >> ` is used to create file if does not exist. If the file exists, it does nothing.
		```terminal
		~$ >> file1.txt
		~$ ls -l file1.txt
		-rw-rw-r-- 2 groot groot 0 Dec 24 11:30 file1.txt
		~$ >> file.txt
		-rw-rw-r-- 2 groot groot 0 Dec 24 10:14 file.txt
		```
	- ` >> ` is used to *append* the ` stdout ` (` 1 `) of ` command ` to ` file1 `.
		```terminal
		~$ date >> file1
		~$ cat file1
		Saturday 24 December 2022 11:39:38 AM EET
		~$ date >> file1
		~$ cat file1
		Saturday 24 December 2022 11:39:38 AM EET
		Saturday 24 December 2022 11:40:45 AM EET
		```
	- You can put multiple redirections on same line separated with ` ; `
		```terminal
		~$ date >> file2; wc -l /etc/profile >> file2; file /usr/bin/znew >> file2;
		~$ cat file2
		Saturday 24 December 2022 11:44:57 AM EET
		27 /etc/profile
		/usr/bin/znew: POSIX shell script, ASCII text executable
		```
				
## ` cat ` and Redirections
* Using ` cat ` command we can write to a file.
* When no option is given, 	
	- ` cat ` reads from ` stdin ` (` 0 `) and writes to the ` stdout ` (` 1 `).
		```terminal
		~$ cat
		Hello, how are you?
		Hello, how are you?
		I am fine.
		I am fine.
		Press <ctrl+D> to send EOF and gracefully exit.
		Press <ctrl+D> to send EOF and gracefully exit.
		~$
		```
* We can redirect the ` stdout ` (` 1 `) to write (overwrite!) to a file using ` > `.
		```terminal
		~$ cat > file1
		This is the first file I am creating on command line.
		We could use this feature to create text files on command line.
		You can exit using <ctrl+D>
		~$ ls -l file1
		-rw-rw-r-- 2 groot groot 146 Dec 24 11:50 file1
		```
	- Run ` cat file1 ` to see the contents of file1.
	
* If you want to *append* to the file use ` >> `.
	- Exit using ` <ctrl+D> `
		```terminal
		~$ cat >> file3
		Attempt 1 : This is a way to create a new file and append text to it.
		~$ cat >> file3
		Attempt 2 : This is a way to append text to a file.
					We can inspect the content using cat or less command. 
		~$ cat file3
		Attempt 1 : This is a way to create a new file and append text to it.
		Attempt 2 : This is a way to append text to a file.
					We can inspect the content using cat or less command. 
		```
