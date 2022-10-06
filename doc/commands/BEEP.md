## BEEP

### Purpose
Sounds the buzzer

### Format
```basic
BEEP  { 0 }
      { 1 }
       ___
 Numeric expression
```
## Example

```basic
BEEP 1
```

### Explanation
1. A low tone is specified by `BEEP` or `BEEP 0`.
2. A high tone is specified by `BEEP 1`.
3. Numeric expressions can be in place of 0 or 1.

### Sample Program
```basic
10 BEEP 1 : BEEP 0 : BEEP 1 : BEEP 0
```
