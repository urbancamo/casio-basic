10 CLS:GOTO10000
1000 DATA"Memory calculations             [MC],[MR],[M-],[M+]",,1000,5010
5010 DATA"Prime factors                   Base = a * b * c * ¥¥¥",,1000,5020
5020 DATA"G.C.M. & L.C.M.",,5010,5040
5040 DATA"ax1+bx2+cx3+¥¥¥=y",,5020,5050
5050 DATA"ax’+bx+c=0",,5040,5060
5060 DATA"ax“+bx’+cx+d=0",,5050,5080
5080 DATA"Numerical solution  f(x)=0      Newton's method",,5060,5090
5090 DATA"Numerical solution  f(x)=0      Method of bisection",,5080,5100
5100 DATA"Matrix operations",,5090,5200
5200 DATA"f(x)dx  [a,b]                  Romberg's method",,5100,5220
5220 DATA"dy/dx=f(x,y(x))                 Runge-Kutta method",,5200,5230
5230 DATA"Lagrange's interpolation",,5220,5250
5250 DATA"Gamma function  ÿ(x)",82FE8280C0,5230,5260
5260 DATA"Bessel function  Jn(x)",,5250,5270
5270 DATA"Bessel function  Yn(x)",,5260,5280
5280 DATA"Modified Bessel function        In(x)",,5270,5290
5290 DATA"Modified Bessel function        Kn(x)",,5280,5300
5300 DATA"Complex number  a+bi",,5290,5350
5350 DATA"Binary-Decimal-Hexadecimal",,5300,5510
5510 DATA"y=ax+b ä- (x1,y1),(x2,y2)",,5350,5520
5520 DATA"Angle(Œ) ä- y=ax+b,y=cx+d",,5510,5530
5530 DATA"Distance ä- y=ax+b,(x1,y1)",,5520,5540
5540 DATA"(X,Y) ä- (x,y),angle(Œ)",,5530,5550
5550 DATA"Circle (x-a)’+(y-b)’=r’         ä- (x1,y1),(x2,y2),(x3,y3)",,5540,5560
5560 DATA"Length(y=cx+d)                  ä (x-a)’+(y-b)’=r’,(x1,y1)",,5550,5570
5570 DATA"y=cx+d,y=ex+f                   ä (x-a)’+(y-b)’=r’,(x1,y1)",,5560,5600
5600 DATA"Area (triangle)",,5570,5605
5605 DATA"Area (trapezoid)",,5600,5610
5610 DATA"Area (parallelogram)",,5605,5615
5615 DATA"Area (circle)",,5610,5620
5620 DATA"Area (sector)",,5615,5625
5625 DATA"Area (segment)",,5620,5630
5630 DATA"Area (ellipse)",,5625,5635
5635 DATA"Area (polygon)",,5630,5650
5650 DATA"Surface (sphere)",,5635,5655
5655 DATA"Surface (zone of sphere)",,5650,5660
5660 DATA"Surface (spherical sector)",,5655,5665
5665 DATA"Surface (circular cylinder)",,5660,5670
5670 DATA"Surface (circular cone)",,5665,5675
5675 DATA"Surface                         (frustum of circular cone)",,5670,5700
5700 DATA"Volume (sphere)",,5675,5705
5705 DATA"Volume (zone of sphere)",,5700,5710
5710 DATA"Volume (spherical sector)",,5705,5715
5715 DATA"Volume (circular cylinder)",,5710,5720
5720 DATA"Volume (circular cone)",,5715,5725
5725 DATA"Volume                          (frustum of circular cone)",,5720,5730
5730 DATA"Volume (wedge)",,5725,5735
5735 DATA"Volume (pyramid)",,5730,5740
5740 DATA"Volume                          (frustum of pyramid)",,5735,5745
5745 DATA"Volume (ellipsoid)",,5740,5750
5750 DATA"Polygon  A,n -æ r,R,l",,5745,5760
5760 DATA"Polyhedron (a,r,R,S,V)",,5750,5800
5800 DATA"Factorization                   a’+2ab+b’=(a+b)’",,5760,5810
5810 DATA"Trigonometric function          sin’Œ+cos’Œ=1",,5800,5820
5820 DATA"Differential                    y=ax’+bx+c æ yƒ=2ax+b",,5810,5830
5830 DATA"Integration                      x dx = 1/2¥x’+C",,5820,5840
5840 DATA"Laplace transformation          F(p)=1/p æ f(t)=1",,5830,5900
5900 DATA"Periodic table                  H Hydrogen 1(1-1a) 1.00794",,5840,5910
5910 DATA"Scientific constant             g=9.80665 [m¥s›’]",,5900,5920
5920 DATA"Electrolytic dissociation       HCOOH äæ HCOO› + Hš",,5910,5930
5930 DATA"Motion                          Ek=1/2¥mv’",,5920,5932
5932 DATA"Waves                           f=fû¥(v-vü)/(v-vı)",,5930,5934
5934 DATA"AC & DC circuits                R=Rü+Rı , 1/R=1/Rü+1/Rı",,5932,5936
5936 DATA"Electric & Magnetic fields      Q=CV , C=‹û¥S/d",,5934,5938
5938 DATA"Thermodynamics and others       W=JQ , J=4.19 [J/cal]",,5936,5950
5950 DATA"Metric conversion (length)      1[cm] -æ 0.01[m]",,5938,5960
5960 DATA"Metric conversion (area)        1[cm’] -æ 0.0001[m’]",,5950,5970
5970 DATA"Metric conversion (volume)      1[cm“] -æ 0.000001[m“]",,5960,5980
5980 DATA"Metric conversion (weight)      1[g] -æ 0.001[kg]",,5970,6210
6210 DATA"Upper probability integrals     N(0,1’)",,5980,6220
6220 DATA"Upper probability integrals     X’(x’,ş)",,6210,6230
6230 DATA"Upper probability integrals     t(x,ş)",,6220,6240
6240 DATA"Upper probability integrals     F(x,şü,şı)",,6230,6310
6310 DATA"Upper cumulative                frequencies     B(x,n,P)",,6240,6320
6320 DATA"Upper cumulative                frequencies     P(x,ÿ)",424C300806,6310,6330
6330 DATA"Upper cumulative                frequencies     H(x,n,M,N)",,6320,6410
6410 DATA"Percentage points               N(0,1’)",,6330,6420
6420 DATA"Percentage points               X’(x’,ş)",,6410,6430
6430 DATA"Percentage points               t(x,ş)",,6420,6440
6440 DATA"Percentage points               F(x,şü,şı)",,6430,6450
6450 DATA"Normal random numbers",,6440,6460
6460 DATA"Exponential random numbers",,6450,6500
6500 DATA"Statistics [x]",,6460,6510
6510 DATA"Regression analysis             [y=a+bx]",,6500,6520
6520 DATA"Regression analysis             [y=a+blnx]",,6510,6530
6530 DATA"Regression analysis             [y=ab^x]",,6520,6540
6540 DATA"Regression analysis             [y=ax^b]",,6530,6610
6610 DATA"Estimation  a<<b               N(,’) ’:known",,6540,6620
6620 DATA"Estimation  a<<b               N(,’)",,6610,6630
6630 DATA"Estimation  a<’<b              N(,’)",,6620,6640
6640 DATA"Estimation  a<<b               N(,’)",,6630,6650
6650 DATA"Estimation  a<ı’/ü’<b         N(ü,ü’),N(ı,ı’)",,6640,6660
6660 DATA"Estimation  a<ü-ı<b           N(ü,’),N(ı,’)",,6650,6670
6670 DATA"Estimation  a<p<b               B(1,p)",,6660,6680
6680 DATA"Estimation  a<pü-pı<b           B(1,pü),B(1,pı)",,6670,6710
6710 DATA"Test N(,’) ’:known                Hû:=û    Hü:âû",,6680,6711
6711 DATA"Test N(,’) ’:known                Hû:=û    Hü:>û",,6710,6712
6712 DATA"Test N(,’) ’:known                Hû:=û    Hü:<û",,6711,6720
6720 DATA"Test N(,’)                         Hû:=û    Hü:âû",,6712,6721
6721 DATA"Test N(,’)                         Hû:=û    Hü:>û",,6720,6722
6722 DATA"Test N(,’)                         Hû:=û    Hü:<û",,6721,6730
6730 DATA"Test N(,’)                         Hû:’=û’  Hü:’âû’",,6722,6731
6731 DATA"Test N(,’)                         Hû:’=û’  Hü:’>û’",,6730,6732
6732 DATA"Test N(,’)                         Hû:’=û’  Hü:’<û’",,6731,6740
6740 DATA"Test N(ü,ü’),N(ı,ı’)             Hû:ü’=ı’ Hü:ü’âı’",,6732,6741
6741 DATA"Test N(ü,ü’),N(ı,ı’)             Hû:ü’=ı’ Hü:ü’>ı’",,6740,6742
6742 DATA"Test N(ü,ü’),N(ı,ı’)             Hû:ü’=ı’ Hü:ü’<ı’",,6741,6750
6750 DATA"Test N(ü,’),N(ı,’)               Hû:ü=ı   Hü:üâı",,6742,6751
6751 DATA"Test N(ü,’),N(ı,’)               Hû:ü=ı   Hü:ü>ı",,6750,6752
6752 DATA"Test N(ü,’),N(ı,’)               Hû:ü=ı   Hü:ü<ı",,6751,6760
6760 DATA"Test B(1,p)                          Hû:p=pû    Hü:pâpû",,6752,6761
6761 DATA"Test B(1,p)                          Hû:p=pû    Hü:p>pû",,6760,6762
6762 DATA"Test B(1,p)                          Hû:p=pû    Hü:p<pû",,6761,6770
6770 DATA"Test B(1,pü),B(1,pı)                 Hû:pü=pı   Hü:püâpı",,6762,6771
6771 DATA"Test B(1,pü),B(1,pı)                 Hû:pü=pı   Hü:pü>pı",,6770,6772
6772 DATA"Test B(1,pü),B(1,pı)                 Hû:pü=pı   Hü:pü<pı",,6771,6772
10000 ONERRORGOTO10400
10010 MODE8:DIM:x=1000:y=6772
10020 DEFSEG=0:a=PEEK(&H743)*256+PEEK(&H742):r$=HEX$(PEEK(&H744))+"000":b=VAL("&H"+r$)
10030 DEFSEG=b:r$="":FORi=a TOa+3:r$=r$+CHR$(PEEK(i+7)):NEXT:r=VAL(r$)
10060 DEFCHR$(254)="3E02040830"
10070 DEFCHR$(253)="2E2A3A0000"
10080 DEFCHR$(252)="123E020000"
10110 RESTORE(r)
10120 READm$,n$,b,c
10130 IFn$<>"" THENDEFCHR$(255)=n$
10140 CLS:PRINTMID$(STR$(r),2);":";m$;
10150 z=ASC(INPUT$(1,@))
10160 IFz=29 ANDr<>x THENa=&HF7EA:r=x:GOTO10110
10170 IFz=28 ANDr<>y THENa=&HFEA7:r=y:GOTO10110
10180 IFz=30 ANDr<>b THENa=a-15:r=b:GOTO10110
10190 IF(z=31 ORz=218) ANDr<>c THENa=a+15:r=c:GOTO10110
10200 IFz=13 ORz=252 THEN10300
10210 GOTO10150
10300 CLS:DEFSEG=0:a$=HEX$(a):b=VAL("&H"+LEFT$(a$,2)):c=VAL("&H"+RIGHT$(a$,2)):POKE&H742,c:POKE&H743,b:r$="LIB0:"+MID$(STR$(r),2):GOTOr$
10400 IFERR=1 THENONERRORGOTO0
10410 r=x:RESUME10110
