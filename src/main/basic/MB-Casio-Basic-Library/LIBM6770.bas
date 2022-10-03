5 IFsq<>60 ANDsq<>62 THENsq=226
10 MODE8:DIM:GOSUB900:ERASEb$:DIMb$(1):b$(0)="Reject":b$(1)="Accept":t$="Test     Hû:pü=pý  Hü:pü"+CHR$(sq)+"pý":f=5:c$=CHR$(5):DEFCHR$(252)="123E020000":DEFCHR$(253)="2E2A3A0000":r=0:s=0:t=0:u=0
45 CLS:PRINTt$;
50 z=r:s$="nü":GOSUB500:r=z
60 z=s:s$="„xü":GOSUB500:s=z
70 z=t:s$="ný":GOSUB500:t=z
80 z=u:s$="„xý":GOSUB500:u=z
90 CLS:PRINT"Significance level ˆ[%]";
95 z=f:s$="ˆ":GOSUB500:f=z:IFf<0 ORf>100 THEN95
97 CLS:PRINTt$;TAB(0);".....";
100 p=f/100:IFsq=226 THENp=p/2
105 sr=0:GOSUB"LIB0:S6410":GOSUB900:IFsr THEN*
107 z=s/r-u/t:IFsq=226 THENz=ABSz
110 b=1:v=(s+u)/(r+t):z=z/SQR(v*(1-v)*(1/r+1/t)):GOSUB400:a=z:z=x:GOSUB400:x=z
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
