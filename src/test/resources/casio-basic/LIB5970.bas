5 GOTO10010
10 DATAx[cm“],0.000001x[m“],X[m“]=1e-6*x[cm“],10,20
20 DATAx[cm“],0.0610237x[in“],X[in“]=.0610237*x[cm“],10,30
30 DATAx[cm“],0.0000353147x[ft“],X[ft“]=3.53147E-5*x[cm“],20,40
40 DATAx[cm“],0.001x[l],X[l]=.001*x[cm“],30,50
50 DATAx[cm“],0.000264172x[gal(US)],X[gal(US)]=2.64172E-4*x[cm“],40,60
60 DATAx[cm“],0.000219968x[gal(UK)],X[gal(UK)]=2.19968E-4*x[cm“],50,70
70 DATAx[m“],1000000x[cm“],X[cm“]=1E6*x[m“],60,80
80 DATAx[m“],61023.7x[in“],X[in“]=61023.7*x[m“],70,90
90 DATAx[m“],35.3147x[ft“],X[ft“]=35.3147*x[m“],80,100
100 DATAx[m“],1000x[l],x[l]=1E3*x[m“],90,110
110 DATAx[m“],264.172x[gal(US)],X[gal(US)]=264.172*x[m“],100,120
120 DATAx[m“],219.968x[gal(UK)],X[gal(UK)]=219.968*x[m“],110,130
130 DATAx[in“],16.3871x[cm“],X[cm“]=16.3871*x[in“],120,140
140 DATAx[in“],0.0000163871x[m“],X[m“]=1.63871E-5*x[in“],130,150
150 DATAx[in“],0.000578704x[ft“],X[ft“]=.000578704*x[in“],140,160
160 DATAx[in“],0.0163871x[l],X[l]=.0163871*x[in“],150,170
170 DATAx[in“],0.00432900x[gal(US)],X[gal(US)]=.004329*x[in“],160,180
180 DATAx[in“],0.00360464x[gal(UK)],X[gal(UK)]=.00360464*x[in“],170,190
190 DATAx[ft“],28316.8x[cm“],X[cm“]=28316.8*x[ft“],180,200
200 DATAx[ft“],0.0283168x[m“],X[m“]=.0283168*x[ft“],190,210
210 DATAx[ft“],1728x[in“],X[in“]=1728*x[ft“],200,220
220 DATAx[ft“],28.3168x[l],X[l]=28.3168*x[ft“],210,230
230 DATAx[ft“],7.48052x[gal(US)],X[gal(US)]=7.48052*x[ft“],220,240
240 DATAx[ft“],6.22882x[gal(UK)],X[gal(UK)]=6.22882*x[ft“],230,250
250 DATAx[l],1000x[cm“],X[cm“]=1E3*x[l],240,260
260 DATAx[l],0.001x[m“],X[m“]=.001*x[l],250,270
270 DATAx[l],61.0237x[in“],X[in“]=61.0237*x[l],260,280
280 DATAx[l],0.0353147x[ft“],X[ft“]=.0353147*x[l],270,290
290 DATAx[l],0.264172x[gal(US)],X[gal(US)]=.264172*x[l],280,300
300 DATAx[l],0.219968x[gal(UK)],X[gal(UK)]=.219968*x[l],290,300
310 DATAx[gal(US)],3785.41x[cm“],X[cm“]=3785.41*x[gal(US)],300,320
320 DATAx[gal(US)],0.00378541x[m“],X[m“]=.00378541*x[gal(US)],310,330
330 DATAx[gal(US)],231x[in“],X[in“]=231*x[gal(US)],320,340
340 DATAx[gal(US)],0.133681x[ft“],X[ft“]=.133681*x[gal(US)],330,350
350 DATAx[gal(US)],3.78541x[l],X[l]=3.78541*x[gal(US)],340,360
360 DATAx[gal(US)],0.832672x[gal(UK)],X[gal(UK)]=0.832672*x[gal(US)],350,370
370 DATAx[gal(UK)],4546.09x[cm“],X[cm“]=4546.09*x[gal(UK)],360,380
380 DATAx[gal(UK)],0.00454609x[m“],X[m“]=.00454609*x[gal(UK)],370,390
390 DATAx[gal(UK)],277.42x[in“],X[in“]=277.42*x[gal(UK)],380,400
400 DATAx[gal(UK)],0.160544x[ft“],X[ft“]=.160544*x[gal(UK)],390,410
410 DATAx[gal(UK)],4.54609x[l],X[l]=4.54609*x[gal(UK)],400,420
420 DATAx[gal(UK)],1.20095x[gal(US)],X[gal(US)]=1.20095*x[gal(UK)],410,420
10010 MODE8:DIM:x=10:y=300:r=x
10050 p$="Metric conversion (volume)"
10110 RESTORE(r)
10120 READm$,n$,s$,b,c
10130 l$="["+MID$(STR$(r/10),2)+"]":l=32-LEN(l$)
10140 CLS:PRINTp$;TAB(l);l$;m$;" -æ ";n$;:LOCATE0,0:LOCATE0,1
10150 z=ASC(INPUT$(1,@))
10170 IFz=29 ANDr<>x THENr=x:GOTO10110
10180 IFz=28 ANDr<>y THENr=y:GOTO10110
10190 IFz=30 ANDr<>b THENr=b:GOTO10110
10200 IFz=31 ANDr<>c THENr=c:GOTO10110
10210 IFz=13 THENCALC$=s$:CALCJMP
10280 GOTO10150
