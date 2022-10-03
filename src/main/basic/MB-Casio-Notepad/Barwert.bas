10 CLEAR:CLS:Locate 2,0:Print "*** Barwertberechnung ***       von M.Schaarschmidt 2007"
20 Beep:Input "Masseinheit der Laufzeit festl. (1)Tage (2)Monate (3)Jahre: ",L
30 On L Gosub 40,50,60
40 L=1/365:Goto 70
50 L=1/12:Goto 70
60 L=1
70 Input "Anzahl der Zahlungen (Cash Flow)eingeben: ",N
80 REM
90 For i=1 to N
100 CLS
110 Print "Daten der ";i;". Zahlung eingeben"
120 CLS
130 Input "Zeitraum bis zur Zahlung:";H
140 T=H*L
150 Input "Betrag:";K
160 Input "Zinssatz (laufzeitbezogener Diskontzins):";Z
170 Z=Z/100
180 B=K*(1/(1+Z)^T)
190 REM
200 Print "Barwert der";i;". Zahlung heute = ";B
210 G=G+B
220 Next i
230 Print "Summe der Barwerte heute =     ";G
