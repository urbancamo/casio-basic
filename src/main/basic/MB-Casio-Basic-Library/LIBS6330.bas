5 ONERRORGOTO500
10 GOSUB100:s=f:q=k+1:y=n+1
30 FORi=1 TOx:f=f*(q-i)*(y-i)/i/(z+i):s=s+f:NEXT
80 s=1-s+f:RETURN
100 q=m-k:y=m-n:z=m-k-n:f=1
110 IFq<17 ANDk<17 THENFORi=0 TOn-1:f=f*(q-i)/(m-i):NEXT:RETURN
120 f=(q+.5)*LNq+(y+.5)*LNy-(m+.5)*LNm-(z+.5)*LNz+(1/q+1/y-1/m-1/z)/12:f=EXPf:RETURN
500 IFERR=1 THENCLS:ONERRORGOTO0
510 sr=1:RESUME80
