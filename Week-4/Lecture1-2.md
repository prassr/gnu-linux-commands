# Pattern Matching

## POSIX Standard
IEEE 1003.1-2001 IEEE Standard for 
IEEE Information Technology - Portable Operating System Interface (POSIX (TM))

Ref: https://standards.ieee.org/standard/1003_1-2001.html

## Regex
* regex is a pattern matching template to filter text.
* **BRE**: POSIX Basic Regular Expression engine
* **ERE**: POSIX Extended Regular Expression engine

## Why learn regex?
* Process input from user.
* Perform string oprations based on pattern.
* Languages: Java, Perl, Python, Ruby, ...
* Tools: grep, sed, awk
* Applications: MySQL, PostgreeSQL, ...
* We will focus on grep here.

### Special Characters (BRE and ERE)
* It is a good practice to enclose the pattern within single / double quotes.

| Character(s) | Description |
| :---------:  | :---------- |
| ` . `        | Any single character except null or newline |
| ` * `        | Zero or more of *preceding* character / expression |
| ` [] `       | Any of the enclosed characters/ [class]("#character-classes"); hyphen (` - `) indicates character range |
| ` ^ `        | Anchor for beginning of line or *negation* of enclosed characters when used as ` [^] ` |
| ` $ `        | Anchor for end of line |
| ` \ `        | Escape special characters |


### Special Characters (BRE)

| Character(s) | Description |
| :---------:  | :---------- |
| ` \{n,m\} `  | Range of occurrences of preceding pattern at least ` n ` and utmost ` m ` times |
| ` \(\) `     | Grouping of regular expressions |

### Special Characters (ERE)

| Character(s) | Description |
| :---------:  | :---------- |
| ` {n,m} `  | Range of occurrences of preceding pattern at least ` n ` and utmost ` m ` times |
| ` () `     | Grouping of regular expressions |
| ` + `      | One of more of preceding character / expression |
| ` ? `      | Zero of one of preceding character / expression |
| ` \| `      | Logical OR over the patterns |   


### Character Classes
* Character classes follow specific structure, ` [:class-name:] `
* The classes should be used within character enclosure braces as ` [character-class] `

| Class | Represents |
| :---------:  | :---------- |
| ` [[:print:]] ` | Printable |
| ` [[:alnum:]] ` | Alphanumeric |
| ` [[:alpha:]] ` | Alphabetic |
| ` [[:lower:]] ` | Lower case |
| ` [[:upper:]] ` | Upper case |
| ` [[:digit:]] ` | Decimal digits | 
| ` [[:blank:]] ` | Space / Tab |
| ` [[:space:]] ` | Whitespace |
| ` [[:punct:]] ` | Punctuation |
| ` [[:xdigit:]] ` | Hexadecimal |
| ` [[:graph:]] ` | Non-space |
| ` [[:cntrl:]] ` | Control Characters |

### Backreferences
* These are used to match previously matched pattern (subexpression).
* ` \(\) ` (BRE) or ` () ` (ERE) can be used to enclose subexpression that can be used later for backreferencing.
* ` \1 ` (reference to the first subexpression) through ` \9 ` (referenct to the ninth subexpression)
* ` \n ` matches whatever was matched by *n*th parenthesized subexpression.
* A line with two occurrences of *hello* will be matched using:
	- ` .* ` : any arbitrary number of characters.
```regex
\(hello\).*\1
```

### BRE Operator Precedence
* highest to lowest in this order.

| Class |  Represents |
| :---------:  | :---------- |
| ` [..] ` ` [==] ` ` [::] ` | Char collation | 
| ` \ `               | Metachar |
| ` [ ] `             | Bracket expansion |
| ` \(\) ` ` \n `     | subexpressions and backreferences |  
| ` * ` ` \{ \} `     | Repetition of preceding regex |
|                     | Concatenation |
| ` ^ ` ` $ `         | Anchors |

### ERE Operator Precedence
* highest to lowest in this order.

