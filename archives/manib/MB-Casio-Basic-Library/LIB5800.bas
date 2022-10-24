5 GOTO10010
10 DATAa’-b’,(a+b)(a-b),10,20
20 DATAa“ùb“,(aùb)(a’úab+b’),10,30
30 DATAa”-b”,(a-b)(a+b)(a’+b’),20,40
40 DATAa”+b”,(a’+‚ÿab+b’)(a’-‚ÿab+b’),30,50
50 DATAa’ù2ab+b’,(aùb)’,40,60
60 DATAa“ù3a’b+3ab’ùb“,(aùb)“,50,70
70 DATA(aùb)’ú4ab,(aúb)’,60,80
80 DATAa’+b’+c’+2bc+2ca+2ab,(a+b+c)’,70,90
90 DATAa”+a’b’+b”,(a’+ab+b’)(a’-ab+b’),80,100
100 DATAa“+b“+c“-3abc,(a+b+c)(a’+b’+c’-bc-ca-ab),90,110
110 DATA(ac-bd)’+(ad+bc)’,(a’+b’)(c’+d’),100,120
120 DATA(ac+bd)’+(ad-bc)’,(a’+b’)(c’+d’),110,130
130 DATA(ac+bd)’-(ad+bc)’,(a’-b’)(c’-d’),120,140
140 DATA(ac-bd)’-(ad-bc)’,(a’-b’)(c’-d’),130,150
150 DATAa’(b-c)+b’(c-a)+c’(a-b),-(b-c)(c-a)(a-b),140,160
160 DATA(b-c)“+(c-a)“+(a-b)“,3(b-c)(c-a)(a-b),150,170
170 DATAa”+b”+c”-2b’c’-2c’a’-2a’b’,(a+b+c)(b-c-a)(c-a-b)(a-b-c),160,180
180 DATAx’+(a+b)x+ab,(x+a)(x+b),170,190
190 DATAx“+(a+b+c)x’+(bc+ca+ab)x+abc,(x+a)(x+b)(x+c),180,200
200 DATAa’-b’-c’-2bc,(a+b+c)(a-b-c),190,210
210 DATA(a+b+c)(bc+ca+ab)-abc,(b+c)(c+a)(a+b),200,220
220 DATA(a+b+c)“-(a“+b“+c“),3(b+c)(c+a)(a+b),210,230
230 DATAa“(b-c)+b“(c-a)+c“(a-b),-(b-c)(c-a)(a-b)(a+b+c),220,230
10010 MODE8:DIM:x=10:y=230:r=x
10020 DEFCHR$(255)="A6AAAA9280"
10110 RESTORE(r)
10120 READm$,n$,b,c
10130 l$="["+MID$(STR$(r/10),2)+"]":l=32-LEN(l$)
10140 CLS:PRINTm$;;TAB(l);l$;"=";n$;
10150 z=ASC(INPUT$(1,@))
10170 IFz=29 ANDr<>x THENr=x:GOTO10110
10180 IFz=28 ANDr<>y THENr=y:GOTO10110
10190 IFz=30 ANDr<>b THENr=b:GOTO10110
10200 IF(z=31 ORz=13) ANDr<>c THENr=c:GOTO10110
10280 GOTO10150
