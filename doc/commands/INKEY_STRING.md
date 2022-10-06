## INKEY#

### Purpose

Assigns a single character input from the keyboard to a variable.

### Example 

```basic
A$ = INKEY$
```

### Explanation
1. Returns the character or performs the function corresponding to the key
pressed during execution of this statement. A null string is returned
if a key is not pressed.
2. The following operations are performed when the keys listed below are
pressed during execution of `INKEY$`.
  - **BRK**: Terminates program execution.
  - **STOP**: Suspends program execution.
  - One-key commands and one-key functions: Return a null string.
3. The cursor is not displayed during data input stand by, and input 
characters are not displayed. Control codes (00H~1FH) can be input, but the 
corresponding opertions will not be performed.

### See
 - [INPUT$](INPUT_STRING.md)

### Sample Program
```basic
10 PRINT "PRESS ANY KEY";
20 C$=INKEY$
30 IF C$=" " THEN 20
40 CLS: PRINT "YOU PRESS "; C$; "KEY"
50 END
```

Displays character corresponding to key input.
