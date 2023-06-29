# Common Instructions for questions 1 to 3

Consider shopping bill dataset stored in directory ` shopping-bills `.

```terminal
~$ pwd
/home/a/shopping-bills
```

Click [here](https://drive.google.com/drive/folders/1nrYE8GJfZWfRItT2FKKm9YD9qroFGzaf?usp=share_link) to access the files.

It contains text files which has data about a customer who has made purchase at a particular shop (inspect a file yourself to find more information). There are 30 files in the directory.

As an example one of the text files name is ` shopping_bill_1.txt `.

# Q1

Write an `awk` script which accepts an integer variable ` i ` and processes a file with name ` shopping_bill_i.txt `. 
And prints

```text
CUSTOMER NAME : customer-name
SHOP NAME : shop-name
NUMBER OF ITEMS PURCHASED : number
TOTAL BILL : number
```

If file containing ` i ` does not exist the output should be

```text
FILE NOT FOUND 
```

# Q2

Write an ` awk ` script which reads a variable ` customer_name ` and prints

```text
CUSTOMER NAME : customer_name
NUMBER OF UNIQUE SHOPS VISITED : number
AVERAGE NUMBER OF PURCHASES PER SHOP : number
AVERAGE SPENDING PER SHOP : number
```

# Q3 

Write an `awk` script which reads a variable `shop-name` and prints

```text
NAME OF THE SHOP : shop-name
NUMBER OF UNIQUE CUSTOMERS : number
MOST PURCHASED ITEM : item-name
MOST PURCHASED ITEM CATEGORY : category
MOST PURCHASED ITEM PRICE : number
```

# Common Instructions for Questions 4 to 9

Consider a directory named ` employee-data `.

```terminal
~$ pwd
/home/a/employee-data
```

There are regular files in this data set with name employee id.
A file name as an example is ` 1999A005 `.

Click [here](https://drive.google.com/file/d/1IZDt2npq9uOP3msCbkTL-0PHfgH3eTbh/view?usp=share_link) to get the zip file which contains the data.

# Q4

In an employee data file the **JOINING DATE** is of the form ` YYYY/MM/DD ` format.

Write a ` sed ` (use BRE and then ERE) command when run on a file converts the **JOINING DATE** format to ` DD-MM-YYYY ` in place.

# Q5

Use the above solution to write a ` bash ` script which changes the **JOINING DATE** of all the employees in the ` pwd `. Suppress all errors.

# Q6

Write a ` bash ` script which prints ` min ` **CTC**, ` max ` **CTC** and ` avg ` **CTC** of the employees which are there in file named ` appraisal_list `.

# Q7

Write a ` bash ` script which gives salary hike of 1.25 to the employees found in file ` appraisal_list `. This should change the files in place. You can create temporary files if you think is needed.

# Q8

Write an ` awk ` script to read a character ` C ` (one of A, E, M, S) as a department and prints

```text
DEPARTMENT : C
NUMBER OF EMPLOYEES : number
NUMBER OF EMPLOYEES WHO GOT SALARY HIKE : number
MIN SALARY : number
MAX SALARY : number
AVERAGE SALARY : number.
```

# Q9

Write an ` awk ` script to read a character ` C ` (one of A, E, M, S) as a department and prints information below about the longest serving employee.

```text
DEPARTMENT : C
EMPLOYEE NAME : name
IS APPRAISED : boolean
CTC : number
```
