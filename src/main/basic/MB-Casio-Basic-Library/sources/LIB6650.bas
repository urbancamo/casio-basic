10 MODE8:DIM:GOSUB900:c$=CHR$(5):DEFCHR$(252)="123E020000":DEFCHR$(253)="2E2A3A0000":t$="N(��,���),N(��,���) a<���/���<b"
20 CLS:PRINTt$;TAB(0);"input new data x� (Y/N) ?";:a$=INPUT$(1,@)
22 IFa$<>"Y" ANDa$<>"y" THEN30
25 s$="x�":GOSUB"LIB0:S6020":GOSUB900
30 CLS:PRINTt$;TAB(0);"input new data x� (Y/N) ?";:a$=INPUT$(1,@)
32 IFa$<>"Y" ANDa$<>"y" THEN36
35 s$="x�":GOSUB"LIB0:S6030":GOSUB900
36 s=sa:IFs>1 THENr=sk^2 ELSEr=0
37 f=95:u=sz:IFu>1 THENt=sl^2 ELSEt=0
45 CLS:PRINTt$;
50 z=s:s$="n�":GOSUB500:s=z
60 z=r:s$="V�":GOSUB500:r=z
70 z=u:s$="n�":GOSUB500:u=z
80 z=t:s$="V�":GOSUB500:t=z
90 CLS:PRINT"Confidence level (1-�)[%]";
95 z=f:s$="1-�":GOSUB500:f=z:IFf<0 ORf>100 THEN95
97 CLS:PRINT"N(��,���),N(��,���)   ";f;"%";TAB(0);".....";
100 n=s-1:m=u-1:p=(1-f/100)/2:sr=0:GOSUB"LIB0:S6440":GOSUB900:IFsr THEN*
105 g=x:n=m:m=s-1:GOSUB"LIB0:S6440":GOSUB900:IFsr THEN*
110 z=t/r/x:GOSUB400:a=z
120 z=t/r*g:GOSUB400:b=z
130 PRINTc$;a;"< ���/��� <";b;:a$=INPUT$(1,@):GOTO45
400 IFz THENz=ROUND(z,LOG(ABSz)-5)
410 RETURN
500 LOCATE0,1:PRINTc$;s$;"=";z;"?";:INPUT@10;z:LOCATE0,0:RETURN
900 ONERRORGOTO910:RETURN
910 IFERR=1 THENCLS:ONERRORGOTO0
920 IFERL=500 THENRESUME500
930 LOCATE0,1:PRINTc$;"not found";:z$=INPUT$(1,@):RESUME20
