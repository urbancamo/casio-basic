5 GOTO10010
10 DATA,x+C,10,20
20 DATAxú,xúöë/(n+1)+C           (n+1‚0),10,30
30 DATA1/x,logˇxˇ+C,20,40
40 DATA1/(x˘a),logˇx˘aˇ+C,30,50
50 DATAeù,eù+C,40,60
60 DATAeúù,eúù/n+C,50,70
70 DATAaù,"aù/loga+C            (a>0,a‚1)",60,80
80 DATAaúù,"aúù/(n•loga)+C       (a>0,a‚1)",70,90
90 DATAlogx,x(logx-1)+C,80,100
100 DATAxeúù,eúù/ní•(nx-1)+C,90,110
110 DATAsinx,-cosx+C,100,120
120 DATAsinax,-1/a•cosax+C,110,130
130 DATAcosx,sinx+C,120,140
140 DATAcosax,1/a•sinax+C,130,150
150 DATAtanx,-logˇcosxˇ+C,140,160
160 DATAcotx,logˇsinxˇ+C,150,170
170 DATAsiníx,x/2-sin2x/4+C,160,180
180 DATAcosíx,x/2+sin2x/4+C,170,190
190 DATAsecíax,1/a•tanax+C,180,200
200 DATAcosecíax,-1/a•cotax+C,190,210
210 DATA1/sinx,log(tan(x/2))+C,200,220
220 DATA1/cosx,log(tan((Á/4)+(x/2)))+C,210,230
230 DATAeúùsinbx,eúù(n•sinbx-b•cosbx)/(ní+bí)+C,220,240
240 DATAeúùcosbx,eúù(n•cosbx+b•sinbx)/(ní+bí)+C,230,250
250 DATAsinûx,xsinûx+Ç(1-xí)+C,240,260
260 DATAcosûx,xcosûx-Ç(1-xí)+C,250,270
270 DATAsinhx,coshx+C,260,280
280 DATAcoshx,sinhx+C,270,290
290 DATAtanhx,log(coshx)+C,280,300
300 DATA1/Ç(aí-xí),sinû(x/a)+C            (ˇxˇ<a),290,310
310 DATA1/(aí+xí),1/a•tanû(x/a)+C,300,320
320 DATA1/Ç(xí˘aí),log(x+Ç(xí˘aí))+C,310,330
330 DATAÇ(aí-xí),1/2•(xÇ(aí-xí)+aísinû(x/a))+C,320,340
340 DATA1/(xí-aí),1/2a•log((x-a)/(x+a))+C  (x>a),330,340
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
