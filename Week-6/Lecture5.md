# ` sed ` 

* A language for processing text streams.

## Introduction

* It is a programming language
* ` sed ` is an abbreviation for `s`tream `ed`itor
* It is a part of POSIX
* sed precedes awk

## Execution model

* Input stream is a set of lines
* Each line is sequence of characters
* Two data buffers are maintained: active *pattern* space and auxiliary *hold* space
* Matched patterns are found in the *hold* space if parenthesis is used and the *pattern* space will contain the line that is read.
* For each line of input, an **execution cycle** is performed loading the line into *pattern* space
* During each cycle, all the statements in the script are executed in the sequence for matching **address pattern** for **actions** specified with the **options** provided

## Usage

* Single line at the command line

```bash
sed -e 's/hello/world/g' input.txt 
```

* Script interpreted by ` sed `

```bash
sed -f ./myscript.sed input.txt 
```

  - [myscript.sed](files/myscript.sed)

## sed statements
 
*  <!-- 4:13 week 6 lecture 5  add svg -->

```text
:label address-pattern action options
```

* Grouping commands

```text
{ cmd ; cmd ; }
```

### address

* Selecting by numbers : 
  - ` 5 ` - 5th line
  - ` $ ` - the last line 
  - ` % ` - all the lines
  - ` 1~3 ` - every 3rd line starting from 1st line

* Selection by text matching : 
  - ` /regexp/ ` - lines which match regexp

* range addresses : 
  - ` /regexp1/,/regexp2/` - from first line which matches regexp1 till the line that matches regexp2
  - ` /regexp/, +4 ` - 4 lines from first line which matches regexp
  - ` /regexp/, ~2 ` - every second line from first line which matches regexp 
  - ` 5,15 ` - from line 5 to 15
  - ` 5,/regexp/` - from line 5 to line which first matches regexp 

* In GNU extended version of ` sed ` the starting and ending part of the address both can be *regexp*.

| action | description    |
|:---------------: | --------------- |
| ` p `   | Print the pattern space   |
|  ` d `  | Delete the pattern space   |
| ` s `   | Substitute using regex match ` [address]s/search/replace/[flags] ` |
| ` = ` | Print current input line number, \n |
| ` # ` | comment | 
| ` i `   |  Insert above the current line  |
|  ` a `  | Append below the current line |
| ` c `   | Change current line |

### programming

|  syntax  |  description   |
|:--------------:| --------------- |
| ` b label ` | Branch unconditionally to *label* |
|  ` :label `  | Specify location of *label* for branch command  |
| ` N `   | Add a new line to the pattern space and append line of input into it  |
| ` q `   | Exit sed without processing further commands or input lines  |
| ` t label `   | Branch to label only if there was a successful substitution was made   |
|  ` T label `   |  Branch to label only if there was **no** successful substitution was made |
| ` w filename `   | Write pattern space to filename   |
| ` x `   | Exchange the contents of hold and pattern spaces |


## bash + sed

* Including sed inside shell script
* heredoc feature
* Use with other shell scripts on command line using pipe

*sed is available everywhere !*

*sed is a meant for text processing, fast in execution*

*use sed to pre-process input for further processing*

## Demonstration

* [sample.txt](files/sample.txt)

* The default action of the stream editor is to print the line that is sent to it.
  - output same as ` cat sample.txt `
```bash
sed -e "" sample.txt
```

* Suppressing the default action of printing using ` -n ` option

```bash
sed -n -e "" sample.txt
```

* Print the line number and ` \n ` and then the line itself

```bash
sed -e "=" sample.txt
```

### Selection by numbers

* Print only a line specified by line number as address
  - print 5th line

```bash
sed -n -e "5p" sample.txt 
```
  - if ` -n ` option is omitted it will print all lines with 5th line printed twice

* To print special characters as it is without any interpretation single quote are useful.

* To print all lines except a particular line (using !)
  - print all lines except 5th line

```bash
sed -e '5!p' sample.txt
```

* Print the last line using ` $ `

```bash
sed -n -e '$p' sample.txt
```

  - Replacing ` '$p' ` with ` "$p" ` will match the value in shell variable ` p `
  - Hence, ` "$VARNAME" ` can be used to match for a shell variable value.


* Print every 5th line starting from line 1

```bash
sed -n -e '1~5p' sample.txt
```

* A single line can be deleted using the line number.
  - delete the 5th line

```bash
sed -e '5d' sample.txt
```

### Selection by address

* Print lines 5 to 8

