5 IFsq<>60 ANDsq<>62 THENsq=226
10 MODE8:DIM:GOSUB900:ERASEb$:DIMb$(1):b$(0)="Reject":b$(1)="Accept":t$="Test     H�:p=p�  H�:p"+CHR$(sq)+"p�":f=5:c$=CHR$(5):r=0:s=0:t=0:DEFCHR$(252)="123E020000"
45 CLS:PRINTt$;
50 z=r:s$="p�":GOSUB500:r=z:IFr>=1 ORr=<0 THEN50
60 z=s:s$="n":GOSUB500:s=z
70 z=t:s$="�x":GOSUB500:t=z
90 CLS:PRINT"Significance level �[%]";
95 z=f:s$="�":GOSUB500:f=z:IFf<0 ORf>100 THEN95
97 CLS:PRINTt$;TAB(0);".....";
100 p=f/100:IFsq=226 THENp=p/2
105 sr=0:GOSUB"LIB0:S6410":GOSUB900:IFsr THEN*
107 z=t-s*r:IFsq=226 THENz=ABSz
110 b=1:z=z/SQR(s*r*(1-r)):GOSUB400:a=z:z=x:GOSUB400:x=z
120 IF(sq=226 ORsq=62) ANDa>x THENb=0
122 IFsq=60 THENx=-x:IFa<x THENb=0
130 z=SGN(sq-60):PRINTc$;a;CHR$(60+z*2+b*(164-z));x;": ";b$(b);:a$=INPUT$(1,@):GOTO45
400 IFz THENz=ROUND(z,LOG(ABSz)-5)
410 RETURN
500 LOCATE0,1:PRINTc$;s$;"=";z;"?";:INPUT@10;z:LOCATE0,0:RETURN
900 ONERRORGOTO910:RETURN
910 IFERR=1 THENCLS:ONERRORGOTO0
920 IFERL=500 THENRESUME500
930 LOCATE0,1:PRINTc$;"not found";:z$=INPUT$(1,@):RESUME45