10 CLEAR:CLS:Locate 2,0:Print "*** Stellarentfernung ***       von M.Schaarschmidt 2007"
20 Beep
30 AE=149597870.691:PC=30856775812800:Lj=9460528000000:Ls=299792.458:Lm=17987547.48:Lst=1079252848.8
40 Input "Entfernung eingeben: Kilometer :",Km
50 If Km=0 then goto 130
60 Print "Entspricht: ";Km/AE;" AE"
70 Print "Entspricht: ";Km/PC;" Parsec"
80 Print "Entspricht: ";Km/Lj;" Lichtjahre"
90 Print "Entspricht: ";Km/Ls;" Lichtsekunden"
100 Print "Entspricht: ";Km/Lm;" Lichtminuten"
110 Print "Entspricht: ";Km/Lst;" Lichtstunden"
120 Goto 660
130 Input "Entfernung eingeben: AE        :",Km
140 If Km=0 then goto 220
150 Print "Entspricht: ";Km*AE;" Km"
160 Print "Entspricht: ";(Km*AE)/PC;" Parsec"
170 Print "Entspricht: ";(Km*AE)/Lj;" Lichtjahre"
180 Print "Entspricht: ";(Km*AE)/Ls;" Lichtsekunden"
190 Print "Entspricht: ";(Km*AE)/Lm;" Lichtminuten"
200 Print "Entspricht: ";(Km*AE)/Lst;" Lichtstunden"
210 Goto 660
220 Input "Entfernung eingeben: Parsec    :",Km
230 If Km=0 then goto 310
240 Print "Entspricht: ";Km*PC;" Km"
250 Print "Entspricht: ";(Km*PC)/AE;" AE"
260 Print "Entspricht: ";(Km*PC)/Lj;" Lichtjahre"
270 Print "Entspricht: ";(Km*PC)/Ls;" Lichtsekunden"
280 Print "Entspricht: ";(Km*PC)/Lm;" Lichtminuten"
290 Print "Entspricht: ";(Km*PC)/Lst;" Lichtstunden"
300 Goto 660
310 Input "Entfernung eingeben: Lichtjahre:",Km
320 If Km=0 then goto 400
330 Print "Entspricht: ";Km*Lj;" Km"
340 Print "Entspricht: ";(Km*Lj)/AE;" AE"
350 Print "Entspricht: ";(Km*Lj)/PC;" Parsec"
360 Print "Entspricht: ";(Km*PC)/Ls;" Lichtsekunden"
370 Print "Entspricht: ";(Km*PC)/Lm;" Lichtminuten"
380 Print "Entspricht: ";(Km*PC)/Lst;" Lichtstunden"
390 Goto 660
400 Input "Entfernung eingeben:Lichtstunden:",Km
410 If Km=0 then goto 490
420 Print "Entspricht: ";Km*Lst;" Km"
430 Print "Entspricht: ";(Km*Lst)/AE;" AE"
440 Print "Entspricht: ";(Km*Lst)/PC;" Parsec"
450 Print "Entspricht: ";(Km*Lst)/Ls;" Lichtsekunden"
460 Print "Entspricht: ";(Km*Lst)/Lm;" Lichtminuten"
470 Print "Entspricht: ";(Km*Lst)/Lj;" Lichtjahre"
480 Goto 660
490 Input "Entfernung eingeben:Lichtminuten:",Km
500 If Km=0 then goto 580
510 Print "Entspricht: ";Km*Lm;" Km"
520 Print "Entspricht: ";(Km*Lm)/AE;" AE"
530 Print "Entspricht: ";(Km*Lm)/PC;" Parsec"
540 Print "Entspricht: ";(Km*Lm)/Ls;" Lichtsekunden"
550 Print "Entspricht: ";(Km*Lm)/Lst;" Lichtstunden"
560 Print "Entspricht: ";(Km*Lm)/Lj;" Lichtjahre"
570 Goto 660
580 Input "Entfernung eingeben:Lichtsekunden:",Km
590 If Km=0 then goto 660
600 Print "Entspricht: ";Km*Ls;" Km"
610 Print "Entspricht: ";(Km*Ls)/AE;" AE"
620 Print "Entspricht: ";(Km*Ls)/PC;" Parsec"
630 Print "Entspricht: ";(Km*Ls)/Lst;" Lichtstunden"
640 Print "Entspricht: ";(Km*Ls)/Lm;" Lichtminuten"
650 Print "Entspricht: ";(Km*Ls)/Lj;" Lichtjahre"
660 Input "Nochmal (j/n)";A$
670 If A$="J" then Goto 10
