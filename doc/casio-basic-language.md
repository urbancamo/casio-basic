# Casio Basic Language

The reference document is the [Casio FX-850P Owners Manual](manuals/Casio_FX-850p_Owners_Manual.pdf).

## Commands

All commands are reserved words.

| Command                                 | Description                                                                                                                                                                                                                                    | Manual Page |
|-----------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------:|
| [&H](commands/AMP_H.md)                 | Converts the 1 through 4-digit hexadecimal value following &H to a decimal value                                                                                                                                                               |         155 |
| [ABS](commands/ABS.md)                  | Returns the absolute value of the argument                                                                                                                                                                                                     |         137 |
| [ACS](commands/ACS.md)                  | Returns the character code corresponding to the character in the first (leftmost) position of a string                                                                                                                                         |         147 |
| [AND](commands/LOGICAL.md)              | Logical AND operator                                                                                                                                                                                                                           |          58 |
| [ANGLE](commands/ANGLE.md)              | Specifies the angle unit                                                                                                                                                                                                                       |         129 |
| [ASC](commands/ASN_ACS_ATN.md)          | Returns the value of the Inverse Cosine trigonometric function for the argument                                                                                                                                                                |         131 |
| [ASN](commands/ASN_ACS_ATN.md)          | Returns the value of the Inverse Sine trigonometric function for the argument                                                                                                                                                                  |         131 |
| [ATN](commands/ASN_ACS_ATN.md)          | Returns the value of the Inverse Tan trigonometric function for the argument                                                                                                                                                                   |         131 |
| [BEEP](commands/BEEP.md)                | Sounds the buzzer                                                                                                                                                                                                                              |         117 |
| [CHR$](commands/CHR_STRING.md)          | Returns a single character which corresponds to the specified character code                                                                                                                                                                   |         146 |
| [CLEAR](commands/CLEAR.md)              | Clears all variables and determines the variable area size in accordance with the parameter entered                                                                                                                                            |          89 |
| [CLOSE](commands/CLOSE.md)              | Closes files and declares an end to the use of the I/O (input/output) buffer                                                                                                                                                                   |         162 |
| [CLS](commands/CLS.md)                  | Clears the display screen                                                                                                                                                                                                                      |         115 |
| [COS](commands/SIN_COS_TAN.md)          | Returns the value of the Cosine trigonometric function value for the argument                                                                                                                                                                  |         130 |
| [CUR](commands/CUR.md)                  | Returns cube root of argument                                                                                                                                                                                                                  |         136 |
| [DATA](commands/DATA.md)                | Holds data for reading by the READ statement                                                                                                                                                                                                   |         108 |
| [DEFSEG](commands/DEFSEG.md)            | Specifies segment base address                                                                                                                                                                                                                 |         125 |
| [DEG](commands/DEG.md)                  | Converts a sexagesimal value to a decimal value                                                                                                                                                                                                |         156 |
| [DIM](commands/DIM.md)                  | Declares an array                                                                                                                                                                                                                              |         121 |
| [DMS$](commands/DMS_STRING.md)          | Converts a decimal value to a sexagesimal string                                                                                                                                                                                               |         157 |
| [EDIT](commands/EDIT.md)                | Enters the BASIC edit mode                                                                                                                                                                                                                     |          93 |
| [ELSE](commands/IF_THEN_ELSE.md)        | Executes the THEN statement or GOTO statement when the specified condition is met. The ELSE statement is executed when the specified condition is not met                                                                                      |         103 |
| [END](commands/END.md)                  | Terminates program execution                                                                                                                                                                                                                   |          96 |
| [EOF](commands/EOF.md)                  | Indicates the end of file reading                                                                                                                                                                                                              |         166 |
| [ERASE](commands/ERASE.md)              | Erases a specified array                                                                                                                                                                                                                       |         122 |
| [ERL](commands/ERL.md)                  | Returns the number of a line in which an error has been generated                                                                                                                                                                              |         128 |
| [ERR](commands/ERR.md)                  | Returns the error code which corresponds to a generated error                                                                                                                                                                                  |         128 |
| [ERROR](commands/ON_ERROR_GOTO.md)      | Specifies the line number to which execution branches when an error is generated                                                                                                                                                               |         126 |
| [EXP](commands/EXP.md)                  | Returns the value of the exponential function for the argument                                                                                                                                                                                 |         134 |
| [FACT](commands/FACT.md)                | Returns the factorial of argument                                                                                                                                                                                                              |         142 |
| [FIX](commands/FIX.md)                  | Returns the integer part of the argument                                                                                                                                                                                                       |         139 |
| [FOR](commands/FOR_NEXT_STEP.md)        | Executes the program lines between the FOR statement and NEXT statement and increments the control variable, starting with the initial value. Execution is terminated when the value of the control variable exceeds the specified final value |         104 |
| [FRAC](commands/FRAC.md)                | Returns the fractional part of the argument                                                                                                                                                                                                    |         140 |
| [FRE](commands/FRE.md)                  | Returns memory area size in accordance with argument                                                                                                                                                                                           |          91 |
| [GOSUB](commands/GOSUB.md)              | Jumps to a specified subroutine                                                                                                                                                                                                                |          99 |
| [GOTO](commands/GOTO.md)                | Branches unconditionally to a specified branch destination                                                                                                                                                                                     |          98 |
| [HEX$](commands/HEX_STRING.md)          | Returns a hexadecimal string for a decimal value specified in the argument                                                                                                                                                                     |         154 |
| [HYP ACS](commands/HYP_ASN_ACS_ATN.md)  | Returns the value of the Inverse Hyperbolic Sine trigonometric function for the argument                                                                                                                                                       |         133 |
| [HYP ASN](commands/HYP_ASN_ACS_ATN.md)  | Returns the value of the Inverse Hyperbolic Cosine trigonometric function for the argument                                                                                                                                                     |         133 |
| [HYP ATN](commands/HYP_ASN_ACS_ATN.md)  | Returns the value of the Inverse Hyperbolic Tan trigonometric function for the argument                                                                                                                                                        |         133 |
| [HYP SIN](commands/HYP_SIN_COS_TAN.md)  | Returns the value of the Hyperbolic Sine trigonometric function for the argument                                                                                                                                                               |         132 |
| [HYP COS](commands/HYP_SIN_COS_TAN.md)  | Returns the value of the Hyperbolic Cosine trigonometric function for the argument                                                                                                                                                             |         132 |
| [HYP TAN](commands/HYP_SIN_COS_TAN.md)  | Returns the value of the Hyperbolic Tan trigonometric function for the argument                                                                                                                                                                |         132 |
| [IF](commands/IF_THEN_ELSE.md)          | Executes the THEN statement or GOTO statement when the specified condition is met. The ELSE statement is executed when the specified condition is not met                                                                                      |         103 |
| [INKEY$](commands/INKEY_STRING.md)      | Assigns a single character input from the keyboard to a variable                                                                                                                                                                               |         119 |
| [INPUT](commands/INPUT.md)              | Assigns keyboard data input to a variable                                                                                                                                                                                                      |         118 |
| [INPUT$](commands/INPUT_STRING.md)      | Assigns a specified number of characters from the keyboard to a variable                                                                                                                                                                       |         120 |
| [INPUT#](commands/INPUT_HASH.md)        | Reads data from a sequential file                                                                                                                                                                                                              |         164 |
| [INT](commands/INT.md)                  | Returns the largest integer which does not exceed the value of the argument                                                                                                                                                                    |         139 |
| [LEFT$](commands/LEFT_STRING.md)        | Returns a substring of a specified length counting from the left of a string                                                                                                                                                                   |         153 |
| [LEN](commands/LEN.md)                  | Returns a value which represents the number of characters contained in a string                                                                                                                                                                |         154 |
| [LET](commands/LET.md)                  | Assigns the value of an expression on the right side of an equation to the variable on the left side                                                                                                                                           |         107 |
| [LIST](commands/LIST.md)                | Displays all or a part of the current specified program                                                                                                                                                                                        |          92 |
| [LIST ALL](commands/LIST.md)            | Displays all programs in sequence from area P0 through P9                                                                                                                                                                                      |          92 |
| [LIST#](commands/LIST_HASH.md)          | Displays all DATA BANK data                                                                                                                                                                                                                    |         170 |
| [LLIST](commands/LLIST.md)              | Outputs program contents to the printer                                                                                                                                                                                                        |         158 |
| [LLIST#](commands/LLIST_HASH.md)        | Outputs all DATA BANK data to printer                                                                                                                                                                                                          |         171 |
| [LN](commands/LN.md)                    | Returns the value of the Natural Logarithm function for the argument                                                                                                                                                                           |         135 |
| [LOAD](commands/LOAD_LOAD_ALL.md)       | Reads a file into memory                                                                                                                                                                                                                       |         168 |
| [LOAD ALL](commands/LOAD_LOAD_ALL.md)   | Reads ALL files from cassette tape into areas P0 to P9                                                                                                                                                                                         |         168 |
| [LOAD#](commands/LOAD_HASH.md)          | Reads data into DATA BANK area                                                                                                                                                                                                                 |         172 |
| [LOCATE](commands/LOCATE.md)            | Moves the cursor to a specified position on the virtual screen                                                                                                                                                                                 |         114 |
| [LOG](commands/LOG.md)                  | Returns the value of the Common Logarithm function for the argument                                                                                                                                                                            |         135 |
| [LPRINT](commands/LPRINT.md)            | Output text to the printer                                                                                                                                                                                                                     |         159 |
| [MID$](commands/MID_STRING.md)          | Returns a substring of a specified length from a specified position within a string                                                                                                                                                            |         151 |
| [MOD](commands/MOD.md)                  | Arithmetic Operator giving the remainder of division with the sign of the dividend                                                                                                                                                             |          57 |
| [NCR](commands/NCR.md)                  | Returns the combination *n*C*R* for the values of *n* and *r*                                                                                                                                                                                  |         143 |
| [NEW](commands/NEW.md)                  | Deletes a program                                                                                                                                                                                                                              |             |
| [NEW ALL](commands/NEW.md)              | Clears the programs in all program areas and all variables                                                                                                                                                                                     |          89 |
| [NEW#](commands/NEW_HASH.md)            | Clears DATA BANK data                                                                                                                                                                                                                          |         170 |
| [NEXT](commands/FOR_NEXT_STEP.md)       | Executes the program lines between the FOR statement and NEXT statement and increments the control variable, starting with the initial value. Execution is terminated when the value of the control variable exceeds the specified final value |         104 |
| [NOT](commands/LOGICAL.md)              | Logical Negation Operator                                                                                                                                                                                                                      |          57 |
| [NPR](commands/NPR.md)                  | Returns the permutation *n*P*r* for the values of *n* and *r*                                                                                                                                                                                  |         143 |
| [ON ERROR GOTO](commands/ON_ERROR_GOTO) | Specifies the line number to which execution branches when an error is generated                                                                                                                                                               |         126 |
| [ON GOTO](commands/ON_GOTO.md)          | Jumps to a specified branch destination in accordance with a specified branching condition                                                                                                                                                     |         101 |
| [ON GOSUB](commands/ON_GOSUB.md)        | Jumps to a specified subroutine in accordance with a specified branching condition                                                                                                                                                             |         102 |
| [OPEN](commands/OPEN.md)                | Declares a file open for use                                                                                                                                                                                                                   |         161 |
| [OR](commands/LOGICAL.md)               | Logical OR operator                                                                                                                                                                                                                            |          58 |
| [PASS](commands/PASS.md)                | Specifies or cancels a password                                                                                                                                                                                                                |          88 |
| [PBGET](commands/PBGET.md)              | Reads the data file contents under the specified filename and assigns them to $ variable, A() array or A$() array                                                                                                                              |          82 |
| [PBLOAD](commands/PBLOAD.md)            | Load PB-100 series programs from cassette tape                                                                                                                                                                                                 |          80 |
| [PBLOAD#](commands/PBLOAD.md)           | Reads data from the specified filename into the DATA BANK                                                                                                                                                                                      |          82 |
| [PBLOAD ALL](commands/PBLOAD.md)        | Loads all PB-100 series programs from cassette tape                                                                                                                                                                                            |          80 |
| [PEEK](commands/PEEK.md)                | Returns the value stored at the specified memory address                                                                                                                                                                                       |         123 |
| [PI](commands/PI.md)                    | Returns the value of π                                                                                                                                                                                                                         |         142 |
| [POKE](commands/POKE.md)                | Writes data to a specified address                                                                                                                                                                                                             |         124 |
| [POL](commands/POL.md)                  | Converts rectangular coordinates *(x,y)* to polar coordinates *(r, θ)*                                                                                                                                                                         |         144 |
| [PRINT](commands/PRINT.md)              | Displays data on the screen                                                                                                                                                                                                                    |         111 |
| [PRINT](commands/PRINT_HASH.md)         | Outputs data to a sequential file                                                                                                                                                                                                              |         163 |
| [RAN#](commands/RAN_HASH.md)            | Returns a random value in the range of 0 to 1                                                                                                                                                                                                  |         141 |
| [READ](commands/READ.md)                | Reads the contents of the DATA statement into memory                                                                                                                                                                                           |         109 |
| [READ#](commands/READ_HASH.md)          | Reads data from DATA BANK area                                                                                                                                                                                                                 |         173 |
| [REC](commands/REC.md)                  | Converts polar coordinates *(r, θ)* to rectangular coordinates *(x,y)*                                                                                                                                                                         |         145 |
| [REM](commands/REM.md)                  | Allows remarks or comments to be included within a program. This command is not executed.                                                                                                                                                      |         106 |
| [RESTORE](commands/RESTORE.md)          | Specifies a DATA line for reading by the READ statement                                                                                                                                                                                        |         110 |
| [RESTORE#](commands/RESTORE_HASH.md)    | Searches specific data in the DATA BANK area and changes the read sequence of DATA BANK data                                                                                                                                                   |         174 |
| [RESUME](commands/RESUME.md)            | Returns from an error handling routine to the main routine                                                                                                                                                                                     |         127 |
| [RETURN](commands/RETURN.md)            | Returns execution from a subroutine to a main program                                                                                                                                                                                          |         100 |
| [RIGHT$](commands/RIGHT_STRING.md)      | Returns a substring of a specified length counting from the right of a string                                                                                                                                                                  |         152 |
| [ROUND](commands/ROUND.md)              | Rounds the argument at the specified digit                                                                                                                                                                                                     |         140 |
| [RUN](commands/RUN.md)                  | Executes a program                                                                                                                                                                                                                             |          94 |
| [SAVE](commands/SAVE_SAVE_ALL.md)       | Saves a program to a specified file                                                                                                                                                                                                            |         167 |
| [SAVE ALL](commands/SAVE_SAVE_ALL.md)   | Saves ALL outputs programs from areas P0 through P9 to cassette tape as an ALL file                                                                                                                                                            |         167 |
| [SAVE#](commands/SAVE_HASH.md)          | Output DATA BANK data to file specified by file descriptor                                                                                                                                                                                     |         171 |
| [SET](commands/SET.md)                  | Specifies output format of numerical data                                                                                                                                                                                                      |         116 |
| [SGN](commands/SGN.md)                  | Returns a value which corresponds to the sign of the argument                                                                                                                                                                                  |         138 |
| [SIN](commands/SIN_COS_TAN.md)          | Returns the value of the Sine trigonometric function value for the argument                                                                                                                                                                    |         130 |
| [SQR](commands/SQR.md)                  | Returns the square root of the argument                                                                                                                                                                                                        |         136 |
| [STEP](commands/FOR_NEXT_STEP.md)       | Executes the program lines between the FOR statement and NEXT statement and increments the control variable, starting with the initial value. Execution is terminated when the value of the control variable exceeds the specified final value |         104 |
| [STOP](commands/STOP.md)                | Temporarily halts program execution                                                                                                                                                                                                            |          97 |
| [STR$](commands/STR_STRING.md)          | Converts the argument (numeric value or numeric expression value) to a string                                                                                                                                                                  |         148 |
| [TAB](commands/TAB.md)                  | Outputs a horizontal tab specification to the screen or printer                                                                                                                                                                                |         113 |
| [TAN](commands/SIN_COS_TAN.md)          | Returns the value of the Tan trigonometric function value for the argument                                                                                                                                                                     |         130 |
| [THEN](commands/IF_THEN.md)             | Executes the THEN statement or GOTO statement when the specified condition is met. The ELSE statement is executed when the specified condition is not met                                                                                      |         103 |
| [TROFF](commands/TROFF.md)              | Cancels the trace mode                                                                                                                                                                                                                         |          95 |
| [TRON](commands/TRON.md)                | Specifies the trace mode                                                                                                                                                                                                                       |          95 |
| [VAL](commands/VAL.md)                  | Converts a numeric character string to a numeric value                                                                                                                                                                                         |         149 |
| [VALF](commands/VALF.md)                | Performs calculation of numeric expression expressed as string, and returns the result                                                                                                                                                         |         150 |
| [VARLIST](commands/VARLIST.md)          | Displays variable names and array names                                                                                                                                                                                                        |          93 |
| [VERIFY](commands/VERIFY.md)            | Verifies the contents of a file stored on cassette tape                                                                                                                                                                                        |         169 |
| [WRITE#](commands/WRITE_HASH.md)        | Rewrites and deletes DATA BANK data                                                                                                                                                                                                            |         175 |
| [XOR](commands/LOGICAL.md)              | Logical XOR operator                                                                                                                                                                                                                           |          58 |

## Operators

### Arithmetic Operators

| Symbol(s) | Description                           |
|-----------|---------------------------------------|
| `+`, `-`      | Signs                                 |
| `+`         | Addition                              |
| `-`         | Subtraction                           |
| `*`         | Multiplication                        |
| `/`         | Division                              |
| `^`         | Power                                 |
| `¥`         | Integer division                      |
| `MOD`       | Integer remainder of integer division |

### Relational Operators 

| Symbol(s)   | Description             |
|-------------|-------------------------|
| `=`         | Equal to                |
| `<>`, `><`  | Does not equal          |
| `<`         | Less than               |
| `>`         | Greater than            |
| `=<`, `<=`  | Lesss than or equal to  |
| `=>`, '`>=` | Greater than equal to ~ |

### Logical Operators

| Symbol(s) | Description     |
|-----------|-----------------|
| `NOT`     | Negation        |
| `AND`     | Logical product |
| `OR`      | Logical sum     |
| `XOR`     | Exclusive OR    | 

### String Operators

| Symbol(s) | Description   |
|-----------|---------------|
| `+`       | Concatenation |

## Reserved Words

Reserved words not listed in the command section.

| Command | 
|---------|
| AS      |
| CALC    |
| CSR     |
| DEF     |
| DEFM    |
| KEY     |
| MID     |
| MODE    |
| OUT     |
| PUT     |
| RND     |
| TO      |
| VAC     |
| VAR     |

## Calculation Range
± 1 × 10⁻⁹⁹ ~ ± 9.9999999999 × 10⁻⁹⁹ and 0. Internal
operation uses 12-digit mantissa.

## Variable Types

The three following types of variables are available for use with this unit.

1. Numeric variables (up to 12-digit mantissa)  `A`, `a`, `NUMBER`, `POINTS`
2. String variables (up to 255 characters) `A$`, `STRING$`
3. Array variables:
   - Numeric array `A(10)`, `XX(3,3,3)`
   - String array `A$(10)`, `ARRAY$(2,2)`

## Variable Names
- Variable names can consist of upper, lower cas or numeric characters, but a numeric
characters cannot be used in the first position of the variable name (i.e. 1AE, 3BC$ are illegal).
- Reserved words cannot be used as the leading characters of a variable name (i.e. RUNON, LIST1$ are illegal).
- The maximum length of variable names is 15 characters.

## Arrays
1. Arrays are declared by DIM statements.
2. Elements are described by subscripts which are integers greater than 0. Fractions are discarded.
3. The number of dimensions is limited by stack capacity.
4. The maximum value of subscripts is limited by memory capacity.

## Variable/Array Application
1. Variables and arrays can be used jointly by all program areas.
2. Arrays cannot be used unless first declared using the `DIM` statement.

## Counting Bytes Used by Variables
The following outlines the number of bytes reserved when a variable appears the first
time within a program.

- **Numeric Variables**
  (variable name lengh + 12) bytes in the variable area
- **String Variables**
  (variable name length + 4) bytes in variable area and (string length + 1) bytes in the string area. Areas are reserved for array variables when the array is declared by the `DIM` statement.
- **Numeric Array Variables**
  (variable name length + 4) + (array size * 8) + (dimension x 2 + 1) bytes in variable area.

**EXAMPLE:**

`DIM XYZ(3,3,5,2)`

- Name: 3
- Size: 4 x 4 x 6 x 3 = 288
- Dimension: 4
- Calculation: (3+4) + (288x8) + 4x2 + 1 = 2320 bytes

**String Array Variables**
  (variable name length + 4) + (array size) + (dimension x 2) bytes in variable area.

The lengths of individual strings are required in the variable area when strings are assigned to the array.

**EXAMPLE:**
```basic
10 DIM ABS$(3,3)
20 AB$(0,0) = "*****"
```

- Name: 2
- Size: 4x4=16
- Dimension: 2
- Calculations: (2+4)+16+(2x2)+5 bytes

**Calculating Program Length**
The following shows points which must be considered when
calculating memory requirements for programs.

- Line numbers: 2 bytes per line number, regardless of the number length (1~65535)

- Commands: 2 bytes per command

- Functions: 2 bytes per function

- Numeric/alphabetic characters: 1 byte per character (spaces are counted as characters)

- `EXE` key: 1 byte per `EXE` key operation at end of program line (for storage of line) 1 byte added to sum of the above

**EXAMPLE:**
```basic
10 A = SIN X
```
2 (line number) + 1 (space following line number) + 1 (A) + 1 (=) + 2 (SIN) + 1 (space) + 1 (X) + 1 (`EXE`) + 1 = 11

The calculation indicates that a total of 11 bytes are required for storage of the above program.
* the space following the line number is added automatically.
