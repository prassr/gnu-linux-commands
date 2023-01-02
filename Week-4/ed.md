# The GNU ed line editor


It is used for editing file line by line.
Now a days, we have more advanced editors, it is good to know when it comes to legacy of editors.
ed editor commands have very close resemblance with vi editor commands.
ed will always be part of system, so it can be used in emergency situations when other tools are not available.


## ed / ex commands

| Description | Commands |
| :---------- | :------  |
| Show the **P**rompt | ` P ` |
| Command Format | ` [addr[,addr]]cmd[params] `  |
| Commands for location | ` 2 ` ` . ` ` $ ` ` % ` ` + ` ` - ` ` , ` ` ; ` ` /RE/ ` |
| Commands for editing | ` f ` ` p ` ` a ` ` c ` ` d ` ` i ` ` j ` ` s ` ` m ` ` u ` |
| Execute a shell *command* | ` !command ` |
| **e**dit a file | ` e filename ` |
| **r**ead file contents into buffer | ` r filename ` |
| **r**ead *command* output to into buffer | ` r !command ` |
| **w**rite buffer to filename | ` w filename ` |
| **q**uit | ` q ` |


## Commands for Location
These commands are used to move the cursor.

| Commands | Description |
| :----------: | :------  |
| a number like ` 2 ` | refers to second line of file |
| ` . ` | refers to current line |
| ` $ ` | refers to last line |
| ` % ` | refers to all the lines |
| ` + ` | line after the cursor (current line) |
| ` - ` | line before the cursor (current line) |
| ` , ` | refers to the buffer holding the file (used with ` p `) or last line in buffer (without ` p `) |
| ` ; ` | refers to current position to end of the file |
| ` /RE/ ` | refers line matched by pattern specified by 'RE' |


## Commands for Editing
These commands are used for editing.

| Commands | Description |
| :----------: | :------  |
| ` f ` | show name of **f**ile being edited |
| ` p ` | **p**rint the current line |
| ` a ` | **a**ppend at the current line |
| ` c ` | **c**hange the current line |
| ` d ` | **d**elete the current line |
| ` i ` | **i**nsert line at the current position |
| ` j ` | **j**oin lines |
| ` s ` | **s**earch for regex pattern |
| ` m ` | **m**ove current line to position |
| ` u ` | **u**ndo latest change |
 

* We will use [test.txt](/Week-4/Files/test.txt), the file used in lecture, to work with examples.

* To open file to edit.

	```terminal
	~$ ed test.txt
	117

	```

	- Here the prompt is available for editing, *117* is size of file [test.txt](/Week-4/Files/test.txt)


* To see the prompt string, type ` P ` and press enter.
	- The default prompt is ` * `.

	```terminal
	P
	*
	```

* To go to line ` 1 ` or last line ` $ `

	```terminal
	*1
	line-1 hello world
	*$
	line-4 end of file
	*
	```

* To see all the lines try ` ,p `
* To go to last line of buffer holding file use ` , `

* To print range of lines
	- Print lines 2 to 3

	```terminal
	*2,3p
	line-2 welcome to line editor
	line-3 ed is perhaps the oldest editor out there
	```

* To go to line containing a pattern 'hello'

	```terminal
	*/hello/
	line-1 hello world
	```

* To go to next line use ` + `

	```terminal
	*+
	line-2 welcome to line editor
	```

* To go to previous line use ` - `

	```terminal
	*-
	line-1 hello world
	```

* To print current line till end of buffer using ` ;p `
	- After the command, current line is the last line
	
	```terminal
	*3
	line-3 ed is perhaps the oldest editor out there
	*;p
	line-3 ed is perhaps the oldest editor out there
	line-4 end of file
	```

* To see all lines use ` %p `
	- The cursor is now at the last line.
	

* To run a command using ` !command `

	```terminal
	*!date
	Saturday 31 December 2022 02:17:24 PM EET
	!
	```

* To read the output of a command into buffer using ` r !command `
	- We will read output of the command ` date `
	- After reading, the number of bytes read is printed
	
	```terminal
	*r !date
	42
	```
	
* To write the buffer read earlier to the file using ` w `
	- After writing, the new file size is printed. 
	
	```terminal
	*w
	159
	```

* To exit editing press ` q ` + enter

* To delete a line using ` d `
	- To delete current line use ` .d `
	- We will move to last line using ` $ `, then delete the line, then check the cursor.
	- use ` w ` to save the file.

	```terminal
	~$ ed test.txt 
	159
	P
	*$
	Saturday 31 December 2022 02:18:59 PM EET
	*.d
	*.
	line-4 end of file
	*w
	117
	```

* To append to a line using  ` a `
	- Exit appending by ` . ` + enter

	```terminal
	*a
	appended this line after the first line
	.
	*1,2p
	```
		
	- Check using ` ,p ` if the line has really appended.

* To search and replace using ` s/search/replacement/ `
	- We will search for *appended* on line to replace it with *Appended* on line 2

	```terminal
	*2
	appended this line after the first line
	*s/appended/Appended/
	*
	```

	- Check the replacement using ` . ` or ` 2 `.
	- Search for *welcome* and replace it with *WELCOME* on line 3.
	- Use ` w ` + enter to save the file.


* To see the filename you are working with using ` f `

	```terminal
	*f
	test.txt
	```

* ` p ` is also used to see the contents of current line

	```terminal
	*p
	line-4 end of file
	```
 
* To join two lines using ` j `
	- First we will append a line at the end
	- Then we will join the lines 5 and 6 and print the line

	```terminal
	*a
	this line is appended at the end of file
	.
	*5
	*5,6j
	*.
	line-4 end of filethis line is appended at the end of the file
	```

* To move a line to a position using ` m `
	- We will move the last line before the first line.

	```terminal
	*m0
	*
	```

	- Check the status using ` ,p `
	
* To undo using ` u `
	- This will undo the effect of previous command.
	
	```terminal
	*u
	*
	```

	- Check the status using ` ,p `, save the file using ` w ` + enter.
	
* To change the line using ` c `
	- Change the last line to 'line-5 EOF'
		
	```terminal
	*$
	*c
	line-5 EOF
	.
	*
	```
	
	- Use ` ,p ` to see the changes.

* To insert a line above current line use ` i `
	- we will add 'line-4 just before end of file'

	```terminal
	*i
	line-4 just before end of file
	.
	*
	```

	- Use ` ,p ` to see the changes.

* To prefix all lines using ` s `
	- ` .* ` matches entire line.
	- After the operation every line is prefixed by text *'PREFIX '*

	```terminal
	*%s/\(.*\)/PREFIX \1/
	*
	```

	- Use ` ,p ` to see the changes.

* To prefix specific lines using ` s `
	- We will replace 'PREFIX' with 'prefix' on lines 3 to 5

	```terminal
	*3,5s/PREFIX/prefix/
	*
	```

	- Use ` ,p ` to see the changes.
