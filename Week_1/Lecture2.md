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

```bash
username@hostname:~$ 
```

` ~ ` : Symbolic representation for home directory. This is working directory. Terminal opens this directory after launch. 

` @ `,  ` : `, and ` $ ` : command prompt decorators.

A command prompt can be empty.

## Simple Commands Overview

<table border=1>
  <tr>
  <th><code>Command</code></th>
  <th>Description</th>
  </tr>
  <tr id="pwd_b">
    <td><strong><code><a href="#pwd">pwd</code></strong></td>
    <td>Prints path of current/working directory.</td>
  </tr>
  <tr id="ls_b">
    <td><strong><code><a href="#ls">ls</a></code></strong></td>
    <td>Lists the files and directories.</td>
   </tr>
  <tr id="wildcards_b">
    <td><strong><code><a href="#wildcards">wildcards</code></strong></td>
    <td><code>?</code> matches single character. <code>*</code> matches 0 or more characters.</td>
   </tr>
  <tr id="cd_b">
    <td><strong><code><a href="#cd">cd</a></code></strong></td>
    <td>Change the working directory.</td>
   </tr>
  <tr id="man_b">
    <td><strong><code><a href="#man">man</a></code></strong></td>
    <td>See the mannual page for a command.</td>
   </tr>
  <tr id="uname_b">
    <td><strong><code><a href="#uname">uname</a></code></strong></td>
    <td>Print the operating system name.</td>
   </tr>
  <tr id="ps_b">
    <td><strong><code><a href="#ps">ps</a></code></strong></td>
    <td>The users currently running processes.</td>
   </tr>
  <tr>
    <td><strong><code>clear</code></strong></td>
    <td>Clears the screen for whole session.  Not possible to navigate the screen by scrolling.</td>
   </tr>
   <tr>
    <td><strong><code>ctrl + L</code></strong></td>
    <td></td>
   </tr>
   <tr>
    <td><strong><code>exit</code></strong></td>
    <td>Exit shell/shell script.</td>
   </tr>
  <tr>
    <td><strong><code>ctrl + D</code></strong></td>
    <td> Exit the shell/shell script/interactive command.</td>
   </tr>
  <tr>
    <td><strong><code></code></strong></td>
    <td></td>
   </tr>
</table>

### Syntax
` root@localhost:~$ command [[options] [arguments]] `
### Type of options
1. UNIX options, which may be grouped and must be preceded by a dash.
2. BSD options, which may be grouped and must not be used with a dash.
3. GNU long options, which are preceded by two dashes.

### ` pwd `
```bash
~$ pwd
```
```terminal
/home/groot
```

