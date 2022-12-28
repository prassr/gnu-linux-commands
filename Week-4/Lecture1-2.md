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
* We will focus on grep in the lecture.

### Special Characters (BRE and ERE)
* Good practice to enclose the pattern within single / double quotes.
| Character(s) | Description |
| :---------:  | :---------- |
| ` . `        | Any single character except null or newline |
| ` * `        | Zero or more of *preceding* character / expression |
| ` [] `       | Any of the enclosed characters; hyphen (` - `) indicates character range |
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
| ` | `      | Logical OR over the patterns |   


### Character Classes
* Character classes follow specific structure, ` [:class-name:] `
* The classes should be used within character enclosure as ` [character-class] `
| Class |  Represents |
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
These are used to match again previously matched patterns within ` \(\) ` or ` () `
* ` \1 ` through ` \9 `
* ` \n ` matches whatever was matched by *n*th earlier parenthesized subexpression.
* A line with two occurrences of *hello* will be matched using:
	- ` .* ` : any arbitrary number of characters.
```regex
\(hell\).*\1
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
| ` | `               | Alternation | 



## ` grep `
Searches for string which matches *pattern* with each line in the file.

Default engine is BRE
* ` grep 'pattern' filename `
* ` command | grep 'pattern' `

Switch to use ERE
* ` egrep 'pattern' filename `
* ` grep -E 'pattern' filename `

### Examples
We will consider [names.txt](/Week-4/examples/names.txt) for the explanation.
Comment start with ` # ` till the end of line.
* ` grep 'pattern' <filename> ` or ` command | grep 'pattern' `
	- Looks for *string* as pattern in file filename.
	- Print the lines which contain word 'Raman'.
	
		```terminal
		~$ grep 'Raman' names.txt
		ED22B902 Raman Singh
		```
	- Print for lines which contain pattern 'Anu'.
		
		```terminal
		$ grep 'Anu' names.txt					# lines that contain
		EE22B905 Anu K. Jain
		NA22B906 Anupama Shridhar
		```	
		+ ` 'Anu' ` : **Anu** , **Anu**pama
	- Try similar commands in terminal

		```bash
		grep 'Sa' names.txt					    # lines containing string 'Sa' together. 
		```
		
		```bash
		grep 'ai' names.txt					    # lines containing string 'ai' together. 
		```
		
	- Piping is very important feature which can be used ` grep ` any command output.
		+ Passing input using pipe to grep and searching the pattern 'ai'.
	
		```terminal
		~$ cat names.txt | grep 'ai'		    # you have seen similar command earlier !
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
		~$ cat names.txt | grep '.am'			# matches any single character, followed by 'am'
		MM22B901 Mary Manickam
		ED22B902 Raman Singh
		CS22B904 Charles M. Sagayam
		NA22B906 Anupama Shridhar
		```
		
		+ ` '.am' ` : Manic**kam**, **Ram**an, Saga**yam**, Anup**ama**
	
	- ` $ ` to match pattern at/towards the end of line.
		
		```terminal
		~$ cat names.txt | grep '.am$'          # '.am' pattern at the end of line.
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
		
		+ ` '\+' ` : M**.**, K**.**
		
		```
		~$ cat names.txt | grep '.\.'			# match an Abbreviation
		CS22B904 Charles M. Sagayam
		EE22B905 Anu K. Jain
		```
		
		+ ` '.\+' ` : **M.**, **K.**
		
	- ` ^ ` to match pattern at/from the beginning.
		
		```terminal
		~$ cat names.txt | grep '^E'			# line begins with 'E', case-sensitive.
		ED22B902 Raman Singh
		EE22B905 Anu K. Jain		
		```
		or 
		```terminal
		~$ cat names.txt | grep  -i '^e'		# line begins with 'E' or 'e', case-insensitive (-i).
		ED22B902 Raman Singh
		EE22B905 Anu K. Jain
		```
		
		+ ` -i '^e' ` : **E**D22B902, **E**E22B905
	- Try in terminal
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

	- ` [] ` Matching a character from characters or range of characters enclosed.
		
		```terminal
		$ cat names.txt | grep 'M[ME]'
		MM22B901 Mary Manickam
		ME22B903 Umair Ahmad
		```
		+ Matches 'M' and then 'M' or 'E', i.e. matches 'MM' or 'ME'
		+ ` 'M[ME]' ` : **MM**22B901, **ME**22B903

	- Try in terminal
	
		```bash
		cat names.txt | grep 'E[ED]'			# matches 'EE' or 'ED'
		```
		
		```bash
		cat names.txt | grep '[ME]E'			# matches 'ME' or 'EE'
		```
	
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
			
		














