1 'KOMPL. YHT.RYHM. RATKAISIN
2 '(c) ???, edited by T.Rautava
3 '920000 / 950720 v3B
110 CLEAR : ANGLE 0
115 PRINT"Kompl. yhtaloryhman ratkaisin";:PRINT
120 INPUT "Yhtaloiden lkm.";N:M=N+1:D=1E-7
130 DIM K(N,M),D(N,M),Y(N),X(N)
140 FOR I=1 TO N
150 PRINT STR$(I)+". yhtalo:";:PRINT
155 FOR J=1 TO M
157 IF J=M THEN PRINT"yht. oikea puoli >"; ELSE PRINT STR$(J)+". kerroin";">";
160 INPUT "",DD$:GOSUB 500:K(I,J)=KK:D(I,J)=DD:NEXT J:NEXT I
165 PRINT"Odota ";
170 FOR L=1 TO N-1
180 IF K(L,L)>D THEN 260
190 FOR I=L+1 TO N:IF K(I,L)<D THEN 210
200 S=I:I=N+2
210 PRINT".";:NEXT I
220 IF I>N+1 THEN 240
230 PRINT:PRINT"Ei ratkaisua!":END
240 FOR J=1 TO M
250 T=K(L,J):K(L,J)=K(S,J):K(S,J)=T:T=D(L,J):D(L,J)=D(S,J):D(S,J)=T:PRINT".";:NEXT J
260 FOR I=L+1 TO N:FOR J=L+1 TO M
270 T=K(I,L)*K(L,J)/K(L,L):W=D(I,L)+D(L,J)-D(L,L):Q=K(I,J)*COS(D(I,J))-T*COSW
280 W=K(I,J)*SIN(D(I,J))-T*SINW
285 IF Q=0 AND W=0 THEN K(I,J)=0:D(I,J)=0 ELSE K(I,J)=POL(Q,W):D(I,J)=Y
290 PRINT".";:NEXT J:NEXT I:NEXT L
295 IF K(N,N)<D THEN 230
300 X(N)=K(N,M)/K(N,N):Y(N)=D(N,M)-D(N,N)
310 FOR I=N-1 TO 1 STEP -1
320 S=K(I,M):E=D(I,M)
330 FOR J=I+1 TO N
340 T=K(I,J)*X(J):W=D(I,J)+Y(J):Q=S*COSE-T*COSW:W=S*SINE-T*SINW
345 IF Q=0 AND W=0 THEN S=0:E=0:GOTO 360
350 S=POL(Q,W):E=Y
360 PRINT".";:NEXT J
370 X(I)=S/K(I,I):Y(I)=E-D(I,I)
380 PRINT".";:NEXT I
390 PRINT:PRINT"Ratkaisu";:PRINT
400 SET F5
410 FOR I=1 TO N
420 PRINT "X"+STR$(I)+"=";X(I);"/";Y(I);CHR$(223)
440 NEXT I
450 INPUT "Summamuodossa (K/E)";DD$
451 IF DD$="K" OR DD$="k" THEN 460
452 IF DD$="E" OR DD$="e" THEN SET N:END
455 GOTO 450
460 FOR I=1 TO N
470 PRINT "X"+STR$(I)+"=";REC(X(I),Y(I));"+";Y;"j"
480 NEXT I:SET N:END
500 KK=VAL(DD$):W=LEN(STR$(KK))
510 IF KK<0 THEN W=W+1
520 Q=ASC(MID$(DD$,W,1)):IF Q=47 OR Q=43 OR Q=45 THEN 550
530 IF LEN(DD$)=W-1 THEN DD=0:RETURN
540 PRINT "---???---":RETURN
550 W=LEN(DD$)-W:IF Q<>47 THEN W=W+1
560 DD=VAL(RIGHT$(DD$,W)):IF Q<>47 THEN GOSUB 580
570 RETURN
580 KK=POL(KK,DD):DD=Y:RETURN
