5 GOTO10010
10 DATAAbsolute temperature,T[K]=t[ﬂC]+273.15,10,20,
20 DATAHeat capacity,Q=CT=mcT,10,30,
30 DATAMechanical equivalent of heat,"W=JQ , J=4.19 [J/cal]",20,40,
40 DATABoyle's law,PV=Constant  (T=constant),30,50,
50 DATAVolume & Temperature,V=V˚(1+T/273),40,60,
60 DATACharle's law,V/V˚=T/T˚,50,70,
70 DATAEquation of state,"PV=nRT , R=8.31 [J/K]",60,80,
80 DATALaw of partial pressures,P=P¸+P˝+P˛+•••,70,90,1,2A2A3E0000
90 DATAPressure,P=1/3•nm˛í,80,100,1,B08C828CB0
100 DATAInternal energy,U=1/2•m˛íN=3/2•nRT,90,110,1,B08C828CB0
110 DATASpecific heat,"Cv=ÓU/ÓT=3R/2 , Cp=ÓU/ÓT+R=5R/2",100,120,
120 DATAHalf life,N=N˚(1/2)˛ù    (x=1/T),110,130,1,40F8480000
130 DATAMass-energy relation ,E=mcí,120,130,
10010 MODE8:DIM:x=10:y=130:r=x
10040 DEFCHR$(253)="2E2A3A0000"
10050 DEFCHR$(252)="123E020000"
10110 RESTORE(r)
10120 CLS:READm$,n$,b,c,d:IFd=1 THENREADd$:DEFCHR$(254)=d$
10130 l$="["+MID$(STR$(r/10),2)+"]":l=32-LEN(l$)
10140 PRINTm$;TAB(l);l$;n$;
10150 z=ASC(INPUT$(1,@))
10170 IFz=29 ANDr<>x THENr=x:GOTO10110
10180 IFz=28 ANDr<>y THENr=y:GOTO10110
10190 IFz=30 ANDr<>b THENr=b:GOTO10110
10200 IF(z=31 ORz=13) ANDr<>c THENr=c:GOTO10110
10280 GOTO10150
