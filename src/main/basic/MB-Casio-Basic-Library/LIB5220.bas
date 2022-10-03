5 ONERRORGOTO1000
10 DEFCHR$(254)="060A12227E":MODE8:DIM:PRINTCHR$(15);
30 f$="":c$=CHR$(5):a=0:b=0:h=1:ANGLE1
90 CLS:PRINT"Define function  dy/dx";
100 LOCATE0,1:PRINTc$;"?";f$;:LOCATE0,0:LOCATE1,1:INPUT@100;f$:LOCATE0,0:z=VALF(f$)
110 IFLEN(f$)<17 THENg$=f$ ELSEg$=LEFT$(f$,20)+"¥¥¥"
120 m$="dy/dx = "+g$:s$="x0":z=a:GOSUB800:a=z
140 s$="y0":z=b:GOSUB800:b=z
150 m$="Step-size  þh     (þh>0)":s$="þh":z=h:GOSUB800:h=z:IFh=<0 THEN150
250 m$="dy/dx = "+g$:n=50
270 ERASEa,b:DIMa(n),b(n):k=32:i=0:j=0:f=a:g=b:GOTO355
300 IFk>31 THENCLS:PRINTm$;TAB(0);"....."; ELSEPRINTc$;".....";
305 f=a(i-1):g=b(i-1):j=i
310 x=f:y=g:p=VALF(f$)*h
320 x=f+h/2:y=g+p/2:q=VALF(f$)*h
330 y=g+q/2:r=VALF(f$)*h
340 x=f+h:y=g+r:s=VALF(f$)*h
350 f=f+h:g=g+(p+2*q+2*r+s)/6
355 a(i)=f:b(i)=g
360 y$="="+STR$(g):IFSGNf<0 THENz$="y("+STR$(f)+") " ELSEz$="y("+MID$(STR$(f),2)+") "
365 l=LEN(z$)+LEN(y$):IFl>31 THENCLS:PRINTz$;TAB(0);y$; ELSEIFk>31 THENCLS:PRINTm$;TAB(0);z$;y$; ELSEPRINTc$;z$;y$;
370 z=ASC(INPUT$(1,@)):k=l:IFz=29 ORz=28 THEN90
375 IFz=31 ANDi=n THEN370
380 IFz=13 ORz=31 THENIFi=n THEN100 ELSEi=i+1:f=a(i):g=b(i):IFj>=i THEN360 ELSE300
390 IFz=30 ANDi>0 THENi=i-1:f=a(i):g=b(i):GOTO360
400 GOTO370
450 LOCATE0,1:PRINTc$;"not found";:z$=INPUT$(1,@):RETURN
800 CLS:PRINTm$;
810 LOCATE0,1:PRINTc$;s$;"=";z;"?";:INPUT@10;z:LOCATE0,0:RETURN
1000 IFERR=1 THENCLS:ONERRORGOTO0
1010 IFERL=100 THENIFERR=2 THENRESUME100 ELSERESUMENEXT
1020 IFERL=810 THENRESUME810
1030 GOSUB450:RESUME90
