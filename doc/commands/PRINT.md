## PRINT

### Purpose

Displays data on the screen.

### Format

```basic
PRINT [output data] {;} [output data]*
                    {,}
        Output data: TAB (Tab specification), numeric expression,
                     string array
```

### Example

```basic
PRINT "AD1990"
```

### Parameters
output data: Output control function, numeric expression or string expression.

### Explanation 
1. Output of a numeric or string expression displays the value or string
on the screen. Control function output results in the operation determined 
by the function being performed. 
2. Numeric expressions are displayed in decimal notation with values longer
than 10 digits.
  - Integers: Values less than 1 x 10^10
  - Fraction: Decimal fractions smaller than 10 digits
  - Exponent: Other values
  A space is added after displayed numeric expressions, with negative
  expressions preceded by a minus sign, and positive expressions preceded
  by a space. Expressions are displayed as integers, fractions, or
  exponential expressions, with the display format automatically selected
  according to the value of the expression.
3. String expressions are dsplayed unchanged. There are, however, special 
operations for internal codes 00H~1FH, 7FH 
(see [CHARACTER CODE TABLE](../other/CHARACTER_CODE_TABLE.md).
4. Output is displayed on the screen from the current position of the cursor
to the right. A line feed results when the cursor reaches the last column
on the last line of the screen (lower right), scrolling the entire screen
upwards. Subsequent output is displayed from the beginning of the bottom line
of the screen (lower left).
5. Separating output data with commas causes execution to be halted with each
display (`STOP` appears on display). Pressing `EXE` executes a carrier 
return/line feed and proceeds the next display.
6. Separating output data with semicolons causes each output to be displayed
immediately following the previous output.
7. Including a semicolon at the end of this statement causes the cursor to
remain at position immediately following the displayed output.
8. Ending this command with output data or a comma, causes execution to be 
halted following display of the output data (`STOP` appears on the display).
Pressing `EXE` executes a line change and proceeds the next display.
9. Omitting the output data (`PRINT` command only) executes a line change
without halting execution.
10. Execution is not halted when this statement is executed while in the 
print mode ( `MODE` `7`).
11. Execution is not halted when this statement is executed while in the 
manual mode.

### See
 - [TAB](TAB.md)

### Sample Program
```basic
10 PRINT "PRINT DISPLAYS MESSAGES"
20 PRINT "ON THE SCREEN"
```

`PRINT` statement displays message on screen.
