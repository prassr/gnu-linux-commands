# Command Line Editors

Working with text files in the terminal

## Editors

### Line Editors

Old editors from the days of Unix. These editors are included by default in Linux or Unix.
* ed : oldest known editor
* ex : extension to ed editor

### Terminal Editors

* pico : It came along with email application pine.
	- nano : extension to pico editor
* vi or vim : most popular and complex editor
* emacs : alternate to vi editor

### GUI Editors

* KDE : Common Desktop Environment
	- kate
	- kwrite
* Gnome
	- gedit
* sublime
* atom : provides intergration to github (support not available.)
* brackets : HTML editor

### IDE (Integrated Development Environment)

* eclipse

* Bluefish

* NetBeans

## Features

* Scrolling, view modes, current position in file
* Navigation (char, word, line, pattern)
* Insert, Replace, Delete
* Cut-Copy-Paste
* Search-Replace
* Language-aware syntax highlighting
* Key-maps, init scripts, macros
* Plugins

We will look at ed, nano (pico), vim and emacs editors.

## [ed](/Week-4/ed.md)
## [nano](/Week-4/nano.md)
## [vim](/Week-4/vim.md)
## [emacs](/Week-4/emacs.md)


## Commands 

### ` readlink `

```bash
readlink -f path
```

* It print value of symbolic link or canonical file name.
* With ` -f ` as option it recursively follows the symlink and prints the canonical file name.
 
	```terminal
	~$ readlink -f /usr/bin/pico
	/usr/bin/nano	
	```
		
### ` dmesg `

```bash
dmesg
```

* It is used to examine or control kernel ring buffer.
* By default it displays all the messages from kernel ring buffer.
