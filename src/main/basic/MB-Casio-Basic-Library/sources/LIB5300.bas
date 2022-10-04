5 ONERRORGOTO1000
10 MODE8:DIM:DEFCHR$(255)="0000FE0000":e=0:f=0:c=0:d=0:g=0:h=0:l$=CHR$(5):GOSUB580
20 a=e:b=f
30 x=a:GOSUB530:a=x:x=b:GOSUB530:b=x
50 IFb<0 THENa$=" -" ELSEa$=" +"
60 LOCATE0,0:c$=STR$(a):IFa THENd$=STR$(ABSb) ELSEd$=STR$(b)
70 IFABSb=1 THENd$=MID$(d$,1,1)
80 PRINTl$;:IFb=0 THENPRINTc$;ELSE IFa=0 THENPRINTd$;"i"; ELSEPRINTc$;a$;d$;"i";
90 LOCATE26,1:z=ASC(INPUT$(1)):IFz>96 THENz=z-32
100 ONz-41 GOTO260,260,,260,600,260,,,,,,,,,,,,,,,,,,220,,380,,,,420,,480,,,400,360,,,,,,500,,,,,,,,,,,450
110 GOTO90
220 CLS:PRINT"Complex number  A(a+bi)";
230 e$="a":x=a:GOSUB520:a=x:e$="b":x=b:GOSUB520:b=x:GOSUB580:GOTO50
260 CLS:PRINT"Complex number  B(c+di)";
270 e$="c":x=c:GOSUB520:c=x:e$="d":x=d:GOSUB520:d=x
290 GOSUB580:ONz-41 GOTO310,320,,330,,340
310 e=a*c-b*d:f=b*c+a*d:GOTO20
320 e=a+c:f=b+d:GOTO20
330 e=a-c:f=b-d:GOTO20
340 e=(a*c+b*d)/(c*c+d*d):f=(b*c-a*d)/(c*c+d*d):GOTO20
360 g=a:h=b:GOTO30
380 e=a:f=b:a=c:b=d:c=e:d=f:GOTO30
400 a=g:b=h:GOTO30
420 e=SQR(a*a+b*b):f=ACS(a/e):IFb THENf=f*SGN(b)
430 CLS:PRINT"r =";e;TAB(0);"Œ =";f;:a$=INPUT$(1,@):GOSUB580:GOTO50
450 e=a*a-b*b:f=2*a*b:GOTO20
480 e=a/(a*a+b*b):f=-b/(a*a+b*b):GOTO20
500 IFb=0 THENIFa<0 THENf=SQR(-a):e=0:GOTO20 ELSEe=SQRa:f=0:GOTO20
510 IFb<>0 THENx=SQR(a*a+b*b):e=SQR((a+x)/2):f=b/(2*e):GOTO20
520 LOCATE0,1:PRINTl$;e$;"=";x;"?";:INPUT@14;x:LOCATE0,0
530 IFx<>0 ANDABSx>=1e-90 THENx=ROUND(x,LOG(ABSx)-8)
540 IFx<>0 ANDABSx<1e-90 THENx=x*1e10:x=ROUND(x,LOG(ABSx)-8):x=x/1e10
550 RETURN
580 CLS:LOCATE0,1:PRINT">A,G,I,S,^,+,-,*,/,M,L,C ?";:RETURN
600 CLS:GOSUB710:i=2
610 PRINT:ONi GOSUB710,715,720,730,740,750,760,770,780,800,810,820
620 z=ASC(INPUT$(1,@)):IFz=28 ORz=29 THEN690
630 IFz<>13 ANDz<>30 ANDz<>31 THEN620
640 IF(z=30 ANDi=1) OR(z=31 ANDi=12) THEN620
650 IFz=30 THENi=i-2
680 i=i+1:IFi<13 THEN610
690 GOSUB580:GOTO50
710 PRINT" A : input A";:RETURN
715 PRINT" G : Gauss  r=ÿAÿ:Œ=argument(A)";:RETURN
720 PRINT" I : inverse         1/A æ A";:RETURN
730 PRINT" S : square root     ‚A æ A";:RETURN
740 PRINT" ^ : square          A’ æ A";:RETURN
750 PRINT" + : addition        A+B æ A";:RETURN
760 PRINT" - : subtraction     A-B æ A";:RETURN
770 PRINT" * : multiplication  A*B æ A";:RETURN
780 PRINT" / : division        A/B æ A";:RETURN
800 PRINT" M : memory          A æ M";:RETURN
810 PRINT" L : load            A ä M";:RETURN
820 PRINT" C : change          A äæ B";:RETURN
1000 IFERR=1 THENCLS:ONERRORGOTO0
1010 IFERL=520 THENRESUME520
1030 LOCATE0,0:PRINTl$;"not found";:a$=INPUT$(1,@):RESUME690
