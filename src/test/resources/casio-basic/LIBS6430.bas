20 GOSUB400:ANGLE1:IFp>=1 ORp=<0 THEN*
30 GOSUB"LIB0:S6410":GOSUB400:x=y:y=x^2
40 a=(y+1)/4:b=((5*y+16)*y+3)/96:c=(((3*y+19)*y+17)*y-15)/384:d=((((79*y+776)*y+1482)*y-1920)*y-945)/92160:e=(((((27*y+339)*y+930)*y-1782)*y-765)*y+17955)/368640
50 x=x*(1+(a+(b+(c+(d+e/n)/n)/n)/n)/n)
60 IFn>(LOGp)^2+3 THEN80
70 q=p:GOSUB"LIB0:S6230":GOSUB400:p=y:GOSUB100:y=x:x=x+(p-q)/a:p=q:IFx THENIFROUND(x-y,LOG(ABSx)-5)<>0 THEN70
80 y=x:RETURN
100 b=n+1:a=EXP((b*LN(b/(n+x*x))+LN(n/b/2/PI)-1+(1/b-1/n)/6)/2):RETURN
400 ONERRORGOTO500:RETURN
500 IFERR=1 THENCLS:ONERRORGOTO0
510 sr=1:RESUME80