| Class |  Represents |
| :---------:  | :---------- |
| ` [..] ` ` [==] ` ` [::] ` | Char collation | 
| ` \ `               | Metachar |
| ` [ ] `             | Bracket expansion |
| ` ( ) `    | subexpressions or grouping |  
| ` * ` ` + ` ` ? ` ` { } `     | Repetition of preceding regex |
|                     | Concatenation |
| ` ^ ` ` $ `         | Anchors |
| ` \| `               | Alternation | 



## ` grep `
Searches for string which matches *pattern* with each line in the file.

### Default engine is BRE
* ` grep 'pattern' filename `
* ` command | grep 'pattern' `


### Examples
We will consider [names.txt](/Week-4/Files/names.txt) for the explanation.
A comment starts with ` # ` and continues till the end of the line.
* ` grep 'pattern' <filename> ` or ` command | grep 'pattern' `
	- Looking for a *string* as a pattern in file *filename*.
	- Print the lines which contain word 'Raman'.
	
		```terminal
		~$ grep 'Raman' names.txt
		ED22B902 Raman Singh
		```
		
	- Print for lines which contain pattern 'Anu'.
		
		```terminal
		$ grep 'Anu' names.txt			  # lines that contain
		EE22B905 Anu K. Jain
		NA22B906 Anupama Shridhar
		```	
		
		+ ` 'Anu' ` : **Anu** , **Anu**pama
	- Try similar commands in terminal

		```bash
		grep 'Sa' names.txt			      # lines containing string 'Sa' together. 
		```
		
		```bash
		grep 'ai' names.txt				  # lines containing string 'ai' together. 
		```
		
	- Piping is very important feature which can be used ` grep ` any command output.
		+ Passing input using pipe to grep and searching the pattern 'ai'.
	
		```terminal
		~$ cat names.txt | grep 'ai'	  # you have seen similar command earlier !
		```
		
	- ` . ` to match a single character.
	
		```terminal
		~$ cat names.txt | grep 'S.n'
		ED22B902 Raman Singh
		PH22B907 Vel Sankaran
		```
		
		+ ` 'S.n' ` matches 3 letters, 'S' followed any single character and 'n'.
		+ **Sin**gh and **San**karan in example above.
		
		```terminal
		~$ cat names.txt | grep '.am'	  # matches any single character, followed by 'am'
		MM22B901 Mary Manickam
		ED22B902 Raman Singh
		CS22B904 Charles M. Sagayam
		NA22B906 Anupama Shridhar
		```
		
		+ ` '.am' ` : Manic**kam**, **Ram**an, Saga**yam**, Anup**ama**
	
	- ` $ ` to match pattern at/towards the end of line.
		
		```terminal
		~$ cat names.txt | grep '.am$'    # '.am' pattern at the end of line.
		MM22B901 Mary Manickam
		CS22B904 Charles M. Sagayam
		```
		
		+ ` '.am$' ` : Manic**kam**, Saga**yam**
	
	- ` \. ` to match ` . ` literal.
		
		```terminal
		~$ cat names.txt | grep '\.'
		CS22B904 Charles M. Sagayam
		EE22B905 Anu K. Jain
		```
		
		+ ` '\.' ` : '.' in M. , K.
		
		```terminal
		~$ cat names.txt | grep '.\.'	  # match an Abbreviation
		CS22B904 Charles M. Sagayam
		EE22B905 Anu K. Jain
		```
		
		+ ` '.\.` : **M.**, **K.**
		
	- ` ^ ` to match pattern at/from the beginning.
		
		```terminal
		~$ cat names.txt | grep '^E'	  # line begins with 'E', case-sensitive.
		ED22B902 Raman Singh
		EE22B905 Anu K. Jain		
		```
		
		or 
		
		```terminal
		~$ cat names.txt | grep  -i '^e'  # line begins with 'E' or 'e', case-insensitive (-i).
		ED22B902 Raman Singh
		EE22B905 Anu K. Jain
		```
		
		+ ` -i '^e' ` : **E**D22B902, **E**E22B905
	- Try in a terminal
		
		```bash
		cat names.txt | grep '^M'
		```

	- ` \b ` to match word boundary, irrespective of the position of the word.
		
		```terminal
		~$ cat names.txt | grep 'an\b'
		ED22B902 Raman Singh
		PH22B907 Vel Sankaran
		```
		
		+ ` 'an\b' ` : Ram**an**, Sankar**an** (Word boundary as well as end of line)
		
	- Try in terminal
		
		```bash
		cat names.txt | grep 'am\b'
		```

	- ` [] ` matching a character from characters or range of characters enclosed.
		
		```terminal
		$ cat names.txt | grep 'M[ME]'
		MM22B901 Mary Manickam
		ME22B903 Umair Ahmad
		```
		
		+ Matches 'M' and then 'M' or 'E', i.e. matches 'MM' or 'ME'
		+ ` 'M[ME]' ` : **MM**22B901, **ME**22B903
		
		
	- Try in terminal
	
		```bash
		cat names.txt | grep 'E[ED]'	  # matches 'EE' or 'ED'
		```
		
		```bash
		cat names.txt | grep '[ME]E'	  # matches 'ME' or 'EE'
		```
		
		```bash
		~$ cat names.txt | grep '[aeiou]' # matches vowels.
		```
		
		```bash
		~$ cat names.txt | grep '[aeiou][aeiou]' # matches two vowels side by side.
		```
	
	- ` [start-stop] ` Matching any characters specified by range ` start-stop `.
		+ ` [1-4] ` : Matches characters in range 1 to 4
		
		```terminal
		$ cat names.txt | grep 'B90[1-4]'
		MM22B901 Mary Manickam
		ED22B902 Raman Singh
		ME22B903 Umair Ahmad
		CS22B904 Charles M. Sagayam
		```
		
		+ Match 'B90' followed by any numbers in range 1 to 4
		+ ` 'B90[1-4] ' ` : MM22**B901**, ED22**B902**, ME22**B903**, CS22**B904**
		
		
	- Try in terminal
		
		```bash
		cat names.txt | grep 'B90[5-7]'	  # match 'B90' followed by any digits from 5 to 7
		```
		
		```bash
		cat names.txt | grep 'B90[5-7]'   # match 'B90' followed by any digits from 1 to 9
		```
		
		```bash
		cat names.txt | grep '[M-Z][aeiou]'  
		# match any character from 'M' to 'Z' followed by a vowel
		```
	
	- ` [^] ` match negation of the characters.
		
		```terminal
		~$ cat names.txt | grep 'B90[^5-7]'
		MM22B901 Mary Manickam
		ED22B902 Raman Singh
		ME22B903 Umair Ahmad
		CS22B904 Charles M. Sagayam
		```
		
		+ Match 'B90' followed by digits not in range 5 to 7
		+ ` 'B90[^5-7] ' ` : MM22**B901**, ED22**B902**, ME22**B903**, CS22**B904**
		
		
	- ` .* ` match any number of characters including 0.
		
		```terminal
		~$ cat names.txt | grep 'S.*[mn]'
		ED22B902 Raman Singh
		CS22B904 Charles M. Sagayam
		PH22B907 Vel Sankaran
		```
		
		+ Match 'S', followed by any number of characters ('.*'), then 'm' or 'n'
		+ ` 'S.*[mn]' ` : **Sin**gh, C**S22B904 Charles M. Sagayam**, **Sankaran**
		+ What if we want to match just names and not part of roll number?
		+ We will introduce word boundary before 'S'
		
		```terminal
		~$ cat names.txt | grep '\bS.*[mn]'
		#HIDDEN#
		```
		
		+ ` '\bS.*[mn]' ` : **Sin**gh, **Sagayam**, **Sankaran**
		
	- ` \{m\} ` preceding character repeats exactly 'm' times
		
		```terminal
		~$ cat names.txt | grep 'M\{2\}'
		MM22B901 Mary Manickam
		```
		
		+ 'M' repeats exactly twice.
		+ ` 'M\{2\}' ` : **MM**22B901
		
	- ` \{m, n\} ` preceding character repeats at least 'm' times and at most 'n' times.
		
		```terminal
		~$ cat names.txt | grep 'E\{1,2\}'
		ED22B902 Raman Singh
		ME22B903 Umair Ahmad
		EE22B905 Anu K. Jain
		```
		+ 'E' repeates once or twice.
		+ ` 'E\{1,2\}' ` : **E**D22B902, M**E**22B903, **EE**22B905
	
	- ` \{m,\} ` preceding character repeats at least 'm' times.
		+ Try in terminal
		
		```bash
		cat names.txt | grep 'M\{1,\}'	  # 'M' repeats at least 1 time.
		```
	
	- ` \{,n\} ` preceding character repeats at most 'n' times.
		+ Try in terminal
		
		```bash
		cat names.txt | grep 'M\{,2\}'	  # 'M' repeats at most 2 times.
		```	
		
	- ` \(pattern\) ` grouping 'pattern's and backreferences.
		+ The 'pattern' inside parenthesis can be any valid pattern.
		
		```terminal
		~$ cat names.txt | grep '\(ma\).*\1'
		ME22B903 Umair Ahmad
		```
		
		+ pattern matches 'ma' (` '\(ma\)' `), followed by any number of characters (` '.*' `), followed by 'ma' ( backreferenced with ` '\1' ` to the first pattern in parenthesis.)
		+ ` '\(ma\).*\1' ` : U**mair Ahma**d
		
		
		```terminal
		~$ cat names.txt | grep '\(a.\)\{3\}'
		CS22B904 Charles M. Sagayam
		```
		
		+ 'a' and any character repeated thrice.
		+ ` '\(a.\)\{3\}' ` : S**agayam**
		+ Change 3 to 2 and see the output.
		
	- Try in terminal
	
		```bash
		cat names.txt | grep '\(.a\).*\1'  
		```
		
		+ any character and 'a' (` '\(.a\)' ` => 1), followed by any number of characters (` '.*' `), then any character and 'a' (` '\1' `).        ......... (1)
		
		```bash
		cat names.txt | grep '\(a.\).*\1'  
		```
		
		+ Follows similar interpretation as (1).
		
		```bash
		cat names.txt | grep '\(a.\)\{2,3\}'
		```
		
