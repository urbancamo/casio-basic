## LET

### Purpose

Assigns the value of an expression on the right side of an equation to the 
variable on the left side

### Format

`LET` numeric variable name = Numeric expression
`LET` string variable name = String expression

### Example

```basic
LET A = 15
LET K$ = "123"
```

### Explanation

1. Assigns the value of an expression on the right side of an equation 
to the variable on the left side.
2. Numeric expressions can only be assigned numeric variables, and string
expressions can only be assigned to string variables. A `TM` error is generated
when an attempt is made to assign a string expression to a numeric variable,
and visa versa.
3. `LET` may be ommitted.

### Sample Program

```basic
10 LET A = 10
20 B = 20
30 PRINT A ; B
```

Assigns 10 to variable A and 20 to variable B, and displays both.
