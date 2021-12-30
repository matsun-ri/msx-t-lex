1000 '  SAVE"lex-c.bas",A
1010 '-------------------------
1020 ' MSX TINY LOGO EXECUTOR
1030 '      /LEXICAL ANALYZER
1040 ' tiny logo compiler
1050 '-------------------------
1060 '
1070 ' ¼®· ¼®Ø
1080 '
1090 CLEAR 3072
1100 DEFINT A-Z
1110 '¶ÞÒÝÉ Ó¼Þ¦ ¼­Ä¸½Ù ¶Ý½³
1120 DEF FNS(SX,SY)=VPEEK(6144+SX+SY*32)
1130 '
1140 'Ã²½³
1150 CL=12 'º-ÄÞ´Ø± É X»ÞË®³
1160 'Ã·½ÄÌÞÛ¯¸ É ÖÐºÐ
1170 CC=60 'ÌÞÛ¯¸ É ¶½Þ
1180 DIM CL$(CC),CM$(CC),CN$(CC)
1190 OPEN"lex-cmd.dat" FOR INPUT AS #1
1200 FOR MI=0 TO CC-1
1210   LINE INPUT #1,MT$:CL$(MI)=MID$(MT$,7)
1220   LINE INPUT #1,MT$:CM$(MI)=MID$(MT$,7)
1230   LINE INPUT #1,MT$:CN$(MI)=MID$(MT$,7)
1240   LINE INPUT #1,MT$ 'ÍÙÌßÒ¯¾°¼Þ Ê ¼Ö³¼Å²
1250 NEXT
1260 CLOSE #1
1270 '
1280 'ºÝÊß²Ù(¼Þ¯º³ º°ÄÞ É ¾²¾²)
1290 '
1300 DIM RA$(10) 'Ë·½³ ½À¯¸
1310 RA=0        'Ë·½³ É ¶½Þ
1320 DIM RE$(10) 'ÌÞÛ¯¸ º³ÌÞÝ É ½À¯¸(NEXT/ENDIF)
1330 RE=0 'RE$()É ¶³ÝÄ
1340 DIM RV(20) 'IFÉ ·Þ®³¦ ·µ¸
1350 RV=0 'RV()É ¶³ÝÄ
1360 DIM RW(20,1) '(n,0) IFÉ ¼Þ¬ÝÌßÓÄ
1370              '(n,1) IFÉ ¼Þ¬ÝÌß»·
1380 RW=0 'RW()É ¶³ÝÄ
1390 DIM RZ$(20) 'ºÝÊß²Ù ¹¯¶
1400 RL=0 'ÍÝ¶ÝºÞ É Ù-Ìß ÍÝ½³ É ¶½Þ
1410 RY=1 '×²Ý ¶³ÝÀ
1420 'º-ÄÞ´Ø± ¶× 1·Þ®³ ¼­Ä¸
1430 'repeat{
1440 MM$="NOW COMPILING LINE"+STR$(RY):GOSUB 2620'¼®ØÁ­³ Ë®³¼Þ
1450   RX=-1  'Ó¼Þ ¶³ÝÀ
1460   RA=0   'Ë·½³ ¶³ÝÀ
1470   RD=0   'ÌÞÛ¯¸º³ÌÞÝ É ÀÞÝ½³
1480   RS$="" 'º-ÄÞ´Ø± ¶× ÄØÀÞ¼À 1·Þ®³
1490   IF FNS(CL+1,RY)<=32 THEN 2260
1500   'repeat{
1510     RX=RX+1
1520     RC$=CHR$(FNS(CL+1+RX,RY))
1530     IF (RC$<=" ") OR (31<=CL+RX) THEN 1600 'break
1540    'RC$=CHR$(RA)
1550 '   IF RC$="€" THEN RC$="…" 'ÌÞÛ¯¸É ¾ÝÄ³
1560     'ÌÞÛ¯¸É ÄÁ­³ Ê Ò²Ú²ºÞ Ä¼ÃÊ ËÛÜÅ².ÀÞÝ½³ ¦ ¶»Ý½Ù
1570     IF RC$="|" THEN RC$="":RD=RD+1
1580     RS$=RS$+RC$
1590     GOTO 1500
1600   '}
1610   RX=0
1620   'º-ÄÞ´Ø± ¶× ÄØÀÞ¼À 1·Þ®³ ¶× Ò²Ú² ¦ ÄØÀÞ½
1630   'repeat{
1640     RX=RX+1
1650     RC$=MID$(RS$,RX,1)
1660     IF LEN(RS$)=RX THEN 1700
1670     IF RC$=" "     THEN 1700
1680     IF RC$="{"     THEN RX=RX-1:GOTO 1700
1690     GOTO 1630
1700   '}
1710   RR$=LEFT$(RS$,RX) 'Ò²Ú² É ÌÞÌÞÝ
1720   'Ë·ÂÂÞ· Ë·½³ ¦ ¼­Ä¸
1730   'repeat{
1740     IF LEN(RS$)=RX THEN 1900
1750     RX=RX+1
1760     RC$=MID$(RS$,RX,1)
1770     IF RC$=" "     THEN 1730
1780     IF RC$="{"     THEN ELSE 1880
1790       'Ë·½³¦ ËÄÂ ¼­Ä¸
1800       RA$(RA)="":RA=RA+1
1810       'repeat{
1820         RX=RX+1
1830         RC$=MID$(RS$,RX,1)
1840         IF RC$="}" THEN 1870 'break
1850         RA$(RA-1)=RA$(RA-1)+RC$
1860         GOTO 1810
1870       '}
1880     'end if
1890     GOTO 1730
1900   '}
1910   'À²µ³½Ù BASICÉ Ò²Ú²¦ »¶Þ½
1920   RI=0
1930   RT$="" 'À²µ³½Ù BASICÉ Ò²Ú²
1940   'ÌÞÛ¯¸ º³ÌÞÝÉ µÜØÅ× ½À¯¸¶× ÄØÀÞ½
1950   IF LEFT$(RR$,1)="~" THEN RE=RE-1:RT$=RE$(RE):GOTO 2000 'ÌÞÛ¯¸É µÜØ
1960   'repeat{
1970     IF LEFT$(CL$(RI),LEN(RR$))=RR$ THEN RT$=CN$(RI):GOTO 2000
1980     RI=RI+1
1990     GOTO 1960
2000   '}
2010   'ÌÞÛ¯¸ º³ÌÞÝÉ ¶²¼Å× ½À¯¸Æ ÂÑ
2020   IF RR$="`if" OR RR$="`óœ" THEN RE$(RE)="'endif":RE=RE+1
2030   IF RR$="`repeat" OR RR$="`˜ø–”" THEN RE$(RE)="NEXT":RE=RE+1
2040   'BASICÉ Ò²Ú²Æ Ë·½³¦ ÜÀ½
2050   RX=0
2060   RU$="" 'BASICÉ Ò²Ú² Æ Ë·½³¦ ¾¯Ä¼À¼Þ®³À²
2070   RU=0   'Ë·½³ É ¶³ÝÄ
2080   'repeat{
2090     IF LEN(RT$)=RX THEN 2210 'break
2100     RX=RX+1
2110     RC$=MID$(RT$,RX,1)
2120     IF RC$="@" THEN ELSE 2160
2130       'Ë·½³¶Þ ÀØÃ²ÚÊÞ ¿Ú¦Â¶³
2140       IF RU<=RA THEN RC$=RA$(RU)
2150       RU=RU+1
2160    'end if
2170     IF RC$="^" THEN RC$=CHR$(34) '"
2180     IF RC$="~" THEN RC$=HEX$(RL):RL=RL+1 'Ù-ÌßÍÝ½³ É ÚÝÊÞÝ
2190     RU$=RU$+RC$
2200     GOTO 2080
2210   '}
2220   '       ²ÝÃÞÝÄ       º-ÄÞ
2230   RZ$(RY-1)=SPACE$(RD*2)+RU$
2240   RY=RY+1
2250   IF RY<23 THEN 1430
2260 '}
2270 '
2280 'ifÉ ¾²·Þ®¦ ·Þ®³ÊÞÝºÞ³Æ ÍÝ¶Ý
2290 MM$="NOW RESOLVING LINE NUMBERS":GOSUB 2620'¼®ØÁ­³ Ë®³¼Þ
2300 FOR RI=0 TO RY-1
2310   'ifÉ ¼Þ¬ÝÌßÓÄ ¦ ·µ¸
2320   IF INSTR(RZ$(RI),"THEN ELSE ")  THEN RV(RV)=RI:RV=RV+1
2330   'ifÉ ¼Þ¬ÝÌß»· ¦ ·µ¸
2340   IF INSTR(RZ$(RI),"'endif") THEN RV=RV-1:RW(RW,0)=RV(RV):RW(RW,1)=RI:RW=RW+1
2350 NEXT
2360 '¼Þ¬ÝÌßÓÄ É ·Þ®³É ELSEÆ ¼Þ¬ÝÌß»· ¦ Â²¶
2370 'REPEAT{
2380   IF RW<1 THEN 2420
2390   FOR RI=0 TO RW-1
2400     RZ$(RW(RI,0))=RZ$(RW(RI,0))+STR$(3010+RW(RI,1)*10)
2410   NEXT
2420 '}
2430 'Ì§²Ù Í ¼­ÂØ®¸
2440 MM$="NOW WRITING LEX-OUT.BAS":GOSUB 2620'¼®ØÁ­³ Ë®³¼Þ
2450 'ÃÝÌßÚ°Ä É ºËß°
2460 COPY"lex-draw.dat" TO "lex-out.bas"
2470 'ºÝÊß²Ù¹¯¶ É ¶·ºÐ
2480 OPEN"lex-out.bas" FOR APPEND AS #1
2490 FOR RI=0 TO RY-2
2500   PRINT #1,3010+RI*10;RZ$(RI)
2510 '`PRINT 3010+RI*10;RZ$(RI)
2520 NEXT
2530 '
2540 CLOSE #1
2550 '¾²¾²¼À º-ÄÞÆ ¾²·Þ®¦ ÜÀ½
2560 MM$="NOW LOADING LEX-OUT.BAS":GOSUB 2620'¼®ØÁ­³ Ë®³¼Þ
2570 'STOP
2580 RUN"lex-out.bas"
2590 END
2600 '-------------------------
2610 '
2620 '1·Þ®³ Ò¯¾°¼Þ ¦ Ë®³¼Þ ½Ù
2630 '
2640 'in  MM$  Ë®³¼Þ½Ù Ò¯¾°¼Þ
2650 '
2660 LOCATE 0,22:PRINT SPC(32);
2670 LOCATE 16-LEN(MM$)\2,22:PRINT MM$;
2680 RETURN
