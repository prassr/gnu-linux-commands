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
    <td><strong><code>exit</code></strong></td>
    <td>Exit shell/shell script.</td>
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
```terminal
~$ pwd
/home/groot
```

[back](#pwd_b)

### ` ls `
```terminal
~$ ls
Desktop  Documents 
```

* Include hidden files while listing files. `.` is a prefix for hidden files.
* ` ls -a <name> `
```terminal
~$ ls -a
.            .cache         Documents                                   
..           .config        Desktop                                   
```

` . ` and ` .. ` are [special files](#filesystem-hierarchy-standard)

* Lists the files and directories in [long listing format](#long-listing-format)
* ` ls -l <name> `
```terminal
~$ ls -l
drwxrwxr-x 5 groot groot 21 Dec 12 18:52 Desktop  
drwxrwxr-x 2 groot groot  3 Nov 19 19:41 Desktop
```

* Print the inode number. [More on inode](#hard-links-and-soft-links)
* ` ls -i <name> `
```terminal
~$ ls -i ~
```

[back](#ls_b)

### Long Listing Format
```terminal
drwxrwxrwx 5 groot groot 3488 Dec 15 10:57 Downloads 
```
* ` d ` : file type, ` d ` for directory. [More on file type](#file-types)
* ` rwxrwxrwx ` : Owner, group and other permissions.
* ` 5 ` : number of hard links.
* ` groot ` : Owner of the file.
* ` groot ` : Group of the owner.
* ` 3488 ` : Size of the file in Bytes.
* ` Dec 15 10:57 ` : Last modified timestamp for file (considered here as separate columns).
* ` Downloads ` : file name.
* ( ` -> /storage/shared/Documents/ ` ) : Optional column for symbolic links.

### File Types
* ` - ` : Regular file
* ` d ` : Directory / Folder
* ` l ` : Symbolic [link](#types-of-links)
* ` c ` : Character file (e.g. terminal ` tty `)
* ` b ` : Block file (e.g. Hard Disk (` sda `))
* ` s ` : Socket file
* ` p ` : Named pipe

### File Permission String
* It is a 9 character string, starting after file type.
* Each character is switch to binary digit 0 or 1.
* Order : ` r ` - read (4), ` w ` - write (2), ` x ` - execute (1). Numbers are bit values in parentheses.
* Sum of bit values gives octal representations for permissions specific to user, group or other.
* ` w ` : Permission required to create, modify or delete a file within a directory.
* ` x ` : When set on directories, a user can search or change to them. 
* ` - ` : off
* ` ? ` : unknown
* e.g. ` rwxrwx--- ` or `770`
	- Owner permissions, character [1-3] (7)
	- Group permissions, character [4-6] (7)
	- Other permissions, character [7-9] (0)
	
| characters | octal |
| :---: | :---: |
| ` --- ` | 0 | 
| ` --x ` | 1 | 
| ` r-- ` | 4 | 
| ` r-x ` | 5 |
| ` rw- ` | 6 |
| ` rwx ` | 7 |

[ back ](#simple-commands-overview)

### ` cd `
` cd <dirname> `
* Without any argument or ` ~ ` as argument this commands makes user's home directory as working directory.
```terminal
~$ cd
~$ cd ~
~$ cd Desk*
~/Desktop$  
```
* `-` is used to navigate to previous working directory if `OLDPWD` environment variable is set.
```terminal
~$ cd -
bash: cd: OLDPWD not set
~$ cd /
/$ cd -
~$ 
```

[back](#cd_b)

### ` man `
* See man pages. Exit man page using `q`.
* ` man [option] command `
* To see the man page for ` ls `.
```terminal
~$ man ls 
```

* ` man ` takes numbers 1-9 as argument. These numbers denote [section](#man-page-sections). 
* To see the first section of ` ls ` command.
	` man section command `
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

### ` mkdir `

* ` mkdir <dirname ...> ` : Create a directory/ directories.
```terminal
~$ mkdir level1 level2
```

### ` chmod `
* Change permissions of a file ( only owners of a file can change permissions. )
* ` chmod MODE <file-name> `
* MODE : [ugoa][+-=][perm]
* Multiple MODE can be separated by comma.
* Characters controlling which users' access to be changed 
	- ` u ` user, ` g ` group , ` o ` other and `a` all
* ` + ` : file mode bits are added to existing file mode bits.
* ` - ` : file mode bits are removed from existing file mode bits. If used as ` -[ugoa] `, removes all permissions for `u`, 'g', `o` or `a`.
* ` = ` : only specified file mode bits are kept, all other bits are removed.
* Add ` rw ` permissions on file `hello.txt` for all. 
```terminal
~$ chmod a+rw hello.txt
```
* Remove ` w ` permission on file ` hello.txt ` for users within group and other users.
```terminal
~$ chmod go-w hello.txt
```
* Remove all permissions on file ` hello.txt ` for others.
```terminal
~$ chmod -o hello.txt
```

### ` touch `
* Changes modified timestamp if the file exits.
* otherwise creates a new file.
* ` touch <filename> `
* Create file ` hello.py `
```terminal
~$ touch hello.py
```

### ` cp `
* Create a copy of a file
* ` cp <source> <destination> ` : Copy a source file to destination file.
* Make a copy of ` hello.py ` as ` greeting.py `.
```terminal
~$ cp hello.py greet.py
```

### ` mv `
* Rename or move a file.
* ` mv <source> <destination> ` : Move a file from source to destination. 
* ` mv <old name> <new name> ` : Rename a file
* Moving file ` hello.py ` to directory ` level1 `.
```terminal
~$ mv hello.py level1
```
* Rename ` greet.py ` as ` greetings.py `
```terminal
~$ mv greet.py greetings.txt
```
* ` "file name" ` Using space in file name.
```terminal
~$ mv level1 "level 1"
```
* To refer to ` 'level 1' ` use quotes around it.

### ` rm `
* ` rm  <file> ` : Remove file or files.
* Remove ` greetings.txt `
```terminal
~$ rm greetings.txt
```
* ` rm -r <file>` : Delete a directory and it's contents recursively (` -r `).
* Delete directory ` 'level 1' `.
```terminal
~$ ` rm -r "level 1"`
```
* ` rm -i <file>` : Ask before deletion. Interactive (` -i `). ((y/'') - yes, n - no)
```terminal
~$ ` rm -ir level2 `
rm: remove directory 'level2'? n
```

### ` alias `
* ` alias ` : List all ` alias`ed commands.
* ` alias command="aliasing command" ` : Add an alias for ` command ` command.
* Add ` alias ` for ` rm -i ` as ` rm ` command. 
```terminal
~$ alias rm="rm -i"
```

### Hard Links and Soft Links
* inode number : An entry in the filesystem table about the location in the storage media.
* Hard Links : 
	- Files with same inode number. 
	- Regular file has 1 hard link
	- Second entry in long listing format
		* number of hard links present for that file. 

### ` whoami `
* Prints name of the current user.

### ` less `
* ` less filename ` : open file for reading.
* Possible to ` scroll ` ` up ` or ` down ` through pages.
* To read a log file do
```terminal
~$ less /var/log/alternatives.log
```

### ` file `
* ` file <filename> ` : Prints the type of file.
* Checking file type of ` znew `
```terminal
~$ file /usr/bin/znew
```

### ` man ` page sections

| Section | Type of pages |
| :-------: | ------------- |
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
    - **` /home/groot `** : groot's home directory
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
    - **` /usr/bin `** : User commands
    - **` /usr/lib `** : Libraries
    - **` /usr/local `** : Local hierarchy
    - **` /usr/sbin `** : Non-vital system binaries
    - **` /usr/share `** Architecture dependent data
    - **` /usr/include `** Header files included by C programs
    - **` /usr/src `** : Source code
  * **` /var `** : Variable data
    - **` /var/cache `** : Application cache data
    - **` /var/lib `** : Variable state information
    - **` /var/local `** : Variable data for /usr/local
    - **` /var/lock `** : Lock files
    - **` /var/log `** : Log files and directories
    - **` /var/run `** : Data relevant to running processes
    - **` /var/tmp `** : Temporary files preserved between reboots
    
[back](#ls)

|         | **sharable** | **unsharable** |
| :---:   | :---:        | :---:          |
| **static** | **` /usr `** **` /opt `** |  **` /etc `** **` /boot `** |
| **variable** | **` /var/mail `** |  **` /var/run `** **` /var/lock `** |

### Important Keyboard Keys

| ` keys ` | Description |
| :---:    | ---         |
| ` ctrl + L ` | Clear screen. Possible to scroll up to view previous commands. |
| ` ctrl + D ` |  Exit the shell/shell script/interactive command. | 
| ` tab ` | Autocomplete the file names if unique, else show multiple possibilities. |
| ` q ` | quit man page, pages opened by commands like ` less ` |

   

