5 ONERRORGOTO2000:DEFSEG=0
10 MODE8:DIM:ERASEa:c$=CHR$(5):n=2:m$="ax1+bx2+cx3+dx4+ex5+fx6+gx7"
30 CLS:PRINT"ax1+bx2+cx3+еее=y     (2сnс7)";
40 LOCATE0,1:PRINTc$;"n=";n;"?";:INPUT@2;n:LOCATE0,0:IFn<2 ORn>7 THEN40
60 m=n-1:DIMa(m,n):p$=LEFT$(m$,4*m+3)+"=y":CLS:PRINTp$;
100 FORi=0 TOm:FORj=0 TOn
110 s$=MID$(STR$(i+1),2)+":"+MID$(p$,j*4+1,1):z=a(i,j)
120 GOSUB1950:IFw=0 THENa(i,j)=z:GOTO140
130 IFj=0 THENIFi=0 THEN30 ELSEi=i-1:j=n-1 ELSEj=j-2
140 NEXT:NEXT
160 LOCATE0,1:PRINTc$;"x1 = .....";:GOTO830
310 FORi=0 TOm:z=b(i):IFz<>0 ANDABSz>=1e-90 THENz=ROUND(z,LOG(ABSz)-7)
315 IFz<>0 ANDABSz<1e-90 THENz=z*1e10:z=ROUND(z,LOG(ABSz)-7):z=z/1e10
320 PRINTc$;"x";MID$(STR$(i+1),2);" =";z;
330 w=ASC(INPUT$(1,@)):IFw=29 ORw=28 THEN30
360 IFw<>13 ANDw<>31 ANDw<>30 THEN330
370 IF(w=31 ANDi=m) OR(w=30 ANDi=0) THEN330
390 IFw=30 THENi=i-2
400 NEXT:GOTO30
830 ERASEb,c,e:y=2*n-1:x=m:DIMc(x,y),e(x),b(x)
840 FORi=0 TOm:FORj=0 TOm:c(i,j)=a(i,j):NEXT:NEXT
850 FORi=0 TOm:FORj=n TOy:IFi=j-n THENc(i,j)=1
860 NEXT:NEXT
870 FORi=0 TOx:e(i)=i:NEXT
880 FORk=0 TOx:w=ABS(c(k,k)):a=k:b=k
890 FORi=k TOx:FORj=k TOx:IFw<ABS(c(i,j)) THENw=ABS(c(i,j)):a=i:b=j
900 NEXT:NEXT
920 IFw<1E-10 THENGOSUB1800:GOTO30
940 IFk<>a THENFORj=k TOy:w=c(k,j):c(k,j)=c(a,j):c(a,j)=w:NEXT
950 IFk<>b THENFORi=0 TOx:w=c(i,k):c(i,k)=c(i,b):c(i,b)=w:NEXT:w=e(k):e(k)=e(b):e(b)=w
960 w=c(k,k):c=k+1:FORj=c TOy:c(k,j)=c(k,j)/w:NEXT
970 FORi=0 TOx:IFi<>k THENw=c(i,k):FORj=c TOy:c(i,j)=c(i,j)-w*c(k,j):NEXT
980 NEXT:NEXT
1040 FORj=n TOy:FORi=0 TOx:w=e(i):c(w,x)=c(i,j):NEXT
1050 FORi=0 TOx:c(i,j)=c(i,x):NEXT:NEXT
1270 FORi=0 TOm:w=0:FORk=0 TOm:w=w+c(i,k+n)*a(k,n):NEXT:b(i)=w:NEXT:GOTO310
1800 LOCATE0,1:PRINTc$;"not found";:z$=INPUT$(1,@):RETURN
1950 LOCATE0,1:PRINTc$;s$;"=";z;"?";:INPUT@43;z:LOCATE0,0:w=PEEK(&H65B)-13:RETURN
2000 IFERR=1 THENCLS:ONERRORGOTO0
2020 IFERL=40 THENRESUME40
2030 IFERL=1950 THENRESUME1950
2040 IFERL=60 THENERASEa:RESUME60
2080 GOSUB1800:RESUME30
