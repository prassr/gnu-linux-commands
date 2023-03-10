# The GNU nano text editor

* In Ubuntu 20.04 or 22.04 the pico editor is symbolic link for nano editor.
* This can be checked with [` readlink `](/Week-4/Lecture3.md#readlink) command.
* nano is a simple editor just like notepad.
* The file opened is directly available for editing unlike [vim](/Week-4/vim.md).

## Keystrokes in nano

Shortcuts used for keys:

* Ctrl key is denoted by ` ^ `. It can also be entered using Esc key twice.
* Meta or Alt or Cmd key is denoted by ` M- ` 

Definitions:

* Buffer : file opened for editing
* macro : a set of actions
* anchor : a jump point
* soft wrapping : break word while wrapping
* hard wrapping : do not break word while wrapping
* linter : a program which checks programmatic errors (e.g. syntactic errors).

### File Handling 

| Keys | Description |
| :---: | :--------- |
| ` ^S ` | Save current file |
| ` ^O ` ` F3 ` | Offer to write file ("Save as") to disk |
| ` ^R ` ` Ins `| Insert a file into current one |
| ` ^X ` ` F2 `| Close buffer, exit from nano |


### Editing

| Keys | Description |
| :---: | :--------- |
| ` ^K ` ` F9 ` | Cut current line and save in cutbuffer |
| ` M-6 ` ` M-^ ` | Copy current line and save in cutbuffer |
| ` ^U ` ` F10 `| Paste contents of cutbuffer |
| ` M-T ` | Cut until end of buffer |
| ` ^] ` | Complete current word | 
| ` M-U ` | Undo last action |
| ` M-E ` | Redo last undone action |
| ` ^J ` ` F4 ` | Justify the current paragraph |
| ` M-J ` | Justify the entire file |
| ` M-: ` | Start/stop recording a macro |
| ` M-; ` | Run the last recorded macro |
| ` F12 ` | Invoke the spell checker, if available |
<!-- | ` M-3 ` | Comment/uncomment line/region | -->


### Search and Replace

| Keys | Description |
| :---: | :--------- |
| ` ^Q ` | Start backward search for string |
| ` ^W ` | Start forward search |
| ` M-Q ` | Find next occurrence backward |
| ` M-W ` | Find next occurrence forward |
| ` M-R ` ` ^\ ` | Start a replacing session |
| ` M-C ` | Case sensitive when in ` M-R ` |	


### Deletion

| Keys | Description |
| :---: | :--------- |
| ` ^H ` ` Bsp `| Delete character before cursor |
| ` ^D ` ` Del ` | Delete character under cursor |
| ` M-Bsp ` ` Sh-^Del ` | Delete word to the left |
| ` ^Del ` | Delete word to the right |
| ` M-Del ` | Delete current line |

### Information

| Keys | Description |
| :---: | :--------- |
| ` ^C ` ` F11 `| Report cursor position |
| ` M-D ` | Report line/word/character count |
| ` ^G ` | Display help text |
| ` M-C ` | Enable/disable constant cursor position display |


### Moving Around

| Keys | Description |
| :---: | :--------- |
| ` ^B ` ` ◂ ` | One character backward |
| ` ^F ` ` ▸ ` | One character forward |
| ` ^◂ ` ` M-Space ` | One word backward |
| ` ^▸ ` ` ^Space` | One word forward |
| ` ^A ` ` Home ` | To start of line |
| ` ^E ` ` End `| To end of line |
| ` ^P ` ` ▴ `| Go to previous line |
| ` ^N ` ` ▾ ` | Go to next line |
| ` ^▴ ` ` M-7 `| To previous block |
| ` ^▾ `  | To next block |
| ` M-( ` | Go to beginning of paragraph; then of previous paragraph |
| ` M-) ` | Go just beyond end of paragraph; then of next paragraph | 
| ` ^Y ` ` PgUp `| One page up |
| ` ^V ` ` PgDn `| One page down |
| ` M-\ ` ` ^Home ` | To top of buffer |
| ` M-/ ` ` ^End ` | To end of buffer |


### Special Movement

| Keys | Description |
| :---: | :--------- |
| ` M-G ` ` M-^- ` ` ^7 ` ` ^/ ` | Go to specified line and column number |
| ` M-] ` | Go to complementary bracket |
| ` M-▴ ` ` M-- ` | Scroll viewport up |
| ` M-▾ ` ` M-+ `| Scroll viewport down |
| ` M-PgUp ` |  Jump backward to the nearest anchor |
| ` M-PgDn ` | Jump forward to the nearest anchor |
| ` M-< ` ` M-◂ ` | Switch to preceding buffer |
| ` M-> ` ` M-▸ ` | Switch to succeeding buffer |

### Various

| Keys | Description |
| :---: | :--------- |
| ` M-Z ` | Hidden interface enable/disable |
| ` ^T ` | Execute a function of external command |
| ` M-B ` | Invoke the linter, if available |
| ` M-F ` | Invoke a program, if available to format/arrange/manipulate the buffer |
| ` M-A ` ` ^6 ` | Turn the mark on or off |
| ` Tab ` ` ^I ` ` M-} `| Indent current line or  marked region |
| ` Sh-Tab ` ` M-{ ` | Unindent current line or  marked region |
| ` ^M ` ` Enter `  | Insert a newline at the cursor position |
| ` M-Ins ` | Place or remove an anchor at the current line |
| ` M-V ` | Enter next keystroke verbatim |
| ` M-S ` | Soft wrapping of overlong lines enable/disable |
| ` M-L ` | Hard wrapping of overlong lines enable/disable |
| ` M-N ` ` M-# ` | Turn line numbers on/off |
| ` M-P ` | Turn visible whitespace on/off |
| ` M-X ` | Hide or unhide the help lines |
| ` M-Y ` | Color syntax highlighting enable/disable |
| ` M-H ` | Smart home key enable/disable | <!-- what is smart home key -->
| ` M-I `  | Auto indent enable/disable |
| ` M-K ` | Cut to end enable/disable |
| ` M-O ` | Conversion of typed tabs to spaces enable/disable |
| ` ^L ` | Refresh the screen |
| ` M-M ` | Mouse support enable/disable |
<!-- ^L               Center the line where the cursor is -->
