5 ONERRORGOTO900
20 MODE8:DIM:a=0:b=0:r=0:h=0:c$=CHR$(5)
30 CLS:PRINT"2çrh+ç(a’+b’)    h:height";
50 s$="h":z=h:GOSUB500:h=z
51 CLS:PRINT"2çrh+ç(a’+b’)    a:b:r:radius";
52 s$="a":z=a:GOSUB500:a=z
53 s$="b":z=b:GOSUB500:b=z
54 s$="r":z=r:GOSUB500:r=z
60 LOCATE0,1:PRINTc$;"Surface =";PI*(2*r*h+a^2+b^2);:z$=INPUT$(1,@):GOTO30
500 LOCATE0,1:PRINTc$;s$;"=";z;"?";:INPUT@42;z:LOCATE0,0:IFz<0 THEN500 ELSERETURN
900 IFERR=1 THENCLS:ONERRORGOTO0
910 IFERL=500 THENRESUME500
920 LOCATE0,1:PRINTc$;"not found";:z$=INPUT$(1,@):RESUME30
