5 ONERRORGOTO900
20 MODE8:DIM:r=0:c$=CHR$(5)
30 CLS:PRINT"4�r�/3             r:radius";
40 LOCATE0,1:PRINTc$;"r=";r;"?";:INPUT@42;r:LOCATE0,0:IFr<0 THEN40
50 LOCATE0,1:PRINTc$;"Volume =";4*PI*r^3/3;:z$=INPUT$(1,@):GOTO40
900 IFERR=1 THENCLS:ONERRORGOTO0
910 IFERL=40 THENRESUME40
930 LOCATE0,1:PRINTc$;"not found";:z$=INPUT$(1,@):RESUME30
