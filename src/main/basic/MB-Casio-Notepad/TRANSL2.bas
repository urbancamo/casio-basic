10 REM Programm:TRANS-LIB -> P2
11 REM Aufgabe :P0 loeschen
20 INPUT "P0 loeschen? [J/N] ";Q$
30 IF Q$<>"J" OR X=0 THEN END
40 POKE X+0,A0
41 POKE X+1,A1
42 POKE X+2,0
43 POKE X+3,A3
44 POKE X+4,A4
45 POKE X+5,0
46 X=0