## INPUT$

### Purpose
Assigns a specified number of characters from the keyboard to a variable.

### Format
```basic
INPUT$  (number of characters)
         --------------------
          Numeric expression
```

### Parameters
number of characters: Numeric expression truncated to an integer in the
range of 0 <= number of characters <= 256

### Explanation
1. A string of the length specified by the number of characters is read from
the keyboard buffer. Execution waits for the keyboard input when the buffer is empty.
2. The following operations are performed when the keys listed below are pressed
during execution of `INPUT$`.
   **BRK**: Halts program execution.
   One-key commands and one-key functions: Return a null string.
3. The cursor is not displayed during data input stand by, and input characters
are not displayed. Control codes (&H00~&H1F) can be input, but the 
corresponding operations will not be performed.

### See
 - [INKEY$](INKEY_STRING.md)

### Sample Program

```basic
10 PRINT "ENTER SECRET CODE";
20 ID$=INPUT$(4)
30 IF ID$<>"9876" THEN 10
40 PRINT: PRINT "OK"
```

Checks for validity of input secret code 9876.