[back](#pwd_b)

### ` ls `
```bash
~$ ls
```
```terminal
Desktop  Documents 
```

####  Include hidden files while listing files. `.` is a prefix for hidden files.
```bash
~$ ls -a
```
```terminal
.            .cache         Documents                                                
..           .config        Desktop                                   
```

` . ` and ` .. ` are [special files](#filesystem-hierarchy-standard)

#### Lists the files and directories in [long listing format](#long-listing-format)
```bash
~$ ls -l
```
```terminal
drwxrwxr-x 5 groot groot 21 Dec 12 18:52 Desktop  
drwxrwxr-x 2 groot groot  3 Nov 19 19:41 Desktop
```
[back](#ls_b)

### Long Listing Format
In long listing format the output contains 9 columns with space as separator.
```terminal
drwxrwxrwx 5 groot groot 3488 Dec 15 10:57 Downloads 
```
* ` d ` : file type, ` d ` for directory. [More on file type]{#}
* ` rwxrwxrwx ` : Owner, group and other permissions.
* ` 5 ` : number of hard links.
* ` groot ` : Owner of the file.
* ` groot ` : Group of the owner.
* ` 3488 ` : Size of the file in Bytes. Denotes meta data size in case of  directory.
* ` Dec 15 10:57 ` : Last modified timestamp for file (consider as separate columns).
* ` Downloads ` : directory or file name.
* ( ` -> /storage/shared/Documents/ ` ) : Optional column for symbolic links.

[ back ](#simple-commands-overview)

### ` cd `
* Without any argument or ` ~ ` as argument this commands makes user's home directory as working directory.
```bash
~$ cd
~$ cd ~
~$ cd Desk*
~/Desktop$  
```
* `-` is used to navigate to previous working directory if `OLDPWD` environment variable is set.
```bash
~$ cd -
bash: cd: OLDPWD not set
```
```bash
~$ cd /
/$ cd -
~$ 
```

[back](#cd_b)

### ` man `
Syntax : ` man [option] command `
* To see the man page for ` ls `.
* Exit man page using `q`.
```terminal
~$ man ls 
```

* ` man ` takes numbers 1-9 as argument. These numbers denote [section](#man-page-sections). 
* To see the first section of ` ls ` command.
```terminal
~$ man 1 ls 
```

[back]($man_b)

### ` uname `
* Prints the operating system name.
```terminal
~$ uname
```

* Prints the system information.
```terminal
~$ uname -a
```

[back]($uname_b)

### ` ps `
* List the processes by current user.
* Output is unsorted by default.
* It displays 
	1. the process ID (pid=PID)
	2. the terminal associated with the process (tname=TTY)
	3. the cumulated CPU time in [DD-]hh:mm:ss format (time=TIME)
	4. the executable name (ucmd=CMD).  


| ` command ` | options | Description |
| :--------:  | :------:| ------------ | 
| ` ps `      |         | The user’s currently running processes |
| ` ps `      | ` -f `  | Full listing of the user’s currently running processes | 
| ` ps `      | ` -ef ` | Full listing of all processes, except kernel processes |
| ` ps `      | ` -A `  | All processes, including kernel processes | 
| ` ps `      | ` -Kf ` | Full listing of kernel processes |
| ` ps `      | ` auxw `| Wide listing sorted by percentage of CPU usage, %CPU |

[back](#ps_b)

### ` man ` page sections

| Section | Type of pages |
| ------- | ------------- |
| 1 | Executable programs of shell commands |
| 2 | System calls provided by kernel |
| 3 | Library calls | 
| 4 | Special files usually found in ` /dev ` |
| 5 | File formats and conventions |
| 6 | Games |
| 7 | Miscellaneous: macro packages, conventions |
| 8 | System administration commands |
| 9 | Kernel routines |

[back](#man)

## Filesystem Hierarchy Standard
> ` / ` is the root of the file system.
> ` / ` is also the delimiter for sub-directories.
> ` . ` is current directory.
> ` .. ` is parent directory.
> Path for traversal can be absolute or relative.

- **` / `** : Root directory
  * **` /root `**  : Superuser's home directory
  * **` /home `**  : User specific profiles home directory
    - **` /groot `** : groot's home directory
  * **` /boot `** : Static files of the boot loader
  * **` /dev `** : Device files (Every device is represented as file.)
  * **` /etc `** : Host specific system configuration.
  * **` /lib `** : Essential shared libraries and kernel modules
  * **` /media `** : Mount points for removable devices
  * **` /mnt `** : Mount points
  * **` /opt `** : Add on application software packages
  * **` /run `** : Data relevant to running processes
  * **` /sbin `** : Essential system binaries
  * **` /srv `** : Data for ftp/http services
  * **` /tmp `** : Temporary files
  * **` /usr `** : Secondary hierarchy
    - **` /bin `** : User commands
    - **` lib `** : Libraries
    - **` /local `** : Local hierarchy
    - **` /sbin `** : Non-vital system binaries
    - **` /share `** Architecture dependent data
    - **` /include `** Header files included by C programs
    - **` /src `** : Source code
  * **` /var `** : Variable data
    - **` /cache `** : Application cache data
    - **` /lib `** : Variable state information
    - **` /local `** : Variable data for /usr/local
    - **` /lock `** : Lock files
    - **` /log `** : Log files and directories
    - **` /run `** : Data relevant to running processes
    - **` /tmp `** : Temporary files preserved between reboots
    
[back](#ls)

|         | **sharable** | **unsharable** |
| :---:   | :---:        | :---:          |
| **static** | **` /usr `** **` /opt `** |  **` /etc `** **` /boot `** |
| **variable** | **` /var/mail `** |  **` /var/run `** **` /var/lock `** |
