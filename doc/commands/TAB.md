## TAB

### Purpose

Outputs a horizontal tab specification to the screen or printer.

### Format

```basic
TAB        (tab specification)
   ------------------------------------
   Numeric constant or numeric variable
```

### Example

```basic
PRINT TAB (5) ; "ABC"
```

### Parameters
tab specification: Numeric expression truncated to an integer in the range
of 0 <= tab specification <= 256.

### Explanation
1. Used in the [PRINT](PRINT.md), [LPRINT](LPRINT.md), and [PRINT#](PRINT_HASH.md)
statements to specify a display position on a line. Spaces are inserted
from the left end of the line to the specified position.
2. The display position is determined by counting from the left end of the line
   (position 0 and) to the right, up to the specified value.
3. A tab specification value which is less than the current printhead
position causes the tabulation to be performed following a carrier
return/line feed.

### See
 - [PRINT](PRINT.md)
 - [LPRINT](LPRINT.md)
 - [PRINT#](PRINT_HASH.md)

### Sample Program
```basic
10 FOR I=0 TO 25
20 PRINT TAB(I); "ABCDEFG"; 
30 NEXT I
```

Prints successive lines of "ABCDEFG", with each line proceeding to the 
right.
