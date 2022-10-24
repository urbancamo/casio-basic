5 ONERRORGOTO900
10 MODE8:DIM:ERASEa,a$:DIMa(2),a$(2):a$(0)="r:inside":a$(1)="R:outside":a$(2)="l:side"
20 ANGLE0:n=0:c$=CHR$(5)
30 CLS:PRINT"Area (polygon)";TAB(0);"1:n,rÊA   2:n,RÊA   3:n,lÊA";
31 f=ASC(INPUT$(1,@))-48:IFf<1 ORf>3 THEN31
32 m$="Polygon  "
35 s$="n:number":z=n:GOSUB500:n=z:IFn<3 ORn>=1e7 ORFRACn<>0 THEN35
36 m$=m$+"(n="+MID$(STR$(n),2)+")  "
37 s$=a$(f-1):z=a(f-1):GOSUB500:a(f-1)=z
40 ONf GOTO41,42,43
41 s=n*a(0)^2*TAN(180/n):GOTO50
42 s=n*a(1)^2*SIN(360/n)/2:GOTO50
43 s=n*a(2)^2/TAN(180/n)/4
50 LOCATE0,1:PRINTc$;"Area =";ABSs;:z$=INPUT$(1,@):GOTO30
500 CLS:PRINTm$;s$;
510 LOCATE0,1:PRINTc$;LEFT$(s$,1);"=";z;"?";:INPUT@42;z:LOCATE0,0:IFz<0 THEN510 ELSERETURN
900 IFERR=1 THENCLS:ONERRORGOTO0
910 IFERL=510 THENRESUME510
920 LOCATE0,1:PRINTc$;"not found";:z$=INPUT$(1,@):RESUME30
