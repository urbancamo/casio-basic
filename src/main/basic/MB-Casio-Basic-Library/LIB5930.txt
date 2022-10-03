5 GOTO10010
10 DATAUniformly accelerated motion,"v=v˚+at , a=Óv/Ót , s=v˚t+atí/2",10,20,
20 DATANewton's equation of motion,F=ma,10,30,
30 DATACircular motion,T=2Ár/v=2Á/˛=1/f,20,40,
40 DATACircular motion,"˛=2Á/T=2Áf=v/r , F=mr˛í=mví/r",30,50,
50 DATASimple harmonic oscillation,"x=r•sin˛t , v=r˛•cos˛t , a=-˛íx",40,60,
60 DATAHooke's law,F=-kx,50,70,
70 DATASpring,"a=F/m=-k/m•x , T=2ÁÇ(m/k)",60,80,
80 DATASimple pendulum,"a=F/m=-g/l•x , T=2ÁÇ(l/g)",70,90,
90 DATAPotential energy,Ep=mgh,80,100,
100 DATAElastic energy   (spring),Ee=1/2•kxí,90,110,
110 DATAKinetic energy,Ek=1/2•mví,100,120,
120 DATACoefficient of friction,F=çN,110,130,
130 DATAWork,W=Fs,120,140,
140 DATAKepler's law (3'rd),Tí/rì=Constant,130,150,
150 DATAUniversal gravitation,"F=G•Mm/rí , G=6.7*10ˇë[N•mí/kgí]",140,160,
160 DATAPotential energy   (planet),Up=-G•Mm/r ,150,170,
170 DATAKinetic energy   (planet),Ek=1/2•mrí˛í,160,180,
180 DATAMoment of inertia,"I=mrí , E=1/2•I˛í",170,190,
190 DATAAngular momentum,J=I˛,180,200,
200 DATAConservation of momentum,mv¸+MV¸=mv˝+MV˝,190,200,
10010 MODE8:DIM:x=10:y=200:r=x
10020 DEFCHR$(255)="202048F808"
10030 DEFCHR$(254)="3E020C223E"
10040 DEFCHR$(253)="2E2A3A0000"
10050 DEFCHR$(252)="123E020000"
10110 RESTORE(r)
10120 CLS:READm$,n$,b,c,d
10130 l$="["+MID$(STR$(r/10),2)+"]":l=32-LEN(l$)
10140 PRINTm$;TAB(l);l$;n$;:LOCATE0,0:LOCATE1,1
10150 z=ASC(INPUT$(1,@))
10170 IFz=29 ANDr<>x THENr=x:GOTO10110
10180 IFz=28 ANDr<>y THENr=y:GOTO10110
10190 IFz=30 ANDr<>b THENr=b:GOTO10110
10200 IF(z=31 ORz=13) ANDr<>c THENr=c:GOTO10110
10280 GOTO10150
