## READ

### Purpose

Reads the contents of the [DATA](DATA.md) statement into memory.

### Format

```basic
READ Variable name [, Variable name]*
```

### Example

```basic
READ A, B
READ C$, X, Y
```

### Parameters

Variable name

### Explanation
1. Assigns the data contained in a [DATA](DATA.md) statement to the variables
on a one-by-one basis.
2. Numeric data can only be assigned to numeric variables, and string data
can only be assigned to string variables. A [TM](../errors/TM.md) error is generated when an
attempt is made to assign string data to a numeric variable, and vice versa.
3. The data in [DATA](DATA.md) statements is read from the lowest line
number in ascending order. Data are read in order from the beginning of a 
[DATA](DATA.md) statement. Subsequent executions read data items in 
sequential order. 
4. The first execution of the READ statement reads the first data item contained
in the first [DATA](DATA.md) statement. Subsequent executions read data items
in sequential order.
5. The data line to be read can be specified using the [RESTORE](RESTORE.md) 
6. statement.

### See
- [DATA](DATA.md)
- [RESTORE](RESTORE.md)

### Sample Program

```basic
10 READ X
20 IF X <> 0 THEN PRINT X;: GOTO 10
30 END
100 DATA 1,2,3,4,5,6,7,8,9
110 DATA 9,8,7,6,5,4,3,2,1
120 DATA 0
```

Sequentially reads data beginning at line 100 and stops execution when 0 
is encountered as data.
