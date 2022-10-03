5 ONERRORGOTO900
20 MODE8:DIM:a=0:b=0:c=0:h=0:c$=CHR$(5)
30 CLS:PRINT"Area (parallelogram)";TAB(0);"1:ah       2:ab•sinå";
40 w=ASC(INPUT$(1,@))-48:IFw<1 ORw>2 THEN40
50 ONw GOTO100,200
100 CLS:PRINT"ah       a:base  h:height";
110 s$="a":z=a:GOSUB500:a=z
120 s$="h":z=h:GOSUB500:h=z
130 z=a*h:GOTO400
200 CLS:PRINT"ab•sinå        a:b:side";
210 s$="a":z=a:GOSUB500:a=z
220 s$="b":z=b:GOSUB500:b=z
230 s$="å":z=c:GOSUB500:c=z:IFSINc<0 THEN230
240 z=a*b*SINc
400 LOCATE0,1:PRINTc$;"Area =";z;:z$=INPUT$(1,@):GOTO30
500 LOCATE0,1:PRINTc$;s$;"=";z;"?";:INPUT@42;z:LOCATE0,0:IFz<0 THEN500 ELSERETURN
900 IFERR=1 THENCLS:ONERRORGOTO0
910 IFERL=500 THENRESUME500
920 LOCATE0,1:PRINTc$;"not found";:z$=INPUT$(1,@):RESUME30
