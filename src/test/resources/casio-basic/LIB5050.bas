5 ONERRORGOTO1000
10 MODE8:DIM:c$=CHR$(5):a=1:b=0:c=0
20 CLS:PRINT"ax+bx+c=0";
30 s$="a":z=a:GOSUB700:a=z:IFz=0 THEN30
40 s$="b":z=b:GOSUB700:b=z
50 s$="c":z=c:GOSUB700:c=z
60 LOCATE0,1:PRINTc$;".....";
100 d=b*b-4*a*c
110 CLS:IFd THEN130
120 PRINT"a(x-)=0";:PRINT:GOTO200
130 PRINT"a(x-)(x-)=0";:PRINT
140 ONSGNd+2 GOTO400,,300
200 x=-b/(2*a):GOSUB510:PRINTc$;" =";x;
210 GOSUB550:IFw=13 THEN20 ELSE210
300 IFb<0 THENz=-b+SQRd ELSEz=-b-SQRd
305 x=z/2/a:y=2*c/z:GOSUB500
310 PRINTc$;" =";x;
330 GOSUB550:IFw<>13 ANDw<>31 THEN330
340 PRINTc$;" =";y;
360 GOSUB550:IFw=30 THEN310 ELSEIFw=13 THEN20 ELSE360
400 x=-b/(2*a):y=SQR(-d)/(2*a):GOSUB500:x$=STR$(x)+" ":y$=MID$(STR$(y),2):IFx=0 THENx$=""
410 PRINTc$;" =";x$;:IFx THENPRINT"+";
420 IFy-1 THENPRINT" ";y$;"i"; ELSEPRINT" i";
430 GOSUB550:IFw<>13 ANDw<>31 THEN430
440 PRINTc$;" =";x$;"-";:IFx THENPRINT" ";
450 IFy-1 THENPRINTy$;"i"; ELSEPRINT"i";
460 GOSUB550:IFw=30 THEN410 ELSEIFw=13 THEN20 ELSE460
500 IFy<>0 ANDABSy>=1e-90 THENy=ROUND(y,LOG(ABSy)-7)
505 IFy<>0 ANDABSy<1e-90 THENy=y*1e10:y=ROUND(y,LOG(ABSy)-7):y=y/1e10
510 IFx<>0 ANDABSx>=1e-90 THENx=ROUND(x,LOG(ABSx)-7)
515 IFx<>0 ANDABSx<1e-90 THENx=x*1e10:x=ROUND(x,LOG(ABSx)-7):x=x/1e10
520 RETURN
550 LOCATE0,0:LOCATE0,1:w=ASC(INPUT$(1,@)):RETURN
700 LOCATE0,1:PRINTc$;s$;"=";z;"?";:INPUT@42;z:LOCATE0,0:RETURN
1000 IFERR=1 THENCLS:ONERRORGOTO0
1010 IFERL=700 THENRESUME700
1050 LOCATE0,1:PRINTc$;"not found";:z$=INPUT$(1,@):RESUME20
