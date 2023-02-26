# Promp Strings
Fields and Customization

## Context of Prompt String

* Shells: bash, dash, zsh, ksh csh
* python: An elegant programming language
* octave: GNU octave language for numeric computations
* gnuplot: Command-line driven interactive plotting program.
* sage: Open source mathematical software

## Bash Prompts

* ` PS1 ` : primary prompt string : ` $ `
* ` PS2 ` : secondary prompt for multi-line input : ` > `
* ` PS3 ` : prompt string in select loops : ` #? `
* ` PS4 ` : prompt string for execution trace : ` + `

## Escape Sequences

| escape | Description |
| ------ | ----------- |
| ` \A `   | Current time in 24-hour as *hh:mm* |
| ` \d `   | Date in *weakday month day* format |
| ` \h `  | *Hostname* upto first period |
| ` \H ` | Complete *hostname* |
| ` \s ` | Name of the *shell*  |
| ` \t ` | Current time in 24-hour as *hh:mm:ss* |
| ` \T ` | Current time in 12-hour as *hh:mm:ss* |
| ` \u ` | Current user's *username* |
| ` \w ` | Current directory |
| ` \W ` | Basename of current directory |
| ` \# ` | Current command number |
| ` \$ ` | If uid is 0, # else $ |
| ` \@ ` | Current time in 12-hour am/pm |
| ` \\ ` | A literal \ character |

* Default prompt

```bash
\u@\h:\w\$
```

- username (` \u `), @ literal, machine name (` \h `), : literal, current directory (` \w `) followed by $ literal if the user is not superuser. 


### Examples

#### ` PS1 `

* The default prompt without colors

```terminal
~$ PS1="\u@\h:\w\$ "
a@a:~$ 
```

* Display time along with current directory

	- A typical output is given below.

```terminal
a@a:~$ PS1="\t:\w\$ "
21:47:07:~$ 
```

* Display date along with current directory

```terminal
21:48:05:~$ PS1="\d:\w\$ "
Fri Feb 17:~$ 
```

* Date and time together with current directory

```terminal
Fri Feb 17:~$ PS1="\d \t:\w\$ "
Fri Feb 17 21:50:01:~$ 
```

* Number of the command.

```terminal
Fri Feb 17 21:50:01:~$ PS1="\#:\$ "
45:$
```

* Doesn't look good? Source the default prompt
	- bash prompt is defined in `~/.bashrc` filesystem. 

```bash
source .bashrc
```


#### ` PS2 `

* This prompt is made available when there are unmatching quotes or newline escapes.
* Change the ` PS2 ` prompt to *~>*

```bash
PS2="~>"
```

### ` PS3 `

* This prompt can not be printed but can be seen within ` [select]() ` loop.

* ` select ` gives a menu, and on choosing right menu option (choose a menu item number), it can perform operations which are specified within the loop.

```bash
select x in alpha beta gamma; do echo $x; done
```

* ` #? ` is the prompt you will see, when you execute above expression.

* Change the prompt to 'choose your option as above: '

```bash
PS3="choose your option as above: "
```

* Execute the ` select ` code above again to see the prompt change.

### ` PS4 `

* It is activated when ` set -x `, used to debug, command is run.
* The typical output is shown below.

```terminal
~$ set -x
~$ pwd
+ pwd
/home/a
```

* Change ` PS4 ` to 'Now Running Command: '

```terminal
~$ PS4='Now Running Command: '
+ PS4='Now Running Command: '
~$ date
Now Running Command: date
Fri Feb 17 05:52:23 PM +06 2023
```

## Python Command Line

* ` ps1 ` and ` ps2 ` are defined in the module ` sys `
* Change ` sys.ps1 ` and ` sys.ps2 ` is needed
* Override ` __str__ ` method to have dynamic prompt.
* Default prompt:

```console
>>>
```

## octave prompt

* See prompt changing in octave, as we plot
	- x and y are array from 1 to 100, with hops of 10.

```terminal
~$ octave
octave:1> x=[1:10:100]
octave:2> y=[1:10:100]
octave:3> plot(x,y)
```

## gnuplot prompt

```terminal
~$ gnuplot
gnuplot> 
```

## sage prompt

```terminal
~$ sage
sage: plot(sin(x),x,0,2*pi)
```
