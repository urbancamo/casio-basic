1 'MEMORY DUMP - HEX
2 '(c) Tommi Rautava
3 'before 950719 / 950719 v3A
90 INPUT"OFFSET";OFFS
100 FOR I=0 TO 14
110 L=PEEK(OFFS+I)
115 GOSUB1000
120 PRINT A$+"  ";
130 NEXT
140 L=PEEK(OFFS+15):GOSUB1000:PRINT A$
150 GOTO 90
999 END
1000 HI=INT(L/16):LO=L MOD 16
1010 IF HI>9 THEN HI=HI+7
1020 IF LO>9 THEN LO=LO+7
1030 A$=CHR$(HI+48)+CHR$(LO+48)
1040 RETURN
