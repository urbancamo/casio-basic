5 ONERRORGOTO900
20 MODE8:DIM:l=0:r=0:a=0:c$=CHR$(5):ANGLE0
30 CLS:PRINT"Area (sector)";TAB(0);"1:lr/2     2:�r��/360";
40 w=ASC(INPUT$(1,@))-48:IFw<1 ORw>2 THEN40
50 ONw GOTO100,200
100 CLS:PRINT"lr/2  l:circular arc   r:radius";
110 s$="l":z=l:GOSUB500:l=z
120 s$="r":z=r:GOSUB500:r=z
130 z=l*r/2:GOTO400
200 CLS:PRINT"�r��/360     r:radius  �:DEG";
220 s$="r":z=r:GOSUB500:r=z
230 s$="�":z=a:GOSUB500:a=z:IFa>360 THEN230
240 z=PI*a*r^2/360
400 LOCATE0,1:PRINTc$;"Area =";z;:z$=INPUT$(1,@):GOTO30
500 LOCATE0,1:PRINTc$;s$;"=";z;"?";:INPUT@42;z:LOCATE0,0:IFz<0 THEN500 ELSERETURN
900 IFERR=1 THENCLS:ONERRORGOTO0
910 IFERL=500 THENRESUME500
920 LOCATE0,1:PRINTc$;"not found";:z$=INPUT$(1,@):RESUME30