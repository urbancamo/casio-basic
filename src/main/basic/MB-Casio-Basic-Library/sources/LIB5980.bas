5 GOTO10010
10 DATAx[g],0.001x[Kg],X[Kg]=.001*x[g],10,20
20 DATAx[g],0.0352740x[oz],X[oz]=.035274*x[g],10,30
30 DATAx[g],0.00220462x[lb],X[lb]=.00220462*x[g],20,40
40 DATAx[Kg],1000x[g],X[g]=1E3*x[Kg],30,50
50 DATAx[Kg],35.2740x[oz],X[oz]=35.274*x[Kg],40,60
60 DATAx[Kg],2.20462x[lb],X[lb]=2.20462*x[Kg],50,70
70 DATAx[oz],28.3495x[g],X[g]=28.3495*x[oz],60,80
80 DATAx[oz],0.0283495x[Kg],X[Kg]=.0283495*x[oz],70,90
90 DATAx[oz],0.0625x[lb],X[lb]=.0625*x[oz],80,100
100 DATAx[lb],453.59237x[g],X[g]=453.59237*x[lb],90,110
110 DATAx[lb],0.45359237x[Kg],X[Kg]=.45359237*x[lb],100,120
120 DATAx[lb],16x[oz],X[oz]=16*x[lb],110,120
10010 MODE8:DIM:x=10:y=120:r=x
10050 p$="Metric conversion (weight)"
10110 RESTORE(r)
10120 READm$,n$,s$,b,c
10130 l$="["+MID$(STR$(r/10),2)+"]":l=32-LEN(l$)
10140 CLS:PRINTp$;TAB(l);l$;m$;" -� ";n$;
10150 z=ASC(INPUT$(1,@))
10170 IFz=29 ANDr<>x THENr=x:GOTO10110
10180 IFz=28 ANDr<>y THENr=y:GOTO10110
10190 IFz=30 ANDr<>b THENr=b:GOTO10110
10200 IFz=31 ANDr<>c THENr=c:GOTO10110
10210 IFz=13 THENCALC$=s$:CALCJMP
10280 GOTO10150
