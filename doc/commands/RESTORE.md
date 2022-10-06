## RESTORE

### Purpose

Specifies a [DATA](DATA.md) line fir reading by the READ statement.

### Format

```basic
RESTORE [line number]
         -----------
     numeric expression
```

### Examples

```basic
RESTORE
RESTORE 1000
RESTORE (10*10)
         -----
        line 100
```

### Parameters

line number: Integer in the range of 1 <= line number <= 65535

### Explanation

1. The first [DATA](DATA.md) line in the program file containing the READ 
statement is the default option when the line number is omitted.
2. When a line number is specified, the first data item in the specified
[DATA](DATA.md) line is read by the next READ statement execution. 
A [UL](../errors/UL.md) error is generated when the specified line number
does not exist, while a [DA](../errors/DA.md) error is generated when no
data exists in the specified line.
3. A numeric expression can be used for line number specification. In this
case, the numeric expression must be enclosed in parentheses.

### See

- [READ](READ.md)
- [DATA](DATA.md)

### Sample Program

```basic
10 READ X
20 IF X<> 0 THEN PRINT X;: GOTO 10
30 RESTORE 110
40 READ X
50 IF X<>0 THEN PRINT X;: GOTO 40
60 END
100 DATA 1,2,3,4,5,6,7,8,9
110 DATA 9,8,7,6,5,4,3,2,1
120 DATA 0
```

Lines 10~20 read data from lines 100~120, while lines 30~50 read data from
lines 110~120 then display them.
