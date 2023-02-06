# Simple Commands 2.0

The root folder ` / ` is the parent of it's own.
```terminal
/$ cd ..
/$
```
* Multiple uses of ` / ` is as good as one.
```terminal
~$ cd ///usr///bin
/usr/bin$
```

### More on ` ls `

* Interpretation of directory as an argument
	- ` ls -l level1 ` will long list all the files of directory ` level1 `.
```
~$ ls -l level1
total 2
-rw-rw-r-- 1 sanr sanr 0 Dec 18 17:06 f1
-rw-rw-r-- 1 sanr sanr 0 Dec 18 17:06 f2
```

* Multiple options
	- ` ls -ld level1 ` will long list the directory itself (not it's content).
	- ` ls -ldi level1 ` will long list the directory itself along with inode number (not it's content).
```terminal
~$ ls -ld level1
drwxrwxr-x 2 sanr sanr 4 Dec 18 17:06 level1
~$ ls -ldi level1
79564 drwxrwxr-x 2 sanr sanr 4 Dec 18 17:06 level1
```

* Recursive listing
	- ` ls -R `
```
~$ ls -R level1
level1:
f1  f2
```
* Order of options for `ls` is immarterial.
	- But the standard practice is ` command options... argument... `
```terminal
~$ ls -ld level1 -i
79564 drwxrwxr-x 2 sanr sanr 4 Dec 18 17:06 level1
~$ ls -li level1 -d
79564 drwxrwxr-x 2 sanr sanr 4 Dec 18 17:06 level1
~$ ls -di level1 -l
79564 drwxrwxr-x 2 sanr sanr 4 Dec 18 17:06 level1
~$ ls level1 -ldi
79564 drwxrwxr-x 2 sanr sanr 4 Dec 18 17:06 level1
```

* Short and long forms of [options](#type-of-options "Types of Options")               
	- ` ls -a ` and ` ls --all ` are equivalent.
	- Not all options have long form, eg. ` -l ` for ` ls `
```
~$ ls -l --directory --inode level1
79564 drwxrwxr-x 2 sanr sanr 4 Dec 18 17:06 level1
```

# Utilities for Knowing Files Better

### [` less `](/Week_1/Lecture2-3.md#less)

### ` cat `
* ` cat <filename> ` : Dumps the file output on screen for reading.
* Abbr. for concatenate.
* Navigation is difficult.
* To see the ` profile ` file content
```terminal
/etc$ cat profile
```

### ` more `
* ` more <filename> ` : Open file filename for reading page by page.
* It beautifully combines the features of [` less `](#less) and [` cat `](#cat).
* Can not scroll ` down ` to see content.
* Shows percentage of file read.
* To view the ` profile ` file content
```terminal
/etc$ more profile
```

### ` head `
* ` head <filename> ` : Print the first 10 lines of the file.
* Can also specify number of lines using ` -n ` option.
* To print first 5 lines.
```terminal
/etc$ head -n 5 profile
```

### ` tail `
* ` tail <filename> ` : Print the last 10 lines of the file.
* Can also specify number of lines using ` -n ` option.
* To print last 5 lines.
```terminal
/etc$ head -n 5 profile
```

### ` wc `
* ` wc <filename> ` - Print number of newline, word and byte for each file
* To print newline (` -l `), word (` w `) an byte (` -c `) count of ` profile `
```terminal
/etc$ wc profile
 27  97 582 profile
```
* To print newline (` -l `) count of ` profile `
```terminal
/etc$ wc -l profile
 27 profile
```
---------------

# Knowing More Commands

### [` man `](/Week_1/Lecture2-3.md#man)

### ` which `
* ` which  <command> ` - Print the path of ` command ` or check if a package exists or not.
* To print path of commands ` less ` and ` more ` 
```terminal
/etc$ which less
/usr/bin/less
/etc$ which more
/usr/bin/more
```
* Actually the size of ` less ` is ` more `
```terminal
/etc$ ls -l /usr/bin/less
-rwxr-xr-x 1 root root 199048 Mar 24  2022 /usr/bin/less
/etc$ ls -l /usr/bin/more
-rwxr-xr-x 1 root root 43392 Feb 21  2022 /usr/bin/more
```

* To print the path of command ` which `!
```terminal
/etc$ which which
/usr/bin/which
```
* ` which ` is kind of reflexive!

### ` whatis `
* ` whatis <command> ` - Print brief description of ` command ` as the first line in ` man ` page
* To print the description of ` which `
```terminal
/etc$ whatis which
which (1)            - locate a command
```

### ` apropos `
* ` apropos <command | word> ` - Search the manual page names and descriptions.
```
~$ apropos who
w (1)                - Show who is logged on and what they are doing.
who (1)              - show who is logged on
whoami (1)           - print effective userid
```
* ` apropos ` is equivalent to ` man -k ` i.e ` man -k who ` will give the same result above as given by ` apropos who `
* As shown below, ` apropos ` is the symbolic link for ` whatis `, but why the outputs are different?
```terminal
~$ ls -l /usr/bin/apropos
lrwxrwxrwx 1 root root 6 Nov  3 19:18 /usr/bin/apropos -> whatis
~$ ls -l /usr/bin/whatis
-rwxr-xr-x 1 root root 48416 Mar 17  2022 /usr/bin/whatis
```
* In GNU-Linux, every executable will know by which name it is invoked which results in different behaviour.

### ` help `
* Print the help for currently running shell. [More on shell](#Shells)
* It includes keywords, syntax for commands, loops and symbolic expressions.  

### ` info `
* ` info ` - Prints documentation for commands.
* ` info <command> ` - Documentation of specific command ` command `.
* It is highly navigatable, just like a webpage.
* Links are marked in * and underline and can be navigated using arrow keys.

| ` keys ` | Description |
| :---:    | ---         |
| ` enter ` | Open a link |
| ` < ` ` shift + , ` | Go back or previous |
| ` > ` | Go forward or next | 
| ` M ` ` m ` | Search menu, similar to seach box |
| ` S ` ` s ` | Regex search |
| ` Q ` `q`| Quit |

### ` type `
* ` type <command> ` - Prints the type of the command.
* Is it
	- offered by shell?
	- offered by operating system?
	- alias?
* To print the type of commands ` type ` and ` ls `
```terminal
~$ type type
type is a shell builtin
~$ type ls
ls is aliased to `ls --color=auto'
```
* Note : commands displayed by ` help ` are all shell builtins. 

### More on [` alias `](/Week_1/Lecture2-3.md#alias)
* To create alias for ` ls -l `
```terminal
~$ alias ll="ls -l"
~$ ll
drwxrwxr-x 5 groot groot 21 Dec 12 18:52 Desktop  
drwxrwxr-x 2 groot groot  3 Nov 19 19:41 Downloads
~$ type ll
ll is aliased to `ls -l'
```

### ` unalias `
* ` unalias <alias_command> ` - Remove the alias command.
* To remove alias ` ll `
```terminal
~$ unalias ll
~$ ll
ll: command not found
```

### ` rmdir `
* ` rmdir <dirname> ` - Remove an empty directory.
* To remove empty directory ` level2 `
```terminal
~$ rmdir level2
```

## Multiple Arguments
* Let's create some files using ` touch ` and multiple arguments and a directory using ` mkdir `.
```terminal
~$ touch file1 file2 file3
~$ mkdir mydir
```
### Second argument
* First argument is a file and second argument is directory.
* ` file1 ` is copied to ` mydir ` 
```terminal
~$ cp file1 mydir
```
* Both arguments are files.
* ` file2 ` is overridden by contents of ` file2 `
```terminal
~$ cp file1 file2
```
* Note
	- Here the alias is not set for ` cp `, hence the command is not interactive.
	- See the [` man `](/Week_1/Lecture2-3.md#man "Explore man") command to figure out interactive option for ` cp `. 

* ` rmdir ` is not meant to handle non empty directories.
```
~$ rmdir mydir
rmdir: failed to remove 'mydir': Directory not empty
```
* We can use ` rm ` and ` rmdir ` and delete directory by explicitly navigating into them.
* But, can we do something better? as this process might be cumbersome.
* To force the deletion ` rm ` has one option ` -r `
```terminal
~$ rm -r mydir
```
* As you can see the file deletion happens without any noise.
* Note 
	- Interactive mode is not set here.
	- Now you know what to do to enable it.


### Interpretation of last argument

### Recursion assumed for ` mv ` and not ` cp `
* Some commands assume recursion while some don't.
* Let's setup our directory structure.
```terminal 
~$ mkdir mydir
~$ cp file1 mydir
```
* Let's check for ` cp `
```terminal 
~$ cp mydir mydir2
cp: -r not specified; omitting directory 'mydir'
~$ cp -r mydir mydir2
```
* Note that most commands tell you what to do.
* To take home, recursion is not assumed for ` cp `.

* Let's check for ` mv `
```terminal
~$ mv mydir mydir3
```
* As you can see no error is generated.
* That means ` mydir ` is successfully renamed as ` mydir3 `

# Links
## ` ln `
* ` ln [-s] <source> <linkname> ` : Create link for ` source ` as ` linkname `

### Symbolic Links
* Inode number of source file and linkname are different.
* ` l `, the first character in long format of file denotes the file is symbolic link.
* ` -s ` option is used to create symbolic link.
* To create a symbolic link (same as shortcut in Windows) for ` file1 ` as ` file0 `
```terminal
~$ ln -s file1 file0
```
* Long list the ` file0 ` to see the output.
```terminal
~$ ls -l file0
lrwxrwxrwx 1 sanr sanr 5 Dec 19 08:28 file0 -> file1
```
* Print the inode numbers of ` file1 ` and ` file0 `
```
~$ ls -i file1 file0
66488 file0  80500 file1
```

### Hard Links
* ` ln <source> <linkname> ` - Create hard link
* We have already come across this in [Week 1](/Week_1/Lecture2-3.md#hard-links).
* Let's take an example.
* To create a hard link for ` file1 ` as ` file11 `
```terminal
~$ ln file1 file11
```
* See the long listing along with inode numbers.
``` terminal
~$ ls -li file1 file11
80500 -rw-rw-r-- 2 sanr sanr 0 Dec 18 20:20 file1
80500 -rw-rw-r-- 2 sanr sanr 0 Dec 18 20:20 file11
```
* As you can see here, number of hard links are two for ` file1 ` and ` file2 ` as both are same which contrasts with symbolic link.
* As long as number of hard links for a *file* > 1 you can delete any file which points to the same hard link as *file*.
* X-device/X-cross storage hard links are forbidden.
* It is typically forbidden to create hard link for a directory.

# File Sizes
## ` ls -s `
* ` ls -s <file> ` - Print the size of ` file `.
* Combine with ` -h ` to print in human readable format.

## ` stat `
* ` stat <file> ` - Shows statistics (file or file system status) on ` file `.
* Typical output of ` stat ` for file ` znew `.
```terminal
/usr/bin$ stat znew
  File: znew
  Size: 4577      	Blocks: 10         IO Block: 4608   regular file
Device: 1bh/27d	Inode: 225090      Links: 1
Access: (0755/-rwxr-xr-x)  Uid: (    0/    root)   Gid: (    0/    root)
Access: 2022-12-18 15:12:06.475640237 +0200
Modify: 2022-09-05 15:33:59.000000000 +0200
Change: 2022-11-03 19:51:25.078671510 +0200
 Birth: 2022-11-03 19:51:25.014673255 +0200
```
* You can get the atomic output using ` -c ` option using ` FORMAT `.
* For example, get textual and octal permissions on file ` znew `
```
/usr/bin$ stat  -c "%a %A" znew
755 -rwxr-xr-x
```
* To know more visit the ` man ` pages.

## ` du `
* ` du <file> ` - Estimate file space usage.
* To see the disk usage of ` znew ` file.
```terminal
/usr/bin$ du znew
5       znew
/usr/bin$ du -h znew
5.0K    znew
```

* Try to figure out the difference between output by ` stat ` and ` du `. 

## Roll of block size

## ` df `
* ` df [-h]` - shows filesystem information in format [human readable] below.
> Filesystem   1K-blocks    Used Available Use% Mounted on

# In-memory Filesystems
* These are special read-only filesytems, available in memory and not on hard disk.
* You can view these filesystems.
* These are directory structures to know more about the system.

## ` /proc `
* Older filesystem, but still useful.
* Used to store different processes.
* These file are just representaions, so file sizes it contains are zero.
* Useful files
	- ` cpuinfo ` - stores cpu information.
	- ` version ` - stores system information, content similar to [`uname`](/Week_1/Lecture2-3.md#uname) -a ` command.
	- ` meminfo ` - Diagnostic information about memory. Check [` free `](/Week_1/Lecture2-3.md#free) command.
	- ` partitions ` - Disk partition information. Check [` df `](#df)  
	- ` kcore ` - The astronomical size ( 2 ^ 47 bits)  tells the maximum virtual memory (47 bits) the current Linux OS is going to handle.
* Directories named by ` number `
	- Each of these correspond to running processes. 
	- The ` number ` corresponds to the process id. 

## ` /sys `
* In use since Kernel 2.6+.
* It's a well organized filesystem.
* Explore usb devices used in the machine.
```
/sys/bus/usb/devices$ ls
1-0:1.0  2-0:1.0  2-1  2-1:1.0  2-2  2-2:1.0  usb1  usb2
```
* Each number corresponds to a device.
* Let's check the ` product ` and ` manufactures ` of the usb device ` 2-1 `
```terminal
/sys/bus/usb/devices/2-1$ cat product
VMware Virtual USB Mouse
/sys/bus/usb/devices/2-1$ cat manufacturer
```
* The VMWare is using its virtual USB mouse to connect the host machine mouse (touch pad) to the guest machine.
* Thus, these two commands help us to explore hardware attached to the machine.


### Type of Options
1. UNIX options, which may be grouped and must be preceded by a dash.
2. BSD options, which may be grouped and must not be used with a dash.
3. GNU long options, which are preceded by two dashes.
