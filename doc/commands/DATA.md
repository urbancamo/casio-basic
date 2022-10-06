## DATA

### Purpose
Holds data for reading by the [READ](READ.md) statement.

### Format

```basic
DATA [data] [, [data]]
      ----      ----
     Constant  Constant
```

### Example

```basic
DATA 10, 5, 8, 3
DATA CAT, DOG, LION
```

### Parameters

1. data: String constants or numeric constants
2. string constants: Quotation marks are not required unless the string 
contains a comma which is part of the data. A null data string (length 0)
is assumed when data is omitted from this statement.

### Explanation
1. This statement can be used anywhere in the program to hold data to be 
read by the READ command.
2. Multiple data items are separated by commas.

### See
 - [READ](READ.md)
 - [RESTORE](RESTORE.md)

### Sample Program

```basic
10 READ A$
20 RESTORE 60
30 READ B$
40 PRINT A$ + " " + B$
50 DATA AD 1990, ABC
60 DAT DEFG
```

Character data "AD1990" and "DEFG" read from lines 50 and 60, and displayed.