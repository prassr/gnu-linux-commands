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
  <tr id="mkdir_b">
    <td><strong><code><a href="#mkdir">mkdir</a></code></strong></td>
    <td>Create directory or directories</td>
   </tr>  
  <tr id="chmod_b">
    <td><strong><code><a href="#chmod">chmod</a></code></strong></td>
    <td>Change permissions.</td>
  </tr>
 <tr id="touch_b">
    <td><strong><code><a href="#touch">touch</a></code></strong></td>
    <td>Create a file / modify timestamp.</td>
  </tr>
  <tr id="cp_b">
    <td><strong><code><a href="#cp">cp</a></code></strong></td>
    <td>Copy file(s)</td>
  </tr>
  <tr id="mv_b">
    <td><strong><code><a href="#mv">mv</a></code></strong></td>
    <td>Move file(s) / rename a file.</td>
  </tr>
  <tr id="rm_b">
    <td><strong><code><a href="#rm">rm</a></code></strong></td>
    <td>Remove a file.</td>
  </tr>
  <tr id="alias_b">
    <td><strong><code><a href="#alias">alias</a></code></strong></td>
    <td>Create alias for a command.</td>
  </tr>
  <tr id="whoami_b">
    <td><strong><code><a href="#whoami">whoami</a></code></strong></td>
    <td>Print current user name.</td>
  </tr>
  <tr id="less_b">
    <td><strong><code><a href="#less">less</a></code></strong></td>
    <td>View files page by page.</td>
  </tr>
  <tr id="date_b">
    <td><strong><code><a href="#date">date</a></code></strong></td>
    <td>Utility for date and time</td>
  </tr>
  <tr id="ncal-and-cal_b">
    <td><strong><a href="#ncal-and-cal"><code>ncal</code> and <code>cal</code></a></strong></td>
    <td>Utility for calendar</td>
  </tr>
  <tr id="free_b">
    <td><strong><code><a href="#free">free</a></code></strong></td>
    <td>Memory statistics.</td>
  </tr>
  <tr id="groups_b">
    <td><strong><code><a href="#groups">groups</a></code></strong></td>
    <td>Groups to which user belongs.</td>
  </tr>
  <tr id="file_b">
    <td><strong><code><a href="#file">file</a></code></strong></td>
    <td>What type of file it is?</td>
  </tr>
  <tr>
    <td><strong><code>clear</code></strong></td>
    <td>Clears the screen for whole session.  Not possible to navigate the screen by scrolling.</td>
   </tr>
   <tr>
    <td><strong><code>exit</code></strong></td>
    <td>Exit shell/shell script.</td>
   </tr>
</table>

### Syntax
` root@localhost:~$ command [[options] [arguments]] `

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
drwxrwxr-x 2 groot groot  3 Nov 19 19:41 Downloads
```

* Print the inode number. [More on inode](#hard-links)
* ` ls -i <name> `
```terminal
~$ ls -i ~
260 Desktop 
268 Documents
```

[back](#ls_b)

### Long Listing Format

- ` drwxrwxrwx 5 groot groot 3488 Dec 15 10:57 Downloads `
	* ` d ` : file type, ` d ` for directory. [More on file type](#file-types)
	* ` rwxrwxrwx ` : Owner, group and other permissions. [More](#file-permission-string)
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
* ` l ` : Symbolic [link](#type-of-links)
* ` c ` : Character file (e.g. terminal ` tty `)
* ` b ` : Block file (e.g. Hard Disk (` sda `))
* ` s ` : Socket file
* ` p ` : Named pipe

### File Permission String
* It is a 9 character string, starting after file type.
* Each character is switch to binary digit 0 or 1.
* Order : ` r ` - read (4), ` w ` - write (2), ` x ` - execute (1). Numbers in parenthesis are binary place values in decimal.
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

[ back ](#long-listing-format)

### ` cd `
` cd <dirname> `
* Without any argument or ` ~ ` as argument this command makes user's home directory as working directory.
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
	- ` man section command `
```terminal
~$ man 1 ls 
```

[back]($man_b)

### ` uname `
* Prints the operating system name.
```terminal
~$ uname
Linux
```

* Print the system information.
```terminal
~$ uname -a
Linux rich-linux 5.15.0-56-generic #62-Ubuntu SMP Tue Nov 22 19:54:14 UTC 2022 x86_64 x86_64 x86_64 GNU/Linux
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
	- With options, other important columns include.
	1. User id (UID)
	2. Parent process ID
	 
```terminal
~$ ps
    PID TTY          TIME CMD
   4172 pts/0    00:00:00 bash
   4567 pts/0    00:00:00 ps
```

| ` command ` | options | Description |
| :--------:  | :------:| ------------ | 
| ` ps `      |         | The user’s currently running processes |
| ` ps `      |  ` --forest ` | Pictorial view of which process launched which process |
| ` ps `      | ` -f `  | Full listing of the user’s currently running processes | 
| ` ps `      | ` -e `  | Listing of all processes, except kernel processes | 
| ` ps `      | ` -ef ` | Full listing of all processes, except kernel processes |
| ` ps `      | ` -A `  | All processes, including kernel processes | 
| ` ps `      | ` auxw `| Wide listing sorted by percentage of CPU usage, %CPU |

