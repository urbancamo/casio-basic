10 REM Programm:TRANS-LIB -> P1
11 REM Aufgabe :Hauptprogramm
20 CLEAR: CLS: PRINT "Dieses Hilfsprogramm uebertraegtein Library-Prog. nach P0."
30 INPUT "Bitte geben Sie die Library- Programm-Nr. ein :";NR$
40 DEFSEG=0: X=PEEK1715+PEEK1716*256-15
50 A=PEEK1718+PEEK1719*256+PEEK1720*65536
60 B=PEEK1724+PEEK1725*256+PEEK1726*65536
70 FOR I=A TO B-15 STEP 15
80 DEFSEG=I/16: C=I-INT(I/16)*16+6
90 FOR K=1 TO LEN(NR$): IF ASC(MID$(NR$,K)=PEEK(K+C) THEN NEXT K: GOTO 110
100 NEXT I: PRINT "Gesuchtes Library-Programm nichtgefunden. Bitte neu waehlen!": GOTO 10
110 REM Adressen ermitteln
120 DEFSEG=0: IF PEEK(X+2)=0 THEN A0=PEEK X: A1=PEEK(X+1): A3=PEEK(X+3): A4=PEEK(X+4)
130 FOR K=0 TO 5: DEFSEG=I/16: N=PEEK(K+I-INT(I/16)*16): DEFSEG=0: POKE X+K,N: NEXT K
140 PRINT "Library-Programm-Nr.:";NR$;: PRINT " ist nun in P0 gespeichert!"

