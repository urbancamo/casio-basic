5 ONERRORGOTO100
20 MODE8:DIM:r=0:c$=CHR$(5)
30 CLS:PRINT"�r�       r:radius";
50 LOCATE0,1:PRINTc$;"r=";r;"?";:INPUT@42;r:LOCATE0,0:IFr<0 THEN50
70 LOCATE0,1:PRINTc$;"Area =";PI*r*r;:z$=INPUT$(1,@):GOTO50
100 IFERR=1 THENCLS:ONERRORGOTO0
110 IFERL=50 THENRESUME50
120 LOCATE0,1:PRINTc$;"not found";:z$=INPUT$(1,@):RESUME30
