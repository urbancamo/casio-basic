10 ' P-6 => Handy-Control 0.32
20 ' 26.10.2006 , 04:11
30 CLS:SET N:PRINT CHR$(9);
100 ' Initialisierung
105 DEFCHR$(252)="04aa2aaa1e"
110 DEFCHR$(253)="1ca222a21c"
115 DEFCHR$(254)="3c8202843e"
117 PRINT" HC-032 init ";
120 HGH=50:' Minuten je Monat
125 DIM TEL(31),MON$(12),TAG$(6),ANZ(12)
130 RESTORE 160
135 ANZ(0)=0:FOR X=1 TO 12
140 READ MON$(X),Y:PRINT"*";
145 ANZ(X)=ANZ(X-1)+Y
150 NEXT X:PRINT" * ";
160 DATA Jan,31,Feb,28,Mar,31,Apr,30,Mai,31,Jun,30,Jul,31,Aug,31,Sep,30,Okt,31,Nov,30,Dez,31
165 IF JJ=2008 THEN FOR LL=2 TO 12:ANZ(LL)=ANZ(LL)+1:NEXT LL
170 RESTORE 190
175 FOR X=0 TO 6
180 READ TAG$(X)
185 NEXT X:PRINT"*";
190 DATA Sonntag,Montag,Dienstag,Mittwoch,Donnerstag,Freitag,Samstag
195 JJ=2006:' aktuelles Jahr
200 IF TAG3>0 AND MON3>0 THEN 400
205 PRINT:INPUT" Ziel-Datum (tt.mm) : ",ZD$:IF LEN(ZD$)<>5 THEN 195
210 TAG3=ABS(INT(VAL(LEFT$(ZD$,2))))
215 MON3=ABS(INT(VAL(RIGHT$(ZD$,2))))
220 IF TAG3<1 OR TAG3>31 OR MON3<1 OR MON3>12 THEN 195
225 PRINT " Ich denke nach ...";
250 IF MON3=2 AND TAG3>29 THEN MON3=0:TAG3=0:GOTO 195
255 IF (MON3=4 OR MON3=6 OR MON3=9 OR MON3=11) AND TAG3>30 THEN MON3=0:TAG3=0:GOTO 195
260 Z=JJ/100:Z=JJ-100*INT(Z):X=JJ/400
265 IF TAG3=29 AND MON3=2 AND Z=0 AND X>INT(X) THEN MON3=0:TAG3=0:GOTO 195
270 M1=MON3:J1=JJ:MON3=MON3-2:IF MON3<1 THEN MON3=MON3+12:JJ=JJ-1
275 C=INT(JJ/100):A=JJ-100*C:B=INT((13*MON3-1)/5)+INT(A/4)+INT(C/4)
280 MON3=M1:JJ=J1:W=A+B+TAG3-C-C:W=W-INT(W/7)*7
285 CLS:PRINT " ";TAG$(W);",";TAG3;CHR$(29);".";MON$(MON3);JJ
290 W3=W
400 ' MENUE
405 TAG3$=TAG$(W3)
410 CLS
420 PRINT " HANDY - CONTROL V 0.32  (L/S) ";:PRINT
430 PRINT " [E]in [A]us [R]es [B]er [Q]uit";
440 X$=INPUT$(1)
450 IF X$="E" THEN 1010
455 IF X$="L" THEN 6010
460 IF X$="A" THEN 2010
465 IF X$="S" THEN 7010
470 IF X$="R" THEN 8010
480 IF X$="B" THEN 3010
490 IF X$<>"Q" THEN 410
500 CLS
510 PRINT"Memory:";
515 PRINT FRE 1;
520 PRINT"Stack:";
525 PRINT FRE 0;
530 END
1000 ' EINGABE
1010 CLS
1015 X$="":TAG=0:MON=0
1020 INPUT" Datum (TT.MM)  ",X$:IF X$="Q" THEN 410
1025 IF LEN(X$)<>5 THEN 1010
1030 TAG=VAL(LEFT$(X$,2))
1032 TAG1=TAG
1035 M$=RIGHT$(X$,2):MON=VAL(M$)
1037 MON1=MON
1040 IF TAG<1 OR TAG>31 OR MON<1 OR MON>12 THEN 1010
1045 PRINT " Ich denke nach ...";
1060 TIJ1=TAG1+ANZ(MON1-1):TIJ3=TAG3+ANZ(MON3-1)
1065 CLS:PRINT TIJ3;"-";TIJ1;"=";
1070 DIFF3=TIJ3-TIJ1+1:WE=INT(DIFF3/7)*2
1075 PRINT DIFF3;"[";WE;"]";:PRINT
1085 PRINT DIFF3;"- (";WE;
1090 IF W3=6 THEN WE=WE+1:PRINT"+ 1 ";
1100 IF W3=7 THEN WE=WE+2:PRINT"+ 2 ";
1110 IF W=7 THEN WE=WE+1:PRINT"+ 1 ";
1120 IF W=6 THEN WE=WE+2:PRINT"+ 2 ";
1130 IF WE=0 THEN IF W3<>6 AND W3<>7 AND W<>7 AND W<>6 AND W3<=W THEN WE=WE+2:PRINT"+ 2 ";
1135 PRINT") =";
1150 DIFF3=DIFF3-WE:PRINT DIFF3;"Tage(e)";
1155 FOR XXL=1 TO 300:NEXT XXL
1160 IF DIFF3<=0 THEN DIFF=1
1240 IF MON=2 AND TAG>29 THEN 1010
1250 IF (MON=4 OR MON=6 OR MON=9 OR MON=11) AND TAG>30 THEN 1010
1260 Z=JJ/100:Z=JJ-100*INT(Z):X=JJ/400
1270 IF TAG=29 AND MON=2 AND Z=0 AND X>INT(X) THEN 1010
1280 M1=MON:J1=JJ:MON=MON-2:IF MON<1 THEN MON=MON+12:JJ=JJ-1
1290 C=INT(JJ/100):A=JJ-100*C:B=INT((13*MON-1)/5)+INT(A/4)+INT(C/4)
1300 MON=M1:JJ=J1:W=A+B+TAG-C-C:W=W-INT(W/7)*7
1305 CLS:PRINT " ";TAG$(W);",";TAG;CHR$(29);".";MON$(MON);JJ;:PRINT
1310 IF W=0 OR W=6 THEN PRINT" Wochenende !!! <Taste> ";:X$=INPUT$(1):GOTO 410
1315 PRINT" Zeit (mm:ss) ";:XZ1$=INPUT$(1):IF XZ1$="Q" THEN 410
1320 PRINT XZ1$;:INPUT"",XZ$
1330 XZ$=XZ1$+XZ$
1355 IF LEN(XZ$)<>5 THEN 1315
1360 MIN$=LEFT$(XZ$,2):MIN=ABS(INT(VAL(MIN$)))
1365 SEK$=RIGHT$(XZ$,2):SEK=ABS(INT(VAL(SEK$)))
1370 IF SEK>59 THEN 1315
1375 IF MIN=0 AND SEK>0 THEN MIN=1:SEK=0
1380 TEL(TAG)=TEL(TAG)+MIN+(SEK/60)
1998 GOTO 3010
1999 END
2000 ' AUSGABE
2010 CLS
2025 SUMMIN$=STR$(INT(HSUMME))
2026 SUMMIN$=RIGHT$(SUMMIN$,LEN(SUMMIN$)-1)
2027 IF LEN(SUMMIN$)=1 THEN SUMMIN$="0"+SUMMIN$
2030 SUMSEK$=STR$(INT((HSUMME-INT(HSUMME))*60+.5))
2031 SUMSEK$=RIGHT$(SUMSEK$,LEN(SUMSEK$)-1)
2032 IF LEN(SUMSEK$)=1 THEN SUMSEK$="0"+SUMSEK$
2035 PRINT" ";SUMMIN$;":";SUMSEK$;" - ";:' bisher verbraucht
2040 BLMIN$=STR$(INT(HGH-HSUMME))
2041 BLMIN$=RIGHT$(BLMIN$,LEN(BLMIN$)-1)
2042 IF LEN(BLMIN$)=1 THEN BLMIN$="0"+BLMIN$
2045 BLSEK$=STR$(INT(((HGH-HSUMME)-INT(HGH-HSUMME))*60+.5))
2046 BLSEK$=RIGHT$(BLSEK$,LEN(BLSEK$)-1)
2047 IF LEN(BLSEK$)=1 THEN BLSEK$="0"+BLSEK$
2050 PRINT BLMIN$;":";BLSEK$;" =>";
2055 IF DIFF3<=0 THEN DIFF3=1
2060 PRINT DIFF3;"x ";:PTM=INT((HGH-HSUMME)/DIFF3):PTM$=STR$(PTM)
2062 PTM$=RIGHT$(PTM$,LEN(PTM$)-1):IF LEN(PTM$)=1 THEN PTM$="0"+PTM$
2070 PRINT PTM$;":";
2080 PTS=((HGH-HSUMME)/DIFF3)-INT((50-HSUMME)/DIFF3):PTS=60*PTS
2082 PTS=INT((PTS*100+.5)/100):PTS$=STR$(PTS)
2084 PTS$=RIGHT$(PTS$,LEN(PTS$)-1):IF LEN(PTS$)=1 THEN PTS$="0"+PTS$
2086 PRINT PTS$;:PRINT
2088 PRINT " bis ";TAG3$;",";TAG3;CHR$(29);". ";MON$(MON3);JJ
2100 CLS:PRINT"Einzelnachweis ? [j/N] ";:X$=INPUT$(1)
2110 IF X$<>"J" THEN 410
2120 CLS
2130 FOR X=1 TO 31
2140 IF TEL(X)=0 THEN 2300
2150 ENWMIN$=STR$(INT(TEL(X)))
2160 ENWMIN$=RIGHT$(ENWMIN$,LEN(ENWMIN$)-1)
2170 IF LEN(ENWMIN$)=1 THEN ENWMIN$="0"+ENWMIN$
2180 ENWSEK$=STR$(INT((TEL(X)-INT(TEL(X)))*60+.5))
2190 ENWSEK$=RIGHT$(ENWSEK$,LEN(ENWSEK$)-1)
2200 IF LEN(ENWSEK$)=1 THEN ENWSEK$="0"+ENWSEK$
2210 PRINT" am";X;CHR$(29);".";TAB(10);ENWMIN$;":";ENWSEK$
2300 NEXT X
2998 GOTO 410
3000 ' BERECHNUNG
3010 CLS:HSUMME=0
3015 PRINT" Moment, ich rechne ... ";:PRINT
3020 FOR X=1 TO 31
3025 HSUMME=HSUMME+TEL(X)
3027 PRINT"*";
3030 NEXT X
3998 GOTO 410
6000 ' LADEN
6010 CLS:PRINT " Bitte warten ...";:PRINT
6020 SUMME=0
6100 RESTORE#:RESTORE# "Handy"
6105 PRINT"*";:READ# X$
6110 FOR X=1 TO 31
6120 PRINT"*";:READ# TEL(X)
6130 HSUMME=HSUMME+TEL(X)
6140 NEXT X
6150 READ# TIJ1
6155 READ# TIJ3
6160 READ# DIFF3
6165 READ# WE
6170 READ# W3
6999 GOTO 410
7000 ' SPEICHERN
7010 CLS:PRINT" Bitte warten ...";:PRINT
7100 RESTORE#:RESTORE# "Handy"
7105 PRINT"*";:WRITE# "Handy"
7110 FOR X=1 TO 31
7120 PRINT"*";:WRITE# TEL(X)
7140 NEXT X
7150 WRITE# TIJ1
7155 WRITE# TIJ3
7160 WRITE# DIFF3
7165 WRITE# WE
7170 WRITE# W3
7999 GOTO 410
8000 ' RESET
8010 CLS
8020 PRINT" Alles l";CHR$(253);"schen  ?  ";:X$=INPUT$(1):PRINT X$;:PRINT
8030 IF X$<>"J" THEN 410
8040 PRINT" Sind Sie sicher ? ";:X$=INPUT$(1)
8050 IF  X$<>"J" THEN 410
8060 CLS:PRINT" ... bitte warten ... ";:PRINT
8065 FOR LL=1 TO 500:NEXT LL
8070 CLEAR
8500 GOTO 110
9996 END
9997 ' ======================
9998 ' (C) 2006 by esra-Soft
9999 ' ======================