5 ONERRORGOTO900
20 MODE8:DIM:a=0:b=0:c=0:h=0:d=0:c$=CHR$(5)
30 CLS:PRINT"Area (triangle)";TAB(0);"1:ah/2  2:ab•sinå/2  3:f(a,b,c)";:LOCATE0,0:LOCATE0,1
40 w=ASC(INPUT$(1,@))-48:IFw<1 ORw>3 THEN40
50 ONw GOTO100,200,300
100 CLS:PRINT"ah/2        a:base  h:height";
110 s$="a":z=a:GOSUB500:a=z
120 s$="h":z=h:GOSUB500:h=z
130 z=a*h/2:GOTO400
200 CLS:PRINT"ab•sinå/2       a:b:side";
210 s$="a":z=a:GOSUB500:a=z
220 s$="b":z=b:GOSUB500:b=z
230 s$="å":z=d:GOSUB500:d=z:IFSINd<0 THEN230
240 z=a*b*SINd/2:GOTO400
300 CLS:PRINT"Ç(s(s-a)(s-b)(s-c)),s=(a+b+c)/2";
320 s$="a":z=a:GOSUB500:a=z
330 s$="b":z=b:GOSUB500:b=z
340 s$="c":z=c:GOSUB500:c=z
350 s=(a+b+c)/2:z=SQR(s*(s-a)*(s-b)*(s-c))
400 IFz<0 THEN450
410 LOCATE0,1:PRINTc$;"Area =";z;:z$=INPUT$(1,@):GOTO30
450 LOCATE0,1:PRINTc$;"not found";:z$=INPUT$(1,@):GOTO30
500 LOCATE0,1:PRINTc$;s$;"=";z;"?";:INPUT@42;z:LOCATE0,0:IFz<0 THEN500 ELSERETURN
900 IFERR=1 THENCLS:ONERRORGOTO0
910 IFERL=500 THENRESUME500
920 RESUME450
