5 GOTO10010
10 DATAOhm's law,"V=IR   (I=Q/t , R=ş¥l/S)",10,20,1,3E40484830
20 DATAResistance,"R=Rü+Rı , 1/R=1/Rü+1/Rı",10,30,
30 DATADC circuit,V=E-IR,20,40,
40 DATADC power & Joule heat,"P=IV=I’R , W=IVt=Pt",30,50,
50 DATAConductance,G=1/R=I/V,40,60,
60 DATAKirchhoff's law,"„ùI=0 , „ùV=0",50,70,
70 DATAWheatstone bridge,RûRü=RıRş,60,80,1,2A2A3E0000
80 DATAAC instantaneous value,"V=Vû¥sinÿt , I=Iû¥sinÿt",70,90,
90 DATAAC effective value,"I=Iû/‚2 , V=Vû/‚2",80,100,
100 DATAAC power,P=VI=VûIû/2,90,110,
110 DATAPower factor,P=VI¥cos,100,120,
120 DATATransformer,"IüVü=IıVı , Nı/Nü=Vı/Vü",110,130,
130 DATAReactance,"X=ÿL=2çfL , X=1/ÿC=1/2çfC",120,140,
140 DATAImpedance,"Z=‚(R’+(ÿL-1/ÿC)’) , Vû=ZIû",130,150,
150 DATANatural frequency (circuit),fû=1/2ç‚(LC),140,160,
160 DATAElectric oscillation,1/2¥Q’/C+1/2¥LI’=Constant,150,160,
10010 MODE8:DIM:x=10:y=160:r=x
10020 DEFCHR$(255)="3E020C223E"
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
