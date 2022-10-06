## LOCATE

### Purpose
Moves the cursor to a specified position on the virtual screen.

### Format

```basic
LOCATE    X-coordinate     ,   Y-coordinate
        -----------------    ------------------
        Numeric expression   Numeric expression
```

### Parameters

1. X-coordinate: Numeric expression truncated to an integer in the range
of 0 <= X-coordinate <= 32
2. Y-coordinate: Numeric expression truncated to an integer in the range
of 0 <= Y-coordinate <= 8

### Explanation
1. Locates the cursor at a specified position on the virtual screen.
2. The origin of the coordinates is the upper left corner of the screen
   (0, 0). The X coordinate value is incremented for each character position
to the right. The Y value coordinate is incremented from each line down.

```
          +-------------------------------+ 
(0, 0) -> |o                             o| <- (31, 0)
          |                               |
          |                               |
          |                               |
          |                               |
          |                               |
          |                               |
(0, 7) -> |o                             o| <- (31, 7)
          +-------------------------------+ 
```

### Sample Program

```basic
10 CLS
20 LOCATE 0,0
30 PRINT "SCREEN UPPPER LEFT";
40 GOTO 20
```

Displays messages from upper left of display.
