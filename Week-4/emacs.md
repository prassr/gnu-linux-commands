# The GNU emacs text editor

Documentation: https://www.gnu.org/software/emacs/refcards/pdf/refcard.pdf

#### Opening emacs

* GUI

	```bash
	emacs <filename>
	```
		
* Terminal

	```bash
	emacs -nw <filename>
	```

Shortcuts
* ` C- ` : Control key
* ` M- ` : Alt key

### Moving Around

| Keys | Description |
| :---: | :--------- |
| ` C-p ` | Move up one line |
| ` C-b ` | Move left one char |
| ` C-f ` | Move right one char |
| ` C-n ` | Move down one line |
| ` C-a ` | Goto beginning of current line |
| ` C-e ` | Goto end of current line |
| ` C-v ` | Move forward one screen |
| ` M-< ` | Move to first line of the file |
| ` M-b ` | Move left to previous word |
| ` M-f ` | Move right to next word |
| ` M-> ` | Move to last line of the file |
| ` M-a ` | Move to beginning of current sentence |
| ` M-e ` | Move to end of current sentence |
| ` M-v ` | Move back one screen |

### Exiting emacs

| Keys | Description |
| :---: | :--------- |
| ` C-x C-s ` | Save buffer to file |
| ` C-z ` | Exit emacs but keep it running |
| ` C-x C-c ` | Exit emacs and stop it |

### Searching Text

| Keys | Description |
| :---: | :--------- |
| ` C-s ` | Search forward |
| ` C-r ` | Search backward |
| ` M-x ` | Replace string |  


### Copy-Paste

| Keys | Description |
| :---: | :--------- |
| ` M-backspace ` | Cut the word before cursor |
| ` M-d ` | Cut the word after cursor |
| ` C-k ` | Cut from cursor to end of line |
| ` M-k ` | Cut from cursor to end of sentence |
| ` C-y ` | Paste the content at the cursor |
