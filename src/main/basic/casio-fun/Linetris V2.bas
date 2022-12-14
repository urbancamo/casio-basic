1 ' LINETRIS FOR CASIO FX-850P/880P V2.0
2 ' BY THOMAS ILG
10 GOSUB5000:CLS ' Call Initialisation
13 GOSUB1800:CLS ' Call Main Menu
14 POINT=0:LEVEL=SRTLEV-1
15 GOSUB4400
16 CLS:GOSUB6000:GOSUB6030 ' Call for a first Object
20 LOC=25:POS=1:CLRLEV=0
30 ERASE LCHECK:DIM LCHECK(1)
35 ERASE PCHECK:DIM PCHECK(1)
40 ERASE ROW$:DIM ROW$(2)
50 ERASE HIG:DIM HIG(2)
200 ROW$(0)=CHR$(134):ROW$(1)=ROW$(0)
240 GOSUB 6000 ' outher GAMELOOP START
250 HIG(0)=LEN(ROW$(0))
255 HIG(1)=LEN(ROW$(1))
260 GOSUB 1600
270 IF HIG(0)>LOC OR HIG(1)>LOC THEN GOTO 1400
275 TURN=1:POS=1
280 GOSUB 1550
300 FOR I=LOC TO 1 STEP -1  ' inner GAMELOOP START
350 K$=INKEY$:IF K$="0" THEN GOTO 1400
360 IF (TURN=0) OR (K$="") THEN GOTO 380
365 IF K$="8" THEN POS=POS+1:IF POS=5 THEN POS=1
370 IF K$="2" THEN POS=POS-1:IF POS=0 THEN POS=4
380 LOCATE I,0:PRINT OB$(POS,0);
390 LOCATE I,1:PRINT OB$(POS,1);
400 IF K$="5" THEN GOSUB 2400:I=0
450 FOR T=0 TO 1
460 IF I>HIG(T) OR OB$(POS,T)="" THEN GOTO 492
470 FOR X=1 TO 2
480 ADD$=MID$(OB$(POS,T),X,1)
485 IF ADD$<>" " THEN ROW$(T)=ROW$(T)+ADD$:LCHECK(T)=LCHECK(T)+1:HIG(T)=HIG(T)+1
490 NEXT X
491 OB$(POS,T)="":TURN=0
492 NEXT T
493 IF K$="5" THEN GOSUB 1600
495 FOR T=0 TO 1
510 IF LCHECK(T)=0 THEN GOTO 550
512 FOR CPO=HIG(T)-LCHECK(T)-1 TO HIG(T)
513 IF CPO<=1 THEN GOTO 535
515 ME=T:GOSUB7000
520 IF DIF>1 OR CPO<HIG(T)-LCHECK(T) THEN GOTO 535
525 IF T=0 THEN ME=1 ELSE ME=0
530 GOSUB 7000
535 NEXT CPO
540 LCHECK(T)=0
550 NEXT T
600 IF OB$(POS,0)="" AND OB$(POS,1)="" THEN I=0
700 IF PCHECK(0)>0 THEN ME=0:OP=1:GOSUB2000:LOCATE 0,0:PRINT ROW$(0)+"  ";
710 IF PCHECK(1)>0 THEN ME=1:OP=0:GOSUB2000:LOCATE 0,1:PRINT ROW$(1)+"  ";
720 IF CLRLEV=2 THEN GOTO 15
730 ' END OF CHECK
1340 NEXT I  ' Inner GAMELOOP END
1355 GOSUB 6030
1360 GOTO 240 ' Outher GAMELOOP END
1400 BEEP:GOSUB1900:GOTO13  ' Procedure Calculate Row Highs
1500 HIG(0)=LEN(ROW$(0)):HIG(1)=LEN(ROW$(1)):RETURN
1550 LOCATE 28,0:PRINT C$;A$;B$;  ' Procedure display points and next object
1555 IF POINT<100 THEN LOCATE 29,1 ELSE IF POINT<1000 THEN LOCATE 28,1 ELSE THEN LOCATE 27,1
1560 PRINT MID$(STR$(POINT),2);:RETURN
1600 LOCATE 0,0:PRINT ROW$(0)+"   ";  ' Procedure dispaly rows
1610 LOCATE 0,1:PRINT ROW$(1)+"   ";
1620 RETURN
1700 LOCATE I,0:PRINT OB$(POS,0);  ' Procedure display opject
1710 LOCATE I,1:PRINT OB$(POS,1);
1750 RETURN
1800 CLS:PRINT "   *** LINETRIS FOR CASIO ***";  ' Procedure main menu
1810 GOSUB 4000
1820 GOSUB 8000
1830 MEN=VAL(K$)
1840 IF MEN=3 THEN END
1845 IF MEN=1 THEN RETURN
1850 IF MEN=2 THEN SRTLEV=SRTLEV+1:IF SRTLEV>14 THEN SRTLEV=1
1890 GOTO1810
1900 CLS:PRINT"      *** GAME OVER ***";  ' Procedure game over and highscore
1910 LOCATE 0,1:PRINT "POINTS:";POINT;"HS:";SCORE;"BY ";NAME$;
1915 GOSUB 8000
1920 IF POINT<=SCORE THEN RETURN
1925 SCORE=POINT
1930 CLS:PRINT"NEW HIGHSCORE!";
1935 LOCATE 0,1
1940 INPUT "ENTER YOUR NAME: ",NAME$
1950 RETURN
2000 HIG(ME)=LEN(ROW$(ME)) ' Procedure check for spaces and matches
2010 FOR P=PCHECK(ME) TO HIG(ME)
2015 IF MID$(ROW$(ME),P,1)=" " THEN GOTO 2030
2020 NEXT P
2025 PCHECK(ME)=0:RETURN
2030 ROW$(ME)=LEFT$(ROW$(ME),P-1)+MID$(ROW$(ME),P+1):HIG(ME)=HIG(ME)-1
2090 ROWME$=ROW$(ME)+"  "
2095 IF DIF=1 THEN ROWOP$=ROW$(OP)+"  "
2100 NOW$=MID$(ROWME$,P-1,1)
2105 IF P>2 THEN LAS$=MID$(ROWME$,P-2,1) ELSE LAS$="X"
2110 FOR P=P-1 TO HIG(ME)
2115 IF NOW$=" " THEN PCHECK(ME)=P:RETURN
2120 NEX$=MID$(ROWME$,P+1,1)
2130 CONT=0
2135 IF NOW$=LAS$ THEN CONT=1
2140 IF DIF>1 THEN GOTO 2150
2145 OPO$=MID$(ROWOP$,P,1)
2146 IF NOW$=OPO$ THEN CONT=CONT+1:GOSUB2500
2150 IF NOW$=NEX$ THEN CONT=CONT+1
2160 IF CONT>1 THEN GOTO 2300
2170 LAS$=NOW$:NOW$=NEX$
2180 NEXT P
2220 PCHECK(ME)=0:RETURN
2300 PCHECK(ME)=2
2310 KILL$=NOW$:GOSUB3000
2390 RETURN
2400 O1$=OB$(POS,0):O2$=OB$(POS,1) ' Procedure Element Fall
2410 FOR A=I-1 TO 1 STEP -1
2420 LOCATE A,0:PRINT O1$;
2430 LOCATE A,1:PRINT O2$;
2440 IF A<=HIG(0) THEN O1$=""
2450 IF A<=HIG(1) THEN O2$=""
2460 IF O1$="" AND O2$="" THEN RETURN
2470 NEXT A
2480 RETURN
2500 IF NOW$=MID$(ROWOP$,P+1,1) THEN CONT=3:RETURN  ' Procedure oposite row check
2510 IF P<2 THEN RETURN
2520 IF NOW$=MID$(ROWOP$,P-1,1) THEN CONT=3
2530 RETURN
3000 LPOINT=0:GOSUB 1600:GOSUB1700  ' Procedure find and kill a symbol
3005 IF DIF=3 THEN Y=ME ELSE Y=0
3010 FOR X=2 TO HIG(Y)
3015 IF " "=MID$(ROW$(Y),X,1) THEN GOTO 3050
3020 IF KILL$=MID$(ROW$(Y),X,1) THEN ROW$(Y)=LEFT$(ROW$(Y),X-1)+" "+MID$(ROW$(Y),X+1):LPOINT=LPOINT+1:LOCATE X-1,Y:PRINT "*";:IF PCHECK(Y)=0 OR PCHECK(Y)>X THEN PCHECK(Y)=X
3040 NEXT X
3050 IF DIF<3 AND Y=0 THEN Y=1:GOTO 3010
3055 POINT=POINT+LPOINT*DIF:LOCATE HIG(0),0:PRINT LPOINT*DIF;:BEEP 1:BEEP
3060 GOSUB 1600:GOSUB 1700:GOSUB 1550
3070 IF DIF=3 THEN Y=ME ELSE Y=0
3080 IF RIGHT$(ROW$(Y),1)=" " THEN ROW$(Y)=LEFT$(ROW$(Y),LEN(ROW$(Y)-1):GOTO3080
3090 IF DIF<3 AND Y=0 THEN Y=1:GOTO 3080
3095 GOSUB1500:CLRLEV=HIG(0)+HIG(1) 
3100 RETURN
4000 LOCATE 0,1:PRINT"1-PLAY  2-STARTLEVEL     3-EXIT";  ' Procedure menu line display
4010 LOCATE 20,1:PRINT SRTLEV;
4030 RETURN
4400 LEVEL=LEVEL+1                                        ' Procedure Next Level
4410 CLS:IF LEVEL=SRTLEV THEN PRINT "START GAME LEVEL"+STR$(LEVEL); ELSE PRINT "LEVEL CLEAR - NEXT LEVEL"+STR$(LEVEL);:BEEP 1:BEEP 0
4420 GOSUB 4600
4430 LOCATE 0,1:PRINT"MODE -        SYMBOLS -       ";  
4440 LOCATE 7,1:PRINT MXD$(DIF);
4450 LOCATE 24,1:PRINT LEFT$(SYMBTEXT$,ELE);
4460 GOSUB 8000:RETURN
4600 IF LEVEL<=9 THEN LL=LEVEL ELSE LL=9
4610 DIF=LEVDIF(LL):ELE=LEVELE(LL)
4650 RETURN
5000 ERASE SYMB$:DIM SYMB$(6):SYMBTEXT$="" ' Procedure basic data preperation
5005 RESTORE 10000
5010 FOR I=1 TO 6
5012 READ A:SYMB$(I)=CHR$(A):SYMBTEXT$=SYMBTEXT$+SYMB$(I)
5015 NEXT I
5020 ERASE MXD$:DIM MXD$(3)
5025 RESTORE 10100
5030 FOR I=1 TO 3
5035 READ MXD$(I):NEXT I
5040 ERASE LEVDIF:DIM LEVDIF(14):ERASE LEVELE:DIM LEVELE(14)
5045 RESTORE 10110
5050 FOR I=1 TO 14
5055 READ LEVDIF(I),LEVELE(I):NEXT I
5060 IF DIF=0 THEN DIF=1
5070 IF ELE=0 THEN ELE=5
5075 IF SRTLEV=0 THEN SRTLEV=1
5080 ERASE OB$:DIM OB$(4,1)
5090 RETURN
6000 OB1=INT((RAN#*ELE)+1)  ' Procedure next element generator
6005 OB2=INT((RAN#*ELE)+1)
6010 OB3=INT((RAN#*(ELE*2)+1)
6015 IF OB3>ELE OR (OB3=OB1 AND OB3=OB2) THEN C$=" " ELSE C$=SYMB$(OB3)
6020 A$=SYMB$(OB1):B$=SYMB$(OB2)
6025 RETURN
6030 OB$(1,0)=A$+C$+" ":OB$(1,1)=B$+"  "  ' Procedure generate all element rotations
6040 OB$(2,0)=B$+A$+" ":OB$(2,1)=" "+C$+" "
6050 IF C$=" " THEN OB$(3,0)=B$+"  ":OB$(3,1)=A$+"  " ELSE OB$(3,0)=" "+B$+" ":OB$(3,1)=C$+A$+" "
6060 OB$(4,0)=C$+"  ":OB$(4,1)=A$+B$+" "
6100 RETURN
7000 KILL$=MID$(ROW$(ME),CPO,1)  ' Procedure check for a match at single position
7005 IF KILL$=" " THEN RETURN
7010 CONT=0
7020 IF KILL$=MID$(ROW$(ME),CPO-1,1) THEN CONT=1
7030 IF LEN(ROW$(ME))>CPO THEN IF KILL$=MID$(ROW$(ME),CPO+1,1) THEN CONT=CONT+1
7040 IF DIF>1 OR CONT> 1 THEN GOTO7100
7050 IF ME=0 THEN OP=1 ELSE OP=0
7060 IF LEN(ROW$(OP))>=CPO THEN IF KILL$=MID$(ROW$(OP),CPO,1) THEN CONT=CONT+1:IF CONT<=1 THEN GOSUB7300 
7100 IF CONT>1 THEN GOSUB 3000:PCHECK(ME)=2  
7110 IF DIF=1 AND CONT>1 THEN PCHECK(OP)=2
7120 IF CONT<=1 THEN LOCATE 0,ME:PRINT ROW$(ME)+" ";
7200 RETURN
7300 IF LEN(ROW$(OP))>=CPO+1 THEN IF KILL$=MID$(ROW$(OP),CPO+1,1) THEN CONT=3:RETURN  ' Procedure oposite row check
7310 IF CPO<2 THEN RETURN
7320 IF KILL$=MID$(ROW$(OP),CPO-1,1) THEN CONT=3
7330 RETURN
8000 K$=INKEY$:IF K$<>"" THEN GOTO 8000  ' Procedure Wait Keypress
8010 K$=INKEY$:IF K$="" THEN GOTO 8010
8020 RETURN
10000 DATA 232,233,234,235,236,237
10100 DATA EASY,MEDIUM,HARD
10110 DATA 1,2
10120 DATA 1,3
10130 DATA 1,4
10140 DATA 1,5
10150 DATA 2,2
10160 DATA 2,3
10170 DATA 2,4
10180 DATA 2,5
10190 DATA 2,6
10200 DATA 3,2
10210 DATA 3,3
10220 DATA 3,4
10230 DATA 3,5
10240 DATA 3,6
