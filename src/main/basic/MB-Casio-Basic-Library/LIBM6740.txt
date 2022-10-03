5 IFsq<>60 ANDsq<>62 THENsq=226
10 MODE8:DIM:GOSUB900:ERASEb$:DIMb$(1):b$(0)="Reject":b$(1)="Accept":t$="Test     Hû:Žü’=Žý’  Hü:Žü’"+CHR$(sq)+"Žý’":c$=CHR$(5):DEFCHR$(252)="123E020000":DEFCHR$(253)="2E2A3A0000"
20 CLS:PRINTt$;TAB(0);"input new data xü (Y/N) ?";:a$=INPUT$(1)
22 IFa$<>"Y" ANDa$<>"y" THEN30
25 s$="xü":GOSUB"LIB0:S6020":GOSUB900
30 CLS:PRINTt$;TAB(0);"input new data xý (Y/N) ?";:a$=INPUT$(1)
32 IFa$<>"Y" ANDa$<>"y" THEN36
35 s$="xý":GOSUB"LIB0:S6030":GOSUB900
36 s=sa:IFs>1 THENr=sk^2 ELSEr=0
37 f=5:u=sz:IFu>1 THENt=sl^2 ELSEt=0
45 CLS:PRINTt$;
50 z=s:s$="nü":GOSUB500:s=z
60 z=r:s$="Vü":GOSUB500:r=z
70 z=u:s$="ný":GOSUB500:u=z
80 z=t:s$="Vý":GOSUB500:t=z
90 CLS:PRINT"Significance level ˆ[%]";
95 z=f:s$="ˆ":GOSUB500:f=z:IFf<0 ORf>100 THEN95
97 CLS:PRINTt$;TAB(0);".....";
100 n=s-1:m=u-1:p=f/100:IFsq=226 ANDr<t THENn=u-1:m=s-1
102 IFsq=226 THENp=p/2 ELSEIFsq=60 THENp=1-p
105 sr=0:GOSUB"LIB0:S6440":GOSUB900:IFsr THEN*
107 IFsq=226 ANDr<t THENz=t/r ELSEz=r/t
110 b=1:GOSUB400:a=z:z=x:GOSUB400:x=z
120 IF(sq=226 ORsq=62) ANDa>x THENb=0
122 IFsq=60 ANDa<x THENb=0
130 z=SGN(sq-60):PRINTc$;a;CHR$(60+z*2+b*(164-z));x;": ";b$(b);:a$=INPUT$(1,@):GOTO45
400 IFz THENz=ROUND(z,LOG(ABSz)-5)
410 RETURN
500 LOCATE0,1:PRINTc$;s$;"=";z;"?";:INPUT@10;z:LOCATE0,0:RETURN
900 ONERRORGOTO910:RETURN
910 IFERR=1 THENCLS:ONERRORGOTO0
920 IFERL=500 THENRESUME500
930 LOCATE0,1:PRINTc$;"not found";:z$=INPUT$(1,@):RESUME20
