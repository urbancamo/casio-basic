5 ONERRORGOTO500
10 MODE8:DIM:ERASEa,b,c$:DIMa(4),b(7),c$(7):a$="a b r x1y1":c$=CHR$(5)
20 CLS:PRINT"(x-a)’+(y-b)’=r’,(x1,y1)";
30 FORi=0 TO4
40 LOCATE0,1:PRINTc$;MID$(a$,i*2+1,(SGN(i-2.5)+1)/2+1);"=";a(i);"?";:INPUT@42;a(i):LOCATE0,0
50 IFi=2 ANDa(2)=<0 THEN40
60 IFi>2 THENIFABS(a(i-3)-a(i))/ABS(a(2))>1e5 THEN30
70 NEXT:a=a(0):b=a(1):r=a(2):x=a(3):y=a(4):LOCATE0,1:PRINTc$;".....";
75 IF(x-a)^2+(y-b)^2<r^2 THENGOTO300
80 IFx=a THEN100 ELSEc=(y-b)/(a-x):d=r^2/(a-x):e=c^2+1:f=c*(c*b+d)+b:g=(c*b+d)^2+b^2-r^2:l=f^2-e*g
90 IFl<0 THEN100 ELSEi=(f+SQRl)/e:k=(f-SQRl)/e:h=c*(i-b)-d+a:j=c*(k-b)-d+a:GOTO200
100 IFy=b THEN300 ELSEc=(x-a)/(b-y):d=r^2/(b-y):e=c^2+1:f=c*(c*a+d)+a:g=(c*a+d)^2+a^2-r^2:l=f^2-e*g
110 IFl<0 THEN300 ELSEh=(f+SQRl)/e:j=(f-SQRl)/e:i=c*(h-a)-d+b:k=c*(j-a)-d+b
200 IFABS(h-j)+ABS(i-k)<>0 THEN210
201 p$="(x1,y1)=(x2,y2)=(x3,y3),":n=0:c$(0)="d"
202 IFb=y THENp$=p$+"x=d":b(0)=x:GOTO400
203 IFx=a THENp$=p$+"y=d":b(0)=y:GOTO400
204 n=1:c$(0)="c":c$(1)="d":p$=p$+"y=cx+d":b(0)=(x-a)/(b-y):b(1)=y-(x-a)/(b-y)*x:GOTO400
210 p$="(x2,y2),":n=2:c$(0)="x2":c$(1)="y2":c$(2)="d"
220 b(0)=h:b(1)=i
230 IFx=h THENp$=p$+"x=d   ":b(2)=x:GOTO250
232 IFy=i THENp$=p$+"y=d   ":b(2)=y:GOTO250
234 n=3:p$=p$+"y=cx+d":c$(2)="c":c$(3)="d":b(2)=(i-y)/(h-x):b(3)=(y-i)/(h-x)*x+y
250 p$=p$+" : (x3,y3),"
260 n=n+1:c$(n)="x3":b(n)=j
270 n=n+1:c$(n)="y3":b(n)=k
275 n=n+1:c$(n)="f"
280 IFx=j THENp$=p$+"x=f":b(n)=x:GOTO400
282 IFy=k THENp$=p$+"y=f":b(n)=y:GOTO400
284 p$=p$+"y=ex+f":c$(n)="e":b(n)=(k-y)/(j-x):n=n+1:c$(n)="f":b(n)=(y-k)/(j-x)*x+y:GOTO400
300 LOCATE0,1:PRINTc$;"not found";:w$=INPUT$(1,@):GOTO20
400 CLS:PRINTp$;:PRINT:FORz=0 TOn
410 PRINTc$;c$(z);" =";b(z);
420 w=ASC(INPUT$(1,@)):IFw=13 THEN480
430 IFw=30 ANDz>0 THENz=z-2:GOTO480
440 IFw=31 ANDz<n THEN480
470 GOTO420
480 NEXT:GOTO20
500 IFERR=1 THENCLS:ONERRORGOTO0
510 IFERL=40 THENRESUME40
550 RESUME300
