5 GOTO10010
10 DATA,x+C,10,20
20 DATAx�,x���/(n+1)+C           (n+1�0),10,30
30 DATA1/x,log�x�+C,20,40
40 DATA1/(x�a),log�x�a�+C,30,50
50 DATAe�,e�+C,40,60
60 DATAe��,e��/n+C,50,70
70 DATAa�,"a�/loga+C            (a>0,a�1)",60,80
80 DATAa��,"a��/(n�loga)+C       (a>0,a�1)",70,90
90 DATAlogx,x(logx-1)+C,80,100
100 DATAxe��,e��/n��(nx-1)+C,90,110
110 DATAsinx,-cosx+C,100,120
120 DATAsinax,-1/a�cosax+C,110,130
130 DATAcosx,sinx+C,120,140
140 DATAcosax,1/a�sinax+C,130,150
150 DATAtanx,-log�cosx�+C,140,160
160 DATAcotx,log�sinx�+C,150,170
170 DATAsin�x,x/2-sin2x/4+C,160,180
180 DATAcos�x,x/2+sin2x/4+C,170,190
190 DATAsec�ax,1/a�tanax+C,180,200
200 DATAcosec�ax,-1/a�cotax+C,190,210
210 DATA1/sinx,log(tan(x/2))+C,200,220
220 DATA1/cosx,log(tan((�/4)+(x/2)))+C,210,230
230 DATAe��sinbx,e��(n�sinbx-b�cosbx)/(n�+b�)+C,220,240
240 DATAe��cosbx,e��(n�cosbx+b�sinbx)/(n�+b�)+C,230,250
250 DATAsin�x,xsin�x+�(1-x�)+C,240,260
260 DATAcos�x,xcos�x-�(1-x�)+C,250,270
270 DATAsinhx,coshx+C,260,280
280 DATAcoshx,sinhx+C,270,290
290 DATAtanhx,log(coshx)+C,280,300
300 DATA1/�(a�-x�),sin�(x/a)+C            (�x�<a),290,310
310 DATA1/(a�+x�),1/a�tan�(x/a)+C,300,320
320 DATA1/�(x��a�),log(x+�(x��a�))+C,310,330
330 DATA�(a�-x�),1/2�(x�(a�-x�)+a�sin�(x/a))+C,320,340
340 DATA1/(x�-a�),1/2a�log((x-a)/(x+a))+C  (x>a),330,340
10010 MODE8:DIM:x=10:y=340:r=x
10020 DEFCHR$(255)="0000FF0000"
10110 RESTORE(r)
10120 READm$,n$,b,c:IFm$="" THENm$=CHR$(8)
10130 l$="["+MID$(STR$(r/10),2)+"]":l=32-LEN(l$)
10140 CLS:PRINTCHR$(129);" ";m$;" dx";TAB(l);l$;"=";n$;
10150 z=ASC(INPUT$(1,@))
10170 IFz=29 ANDr<>x THENr=x:GOTO10110
10180 IFz=28 ANDr<>y THENr=y:GOTO10110
10190 IFz=30 ANDr<>b THENr=b:GOTO10110
10200 IF(z=31ORz=13)ANDr<>c THENr=c:GOTO10110
10280 GOTO10150
