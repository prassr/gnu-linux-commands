# Utilities in GNU/Linux

Tools to augment your productivity.

## ` find `

* locating files and processing them

```bash
find [pathnames] [conditions]
```

| condition | Description |
| :-------: | :------- |
| ` -name `   | *pattern* to match filenames |
| ` -type `   | File type code eg., ` c ` for character file, ` d ` for direcotry, ` l ` for symbolic link 
| ` -atime `  | File accessed ` +n ` (more than n), ` -n ` (less than n) days ago |
| ` -ctime `  | File changed ` +n ` (more than n), ` -n ` (less than n) days ago  |
| ` -regex `  | Regular expression for *pattern* of filenames. Combine with -regextype posix-basic, posix-egrep etc. |
| ` -exec `   | Command to run using ` { } ` as place holder for filename. |
| ` -print `  | Print the full path name of matching files |


* `tar`

packaging collections of files.

* `make`

conditional actions

 