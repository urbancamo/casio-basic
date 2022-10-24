5 GOTO10010
10 DATAC,0,10,20
20 DATAxú,nxúû,10,30
30 DATAx,1,20,40
40 DATA1/x,-1/xí,30,50
50 DATAÇˇ,1/(2Çˇ),40,60
60 DATAaù,aùloga,50,70
70 DATAeù,eù,60,80
80 DATAeúù,neúù,70,90
90 DATAlogx,1/x,80,100
100 DATAxù,xù(logx+1),90,110
110 DATAsinx,cosx,100,120
120 DATAcosx,-sinx,110,130
130 DATAtanx,secíx,120,140
140 DATAcotx,-cosecíx,130,150
150 DATAsecx,secx•tanx,140,160
160 DATAcosecx,-cosecx•cotx,150,170
170 DATAsinax,a•cosax,160,180
180 DATAcosax,-a•sinax,170,190
190 DATAtanax,a•secíax,180,200
200 DATAcotax,-a•cosecíax,190,210
210 DATAsinûx,1/Ç(1-xí)          (˛y˛<Á/2),200,220
220 DATAcosûx,-1/Ç(1-xí)           (0<y<Á),210,230
230 DATAtanûx,1/(1+xí)           (˛y˛<Á/2),220,240
240 DATAcotûx,-1/(1+xí)          (˛y˛<Á/2),230,250
250 DATAsecûx,"1/(xÇ(xí-1))    (0<y<Á,xí>1)",240,260
260 DATAcosecûx,"1/(xÇ(xí-1))  (˛y˛<Á/2,xí>1)",250,270
270 DATAsinhx,coshx,260,280
280 DATAcoshx,sinhx,270,290
290 DATAtanhx,sechíx,280,300
300 DATAcothx,-cosechíx,290,310
310 DATAsechx,-sechx•tanhx,300,320
320 DATAcosechx,-cosechx•cothx,310,330
330 DATAsinhûx,1/Ç(1+xí),320,340
340 DATAcoshûx,"1/Ç(xí-1)         (y>0,xí>1)",330,350
350 DATAtanhûx,1/(1-xí)              (xí<1),340,360
360 DATAcothûx,1/(1-xí)              (xí>1),350,370
370 DATAsechûx,-1/(xÇ(1-xí))        (0<x<1),360,380
380 DATAcosechûx,-1/(xÇ(xí+1)),370,380
10010 MODE8:DIM:x=10:y=380:r=x
10020 DEFCHR$(255)="A2A49C92A2"
10030 DEFCHR$(254)="0000FE0000"
10110 RESTORE(r)
10120 READm$,n$,b,c
10130 l$="["+MID$(STR$(r/10),2)+"]":l=32-LEN(l$)
10140 CLS:PRINT"y =";m$;TAB(l);l$;"y";CHR$(131);"=";n$;
10150 z=ASC(INPUT$(1,@))
10170 IFz=29 ANDr<>x THENr=x:GOTO10110
10180 IFz=28 ANDr<>y THENr=y:GOTO10110
10190 IFz=30 ANDr<>b THENr=b:GOTO10110
10200 IF(z=31 ORz=13) ANDr<>c THENr=c:GOTO10110
10280 GOTO10150
