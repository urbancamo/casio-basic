5 GOTO10010
10 DATAC,0,10,20
20 DATAx�,nx��,10,30
30 DATAx,1,20,40
40 DATA1/x,-1/x�,30,50
50 DATA��,1/(2��),40,60
60 DATAa�,a�loga,50,70
70 DATAe�,e�,60,80
80 DATAe��,ne��,70,90
90 DATAlogx,1/x,80,100
100 DATAx�,x�(logx+1),90,110
110 DATAsinx,cosx,100,120
120 DATAcosx,-sinx,110,130
130 DATAtanx,sec�x,120,140
140 DATAcotx,-cosec�x,130,150
150 DATAsecx,secx�tanx,140,160
160 DATAcosecx,-cosecx�cotx,150,170
170 DATAsinax,a�cosax,160,180
180 DATAcosax,-a�sinax,170,190
190 DATAtanax,a�sec�ax,180,200
200 DATAcotax,-a�cosec�ax,190,210
210 DATAsin�x,1/�(1-x�)          (�y�<�/2),200,220
220 DATAcos�x,-1/�(1-x�)           (0<y<�),210,230
230 DATAtan�x,1/(1+x�)           (�y�<�/2),220,240
240 DATAcot�x,-1/(1+x�)          (�y�<�/2),230,250
250 DATAsec�x,"1/(x�(x�-1))    (0<y<�,x�>1)",240,260
260 DATAcosec�x,"1/(x�(x�-1))  (�y�<�/2,x�>1)",250,270
270 DATAsinhx,coshx,260,280
280 DATAcoshx,sinhx,270,290
290 DATAtanhx,sech�x,280,300
300 DATAcothx,-cosech�x,290,310
310 DATAsechx,-sechx�tanhx,300,320
320 DATAcosechx,-cosechx�cothx,310,330
330 DATAsinh�x,1/�(1+x�),320,340
340 DATAcosh�x,"1/�(x�-1)         (y>0,x�>1)",330,350
350 DATAtanh�x,1/(1-x�)              (x�<1),340,360
360 DATAcoth�x,1/(1-x�)              (x�>1),350,370
370 DATAsech�x,-1/(x�(1-x�))        (0<x<1),360,380
380 DATAcosech�x,-1/(x�(x�+1)),370,380
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
