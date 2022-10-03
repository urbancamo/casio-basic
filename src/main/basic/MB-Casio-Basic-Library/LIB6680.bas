10 MODE8:DIM:GOSUB900:c$=CHR$(5):f=95:DEFCHR$(252)="123E020000":DEFCHR$(253)="2E2A3A0000":r=0:s=0:t=0:u=0
45 CLS:PRINT"B(1,pü),B(1,pý) a<pü-pý<b";
50 z=r:s$="nü":GOSUB500:r=z
60 z=s:s$="„xü":GOSUB500:s=z
70 z=t:s$="ný":GOSUB500:t=z
80 z=u:s$="„xý":GOSUB500:u=z
90 CLS:PRINT"Confidence level (1-ˆ)[%]";
95 z=f:s$="1-ˆ":GOSUB500:f=z:IFf<0 ORf>100 THEN95
97 CLS:PRINT"B(1,pü),B(1,pý)   ";f;"%";TAB(0);".....";
100 p=(1-f/100)/2:sr=0:GOSUB"LIB0:S6410":GOSUB900:IFsr THEN*
110 j=s/r:k=u/t:z=j-k-x*SQR(((1-j)*j)/r+((1-k)*k)/t):GOSUB400:a=z
120 z=j-k+x*SQR(((1-j)*j)/r+((1-k)*k)/t):GOSUB400:b=z
130 PRINTc$;a;"< pü-pý <";b;:a$=INPUT$(1,@):GOTO45
400 IFz THENz=ROUND(z,LOG(ABSz)-5)
410 RETURN
500 LOCATE0,1:PRINTc$;s$;"=";z;"?";:INPUT@10;z:LOCATE0,0:RETURN
900 ONERRORGOTO910:RETURN
910 IFERR=1 THENCLS:ONERRORGOTO0
920 IFERL=500 THENRESUME500
930 LOCATE0,1:PRINTc$;"not found";:z$=INPUT$(1,@):RESUME45