[back](#ps_b)

### ` mkdir `

* ` mkdir <dirname ...> ` : Create a directory/ directories.
```terminal
~$ mkdir level1 level2
```

[back](#mkdir_b)

### ` chmod `
* Change permissions of a file ( only owners of a file can change permissions. )
* ` chmod MODE <file-name> `
* MODE : [ugoa][+-=][perm]
* Multiple MODE can be separated by comma.
* Characters controlling which users' access to be changed 
	- ` u ` user, ` g ` group , ` o ` other and `a` all
* ` + ` : file mode bits are added to existing file mode bits.
* ` - ` : file mode bits are removed from existing file mode bits. If used as ` -[ugoa] `, removes all permissions for ` u `, ` g `, ` o ` or ` a `.
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

[back](#chmod_b)

### ` touch `
* Changes modified timestamp if the file exits.
* otherwise creates a new file.
* ` touch <filename> `
* Create file ` hello.py `
```terminal
~$ touch hello.py
```

[back](#touch_b)

### ` cp `
* Create a copy of a file
* ` cp <source> <destination> ` : Copy a source file to destination file.
* Make a copy of ` hello.py ` as ` greeting.py `.
```terminal
~$ cp hello.py greet.py
```

[back](#cp_b)

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

[back](#mv_b)

### ` rm `
* ` rm  <file> ` : Remove file or files.
* Remove ` greetings.txt `
```terminal
~$ rm greetings.txt
```
* ` rm -r <file>` : Delete a directory and it's contents recursively (` -r `).
* Delete directory ` 'level 1' `.
```terminal
~$ rm -r "level 1"
```
* ` rm -i <file>` : Ask before deletion. Interactive (` -i `). ((y/'') - yes, n - no)
```terminal
~$ rm -ir level2
rm: remove directory 'level2'? n
```

[back](#rm_b)

### ` alias `
* ` alias ` : List all ` alias`ed commands. [More on ` alias `](#/Week_2/Lecture1.md#more-on-alias)
* ` alias command="aliasing command" ` : Add an alias for ` command ` command.
* Add ` alias ` for ` rm -i ` as ` rm ` command. 
```terminal
~$ alias rm="rm -i"
```

[back](#alias_b)

### ` whoami `
* Prints name of the current user.
```
~$ whoami
groot
```

[back](#whoami_b)

### ` less `
* ` less <filename> ` : open file for reading.
* Possible to ` scroll ` ` up ` or ` down ` through pages.
* To read a log file do
```terminal
~$ less /var/log/alternatives.log
```

[back](#less_b)

### ` date `
* ` date [option]... [+FORMAT] ` : Current date and time.
* option ` -R ` : date and time RFC5322 standard format, used in email communications.
```terminal
~$ date
Saturday 17 December 2022 01:58:49 PM EET
~$ date -R
Sat, 17 Dec 2022 13:59:05 +0200
```

[back](#date_b)

### ` ncal ` and ` cal `
* ` ncal [month] [year] ` : Displays calendar of current month by default.
* Both belong to the same gnu utility ` ncal `, orientation is the only difference.
* ` month ` in long, short text (case-insensitive) or number (1-12, works only when year is specified.) format.
* ` year ` in `YY` or `YYYY` format.
* Display calendar for November, 2022
```terminal
~$ cal nov 2022
   November 2022      
Su Mo Tu We Th Fr Sa  
       1  2  3  4  5  
 6  7  8  9 10 11 12  
13 14 15 16 17 18 19  
20 21 22 23 24 25 26  
27 28 29 30 
```
* or
```terminal
~$ ncal nov 2022
    November 2022     
Su     6 13 20 27   
Mo     7 14 21 28   
Tu  1  8 15 22 29   
We  2  9 16 23 30   
Th  3 10 17 24      
Fr  4 11 18 25      
Sa  5 12 19 26
```

[back](#ncal-and-cal_b)

### ` free `
* ` free [option]` : Displays memory information (memory and swap).
* System utilizes swap memory when it runs out of memory (RAM).
* Swap memory is part of hard disk.
* option ` -h ` : human readable (typically Gi).
```terminal
~$ free -h
               total        used        free      shared  buff/cache   available
Mem:           1.9Gi       1.5Gi       101Mi       2.0Mi       279Mi       227Mi
Swap:          1.4Gi        50Mi       1.3Gi
```

[back](#free_b)

### ` groups `
* ` groups ` : Prints the group to which the current user belongs.
* Group with the name of current user is also created for privacy.
```terminal
~$ groups
groot sudo
```
[back](#groups_b)

### ` file `
* ` file <filename> ` : Prints the type of file.
* Checking file type of ` znew `
```terminal
~$ file /usr/bin/znew
/usr/bin/znew: POSIX shell script, ASCII text executable
```

[back](#file_b)

### [Hard Links](#/Week_2/Lecture_1.md#links, "More on links")
* inode number : An entry in the filesystem table about the location in the storage media.
* Hard Links : 
	- Files with same inode number. 
	- Regular file has 1 hard link
	- Second entry in long listing format
		* number of hard links present for that file. 

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
* ` / ` is the root of the file system.
* ` / ` is also the delimiter for sub-directories.
* ` . ` is current directory.
* ` .. ` is parent directory.
* Path for traversal can be absolute or relative.

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

   

