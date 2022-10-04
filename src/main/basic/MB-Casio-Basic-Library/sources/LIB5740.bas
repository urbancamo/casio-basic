5 ONERRORGOTO900
20 MODE8:DIM:a=0:b=0:c=0:d=0:h=0:c$=CHR$(5)
30 CLS:PRINT"h(ab+cd+‚(abcd))/3 a:b:c:d:edge";
40 s$="a":z=a:GOSUB500:a=z
41 s$="b":z=b:GOSUB500:b=z
42 s$="c":z=c:GOSUB500:c=z
43 s$="d":z=d:GOSUB500:d=z
44 CLS:PRINT"h(ab+cd+‚(abcd))/3   h:height";
45 s$="h":z=h:GOSUB500:h=z
50 w=a*b*c*d:LOCATE0,1:PRINTc$;"Volume =";h*(a*b+c*d+SQRw)/3;:z$=INPUT$(1,@):GOTO30
500 LOCATE0,1:PRINTc$;s$;"=";z;"?";:INPUT@42;z:LOCATE0,0:IFz<0 THEN500 ELSERETURN
900 IFERR=1 THENCLS:ONERRORGOTO0
910 IFERL=500 THENRESUME500
930 LOCATE0,1:PRINTc$;"not found";:z$=INPUT$(1,@):RESUME30
