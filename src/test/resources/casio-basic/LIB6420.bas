10 MODE8:DIM:GOSUB500:c$=CHR$(5):n=1:p=0:DEFCHR$(254)="3E02040830"
20 CLS:PRINT"Percentage points  X�(x�,�)";
30 z=n:s$="�":GOSUB400:n=z:IFn=<0 ORFRACn<>0 THEN30
40 z=p:s$="p":GOSUB400:p=z:IFp=<0 ORp>1 THEN40
60 LOCATE0,1:PRINTc$;".....";
70 sr=0:GOSUB"LIB0:S6420":GOSUB500:IFsr THEN*
75 IFx THENx=ROUND(x,LOG(ABSx)-6)
80 PRINTc$;"x�=";x;:z$=INPUT$(1,@):GOTO30
400 LOCATE0,1:PRINTc$;s$;"=";z;"?";:INPUT@10;z:LOCATE0,0:RETURN
500 ONERRORGOTO510:RETURN
510 IFERR=1 THENCLS:ONERRORGOTO0
520 IFERL=400 THENRESUME400
530 LOCATE0,1:PRINTc$;"not found";:z$=INPUT$(1,@):RESUME20
