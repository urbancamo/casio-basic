## INPUT 

### Purpose
Assigns keyboard data input to a variable.

### Format
```basic
INPUT ["message" {;}] variable [, ["message" {;}], variable
                 {,}   name                  {,}    name
```

### Example
```basic
INPUT "YEAR=", Y, "MONTH=", M, "DAY=", D
```

### Parameters
1. message: Character string beginning with a string constant
2. variable name: Numeric variable name or string variable name

### Explanation
1. Data can be input to the specified variable from the keyboard.
2. Messages included in the `INPUT` statement are displayed. A question mark
is displayed following the message when a semicolon is included following
the message specification.
3. A question mark only is displayed when a message is not specified.
4. The **EXE** key must be pressed following each data input.
5. Numeric expressions can only be assigned to numeric variables, and 
string expressions can only be assigned to string variables. A 
[TM](../errors/TM.md) error is generated when an attempt is made to 
assign a string expression to a numeric variable.
6. Quotation marks are not used when entering string data. Enclosing a string
in quotation marks causes the quotation marks to be stored as part of the string.
7. Pressing the **EXE** key without entering data inputs a string of length 0
for a string variable, when a numeric variable retains its current value.
8. Generally, the logical line immediately following the message is input.
The cursor can, however, be moved to any position on the virtual screen
   (using the cursor keys), and all data from the current cursor
position to the end of the current logical line are input when **EXE** is 
pressed.
9. Numeric expressions may be used for numeric value input.
10. Pressing the **IN** key or changing modes during execution of the `INPUT`
statement terminates program execution.
11. Pressing the **IN** key during execution of `INPUT` leaves program
execution.
12. Input data can be edited using the **INS** key, cursor keys, etc.
    Character data can be input within the range of character codes 20 through 7E and 80 through FF.

### Sample Program

```basic
10 INPUT "INPUT STRING"; S$
20 PRINT "S$="; S$
30 END
```

Displays string entry.
