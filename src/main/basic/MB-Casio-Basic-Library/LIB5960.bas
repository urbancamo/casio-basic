5 GOTO10010
10 DATAx[m’],0.01x[a],X[a]=0.01*x[m’],10,20
20 DATAx[m’],0.000247105x[acre],X[acre]=2.47105E-4*x[m’],10,30
30 DATAx[m’],0.000000386102x[mile’],X[mile’]=3.86102E-7*x[m’],20,40
40 DATAx[a],100x[m’],X[m’]=100*x[a],30,50
50 DATAx[a],0.0247105x[acre],X[acre]=0.0247105*x[a],40,60
60 DATAx[a],0.0000386102x[mile’],X[mile’]=3.86102E-5*x[a],50,70
70 DATAx[acre],4046.86x[m’],X[m’]=4046.86*x[acre],60,80
80 DATAx[acre],40.4686x[a],X[a]=40.4686*x[acre],70,90
90 DATAx[acre],0.0015625x[mile’],X[mile’]=.0015625*x[acre],80,100
100 DATAx[mile’],2589990x[m’],X[m’]=2589990*x[mile’],90,110
110 DATAx[mile’],25899.9x[a],X[a]=25899.9*x[mile’],100,120
120 DATAx[mile’],640x[acre],X[acre]=640*x[mile’],110,120
10010 MODE8:DIM:x=10:y=120:r=x
10050 p$="Metric conversion (area)"
10110 RESTORE(r)
10120 READm$,n$,s$,b,c
10130 l$="["+MID$(STR$(r/10),2)+"]":l=32-LEN(l$)
10140 CLS:PRINTp$;TAB(l);l$;m$;" -æ ";n$;
10150 z=ASC(INPUT$(1,@))
10170 IFz=29 ANDr<>x THENr=x:GOTO10110
10180 IFz=28 ANDr<>y THENr=y:GOTO10110
10190 IFz=30 ANDr<>b THENr=b:GOTO10110
10200 IFz=31 ANDr<>c THENr=c:GOTO10110
10210 IFz=13 THENCALC$=s$:CALCJMP
10280 GOTO10150
