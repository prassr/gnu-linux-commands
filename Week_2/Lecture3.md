# Shell Variables Part - 1
* Creationm, inspection, modifictaion, lists...

## Creating a Variable
* ` varname="value string" `
	- Example: Create and display variable ` myvar ` with value ` 10 `
```terminal
~$ myvar=10
~$ echo $myvar
10
```
	- Example: Change value of variable ` myvar `
```terminal
~$ myvar="hello world"
~$ echo $myvar
hello world
```
* Variable name can have mix of alpha-numeric chars and _. 
* It name does not start with a number.
* There are no spaces around `=` (assignment operator).
* A value can be number, string or a ` ` command ` `.
* Safer to enclose string value within double quotes.


## Exporting a Variable
* Make variable available within environment and to the subshell.
* It can be done in following ways
	- ` export myvar="value string" `
	- ` myvar="value string" `
	  ` export myvar `


## Using Variable Values
* Refering by variable name using ` $ `.
	- ` echo $myvar `
	- ` echo ${myvar}`
	- ` echo "${myvar}_something" `

## Removing a Variable
* Delete the variable.
	- ` unset myvar `
## Removing Value of a Variable
* Set the value of variable as 	` null `
	- ` myvar= `
	
## Test if a Variable is Set
```bash
[[ -v myvar ]];
echo $?
```
* Return codes:
	- ` 0 ` : success (variable ` myvar ` is set)
	- ` 1 ` : failure (variable ` myvar ` is not set) 

## Test if a Variable is *Not* Set
```bash
[[ -z ${myvar+x} ]];
echo $?
```
* ` -z ` works oppsite to ` -v `
* ` x ` can be any string
* Return codes:
	- ` 0 ` : success (variable ` myvar ` is not set)
	- ` 1 ` : failure (variable ` myvar ` is set) 


## Substitute Default Value
* If the variable ` myvar ` is not set, use ` "default" ` as its default value.
```bash
echo ${myvar:-"default"}
```
* There are no spaces around ` :- `
* Pseudocode : 
> if ` myvar ` is set:
> 	display its value
> else:
> 	display "default"

* If the variable ` myvar ` is *not* set, then set ` "default" ` as it's value.
```bash
echo ${myvar:="default"}
```
* There are no spaces around ` := `
* Pseudocode : 
> if ` myvar ` is set:
> 	display its value
> else:
> 	set "default" as its value
> 	display its new value
	
## Reset Value if Variable is Set
* If the variable ` myvar ` is set, then set "default" as its value.
```bash
echo ${myvar:+"default"}
```
* There are no spaces around ` :+ `
* Pseudocode : 
> if ` myvar ` is set:
> 	set "default" as its value
> 	display its new value	
> else:
> 	display its value

## List of Variable Names
* List of names of shell variables that start with ` H `
```bash
~$ echo ${!H*}
HISTCMD HISTCONTROL HISTFILE HISTFILESIZE HISTSIZE HOME HOSTNAME HOSTTYPE
```

## Length of String Value
* Display length of the string value of the variable ` myvar `.
* If ` myvar ` is not set, display ` 0 `
```bash
echo ${#myvar}
```

## String Operations
### Slice of String Value
* Provide *offset* and *slice_length* are separated by ` : `.
* ` ${varname:offset:slice_length} `
* Display *4 chars* of the string valur of the variable ` myvar ` skipping first *5 chars*.
* If *slice_length > ${#varname}*, *slice_length = ${#varname}*.
* If offset is negative.
```bash
echo ${myvar:5:4}
```

### Remove Prefix Matching a Pattern 
* Match the string from the beginning.
* Pattern is regex (later)
* ` . ` matches single character, ` * ` matches any number of characters.
* Match once using ` # `
```bash
echo ${myvar#pattern}
```
* Match max possible using ` ## `
```bash
echo ${myvar##pattern}
```

### Remove Suffix Matching a Pattern
* Match the string from the end.
* Match once using ` % `
```bash
echo ${myvar%pattern}
```
* Match max possible using ` %% `
```bash
echo ${myvar%%pattern}
```

### Replace Matching Pattern
* Replace matching pattern from anywhere in the string.
* *pattern* and **string** are separated with ` / `
* Match *pattern* once (` / `) and replace with **string**.
```bash
echo ${myvar/pattern/string}
```
* Match *pattern* max possible (` // `) and replce with **string**.
```bash
echo ${myvar//pattern/string}
```

### Replace Matching Pattern by Location
* Match and replace the prefix (` /# `)
	- match at the *beginning*
```bash
echo ${myvar/#pattern/string}
```
* Match and replace the suffix (` /% `)
	- match at the *end*
```bash
echo ${myvar/%pattern/string}
```

### Changing Case to Lower Case
* Uses ` , ` (comma) symbol.
* Changes only view and not the value.
* Change first character to lower case using ` , `
```bash
echo ${#myvar,}
```
* Change all character to lower case using ` ,, `
```bash
echo ${#myvar,,}
```

### Changing Case to Upper Case
* Uses ` ^ ` (caret) symbol.
* Changes only view and not the value.
* Change first character to Upper case using ` ^ `
```bash
echo ${#myvar^}
```
* Change all character to UPPER case using ` ^^ `
```bash
echo ${#myvar^^}
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
* ` +i ` : Remove integer attribute/restriction
```bash
declare +i myvar
```
* ` -l ` : Convert value to lower case on assignment.
```bash
declare -l myvar
```
* ` +l ` : Remove lower case restriction.
```bash
declare +l myvar
```
*  ` -u ` : Convert value to upper case on assignment.
```bash
declare -u myvar
```
*  ` +u ` : Remove upper case restriction.
```bash
declare +u myvar
```
* ` -r ` : Make the variable read only. ` + ` can not be used to remove this attribute.
```bash
declare -r myvar
```

## Indexed Arrays
* Declare an indexed array ` arr ` using ` -a `
```bash
declare -a arr
```
### Indexed Array Operations
* set value of element with index 0 in the array.
```bash
$arr[0]="value"
```
* Access value of element with index 0 in the array.
```bash
echo ${arr[0]}
```
* Number of elements in the array (` @ ` : all elements).
```bash
echo ${#arr[@]}
```
* Display all indices used. (Indices in bash array can be sparse.)
```bash
echo ${!arr[@]}
```
* Diplay values of all elements in the array.
```bash
echo ${arr[@]}
```
* Delete element with index 2 in the array
```bash
unset 'arr[2]'
```
* Append an element with a value to the end of the array.
```bash
arr+=("value")
```

## Associative Arrays
* Declare an associative array or hash using ` -A `
```bash
declare -A hash
```
### Associative Arrays Operations
* set value of element with index ` "a" ` in the array.
```bash
$hash["a"]="value"
```
* Access value of element with index ` "a" ` in the array.
```bash
echo ${hash["a"]}
```
* Number of elements in the array (` @ ` : all elements).
```bash
echo ${#hash[@]}
```
* Display all indices used. (Indices in bash array can be sparse.)
```bash
echo ${!hash[@]}
```
* Diplay values of all elements in the array.
```bash
echo ${hash[@]}
```
* Delete element with index ` "a" ` in the array
```bash
unset 'hash["a"]'
```

Shell Variable Manipulations are FAST!	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
