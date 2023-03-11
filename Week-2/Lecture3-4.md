# Shell Variables Part - 1
* Creation, inspection, modifictaion, lists...

## Creating a Variable
* ` myvar="value string" `
* Variable name can have mix of alpha-numeric chars and _. 
	- ` myvar `, ` MyVar `, ` My10Var ` and ` MyVar_1 ` are valid
* It does not start with a number.
	- ` 10myvar ` is invalid
* There are no spaces around ` = ` (assignment operator).
	- ` myvar = 10 ` is invalid
* A value can be number, string or a `` `command` `` (command substitution).
* Safer to enclose string value within double quotes.
* ` ${myvar} ` is more convenient for string concatenation than ` $myvar `
### Examples
* Create and display variable ` myvar ` with value ` 10 `
```terminal
~$ myvar=10
~$ echo $myvar
10
```
* Change value of variable ` myvar `
```terminal
~$ myvar="hello world"
~$ echo $myvar
hello world
```
* Effect when value not within quotes.
	- variable is assigned a value null
```terminal
~$ myvar=hello world
Command 'world' not found.
~$ echo $?
127
```

* ` command ` as value of a variable. (` command ` is any valid command)
	- store value of ` date ` in variable ` myvar `
```terminal
~$ mydate=` date ` 
~$ echo $myvar
Thursday 22 December 2022 12:23:07 PM EET
~$ myvar=` echo Today is Thursday `
Today is Thursday
```


## Exporting a Variable
* Make variable available to the subshell.
* It can be done in following ways
	- ` export myvar="value string" `
	- ` myvar="value string" ;`
	  ` export myvar `
### Examples
* By default variable is not available for child shell
```terminal
~$ myvar=3.14
~$ bash
~$ echo $myvar

```
* Make the variable available in child shell
	- Changing the value of variable in child shell does not affect it's value in parent shell
```terminal
~$ export myvar=3.14
~$ bash
~$ echo $myvar
3.14
```



## Using Variable Values
* Refering by variable name using ` $ `.
	- ` echo $myvar `
	- ` echo ${myvar}`
	- ` echo "${myvar}_something" `
### Example
* Accessing variable as ` ${myvar} ` and without ` $myvar `
	- As stated above ` _ ` can be part of variable name.
```terminal
~$ myvar=FileName
~$ echo "$myvar.txt"
FileName.txt
~$ echo "$myvar_txt"

~$ echo ${myvar}_txt
FileName_txt
```


## Removing a Variable
* Delete the variable.
	- ` unset myvar `
* Example
```terminal
~$ unset myvar
~$ echo $myvar

```
## Removing Value of a Variable
* Set the value of variable as 	` null `
	- ` myvar= `
* Example
```terminal
~$ myvar=
~$ echo $myvar

```
.............................................................
## Test if a Variable is Set
* ` -v varname `
	- True if the shell variable ` varname ` is set and is name reference. 
```bash
[[ -v myvar ]];
echo $?
```
* Return codes:
	- ` 0 ` : success (variable ` myvar ` is set)
	- ` 1 ` : failure (variable ` myvar ` is not set) 
* Example
```terminal
~$ unset myvar
~$ [[ -v myvar ]];
~$ echo $?
1
~$ myvar=10
~$ [[ -v myvar ]];
~$ echo $?
0
```

## Test if a Variable is *Not* Set
* ` -z string ` 
	- True if the length of the string is **z**ero.

```bash
[[ -z ${myvar} ]];
echo $?
```

* Return codes:
	- ` 0 ` : success (If the length of the string ` ${myvar} ` is zero.)
	- ` 1 ` : failure (If the length of the string ` ${myvar} ` is not zero.) 
* Example
```terminal
~$ unset myvar
~$ [[ -z ${myvar} ]];
~$ echo $?
0
~$ myvar=10
~$ [[ -z ${myvar} ]];
~$ echo $?
1
```

## Substitute Default Value
* If the variable ` myvar ` is not set (` :- `), use ` "default" ` as temporary value.
```bash
echo ${myvar:-"default"}
```
* There are no spaces around ` :- `
* Pseudocode : 
> if ` myvar ` is set:
>
> >	display its value
>
> else:
>
> >	display "default"
### Examples
```terminal
~$ myvar=
~$ echo ${myvar:-hello}
hello
~$ echo ${myvar:-"myvar is not set"}
myvar is not set
~$ echo ${myvar}

~$ myvar="HELLO"
~$  ${myvar:-hello}
HELLO
```

