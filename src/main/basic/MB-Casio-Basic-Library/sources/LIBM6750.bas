5 IFsq<>60 ANDsq<>62 THENsq=226
10 MODE8:DIM:GOSUB900:ERASEb$:DIMb$(1):b$(0)="Reject":b$(1)="Accept":t$="Test     Hû:ü=ý  Hü:ü"+CHR$(sq)+"ý":DEFCHR$(254)="A2A49C92A2":c$=CHR$(5):DEFCHR$(252)="123E020000":DEFCHR$(253)="2E2A3A0000"
20 CLS:PRINTt$;TAB(0);"input new data xü (Y/N) ?";:a$=INPUT$(1)
22 IFa$<>"Y" ANDa$<>"y" THEN30
25 s$="xü":GOSUB"LIB0:S6020":GOSUB900
30 CLS:PRINTt$;TAB(0);"input new data xý (Y/N) ?";:a$=INPUT$(1)
32 IFa$<>"Y" ANDa$<>"y" THEN36
35 s$="xý":GOSUB"LIB0:S6030":GOSUB900
36 r=sa:IFr>1 THENs=sg:t=sm ELSEs=0:t=0
37 f=5:u=sz:IFu>1 THENv=sh:w=sn ELSEv=0:w=0
45 CLS:PRINTt$;
50 z=r:s$="nü":GOSUB500:r=z
55 z=s:s$="þü":GOSUB500:s=z
60 z=t:s$="Sü":GOSUB500:t=z
70 z=u:s$="ný":GOSUB500:u=z
75 z=v:s$="þý":GOSUB500:v=z
80 z=w:s$="Sý":GOSUB500:w=z
90 CLS:PRINT"Significance level ˆ[%]";
95 z=f:s$="ˆ":GOSUB500:f=z:IFf<0 ORf>100 THEN95
97 CLS:PRINTt$;TAB(0);".....";
100 n=r+u-2:p=f/100:IFsq=226 THENp=p/2
105 sr=0:GOSUB"LIB0:S6430":GOSUB900:IFsr THEN*
107 z=(s-v):IFsq=226 THENz=ABSz
110 b=1:z=z/SQR((1/r+1/u)*((t+w)/n)):GOSUB400:a=z:z=x:GOSUB400:x=z
120 IF(sq=226 ORsq=62) ANDa>x THENb=0
122 IFsq=60 THENx=-x:IFa<x THENb=0
130 z=SGN(sq-60):PRINTc$;a;CHR$(60+z*2+b*(164-z));x;": ";b$(b);:a$=INPUT$(1,@):GOTO45
400 IFz THENz=ROUND(z,LOG(ABSz)-5)
410 RETURN
500 LOCATE0,1:PRINTc$;s$;"=";z;"?";:INPUT@10;z:LOCATE0,0:RETURN
900 ONERRORGOTO910:RETURN
910 IFERR=1 THENCLS:ONERRORGOTO0
920 IFERL=500 THENRESUME500
930 LOCATE0,1:PRINTc$;"not found";:z$=INPUT$(1,@):RESUME20
