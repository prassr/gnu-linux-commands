# Combining Commands and Files

* In GNU/Linux OS it is possible to combine multiple commands together a to achieve a task.

## Executing Multiple Commands

* ` command1; command2; command3; `
	- Each command will be executed one after the other.
	
		```terminal
		~$ ls -d D* ; date; wc -l /etc/profile;
		Desktop  Documents  Downloads
		Saturday 24 December 2022 09:09:25 AM EET
		27 /etc/profile
		```
	- If one command fails the reamining will be executed.
	
		```terminal
		~$ ls /blah ; date; wc -l /etc/profile;
		ls: cannot access '/blah': No such file or directory
		Saturday 24 December 2022 09:11:04 AM EET
		27 /etc/profile
		```
		
* ` command1 && command2 && command3 `
	- ` && ` is logical AND operator. 
	- ` command2 ` will be executed only if ` command1 ` succeeds.
	- If ` command2 ` succeeds ` command3 ` will be executed.

* ` command1 || command2 || command3 `
	- ` || ` is logical OR operator.
	- ` command2 ` will be executed if ` command1 ` fails. 
	- ` command3 ` will be executed if ` command2 ` fails.

	
