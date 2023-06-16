# Utilities in GNU/Linux

Tools to augment your productivity.

## ` find `

* locating files and processing them

```bash
find [pathnames] [conditions]
```

| condition | Description |
| :-------: | :------- |
RrR -name `   | *pattern* to match filenames |
| ` -type `   | File type code eg., ` c ` for character file, ` d ` for direcotry, ` l ` for symbolic link 
| ` -atime `  | File accessed ` +n ` (more than n), ` -n ` (less than n) days ago |
| ` -ctime `  | File changed ` +n ` (more than n), ` -n ` (less than n) days ago  |
| ` -regex `  | Regular expression for *pattern* of filenames. Combine with -regextype posix-basic, posix-egrep etc. |
| ` -exec `   | Command to run using ` { } ` as place holder for filename. |
| ` -print `  | Print the full path name of matching files |

Examples

* Print all the file paths in home directory.

```bash
find $HOME -print 
```

* Count the number of files in home directory.

```bash
find $HOME -print | wc -l
```

* List the file names in home directory that are modified in last two days.

```bash
find $HOME -mtime -2 -print
```

* List the file names in home directory that are modified more than a month ago in home directory.

```bash
find $HOME -mtime +30 -print
```

* List the man page direcotries in ` /usr ` directory.
    - ` ? ` matches one character after *man*

```bash
find /usr -type d -name 'man?' -print
```

* List the files which are more than 10 MB.

```bash
find . -size +10M -print
```

* Using ` -exec ` long list with ` -h ` option the files which are more than 10 MB.
    - ` {} ` is the placeholder for file names

```bash
find . -size +10M -exec ls -lsh {} \;
```

* List all the jpeg files along with it's size in human readable form.

```bash
find . -name '*.jpg' -exec ls -sh {} \;
```

## File Packaging

* Deep file hierarchies
* Large number of tiny files
* ` tar ` : collect a file hierarchy into a single file
* ` gzip ` : compress a file
* Applications : backup, file sharing, reduce disc utilization

### Possibilities

* ` tar `, ` zip `
* ` compress ` (ncompress), ` gzip ` (ncompress), ` bzip2 ` (bzip2), ` xz `(xz-utils), ` 7z ` (p7zip-full)
* Tarballs like bundle.tgz for package + compress
* Time and memory required to shrink / expand versus size ratio
* Portability
* Unique names using timestamp, process ID etc., for backup tarballs

## ` tar `

* packaging (archiving) collection of files.

```text
tar -[cvx] [-f ARCHIVE] [files]
```

Examples

* Getting all log files in a directory ` logfiles `

```bash
cp -r /var/log logfiles
```

* Storage space used by logfiles directory.

```bash
du -sh logfiles/
```

* Creating a bundle of all log files in directory ` logfiles `.

```bash
tar -cvf logfiles.tar logfiles/
```

* Extracting files from tarball

```bash
tar -xvf logfiles.tar logfiles/
```

## ` gzip `

* Compress or expand files
* Extension: **.gz**.

```text
gzip [OPTIONS] [file]
```

Examples

* Compressing ` logfiles.tar `

```bash
gzip logfiles.tar
```

* Decompressing the ` logfiles.tar.gz ` file

```bash
gunzip logfiles.tar
```

## ` bzip2 `

* Compress or expand files
* More efficient than ` gzip ` in terms of compression ratio.
* Extension: **.bz2**.

```text
bzip2 [OPTIONS] [file]
```

Examples

* Compressing ` logfiles.tar `

```bash
bzip2 logfiles.tar
```

* Decompressing the ` logfiles.tar.bz2 ` file

```bash
bzip2 -d logfiles.tar.bz2
```

## ` compress `

* Compress or expand files
* Less efficient than both ` gzip ` and ` gzip2 ` in terms of compression ratio.
* Extension: **.Z**.

```text
compress [OPTIONS] [file]
```

Examples

* Compressing ` logfiles.tar `

```bash
compress logfiles.tar
```

* Decompressing the ` logfiles.tar.Z ` file

```bash
uncompress logfiles.tar.Z
```

## ` make `

Used to

* compile source code
* Conditional actions
* Conditional running of the scripts.
* Maintainance activity.
* Only performs action when the target files have changed.

```bash
make -f make.file # make.file is make script file.
```

* See [make.file](files/make.file)

Examples

* Running a section of the make file
  - The command below runs the ` backup ` section from the file ` make.file `.
```bash
make -f make.file backup 
```