```bash
sed -n -e '5,8p' sample.txt
```

* Separating commands with ` ; `
  - Print all line numbers and contents of lines 5 to 8.

```bash
sed -n -e '=; 5,8p' sample.txt
```

* Print line numbers and the content for only lines 5 to 8

```bash
sed -n -e '5,8{=;p}' sample.txt
```

* Print lines where the address matches the word ` microsoft ` in regexp.

```bash
sed -n -e '/microsoft/p' sample.txt
```

* Try for yourself:
  - print the line which matches address ` /in place of/ `.
  - print lines which does not match the address ` /text/ `


* Printing a specific number of lines after the address match.
  - print 2 lines after including the matching address.

```bash
sec -n -e '/adobe/,+2p' sample.txt
```

* A range of lines can be deleted specified by address
  - to delete lines 1 to 5

```bash
sed -e '1,5d' sample.txt
```

* Try for yourself:
  - delete all the lines.
  - delete lines except lines 4 to 6
  - delete every 2nd line after matching address ` /microsoft/ `

### The ` s ` command

* The most used command in ` sed `.

* Search for the word `microsoft` and replace it with `MICROSOFT`

```bash
sed -e 's/microsoft/MICROSOFT/g' sample.txt
```

  - Before ` s ` comes the address space. Since it is not specified the command is applicable for all lines.
  - ` g ` flag is used to match *search* regexp and replace all the occurrences of it with ` replace ` string on a line.

* On first line, replace the word ` linux ` with ` LINUX `

```bash
sed -e '1s/linux/LINUX/g'
```

* Try for yourself:
  - replace all occurrences of *in place of* with *in lieu of*

* By default sed uses BRE, with ` -E ` we can force to use ERE.

* Use ERE to search for ` L ` and one or more digits followed by space and replace it with empty string.

  - for line 3 to 6

```bash
sed -E -e '3,6s/^[[:digit:]]+ //g' sample.txt
```

  - from line 3 upto the occurrence of phrase *symbolic*.

```bash
sed -E -e '3,/symbolic/s/^[[:digit:]]+ //g' sample.txt
```

* Try for yourself:
  - do the same for all lines.
  - do the same starting from line 1, every 3rd line.
  - do the same for even numbered line (with and without using ` ! `).
  - do the same for the address range ` /text/,/video/ `

### Adding a line before and after a line.

* The sed ` i ` (`i`nsert) command can be used to add a line before a line specified by address.
* The sed ` a ` (`a`ppend) command can be used to add a line after a line specified by address.

* To insert a header line before the first line.

```bash
sed -e '1i -----------header-----------' sample.txt
```

* To append footer after the last line.

```bash
sed -e '$a -----------footer-----------' sample.txt
```

* Both the operations can be performed with a single command with ` -e ` spanning the same command.

```bash
sed -e '1i -----------header-----------' -e '$a -----------footer-----------' sample.txt
```

* Add a break after before every 5th line starting with line 1

```bash
sed -e '1~5i ------- break --------' sample.txt
```
* The two operations can be combined together to perform meaningful insertion and append operations on different address ranges.

### Replacing or changing a line with some text

* The sed ` c ` (`c`hange line) command can be used to change che contents of a line with new content.

* To change the lines which match the address ` /miscosoft/ `

```bash
sed -e '/microsoft/c ------censored------' sample.txt
```

## Sed Scripts 

A sed script is a file which contains the sed commands (the part in quotes after ` -e `).
The commands given in the script are executed line by line on input file.

A sample script file can be found as [hf.sed](files/hf.sed).

* Executing the [hf.sed](files/hf.sed) on the file [sample.txt](files/sample.txt)

```bash
sed -f hf.sed sample.txt 
```

* We will now process the file [block-ex-6.input](/Week-7/files/block-ex-6.input) with script [clean.sed](files/clean.sed) which produces only roll number and amount separated by space.

```bash
sed -E -f clean.sed block-ex-6.input
```

## Joining Lines using

* Joining lines requires sed to read one more line into the buffer.

* Consider file [sample-split.txt](files/sample-split.txt). It has line breaks after `\` on some lines. 

* Join the lines which are ending with `\` using the sed script [join.sed](files/join.sed).
  - The script will produce the similar result as in file [sample.txt](files/sample.txt)

```bash
sed -f join.sed sample-split.txt
```

## Sed debugging

* Option ` --degug ` to sed can be used to enable debugging.
* For every line that is being precessed, it prints the line which is read, pattern that matched and command that is executed.
