5 ONERRORGOTO900
20 MODE8:DIM:r=0:h=0:c$=CHR$(5)
30 CLS:PRINT"�r�(r�+h�)+�r�   r:radius";
40 s$="r":z=r:GOSUB500:r=z
45 CLS:PRINT"�r�(r�+h�)+�r�   h:height";
50 s$="h":z=h:GOSUB500:h=z
70 LOCATE0,1:PRINTc$;"Surface =";PI*r*(SQR(r*r+h*h)+r);:z$=INPUT$(1,@):GOTO30
500 LOCATE0,1:PRINTc$;s$;"=";z;"?";:INPUT@42;z:LOCATE0,0:IFz<0 THEN500 ELSERETURN
900 IFERR=1 THENCLS:ONERRORGOTO0
910 IFERL=500 THENRESUME500
920 LOCATE0,1:PRINTc$;"not found";:z$=INPUT$(1,@):RESUME30
