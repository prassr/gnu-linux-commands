# vi editor

* It is also known as vim.
* VIM stands for **V**i **IM**proved
* It is said that vi is the most complex editor with respect to it's features which it provides through the commands.
* vim is available for all operating systems.
* Vim tutorial
	- The following command can be used to open vim tutorial.

		```bash
		vimtutor
		```

## Opening Files

* Normal Mode
	
	```bash
	vi <filename>
	```

* Binary mode
	
	```bash
	vi -b <filename> 
	```

## Modes  in vi

vi has different modes.
At the bottom it puts a notification when a mode is enebled.

### command mode

This mode is default mode in vi editor.
It eneables running commands such as special keystrokes and opens door to enter ex mode.

* ` Esc `
	-  Escape key is used to enter command mode.

#### ex mode

This mode is available after you enter command mode.
It is used to run native or system commands in vi editor.

* ` : `
	- Used to run ex or ed commands

#### Information
| Keys | Description |
| :---: | :--------- |
| ` :f ` | See the file name |
| ` CTRL+G ` | Print file name and number of lines |
| ` :X ` | Encrypt file |
| ` :h ` | Show help |

#### Exiting vi

| Keys | Description |
| :---: | :--------- |
| ` :w ` | write changes made to the disk |
| ` :x ` | write changes made to the disk and quit |
| ` :wq ` | write changes made to the disk and quit |
| ` :q ` | quit (if write out is over) |
| ` !q ` | ignore chnges and quit |


#### Moving around in vi

| Keys | Description |
| :---: | :--------- |
| ` k ` | move up |
| ` h ` | move left |
| ` j ` | move down |
| ` l ` | move right |


```
		     k ▴ 

h ◂ Bsp	    "Moving around in vi"       l ▸ Space

		    j ▾ Enter

```

#### Screen Manipulation

| Keys | Description |
| :---: | :--------- |
| ` CTRL+F ` | Scroll forward one screen |
| ` CTRL+B ` | Scroll backward one screen |
| ` CTRL+D ` | Scroll down half screen |
| ` CTRL+U ` | Scroll up half screen |
| ` CTRL+L ` | Redraw screen |
| ` CTRL+R ` | Redraw screen removing deleted stuff, redo, pulls the file content towards newest change |


#### Moving Around

| Keys | Description |
| :---: | :--------- |
| ` 0 ` | start of the current line |
| ` $ ` | end of the current line |
| ` w ` | beginning of the word |
| ` b ` | beginning of preceding word |
| ` :0 ` | first line in the file |
| ` 1G ` | first line in the file |
| ` gg ` | first line in the file
| ` :n ` | *n*th line in the file |
| ` nG ` | *n*th line in the file |
| ` ngg ` | *n*th line in the file |
| ` :$ ` | last line in the file |
| ` G ` | last line in the file |


#### Changing Text

| Keys | Description |
| :---: | :--------- |
| ` r ` | replace single char under cursor |
| ` R ` | replace chars from cursor till Esc |
| ` cw ` | change word under cursor, from current char till Esc |
| ` cNw ` | change *N* words from current char till Esc |
| ` C ` | Change chars in current line till Esc |
| ` cc ` | change current line till Esc | 
| ` Ncc ` | change next *N* lines, starting from current, till Esc |


#### Deleting Text

| Keys | Description |
| :---: | :--------- |
| ` x ` | delete single char under cursor |
| ` Nx ` | delete *N* chars from cursor |
| ` dw ` | delete one word, from the char under cursor |
| ` dNw` | delete *N* words, from the char under cursor |
| ` D ` | Delete rest of the line, from the char under cursor |
| ` dd ` | delete current line |
| ` Ndd ` | delete next *N* lines, starting from current |
 
#### Copy-Paste Text

| Keys | Description |
| :---: | :--------- |
| ` yy ` | copy (*y*ank) current line to buffer |
| ` Nyy ` | copy next *N* lines, including current, into buffer |
| ` p ` | Paste buffer into text after current line |
| ` u ` | undo previous action, pulls the file content back to oldest change | 

* ` y+Enter ` is same as ` 2yy `

#### Searching Text

| Keys | Description |
| :---: | :--------- |
| ` /string ` | search forward for string |
| ` ?string ` | Search backward for string |
| ` n ` | move cursor to next occurrence of string |
| ` N ` | move to previous occurrence of string | 

#### Search and Replace Text
* Use ` / ` to search using regex.

ex mode
Syntax
* ` [addr] s/regex/replacement/[flags] `
	- Search for text matching *regex* on lines specified by address *addr* and replace with *replacement*

##### Address Types

| Keys | Description |
| :---: | :--------- |
| `  m,n ` | lines from *m* to *n* |
| ` /regex/,n ` | from lines matching */regex/* to *n* |
| ` m,/regex/ ` | from line *m* to line matching */regex/* |
| ` % ` | all lines |


#### Flags

| Flag | Description |
| :---: | :--------- |
|  No Flag  | only first occurrence |
| ` c ` | prompt for confirmation |
| ` g ` | all occurrences | 


#### Enable-Disable Line Numbers

| Keys | Description |
| :---: | :--------- |
| ` :se nu ` ` :set nu ` | set line numbers |
| ` :se nonu ` ` :set nonu ` | unset line numbers |


### insert mode

It is the mode where you start typing text for editing file.
You can enter insert mode in multiple ways with different necessities.

*  ` i `
	- Start inserting text before the character under cursor.
* ` I `
	- Move cursor to the start of the current line.
* ` O `
	- Insert line above current line.
* ` o `
	- Append line below current line.
* ` a `
	- Start appending text after the character under cursor.
* ` A `
	- Move cursor to the end of current line

In insert mode you can enter keystrokes verbatim after using ` CTRL+V `.



<!-- dos files from windows have a character at the end which is carriage return (^M)-->





