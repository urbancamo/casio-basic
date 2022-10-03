5 ONERRORGOTO500
10 MODE8:DIM:ERASEa:DIMa(8):l$="abr":m$="x1y1x2y2x3y3":c$=CHR$(5)
20 CLS:PRINT"Circle  (x1,y1),(x2,y2),(x3,y3)";
30 FORk=0 TO5
40 LOCATE0,1:PRINTc$;MID$(m$,1+2*k,2);"=";a(k);"?";:INPUT@42;a(k):LOCATE0,0
50 NEXT:LOCATE0,1:PRINTc$;
60 a=a(0)-a(2):b=a(0)+a(2):c=a(1)-a(3):d=a(1)+a(3):e=(a*b+c*d)/2
70 f=a(2)-a(4):g=a(2)+a(4):h=a(3)-a(5):i=a(3)+a(5):j=(f*g+h*i)/2
80 IFa*h-c*f<>0 THENa(7)=(a*j-e*f)/(a*h-c*f) ELSE160
90 IFa<>0 THENa(6)=(e-a(7)*c)/a ELSEIFf<>0 THENa(6)=(j-a(7)*h)/f ELSE160
100 a(8)=SQR((a(0)-a(6))^2+(a(1)-a(7))^2)
110 CLS:PRINT"Circle  (x-a)’+(y-b)’=r’";:PRINT
120 FORk=1 TO3:PRINTc$;MID$(l$,k,1);" =";a(k+5);
125 w=ASC(INPUT$(1,@)):IFw=13 THEN140
130 IFw=30 ANDk>1 THENk=k-2:GOTO140
132 IFw=31 ANDk<3 THEN140
138 GOTO125
140 NEXT:GOTO20
160 LOCATE0,1:PRINTc$;"not found";:w$=INPUT$(1,@):GOTO20
500 IFERR=1 THENCLS:ONERRORGOTO0
510 IFERL=40 THENRESUME40
520 RESUME160