## Set Default Value

* If the variable ` myvar ` is *not* set, then set ` "default" ` as it's value.
```bash
echo ${myvar:="default"}
```
* There are no spaces around ` := `
* Pseudocode : 
> if ` myvar ` is set:
> >
> > display its value
>
> else:
>
> >	set "default" as its value
> >
> >	display its new value

### Examples
```terminal
~$ myvar=
~$ echo ${myvar:=hello}
hello
~$ echo ${myvar:=HELLO}
hello
~$ echo ${myvar}
hello
```

## Reset Value if Variable is Set
* If the variable ` myvar ` is set, then set "default" as its temporary value.
```bash
echo ${myvar:+"default"}
```
* There are no spaces around ` :+ `
* Pseudocode : 
> if ` myvar ` is set:
>
> >	display "default"	
>
> else:
>
> >	display ""

### Example
```
~$ myvar=apple
~$ echo ${myvar:+APPLE}
APPLE
~$ echo $myvar
apple
~$ unset myvar
echo ${myvar:+APPLE}

```


## User Defined Error Message (Alert)
* Display user defined error when variable is not set.
```bash
echo ${myvar:?"myvar is not set"}
```
### Example
```
~$ unset myvar
~$ echo ${myvar:?"myvar is not set"}
bash: myvar: myvar is not set
```

## List of Variable Names
* Print the environment variable names matching *init_chars*.
* We can access these variables using the methods we have seen already.
```bash
echo ${!init_chars*}
```
### Example 
- List of names of shell variables that start with ` H ` and ` HI `.
```bash
~$ echo ${!H*}
HISTCMD HISTCONTROL HISTFILE HISTFILESIZE HISTSIZE HOME HOSTNAME HOSTTYPE
~$ echo ${!HI*}
HISTCMD HISTCONTROL HISTFILE HISTFILESIZE HISTSIZE
~$ echo ${HISTFILE}
/home/groot/.bash_history
```

## Length of String Value
* Display length of the string value of the variable ` myvar `.
* If ` myvar ` is not set, display ` 0 `.
```bash
echo ${#myvar}
```
### Example 
- Getting length of string returned by ` date ` command stored in a variable.
```terminal
~$ mydate=` date `
~$ echo ${mydate}
Thursday 22 December 2022 04:50:31 PM EET
~$ echo ${#mydate}
41
~$ myvar=
~$ echo ${#myvar}
0
```

