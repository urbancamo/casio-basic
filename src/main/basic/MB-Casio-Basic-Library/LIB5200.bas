5 ONERRORGOTO1000
10 DEFCHR$(255)="0000FE0000":MODE8:DIM:PRINTCHR$(15);
30 f$="":c$=CHR$(5):a=0:b=0:e=1e-7:m=8:ANGLE1:ERASEa:DIMa(m)
50 CLS:PRINT"Romberg's method  Åf(x)dx [a,b] 1:f(x),[a,b]      2:ã,loop";
60 k=ASC(INPUT$(1,@)):IFk=13ORk=49THEN90ELSEIFk=50THEN170
80 GOTO60
90 CLS:PRINT"Define function";
100 LOCATE0,1:PRINTc$;"f(x) ?";f$;:LOCATE0,0:LOCATE6,1:INPUT@100;f$:LOCATE0,0:z=VALF(f$)
110 IFLEN(f$)<21THENg$=f$ ELSEg$=LEFT$(f$,17)+"•••"
120 m$="Å "+g$+" dx [a,b]":s$="a":z=a:GOSUB800:a=z
130 s$="b":z=b:GOSUB800:b=z:GOTO250
170 m$="Err  ˇAn+1-Anˇ<ã  (ã>0)":s$="ã":z=e:GOSUB800:e=z:IFe<1e-90 THEN170
200 m$="Max loop  2ú     (n>0)":s$="n":z=m:GOSUB800:m=z:IFm=<0ORFRACm<>0THEN200ELSEERASEa:DIMa(m):GOTO50
250 CLS:PRINTm$;TAB(0);"Åf(x)dx = .....";
260 h=b-a:x=a:g=VALF(f$):x=b:f=VALF(f$):a(0)=(g+f)*h/2
300 FORi=1 TOm:h=h/2
310 s=0:FORj=1TO2^i-1STEP2:x=a+j*h:s=s+VALF(f$):NEXT
320 a(i)=a(i-1)/2+h*s
330 n=1:FORk=i-1TO0STEP-1
340 a(k)=a(k+1)+(a(k+1)-a(k))/(4^n-1)
350 IFABS(a(k+1)-a(k)) <e AND(i>3ORi=m)THENx=a(k):GOTO500
360 n=n+1:NEXT:NEXT:GOSUB450
390 PRINTc$;"n =";m;TAB(11);":An =";STR$(a(m-1));:LOCATE0,0:LOCATE1,1:z$=INPUT$(1,@):GOTO50
450 LOCATE0,1:PRINTc$;"not found";:z$=INPUT$(1,@):RETURN
500 x=ROUND(x,INTLOG(ABSe)-1):PRINTc$;"Åf(x)dx =";x;:z$=INPUT$(1,@):GOTO50
800 CLS:PRINTm$;
810 LOCATE0,1:PRINTc$;s$"=";z;"?";:INPUT@10;z:LOCATE0,0:RETURN
1000 IFERR=1 THENCLS:ONERRORGOTO0
1010 IFERL=100 THENIFERR=2 THENRESUME100 ELSERESUMENEXT
1015 IFERL=810 THENRESUME810
1020 GOSUB450:RESUME50
