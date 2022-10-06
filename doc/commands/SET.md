## SET 

### Purpose
Specifies output format of numeric data

### Format
```basic
       + F     number of digits
       |     ---------------------
       |     Single character; 0~9
 SET   |
       | E     number of digits
       |     ---------------------
       |     single character; 0~9
       + N  
```

### Example
```basic
SET F3
```

### Parameters
```F number of digits``` Specifies number of decimal places.
```E number of digits``` Specifies number of significant digits.
```N``` Cancels current specification.

### Explanation
1. This command specifies the number of decimal places and the number of 
significant digits for numeric data output to the display, printer, tape
recorder or RS-232C terminal.
2. The number of decimal places can be specified within the range of 0 through 9.
3. The number of significant digits can be specified within the range of 1
through to 10. 
4. The statement ```SET N``` cancels both specifications.
5. Output values are rounded to the specified decimal places or to the
specified significant digits.
6. This command is only valid for output data. The mantissa part for internal
calculations is still 12 digits.

### Sample Program

```basic
10 A = 10/3
20 SET F
30 PRINT A
40 SET E2
50 PRINT A
60 END
```


```
RUN
EXE
 3.33
EXE
 3.33
 3.3E+00
EXE
 3.3E+00
 3.333333333_
EXE
 3.33333333
```

Result of 10/3 displayed with 2 decimal places, 2 signficant digits, 
and specification cancelled.