## String Operations
### Slice of String Value
* Provide *offset* and *slice_length* separated by ` : `.
* ` ${varname:offset:slice_length} `
* Display *4 chars* of the string value of the variable ` myvar ` skipping first *5 chars*.
* If *slice_length > ${#varname}*, *slice_length = ${#varname}*.
* Offset value can be negative.
```bash
echo ${myvar:5:4}
```
#### Examples
* Extract part of string by using offset from the beginning.
```terminal
~$ myvar=abcdefgh12345678
~$ echo ${myvar:3:3}
def
~$ echo ${mydate:0:6}
Sunday
```

* Extract part of string by using offset from the end.
	- notice ` <space> ` between operator ` : ` and ` - ` sign.
```terminal
~$ myvar=abcdefgh12345678
~$ echo ${myvar: -3:3}
678
~$ echo ${mydate: -3:2}
67
```

* Using command and variable to obtain the same result. 
```terminal
~$ date
Thursday 22 December 2022 05:10:53 PM EET
~$ date +"%d %B %Y"
22 December 2022
~$ mydate=` date `
$ echo ${mydate:9:16}
22 December 2022
```

### Remove Prefix Matching a Pattern 
* Match the string from the beginning.
* Pattern is regex (later)
* ` * ` matches any number of characters.
* Match once using ` # `
```bash
echo ${myvar#pattern}
```

```terminal
~$ myvar=MyFile.tar.gz
~$ echo ${myvar#*.}
tar.gz
~$ echo ${myvar#*.*.}
gz
```
* Match max possible using ` ## `
```bash
echo ${myvar##pattern}
```

```terminal
~$ myvar=MyFile.tar.gz
~$ echo ${myvar##*.}
gz
```

### Remove Suffix Matching a Pattern
* Match the string from the end.
* Match once using ` % `
```bash
echo ${myvar%pattern}
```

```terminal
~$ myvar=MyFile.tar.gz
~$ echo ${myvar%.*}
MyFile.tar
~$ echo ${myvar%.*.*}
MyFile
```

* Match max possible using ` %% `
```bash
echo ${myvar%%pattern}
```
```terminal
~$ myvar=MyFile.tar.gz
~$ echo ${myvar%%.*}
MyFile
~$ echo ${myvar%%.*}.${myvar##*.}
MyFile.gz
~$ echo ${myvar%%.*}.zip
MyFile.zip
```

### Replace Matching Pattern
* Replace matching pattern from anywhere in the string.
* *pattern* and **string** are separated with ` / `
* Match *pattern* once (` / `) and replace with **string**.
```bash
echo ${myvar/pattern/string}
```
* Example 1 - Change only first occurrence of *pattern* with **string**
```terminal
~$ myvar=MyFile.SomeThing.jpeg
~$ echo ${myvar/e/E}
MyFilE.SomeThing.jpeg
```

* Match *pattern* max possible (` // `) and replace with **string**.
```bash
echo ${myvar//pattern/string}
```

```terminal
~$ echo ${myvar//e/E}
MyFilE.SomEThing.jpEg
~$ myvar=MyjpegFile.Something.jpeg
~$ echo ${myvar//jpeg/jpg}
MyjpgFile.Something.jpg
~$ myfname=` echo ${myvar//jpeg/jpg} `
~$ echo $newfname
MyjpgFile.Something.jpg
```

### Replace Matching Pattern by Location
* Match and replace the prefix (` /# `)
	- match at the *beginning*
```bash
echo ${myvar/#pattern/string}
```

```terminal
~$ echo ${myvar/#M/m}
myFile.SomeThing.jpeg
~$ mydate=`date`
~$ newdate=` echo ${mydate/#*day }`
~$ echo $newdate
22 December 2022 05:10:53 PM EET
```

* Match and replace the suffix (` /% `)
	- match at the *end*
```bash
echo ${myvar/%pattern/string}
```

```terminal
~$ echo ${myvar/%jpeg/jpg}
MyFile.SomeThing.jpg
```

### Changing Case to Lower Case
* Uses ` , ` (comma) symbol.
* Changes only view and not the value.
* Change first character to lower case using ` , `
```bash
echo ${myvar,}
```

```terminal
~$ mymonth="MARGALI"
~$ echo ${mymonth,}
mARGALI
```


* Change all character to lower case using ` ,, `
```bash
echo ${myvar,,}
```
```terminal
~$ echo ${mymonth,,}
margali
```

### Changing Case to Upper Case
* Uses ` ^ ` (caret) symbol.
* Changes only view and not the value.
* Change first character to Upper case using ` ^ `
```bash
echo ${myvar^}
```

```terminal
~$ mymonth="margali"
~$ echo ${mymonth^}
Margali
```

* Change all characters to UPPER case using ` ^^ `
```bash
echo ${myvar^^}
```

```terminal
~$ mymonth="margali"
~$ echo ${mymonth^^}
MARGALI
```

## Set or Unset Attributes on  Value Types
* Attributes are some restrictions.
* ` declare [option] varname `
* ` declare [option] varname=value... `
* ` - ` is used to set attribute and ` + ` is used to remove attribute.
### Options which set and unset attributes: 
* ` -i ` : Can only assign ` integer ` values, strings converted to integer 0.
```bash
declare -i myvar
```

```terminal
~$ declare -i mynum=1729
~$ echo $mynum
1729
~$ mynum="hello world"
~$ echo $mynum
0
```

* ` +i ` : Remove integer attribute/restriction
```bash
declare +i myvar
```

```terminal
~$ declare +i mynum
~$ mynum="hello world"
~$ echo $mynum
hello world
```

* ` -l ` : Convert value to lower case on assignment.
```bash
declare -l myvar
```

```terminal
~$ declare -l myvar="HELLO WORLD"
~$ echo ${myvar}
hello world
```

* ` +l ` : Remove lower case restriction.
```bash
declare +l myvar
```

*  ` -u ` : Convert value to upper case on assignment.
```bash
declare -u myvar
```

```terminal
~$ declare -u MYVAR="hello world"
~$ echo ${MYVAR}
HELLO WORLD
```

*  ` +u ` : Remove upper case restriction.
```bash
declare +u myvar
```

* ` -r ` : Make the variable read only. ` + ` can not be used to remove this attribute.
```bash
declare -r myvar
```

```terminal
~$ declare -r PI=3.142
~$ echo $PI
3.142
~$ PI=2.142
bash: PI: readonly variable
~$ declare +r PI
bash: declare: PI: readonly variable
```

## Indexed Arrays
* Declare an indexed array ` arr ` using ` -a ` 
```bash
declare -a arr
```

```terminal
~$ declare -a arr
```

### Indexed Array Operations
* Set value of element with some index in the array.
```bash
arr[0]="value"
```
```terminal
~$ arr[0]=Sunday
~$ arr[1]=Monday
```

* Access value of element with index 0 in the array.
```bash
echo ${arr[0]}
```

```terminal
~$ echo ${arr[0]}
Sunday
~$ echo $arr
Sunday
~$ 
```

* Number of elements in the array (` @ ` : all elements).
```bash
echo ${#arr[@]}
```
```terminal
~$ echo ${#arr[@]}
2
```

* Display all indices used. (Indices in bash array can be sparse.)
```bash
echo ${!arr[@]}
```

```terminal
~$ echo ${!arr[@]}
0 1
```

* Diplay values of all elements in the array.
```bash
echo ${arr[@]}
```

```terminal
~$ echo ${arr[@]}
Sunday Monday
```

* Array indices are sparse
	- indices are sorted in natural order.
```terminal
~$ arr[100]=NotToBeDay
~$ echo ${arr[@]}
Sunday Monday NotToBeDay
$ echo ${!arr[@]}
0 1 100
```

* Delete element with index 100 in the array
```bash
unset 'arr[100]'
```

```terminal
~$ unset 'arr[100]'
~$ echo ${arr[@]}
Sunday Monday
```

* Append an element with a value to the end of the array.
	- Multiple elements can be separated with space
```bash
arr+=("value")
```

```terminal
~$ arr+=(Tuesday)
~$ echo ${arr[@]}
Sunday Monday Tuesday
```

* Array declaration and initialization
	- ` <space> ` as separator.
	- indices start with 0
```terminal
~$ declare -a weekdays=(Sunday Monday Tuesday Wednesday Thursday Friday Saturday)
~$ echo ${!weekdays[@]}
0 1 2 3 4 5 6
~$ echo ${weekdays[@]}
Sunday Monday Tuesday Wednesday Thursday Friday Saturday
```

* ` ls ` command output into array
```terminal
~$ declare -a arr
~$ arr=(` ls `)
```

## Associative Arrays
* Declare an associative array or hash using ` -A `
```bash
declare -A hash
```

```terminal
~$ declare -A hash
```

### Associative Arrays Operations
* set value of element with index ` "a" ` in the array.
```bash
hash["a"]="value"
```
```terminal
~$ hash[0]="Amul"
~$ hash[1]="Gokul"
~$ hash["city"]="Madras"
```

* Access value of element with index ` "a" ` in the array.
```bash
echo ${hash["a"]}
```
```terminal
~$ echo ${hash["city"]}
Madras
```
* Number of elements in the array (` @ ` : all elements).
```bash
echo ${#hash[@]}
```

```terminal
~$ echo ${#hash[@]}
3
```

* Display all indices used. (Indices in bash array can be sparse.)
```bash
echo ${!hash[@]}
```

```terminal
~$ echo ${!hash[@]}
0 1 city
```

* Diplay values of all elements in the array.
```bash
echo ${hash[@]}
```

```terminal
~$ echo ${hash[@]}
Amul Gokul Madras
```

* Delete element with index ` "a" ` in the array
```bash
unset 'hash["a"]'
```

```terminal
~$ unset 'hash["city"]'
~$ echo ${hash[@]}
Amul Gokul
```

Shell Variable Manipulations are FAST!	
