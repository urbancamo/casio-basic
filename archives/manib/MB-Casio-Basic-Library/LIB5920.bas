5 GOTO10010
10 DATAHCOOH,HCOO� + H�,10,20,1.77�10��,a,
20 DATACH�COOH,CH�COO� + H�,10,30,1.75�10��,a,
30 DATAC�H�COOH,C�H�COO� + H�,20,40,6.31�10��,a,2
40 DATAH�CO�,H� + HCO��,30,50,4.45�10��,a,
50 DATAC�H�OH,C�H�O� + H�,40,60,1.00�10���,a,2
60 DATANH� + H�O,NH�� + OH�,50,70,1.78�10��,b,1
70 DATAC�H�N + H�O,C�H�NH� + OH�,60,80,1.5�10��,b,
80 DATAC�H�NH� + H�O,C�H�NH�� + OH�,70,80,3.8�10���,b,2
10010 MODE8:DIM:x=10:y=80:r=x
10020 DEFCHR$(252)="2E2A3A0000"
10030 DEFCHR$(253)="2A2A3E0000"
10035 DEFCHR$(254)="3A2A2E0000"
10040 DIM:ERASEa$:DIMa$(2):RESTORE10080
10050 FORi=1 TO2:READa$(i):NEXT
10080 DATA38083E0000,3E2A2E0000
10110 RESTORE(r)
10120 READm$,n$,b,c,d$,e$,d:CLS
10125 IFd THENDEFCHR$(255)=a$(d)
10130 l$="["+MID$(STR$(r/10),2)+"]"
10140 CLS:PRINTm$;" �� ";n$;TAB(0);"K";e$;" = ";d$;" [mol/l]";TAB(28);l$;
10150 z=ASC(INPUT$(1,@))
10170 IFz=29ANDr<>x THENr=x:GOTO10110
10180 IFz=28ANDr<>y THENr=y:GOTO10110
10190 IFz=30ANDr<>b THENr=b:GOTO10110
10200 IF(z=31 ORz=13) ANDr<>c THENr=c:GOTO10110
10280 GOTO10150
