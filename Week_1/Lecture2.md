# Command line environment

## Terminal emulators

- GNOME Terminal - Default terminal for GNOME
- Terminal - Default terminal for macOS
- GNU Screen - Terminal multiplexer
- guake - Drop down terminal for GNOME
- konsole - Default terminal for KDE
- xfce4-terminal - Default terminal for Xfce
- xterm - Standard terminal for X11
- Termux - Terminal emulator for Android

## Command Prompt

```terminal
username@hostname:~$
```

` ~ ` : Symbolic representation for home directory. This is present working directory.

` @ `,  ` : `, and ` $ ` : command prompt decorators.

A command prompt can be empty.

## Clearing terminal
- ` clear `
    * Clears the whole screen
    * Not possible to navigate by scrolling.
- ` ctrl + L ` or ` ctrl + l `
    * Clears the whole screen.
    * Possible to navigate using scrolling.

## Simple Commands
### Syntax
` command` `[[options] [arguments]] `
| ` command ` | `[[options] [arguments]] ` | Description |
| ----------- | ----------- | ---------- |
| ` pwd `     |             | prints path of current/working directory. |
| ` ls `      |             | lists the files and directories. |
|             | ` -a `      | include hidden files while listing files. `.` is a prefix for hidden files. |
|             | ` -l `      | lists the files and directories in long listing format. |
| ` man `     | ` command ` | see the mannual page for command ` command ` | 
| ` uname `   |             | print the operating system. |
|             | ` -a `      | print the system information in a sentence.
|||| 