### Switch to use ERE
* ` egrep 'pattern' filename `
* ` grep -E 'pattern' filename `
	
	- ` + ` match preceding pattern once or more number of times.
	
		```terminal
		~$ cat names.txt | egrep 'M+'
		MM22B901 Mary Manickam
		ME22B903 Umair Ahmad
		CS22B904 Charles M. Sagayam
		```	
		
		+ Match 'M' at least once. Similar to ` '\{1,\}' `
		+ ` 'M+' ` : **MM**22B901 **M**ary **M**anickam, **M**E22B903,  **M**.
		
		```terminal
		~$ cat names.txt | egrep '^M+'
		MM22B901 Mary Manickam
		ME22B903 Umair Ahmad	
		```
		
		+ Match 'M' at least once at the beginning of the line.
		+ ` '^M+' ` : **MM**22B901, **M**E22B903
		
	- ` * ` matches preceding character 0 or more times
		
		```terminal
		~$ cat names.txt | egrep '^M*'
		```
		
		+ Match 'M' 0 or more number of times at the beginning of the line.
		+ It dumps the whole [names.txt](/Week-4/Files/names.txt) file
		
	- Try in terminal
		
		```bash
		cat names.txt | egrep 'M*a'
		```
		
		+ Matches string containing, 'a',  'Ma', 'MMa', 'MMMa'.....
		
		```bash
		cat names.txt | egrep 'M.*a'
		```
		
		+ Matches 'M' then any number of characters (` .* `) then 'a'.

	- ` (pattern) ` match subexpression
		
		```terminal
		~$ cat names.txt | egrep '(ma)+'
		ED22B902 Raman Singh
		ME22B903 Umair Ahmad
		NA22B906 Anupama Shridhar
		```
		
		+ matches 'ma' once or more times.
		+ ` (ma)+ ` :  Ra**ma**n, U**ma**ir Ah**ma**d, Anupa**ma**
		
	- Try in terminal
		
		```bash
		cat names.txt | egrep '(ma)*'
		```
		+ Matches 'ma' 0 or more times
		
		```bash
		cat names.txt | egrep '(ma){2}'
		```
		
		+ Matches 'ma' exactly twice consecutively.
	
	- ` (pattern1 | pattern2) `	match 'pattern1' or 'pattern2'
		
		```terminal
		~$ cat names.txt | egrep '(ED|ME)'
		ED22B902 Raman Singh
		ME22B903 Umair Ahmad
		```
		
		+ Matches 'ME' or 'ED'
		+ ` '(ED|ME)' ` : **ED**22B902, **ME**22B903 
	
	- Try in terminal
		
		```bash
		cat names.txt | egrep '(Anu|Raman)'
		```
		
		+ Matches string containing 'Anu' or 'Raman'
	
		```bash
		cat names.txt | egrep '(an|an)$'
		```
		
		+ Matches with 'am' or 'an' at the end of the line.
		+ Remove '$' and try.

	- It is important to gain flexibility to use ` grep ` on any command.
	- We will discuss this for a command that we have seen earlier namely [` dpkg-query `](/Week-3/Lecture3-4.md#dpkg-query)
	- Using ` dpkg-query ` and ` egrep ` 
		To list package names with 4 characters
	
		```terminal
		~$ dpkg-query -W -f'${Section} ${binary:Package}\n' | egrep ' .{4}$'
		```
		
		First 5 lines of output
		
		```terminal
		shells bash
		admin bolt
		utils cpio
		admin cron
		net cups
		```
		
		+ ` ' .{4}$' ` matches any character 4 times at the end of the line, <space> before ensures word boundary, and helps not matching the section.
		+ ` ' .{4}$' ` is equivalent to ` ' ....$' `
		+ ` ' .{4}$' `  : ** bash**, ** bolt**, ** cpio**, ** cron**, ** cups**
	
		To list the package names with 4 characters starting with 'g'.
		
		```terminal
		~$ dpkg-query -W -f'${Section} ${binary:Package}\n' | egrep ' g.{3}$'
		interpreters gawk
		gnome gdm3
		utils gpgv
		utils grep
		utils gzip
		```
		
		To list the package names starting with 'g' and having 1 to 6 characters
		 
		```terminal
		~$ dpkg-query -W -f'${Section} ${binary:Package}\n' | egrep ' g.{1,5}$'
		interpreters gawk
		gnome gcr
		devel gdb
		admin gdisk
		gnome gdm3
		```
		
		To list the package names in section 'math'
		
		```terminal
		~$ dpkg-query -W -f'${Section} ${binary:Package}\n' | egrep '^math'
		math bc
		math dc
		math galculator
		math gnome-calculator
		```
		
		Try in a terminal and figure out the difference with command above
		
		```bash
		dpkg-query -W -f'${Section} ${binary:Package}\n' | egrep 'math'
		```
		
		+ Prints packages or sections having 'math' as string 
		
		Try in a terminal
		
		```bash
		dpkg-query -W -f'${Section} ${binary:Package}\n' | egrep ' kd.*$'
		```
		
		+ Prints package names starting with 'kd'
		 

### Matching character sets with ` grep `
* We will consider [chartypes.txt](/Week-4/Files/chartypes.txt) file for demonstration.
* It contains text, special characters as well as control characters (similar file is used in the lecture video).
	
	- ` [[:alpha:]] ` matches alphabetic characters.
		
		To match an alphabetic character at the beginning of the line
		
		```terminal
		~$ cat chartypes.txt | grep '^[[:alpha:]]'
		hello : alphabetical stuff : 5g
		l : start lower end upper : H
		L : start upper end lower : h
		```
		
		+ ` '^[[:alpha:]]' ` : **h**ello, **l**, **L**
		
		To match an alphabetic character at the end of the line
		
		```terminal
		~$ cat chartypes.txt | grep '[[:alpha:]]$'
		hello : alphabetical stuff : 5g
		l : start lower end upper : H
		L : start upper end lower : h
		```
		
		+ ` '[[:alpha:]]$' ` : 5**g**, **H**, **h**
		
		To match an alphabetic character anywhere in the line
		+ Try in a terminal
		
		```bash
		cat chartypes.txt | grep '[[:alpha:]]'
		```
		
		
	- ` [[:alnum:]] ` matches alpha numeric characters.
		
		To match an alpha numeric character at the beginning of the line
		
		```terminal
		~$ cat chartypes.txt | grep '^[[:alnum:]]'
		hello : alphabetical stuff : 5g
		l : start lower end upper : H
		L : start upper end lower : h
		5g : alpha numeric stuff : 42
		42 : solution to everything :
		```
		
		+ ` '^[[:alnum:]]' ` : **h**ello, **l**, **L**, **5**g, **4**2
		
		To match an alpha numeric character at the end of the line
		
		```terminal
		~$ cat chartypes.txt | grep '[[:alnum:]]$'
		hello : alphabetical stuff : 5g
		l : start lower end upper : H
		L : start upper end lower : h
		5g : alpha numeric stuff : 42
		```
		+ ` '[[:alnum:]]$' ` : 5**g**,  **H**, **h**,  4**2**
		
		To match an alpha numeric character anywhere in the line
		+ Try in a terminal
		
		```bash
		cat chartypes.txt | grep '[[:alnum:]]'
		```
	
	- ` [[:digit:]] ` matches only numbers or digits
		
		To match a digit at the beginning of the line
		
		```terminal
		~$ cat chartypes.txt | grep '^[[:digit:]]'
		5g : alpha numeric stuff : 42
		42 : solution to everything : 
		```
		
		+ ` '^[[:digit:]]' ` : **5**g, **4**2
		
		To match a digit at the end of the line
		
		```terminal
		~$ cat chartypes.txt | grep '[[:digit:]]$' 
		5g : alpha numeric stuff : 42
		```
		
		+ ` '[[:digit:]]$' ` : 4**2**
		
		To match a digit anywhere in the line
		+ Try in a terminal
		
		```bash
		cat chartypes.txt | grep '[[:digit:]]' 
		```
	
	- ` [[:cntrl:]] ` matches control characters.
		
		To match a control character
		
		```terminal
		~$ cat chartypes.txt | grep '[[:cntrl:]]'
		42 : solution to everything :	
		 : start with control C and end with dot : .
		  : start with blank end with control char :  
		```
		
		+ The first line contains tab character at the end.
		
		To output lines which do not match any control characters.
		+  ` -v ` option negates the selection.
		+ Try in terminal
		
		```bash
		cat chartypes.txt | grep -v '[[:cntrl:]]' 
		```
	
	- ` [[:punct:]] ` matches punctuation characters.
		+ Punctuation Characters : `` `~\!@#$%^&*_-+=[]{}();:,.<>/?""'' ``
		
		To match a punctuation character at the beginning of the line 
		
		```terminal
		~$ cat chartypes.txt | grep '^[[:punct:]]'
		, : start with comma end with equals : =
		```
		
		Try the questions below.
		+ Write a command to match a punctuation character at the end of the line.
		+ Write a command to match a punctuation character anywhere in the line.

	- ` [[:lower:]] ` matches lower case characters
		
		To match a lower case character at the beginning of the line
		
		```terminal
		~$ cat chartypes.txt | grep '^[[:lower:]]'
		hello : alphabetical stuff : 5g
		l : start lower end upper : H
		```
		
		+ ` '^[[:lower:]]' ` : **h**ello, **l**
		
		Try the questions below.
		+ Write a command to match a lower case character at the end of the line.
		+ Write a command to match a lower case character anywhere in the line.
	
	
	- ` [[:upper:]] ` matches upper case characters
		
		To match an upper case character at the beginning of the line
		
		```terminal
		~$ cat chartypes.txt | grep '^[[:upper:]]'
		L : start upper end lower : h
		```
		
		+ ` '^[[:upper:]]' ` : **L**
		
		Try the questions below.
		+ Write a command to match an upper case character at the end of the line.
		+ Write a command to match an upper case character anywhere in the line.
	
	
	- ` [[:print:]] ` matches printable characters
		+ control characters are not printable.
		
		To match a printable character at the end of the line
		
		```terminal
		~$ cat chartypes.txt | grep '[[:print:]]$'
		hello : alphabetical stuff : 5g
		l : start lower end upper : H
		L : start upper end lower : h
		5g : alpha numeric stuff : 42
		 : start with control C and end with dot : .
		, : start with comma end with equals : =
		```
		
		+ ` '[[:print:]]$' ` : 5**g**, **H**, **h**, 4**2**, **.**, **=** 
		
		Try the questions below.
		+ Write a command to match a printable character at the beginning of the line.
		+ Write a command to match a printable character anywhere in the line.
		
	- ` [[:blank:]] ` matches blank characters (space / tab)
		
		To match a blank character at the end of the line
		
		```terminal
		~$ cat chartypes.txt | grep '[[:blank:]]$'
		42 : solution to everything :	
		```
		
		+ The line has tab at the end.
		
		Try the questions below.
		+ Write a command to match a blank character at the beginning of the line.
		+ Write a command to match a blank character anywhere in the line.

	- ` [[:space:]] ` matches space
		
		To match a space at the beginning of the line
		
		```terminal
		~$ cat chartypes.txt | grep '^[[:space:]]'
		  : start with blank end with control char :
		```
		
		Try the questions below.
		+ Write a command to match a space at the end of the line.
		+ Write a command to match a space anywhere in the line.
		
	- ` [[:graph:]] ` matches non-space characters.
		
		To match a non-space characters at the beginning of the line
		
		```terminal
		~$ cat chartypes.txt | grep '^[[:graph:]]'
		hello : alphabetical stuff : 5g
		l : start lower end upper : H
		L : start upper end lower : h
		5g : alpha numeric stuff : 42
		42 : solution to everything :	
		, : start with comma end with equals : =
		```
		
		+ ` '^[[:graph:]]' ` : **h**ello, **l**, **L**, **5**g, **4**2, **,**
		
		Try the questions below.
		+ Write a command to match a space at the end of the line.
		+ Write a command to match a space anywhere in the line.
	
	- ` ^$ ` matches empty lines.
		The two anchors together match empty lines.
		Use when you want the empty lines in the input to be skipped in the output
		
		Try in a terminal
		
		```bash
		cat chartypes.txt | grep '^$'
		```	
		
		```bash
		cat chartypes.txt | grep -v '^$'
		```

#### More Examples on ` grep ` Character Sets
* We will consider [patterns.txt](/Week-4/Files/patterns.txt) file.
* It contains some patterns. We will try to match these using ` grep `.
* Similar file is used in lecture.

	- To match the line which contains aadhaar number.
		
		```terminal
		~$ egrep '[[:digit:]]{12}' patterns.txt
		Aadhar card number contains 12 digits and can look like 123456781234 for example.
		```
		
		+ ` '[[:digit:]]{12}' ` : **123456781234**
		
	- To match the line which contains pincode.
		+ Matching only six digits is not feasible, we will consider word boundary also.
		
		```terminal
		~$ egrep '\b[[:digit:]]{6}\b' patterns.txt
		Pincodes of cities of Bharat contain 6 digits and that of IITM is 600036.
		```
		
		+ ` '\b[[:digit:]]{6}\b' ` : **600036**
		+ Try without '\b' and see the difference in output.
	
	- To match the line which contains roll number.
		+ Roll number has a specific pattern, only matching alphanumeric characters will not help.
		```terminal
		~$ egrep '\b[[:alpha:]]{2}[[:digit:]]{2}[[:alpha:]][[:digit:]]{3}\b' patterns.txt
		Roll numbers in IIT for regular students are of the pattern MM22B001 where the first two letters correspond to the Department code, 2 digits for the year of joining, then the program code character and then a 3 digit number for their roll number within the class
		```
		
		+ ` '\b[[:alpha:]]{2}' ` : **MM**
		+ ` '[[:digit:]]{2}' `   : **22**
		+ ` '[[:alpha:]]' `      : **B**
		+ ` '[[:digit:]]{3}\b' ` : **001**
		
		+ Try the command with pattern - ` '[[:alnum:]]{8}' `
	
	- To match the line that contains URL.
		+ "github.com" and "https://www.github.com" are valid URLs.
		+ Notice that the URL contains  dot ('.')
		
		```terminal
		~$ egrep "\b[[:alnum:]]+\.[[:alnum:]]+" patterns.txt
		URLs can be given these days without the protocol like https://www.iitm.ac.in/ They can be given as just github.com for example.
		```
		
		+ ` "\b[[:alnum:]]+\.[[:alnum:]]+" ` : **www.iitm**,  **ac.in**, **github.com**


## ` cut ` Command
* We have seen ` head ` and ` tail ` command to select lines.
* Cut command is used to select columns of lines.
* We will consider [fields.txt](/Week-4/Files/fields.txt) file for demonstration.
* Options :
	- ` -b ` : to select bytes.
	- ` -c ` : to select characters
	- ` -d ` : to specify delimeter, TAB by default
	- ` -f ` : to select fields
* arguments to ` -b `, ` -c `, ` -f `, M and N are numbers
	- ` M ` - select only M'th character
	- ` M-N ` - select M to N characters.
	- ` M- ` - select characters M onwards
	- ` -N ` - select characters upto N
	
	- ` cut -c ` to select characters
		
		To select first 4 characters (1-4)
		
		```terminal
		~$ cut -c 1-4 fields.txt
		1234
		2345
		3456
		```
		
		Try in a terminal
		
		```bash
		cut -c 5-8 fields.txt
		```
		+ Selects characters 5 to 8
		
		To select characters up to 4 (-4)
		
		```terminal
		~$ cut -c -4 fields.txt
		1234
		2345
		3456
		```
		
		To select characters 8 onwards (8-)
		
		```terminal
		~$ cut -c 8- fields.txt
		llo world,line-1
		welcome cmdline,line-2
		rse text,line-3
		```
		
	- ` cut -d"D" -f ` to cut and select characters by fields separated by D (delimeter)
		
		To select first field using D=" " (space)
		
		```terminal
		~$ cut -d " " -f 1 fields.txt
		1234;hello
		234567;welcome
		3456;parse
		```
		
		Try in a terminal
		
		```bash
		~$ cut -d " " -f 2
		```
		
		+ Selects second half of the field separated by " "
		
		To select first field using D=";"
		
		```terminal
		~$ cut -d ";" -f 1 fields.txt
		1234
		234567
		3456
		```
		
		Try in a terminal
		
		```bash
		cut -d ";" -f 2 fields.txt
		```
		+ Selects second half of the field separated by ";".
		
		To select second field using D=","
		
		```terminal
		~$ cut -d "," -f 2 fields.txt
		line-1
		line-2
		line-3
		```
		
		Try in a terminal
		
		```bash
		cut -d "," -f 1 fields.txt
		```
		
		+ Selects first half of the field separated by ",".
		
	- Combining ` cut ` command twice
	
		To select only the text part between fields separated by ";" and ","
		+ We use piping for this.
		
		```terminal
		~$ cat fields.txt | cut -d ";" -f 2 | cut -d ","  -f 1 
		hello world
		welcome cmdline
		parse text
		```
		
		It is possible to match the similar output using ` grep `
		+ Try in a terminal
		
		```bash
		cat fields.txt | grep ";.*,"
		```
		+ Matches patterns like **;hello world,**
		+ This pattern can be extracted using [sed]() command

	
	- Combining ` cut `, ` head ` and ` tail ` commands
		We will pick *welcome cmdline* text.
		
		```terminal
		~$ cat fields.txt | cut -d ";" -f 2 | cut -d ","  -f 1 | head -n 2 | tail -n 1		
		welcome cmdline
		```
	
		











