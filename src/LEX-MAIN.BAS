1000 '    SAVE"lex-main.bas",A
1010 '    RUN"lex.bas"
1020 '-------------------------
1030 ' MSX TINY LOGO EXECUTOR
1040 '      /LEXICAL ANALYZER
1050 ' main program
1060 '-------------------------
1070 '
1080 'files:
1090 ' LEX.BAS
1100 ' LEX-MAIN.BAS Ò²ÝÌßÛ¸Þ×Ñ
1110 ' LEX-C.BAS    ºÝÊß²×
1120 ' LEX-CMD.DAT  ÌÞÛ¯¸Ã²·Þ
1130 ' LEX-DRAW.DAT ÃÝÌßÚ°Ä
1140 '
1760 '½Ìß×²Ä ÒÝ
1770 ' 0- 7 ¶°¿Ù
1780 ' 8-11 Ò²Ú²ÌÞÛ¯¸
1790 '24-31 ¶°¿Ù É ¶¹Þ
1800 '
1810 '----------
1820 ' ¼®· ¼®Ø
1830 '----------
1840 CLEAR 2048
1850 DEFINT A-Z
1860 DEF FNS(SX,SY)=VPEEK(6144+SX+SY*32) '¶ÞÒÝÉ Ó¼Þ¦ ¼­Ä¸½Ù ¶Ý½³
1870 '
1880 PUT SPRITE  0,(120,100),0,1
1890 PUT SPRITE 24,(120,100),0,1
1900 '
1910 'µÄ
1920 PLAY"t150o5l32s0m500"
1930 '
1940 'Ã²½³
1950 '
1960 CL=12 'º-ÄÞ´Ø± É X»ÞË®³
1970 MV=8:MW=9 '³²ÝÄÞ³ É ²Á
1980 '
1990 'ÍÝ½³
2000 '
2010 DIM MB(17,4) '³¨ÝÄÞ³ À²Ë ÊÞ¯Ì§
2020 DIM DM$(1) '±ÄÃÞ ERASE½ÙÀÒ
2030 MN$="NONAME00.LEX"'¿-½Ì§²Ù
2040 MX=120 'Ï³½¶°¿Ù
2050 MY=100
2060 MT=0   'ÌÞÛ¯¸´Ø±É ¹ÞÝºÞ
2070 GOSUB 7110 '½ÅÄÞ¹²
2080 '
2090 'Ã·½ÄÌÞÛ¯¸ É ÖÐºÐ
2100 CC=60 'ÌÞÛ¯¸ É ¶½Þ
2110 DIM CL$(CC),CM$(CC),CH$(CC)
2120 OPEN"lex-cmd.dat"FOR INPUT AS #1
2130 FOR MI=0 TO CC-1
2140   LINE INPUT #1,MT$:CL$(MI)=MID$(MT$,7)
2150   LINE INPUT #1,MT$:CM$(MI)=MID$(MT$,7)
2160   LINE INPUT #1,MT$ 'ÖÐÄÊÞ½ (BASICÍÉ ÍÝ¶ÝÊ ºÉÓ¼Þ­-ÙÃÞÊ µºÅÜÅ²)
2170   LINE INPUT #1,MT$:CH$(MI)=MID$(MT$,7)
2180 NEXT
2190 CLOSE #1
2200 '
2210 '
2220 '------------
2230 ' ¶ÞÒÝ ËÞ®³¶Þ
2240 '------------
2250 CLS
2260 '       01234567890123456789012345678901
2270 PRINT  "X eN jP mSXYXWWWWCODE AREAWWWWWY";
2280 FOR MI=1 TO 20
2290   LOCATE 0,MI
2300   PRINT"V          VV                  V";
2310 NEXT
2320 PRINT  "ZWWWWWWWWWW[ZWWWWWWWWWWWWWWWWWW[";
2330 PRINT
2340 PRINT  "  eXIT lOAD sAVE oVERWRITE rUN ";
2350 'Ã·½ÄÌÞÛ¯¸ Ë®³¼Þ
2360 GOSUB 3850
2400 '
2410 MP=MX:MQ=MY 'ÄÞ×¯¸ÞÓÄ»ÞË®³
2420 MD=0   'ÄÞ×¯¸ÞÁ­³
2430 MF$="" 'Ì§Ý¸¼®Ý·° ÆÖÙ ¿³»
2440 MG=0   '·°ÎÞ°ÄÞ Ö³ ¶°¿Ù
2450 '
2460 'Ó¼ lex.ini ¶Þ ±ÚÊÞ ÖÐºÐ½Ù
2470 ON ERROR GOTO 2550
2480   OPEN "lex.ini" FOR INPUT AS #1
2490   ON ERROR GOTO 0 '´×-Ä×¯Ìß ¶²¼Þ®
2500   INPUT #1, MN$
2510   CLOSE #1
2520   KILL"lex.ini"
2530   GOSUB 9850 '»²·ÄÞ³Ï´É ¿-½¦ ÖÐºÑ
2540   GOTO 2570
2550 '´×- Ä×¯Ìß
2560 RESUME 2570 '´×-¶Þ ±ÚÊÞ
2570 '´×-É ³ÑÆ ¶¶Ü×½Þ ºº¶× »²¶²
2580 ON ERROR GOTO 0
2590 GOSUB 7370 'Ì§²ÙÒ² É Ë®³¼Þ
2600 'Ì§Ý¸¼®Ý·° ÜØºÐ ¾¯Ã²
2610 ON KEY GOSUB 4220,4230,4240,4250,4260
2620 FOR MI=1 TO 5
2630   KEY(MI) ON
2640 NEXT
2650 '----------
2660 ' Ò²Ý ¼®Ø
2670 '----------
2680 MS=PAD(12)
2690 MK$=INKEY$
2700 MX=MX+PAD(13)
2710 IF MK$=CHR$(29) THEN MX=MX-8
2720 IF MK$=CHR$(28) THEN MX=MX+8
2730 IF MX<0 THEN MX=0
2740 IF 250<MX THEN MX=250
2750 MY=MY+PAD(14)
2760 IF MK$=CHR$(30) THEN MY=MY-8
2770 IF MK$=CHR$(31) THEN MY=MY+8
2780 IF MY<0 THEN MY=0
2790 IF 190<MY THEN MY=190
2800 '¶-¿Ù ²ÄÞ³
2810 IF MD=0 THEN ELSE 2860
2820   'ÄÞ×¯¸Þ Á­³ ÃÞÊÅ²
2830   PUT SPRITE  0,(MX,MY),7,0
2840   PUT SPRITE 24,(MX,MY+1),4,0
2850   GOTO 2940
2860 'else
2870   'ÄÞ×¯¸Þ Á­³ Ê Ã·½ÄÌÞÛ¯¸ ¦ Ë®³¼Þ
2880   PUT SPRITE  8,(MX   ,MY),7,8
2890   PUT SPRITE  9,(MX+16,MY),7,9
2900   PUT SPRITE 10,(MX+32,MY),7,10
2910   PUT SPRITE 11,(MX+48,MY),7,11
2920   PUT SPRITE  0,(0,192),0
2930   PUT SPRITE 24,(0,192),0
2940 'end if
2950 'ÌÞÛ¯¸´Ø±É Íß-¼ÞÉ ¶-¿Ù
2960 PUT SPRITE  1,(9+MT*24,0),6,2
2970 PUT SPRITE 25,(9+MT*24,1),1,2
2980 'Ï³½¸Ø¯¸ ¼­Ä¸
2990 MS=STRIG(1)+STRIG(0)
3000 '±×ÀÆ ËÀÞØÎÞÀÝ ¶Þ µ»ÚÀ×
3010 IF MS   AND MD=0 THEN ELSE 3430
3020   '¸Ø¯¸»ÚÀÉ¶Þ º°ÄÞ´Ø± Å×
3030   'Ë·½³¦ ¹Ý»¸½Ù
3040   IF (CL<MX\8) AND (MY\8<22) THEN ELSE 3080
3050     GOSUB 8500 'Ë·½³ É ¼®Ø
3060     IF AN=0 THEN 3410
3070     'else ¿ÉÏÏ ¼ÀÉ¼®ØÍ
3080   'else
3090     '¸Ø¯¸ »ÚÀ ÊÞ¼®É ºÄÊÞ ¦ ËÛ³
3100     GOSUB 4300
3110     IF GS$>"" THEN ELSE 3400
3120       '¹ÞÝºÞ·Ø¶´ ¦ ¸Ø¯¸¼ÀÄ·É ¼®Ø
3130       IF GS$="eN"  THEN MU=MT:MT=0:GOTO 3400
3140       IF GS$="jP"  THEN MU=MT:MT=1:GOTO 3400
3150       IF GS$="mSX" THEN MU=MT:MT=2:GOTO 3400
3160       'ÒÆ­° ¦ ¸Ø¯¸¼ÀÄ·É ¼®Ø
3170       IF GS$="eXIT" THEN GOTO 3750 '¼­³Ø®³
3180       IF GS$="lOAD" THEN GOSUB 3940:GOTO 3400 'ÖÐºÐ
3190       IF GS$="sAVE" THEN GOSUB 4070:GOTO 3400 'Î¿ÞÝ
3200       IF GS$="oVERWRITE" THEN GOSUB 9630:PLAY"fc":GOTO 3400 '³Ü¶Þ·
3210       IF GS$="rUN"       THEN GOSUB 10130:GOTO 3400 '¼Þ¯º³
3220       'ÒÆ­-ÃÞ Å¹ÚÊÞ ÄÞ×¯¸Þ ¶²¼
3230       MD=1
3240       'ÄÞ×¯¸ÞÓÄ »ÞË®³ Î¿ÞÝ
3250       MP=MX:MQ=MY
3260       'À²µ³½Ù ÍÙÌßÒ¯¾-¼Þ ¦ »¶Þ½
3270       MI=0
3280       'repeat{
3290         IF LEFT$(CL$(MI),LEN(GS$))=GS$ THEN ELSE 3330
3300           MM$=CH$(MI)
3310           GOSUB 7270 'Ò¯¾-¼Þ É Ë®³¼Þ
3320           GOTO 3370 'break
3330         'else
3340           MI=MI+1
3350           GOTO 3280
3360         'end if
3370       '}
3380       'Ë·½³ ¦ Â²¶
3390       IF GT$="" THEN GS$=GS$+CM$(MI) ELSE GS$=GS$+GT$
3400     'end if
3401     'Ã·½ÄÌÞÛ¯¸ Ë®³¼Þ
3402     IF MT<>MU THEN ELSE 3409
3403       GOSUB 3850
3404       MU=MT
3409     'end if
3410   'end if
3420   MF$="" '¼®ØÁ­³É Ì§Ý¸¼®Ý·° Ê Ñ¼
3430 'end if
3440 'ËÀÞØÎÞÀÝ ¶Þ ÊÅ»ÚÀ× ÄÞÛ¯Ìß
3450 IF MS=0 AND MD THEN ELSE 3490
3460   GOSUB 5120 'Ã·½ÄÌÞÛ¯¸ É ÄÞÛ¯Ìß
3470   MD=0       'ÄÞ×¯¸Þ ¼­³Ø®³
3480   LOCATE 0,22:PRINT SPC(32); 'ÍÙÌß¦ ¼®³·®
3490 'end if
3500 'Ð·Þ¸Ø¯¸ »ÚÀ× ÌÞÛ¯¸¦ ¹½
3510 IF STRIG(3) OR MK$=CHR$(27) THEN GOSUB 7820
3520 '
3530 'Ì§Ý¸¼®Ý·° ÆÖÙ ¿³»
3540 IF MF$>"" THEN ELSE 3620
3550   GS$=MF$
3560   MF$=""
3570   IF GS$="eXIT" THEN GOTO 3750 '¼­³Ø®³
3580   IF GS$="lOAD" THEN GOSUB 3940:GOTO 3620 'ÖÐºÐ
3590   IF GS$="sAVE" THEN GOSUB 4070:GOTO 3620 'Î¿ÞÝ
3600   IF GS$="oVERWRITE" THEN GOSUB 9630:PLAY"fc":GOTO 3620 '³Ü¶Þ·
3610   IF GS$="rUN"  THEN GOSUB 10130:GOTO 3620 '¼Þ¯º³
3620 'end if
3630 '
3640 '·° Æ­³Ø®¸
3650 'MK$=INKEY$
3660 'IF MK$=CHR$(30) THEN MG=MG-1
3670 'IF MK$=CHR$(31) THEN MG=MG+1
3680 'IF MG<0  THEN MG=0
3690 'IF 19<MG THEN MG=19
3700 'PUT SPRITE  1,(1,MG*8+8),9,2
3710 'PUT SPRITE 25,(1,MG*8+9),6,2
3720 GOTO 2660
3730 '
3740 '------------
3750 ' ¼­³Ø®³ ¼®Ø
3760 '------------
3770 WF$="ARE YOU SURE?"
3780 GOSUB 9430 'OK/·¬Ý¾Ù ¶¸ÆÝ
3790 IF WR=0 THEN 2660
3800 SCREEN 0:WIDTH 80
3810 END
3820 '
3830 '-------------------------
3840 '
3850 'ÌÞÛ¯¸´Ø± Ë®³¼Þ
3860 '
3871 FOR MI=0 TO 19
3872   LOCATE 1, MI*1+1
3873   PRINT SPC(10);
3874   LOCATE 1, MI*1+1
3875   PRINT CL$(MT*20+MI);
3876 NEXT
3880 RETURN
3910 '
3920 '-------------------------
3930 '
3940 'LOAD Ï´¼®Ø
3950 '
3960 WF$=MN$ 'Æ­³Ø®¸ ÃÞÌ«ÙÄÁ
3970 GOSUB 9040 'Ó¼Þ Æ­³Ø®¸
3980 'Ó¼ÞÆ­³Ø®¸¶Þ ¼Þ¯º³ »ÚÃ²ÚÊÞ ÖÐºÐ
3990 IF WR=1 THEN ELSE 4020
4000   MN$=WF$
4010   GOSUB 9850
4020 'end if
4030 RETURN
4040 '
4050 '-------------------------
4060 '
4070 'SAVE Ï´¼®Ø
4080 '
4090 WF$=MN$ 'Æ­³Ø®¸ ÃÞÌ«ÙÄÁ
4100 GOSUB 9040 'Ó¼Þ Æ­³Ø®¸
4110 'Ó¼ÞÆ­³Ø®¸¶Þ ¼Þ¯º³ »ÚÃ²ÚÊÞ Î¿ÞÝ
4120 IF WR=1 THEN ELSE 4150
4130   MN$=WF$
4140   GOSUB 9630
4150 'end if
4160 RETURN
4170 '
4180 '-------------------------
4190 '
4200 'Ì§Ý¸¼®Ý·° ÆÖÙ ¿³»
4210 '
4220 MF$="eXIT":RETURN 'f1
4230 MF$="lOAD":RETURN 'f2
4240 MF$="sAVE":RETURN 'f3
4250 MF$="oVERWRITE":RETURN 'f4
4260 MF$="rUN" :RETURN 'f5
4270 '
4280 'G-----------------------G
4290 '
4300 '¸Ø¯¸»ÚÀÊÞ¼®É Ã·½Ä ¦ ËÛ³
4310 '
4320 'out ¶ÞÒÝ¶× ËÛ¯À Ã·½Ä É³Á
4330 '    GS$ Ò²Ú²ÌÞÛ¯¸ ÎÝÀ²
4340 '    GT$ Ë·½³ É ÌÞÌÞÝ
4350 '  GV  ÄÞ×¯¸ÞÀ²¼®³ É »²¼® É ·Þ®³
4360 '  GW  µÅ¼Þ¸ ·Þ®³½³
4370 '     (ÌÞÛ¯¸´Ø± ¶× Å× 0)
4380 '
4390 GS$=""
4400 GT$=""
4410 GV=0
4420 GW=0
4430 GX=MX\8
4440 GY=MY\8
4450 GD=0 'ÌÞÛ¯¸º³ÌÞÝ É ÀÞÝ½³
4460 '
4470 GOSUB 7110 '½ÅÄÞ¹²
4480 '¾ÝÄ³ÏÃÞ »¶ÉÎÞÙ
4490 IF (0<=GX) AND (32<FNS(GX,GY)) THEN GX=GX-1:GOTO 4490
4500 'Ã·½Ä¦ ËÛ³
4510 'repeat{
4520   GX=GX+1
4530   GA=FNS(GX,GY)
4540   IF (32<GA) AND (GX<32) THEN GS$=GS$+CHR$(GA):GOTO 4510
4550 '}
4560 '¾ÝÄ³É ²ÝÃÞÝÄ(|)¦ »¸¼Þ®½Ù
4570 'repeat{
4580   IF LEFT$(GS$,1)="|" THEN ELSE 4620
4590     GS$=MID$(GS$,2)
4600     GD=GD+1 '²ÝÃÞÝÄÉ ÀÞÝ½³
4610     GOTO 4580
4620 '}
4630 IF GS$="" THEN PLAY"cc":RETURN
4640 PLAY"cf"
4650 '¸Ø¯¸ ²Á¶Þ ÒÆ­° ÃÞÅ¹ÚÊÞ
4660 IF GY<23 THEN ELSE 5070
4670   GV=GY 'ÌÞÛ¯¸º³ÌÞÝ É ¾ÝÄ³·Þ®³
4680   'ÌÞÛ¯¸º³ÌÞÝ É ·Þ®³½³(ÌÞÛ¯¸´Ø±=0)
4690   IF CL<MX\8 THEN GW=1 ELSE GW=0
4700   '¸Ø¯¸ ²Á¶Þ º-ÄÞ´Ø± ¶Â ¼­Ä¸¼À Ó¼ÞÚÂÉ ¾ÝÄ³¶Þ ÌÞÛ¯¸º³ÌÞÝ É Ê¼ÞÒ` ¶ µÜØ~Å×
4710   IF (CL<MX\8) AND (LEFT$(GS$,1)="`") OR (LEFT$(GS$,1)="~") THEN ELSE 4930
4720     'ÌÞÛ¯¸É ¾ÝÄ³·Þ®³ ¦ ¹Ý»¸
4730     IF CHR$(FNS(CL+1+GD,GY))<>"`" THEN GY=GY-1:GOTO 4730
4740     GV=GY '¾ÝÄ³·Þ®³
4750     'Ó¼Þ¦ ËÛ³
4760     GS$=""
4770     GX=CL+GD
4780     'repeat{
4790       GX=GX+1
4800       GA=FNS(GX,GY)
4810       IF (32<GA) AND (GX<32) THEN GS$=GS$+CHR$(GA):GOTO 4780
4820     '}
4830     'ÌÞÛ¯¸º³ÌÞÝÉ ³´¶× ¼ÀÏÃÞ ¿³»
4840     'repeat{
4850       GY=GY+1:GW=GW+1
4860       GA$=CHR$(FNS(CL+1+GD,GY))
4870       'ÌÞÛ¯¸º³ÌÞÝ É µÜØ Å× ÔÒÙ
4880       IF GA$="~" THEN 4920
4890       'º-ÄÞ´Ø± É µÜØ Å× ÔÒÙ
4900       IF GY=20  THEN GY=GY-1:GW=GW-1:GOTO 4920
4910       GOTO 4840
4920     '}
4930   'end if
4940   'Ë·½³¦ ÌÞÝØ½Ù
4950   GP=INSTR(GS$,"{")
4960   IF 0<GP THEN ELSE 4990
4970     GT$=MID$( GS$,GP)
4980     GS$=LEFT$(GS$,GP-1)
4990   'endif
5000   'ÌÞÛ¯¸ ÄÞ×¯¸ÞÖ³É ½Ìß×²Ä ÊßÀ-ÝÉ »¸¾²
5010   FOR GI=0 TO LEN(GS$)-1
5020     '½Ìß×²ÄÊßÀ°Ý 8-11
5030     FOR GJ=0 TO 7
5040       VPOKE &H3900+GI*16+GJ,VPEEK(ASC(MID$(GS$,GI+1,1))*8+GJ)
5050     NEXT
5060   NEXT
5070 'end if
5080 RETURN
5090 '
5100 'D-----------------------D
5110 '
5120 'ÄÞÛ¯Ìß»ÚÀÊÞ¼®Æ Ã·½ÄÌÞÛ¯¸¦ µ¸
5130 '
5140 DD=0 'ÄÞÛ¯Ìß»ÚÀ ·Þ®³ É ÌÞÛ¯¸º³ÌÞÝ É ÀÞÝ½³
5150 GOSUB 7110 '½ÅÄÞ¹²
5160 'ÄÞÛ¯Ìß ²ÁÊ º-ÄÞÍß²Ý ¶?
5170 IF MX\8<CL THEN ELSE 5220
5180   'ÄÞÛ¯Ìß ²Á¶Þ º-ÄÞÍß²Ý ÃÞÅ¹ÚÊÞ Ñ¼
5190   GOSUB 6940 '´×- É µÄ
5200   GOSUB 7010 '½Ìß×²Ä ¦ ¹½
5210   RETURN
5220 'endif
5230 DY=(MY+3)\8 'ÄÞÛ¯Ìß ²Á
5240 '
5250 DB=1:IF LEFT$(GS$,1)="`" THEN DB=2 'ËÂÖ³Å ¸³·Þ®³
5260 DL=1 '¸³·Þ®³ ¹Ý»¸
5270 '½Ìß×²Ä¦ ¹½
5280 GOSUB 7010
5290 'ÌÞÛ¯¸´Ø± ¶×É ÄÞÛ¯Ìß Å×
5300 IF GW=0 THEN ELSE 5880
5310   '±²Ã²Ù ·Þ®³¦ »¶Þ½
5320   'repeat{
5330     IF 32<FNS(CL+1,DL) THEN ELSE 5390
5340       DL=DL+1
5350       IF DL<22-DB THEN 5320
5360   '}
5370   '±·¶ÞÅ¹ÚÊÞ ±·×ÒÙ
5380   GOSUB 6940:GOTO 5860
5390   '
5400   'ÄÁ­³É ·Þ®³Í ¿³Æ­³ ÃÞÊÅ² -> »²ºÞÆ Â²¶
5410   IF DL>DY THEN ELSE DY=DL:GOTO 5750
5420     'ÄÁ­³É ·Þ®³Í ¿³Æ­³
5430     '
5440     'ÌÞÛ¯¸ º³ÌÞÝ É ÄÁ­³?
5450     IF CHR$(FNS(CL+1,DY))="|" THEN ELSE 5520
5460       'ÌÞÛ¯¸º³ÌÞÝ É ÀÞÝ½³ ¦ ¼­Ä¸
5470       IF CHR$(FNS(CL+1+DD,DY))="|" THEN DD=DD+1:GOTO 5470
5480       '»×Æ ÌÞÛ¯¸ º³ÌÞÝ É µÜØ ¶Þ ±ÚÊÞ
5490       IF CHR$(FNS(CL+1+DD,DY))="~" THEN DD=DD+1
5500                         '½¸Û-Ù »¾Å² <--> »¾Ù
5510       IF FNS(CL+2,DY)<=32 THEN 5750 ELSE 5610
5520     'endif
5530     'ÌÞÛ¯¸º³ÌÞÝÉ ÄÁ­³ÃÞÊÅ²
5540     'ÌÞÛ¯¸ º³ÌÞÝ É µÜØ?
5550     IF CHR$(FNS(CL+1,DY))="~" THEN ELSE 5600
5560       DD=1 'ÌÞÛ¯¸º³ÌÞÝ É ÀÞÝ½³ ¦ ¼­Ä¸
5570       'Å×ÊÞ ÌÞÛ¯¸ º³ÌÞÝ Æ ¿³Æ­³
5580                      '1·Þ®³ ³´¶Þ ¸³·Þ®³ Å× ½¸Û-Ù ¼Å² <--> ½Ù
5590       IF FNS(CL+2,DY-1)<=32   THEN DY=DY-1:GOTO 5750 ELSE 5610
5600     'end if
5610     'Ó¼ ÄÞÛ¯ÌßÀ²¼®³ ¶Þ ÊÐÀÞ½Å×
5620     IF 31<CL+1+DD+LEN(GS$) THEN ELSE 5660
5630       '±·¶ÞÅ¹ÚÊÞ ±·×ÒÙ
5640       GOSUB 6940 '´×° É µÄ
5650       RETURN
5660     'end if
5670     '·Þ®³ ºËß-
5680     DZ=DL+DB-1 'ÃÝ¿³ÓÄ »²¼­³·Þ®³
5690     IF 20<DZ THEN DZ=20
5700     FOR DI=DZ TO DY+DB STEP -1 'DZ~DY
5710       FOR DJ=CL TO 30
5720         VPOKE &H1800+DJ+DI*32,FNS(DJ,DI-DB)
5730       NEXT
5740     NEXT
5750   'endif
5760   'ÄÞÛ¯Ìß É À²¼®³¶Þ ÌÞÛ¯¸º³ÌÞÝ Å× ººÃÞ Â·ÞÉ·Þ®³ ²º³¦ Ë®³¼Þ½Ù
5770   IF LEFT$(GS$,1)="`" THEN ELSE 5830
5780     LOCATE CL+1,DY  :PRINT STRING$(DD,"|");GS$;
5790     IF 0<31-POS(0) THEN PRINT SPC(31-POS(0));
5800     LOCATE CL+1,DY+1:PRINT STRING$(DD,"|");"~end";'STRING$(LEN(GS$)-1,"„");
5810     IF 0<31-POS(0) THEN PRINT SPC(31-POS(0));
5820     GOTO 5860
5830   'else
5840     LOCATE CL+1,DY:PRINT STRING$(DD,"|");GS$;
5850     IF 0<31-POS(0) THEN PRINT SPC(31-POS(0));
5860   'end if
5870   GOTO 6880
5880 'else
5890   'º°ÄÞ´Ø± ¶×É ÄÞÛ¯Ìß
5900   '(·Þ®³¶Þ Ì´ÀØ Í¯ÀØ ¼Å²)
5910   '
5920   DD=0 'ÄÞ×¯¸ÞÓÄÉ ÀÞÝ½³
5930   DW=0 'ÌÞÛ¯¸Å² »²Á®³É Ó¼Þ½³
5940   'ÄÞÛ¯Ìß»·¶Þ ÄÞÛ¯ÌßÓÄÅ× ÅÆÓ¼Å²
5950   IF GV<=DY AND DY<=GV+GW-1 THEN 6880'break
5960   'ÊÞ¯Ì§ ¦ ¶¸Î
5970   ERASE DM$
5980   DIM DM$(20)
5990   'ÄÞÛ¯ÌßÀ²¼®³ É À²Ë
6000   FOR DI=0 TO GW-1
6010     DM$(DI)=""
6020     DS=0'¸³Ê¸ ²¶Þ²É Ó¼Þ¦ ÐÂ¹À Ì×¸Þ
6030     FOR DJ=30 TO CL+1 STEP -1
6040       DC=FNS(DJ,GV+DI)
6050       IF 32<DC THEN DS=1 '¸³Ê¸ ²¶Þ²É Ó¼Þ¦ ÐÂ¹À
6060       IF DS=1 THEN DM$(DI)=CHR$(DC)+DM$(DI)
6070     NEXT
6080     '1·Þ®³ÒÅ× ÄÞ×¯¸ÞÓÄÉ ²ÝÃÞÝÄ ÀÞÝ½³¦ ¼­Ä¸
6090     IF DI=0 THEN ELSE 6110
6100       IF MID$(DM$(DI),DD+1,1)="|" THEN DD=DD+1:GOTO 6100
6110     'endif
6120     '¾ÝÄ³É ²ÝÃÞÝÄ(|)¦ »¸¼Þ®
6130     DM$(DI)=MID$(DM$(DI),DD+1)
6140     'ÌÞÛ¯¸Å² »²Á®³É Ó¼Þ½³
6150     IF DW<LEN(DM$(DI)) THEN DW=LEN(DM$(DI))
6160 'MM$="<"+DM$(DI)+">":GOSUB 7040:I$=INPUT$(1)'````
6170   NEXT
6180   DD=0
6190   'ÌÞÛ¯¸ º³ÌÞÝ É ÄÁ­³?
6200   IF CHR$(FNS(CL+1,DY))="|" THEN ELSE 6250
6210     'ÌÞÛ¯¸º³ÌÞÝ É ÀÞÝ½³ ¦ ¼­Ä¸
6220     IF CHR$(FNS(CL+1+DD,DY))="|" THEN DD=DD+1:GOTO 6220
6230     '»×Æ ÌÞÛ¯¸ º³ÌÞÝ É µÜØ ¶Þ ±ÚÊÞ
6240     IF CHR$(FNS(CL+1+DD,DY))="~" THEN DD=DD+1
6250   'endif
6260   'Ó¼ ÄÞÛ¯ÌßÀ²¼®³ ¶Þ ÊÐÀÞ½Å×
6270 'MM$=STR$(DD)+STR$(DW):GOSUB 7040:I$=INPUT$(1)'````
6280   IF 31<CL+1+DD+DW THEN ELSE 6320
6290     '±·¶ÞÅ¹ÚÊÞ ±·×ÒÙ
6300     GOSUB 6940 '´×° É µÄ
6310     RETURN
6320   'end if
6330   'ÌÞÛ¯¸º³ÌÞÝ É »¸¼Þ®
6340   'ÄÞ×¯¸ÞÓÄÉ »ÞË®³
6350   SWAP MX,MP
6360   SWAP MY,MQ
6370   'ÌÞÛ¯¸ »¸¼Þ®
6380   GOSUB 7820
6390   '»ÞË®³ Ì¸¹ÞÝ
6400   SWAP MX,MP
6410   SWAP MY,MQ
6420   GOSUB 7110 '½ÅÄÞ¹²
6430   'ËÂÖ³Å ¸³·Þ®³
6440   DB=GW
6450   'ÄÞÛ¯Ìß»· ¶Þ ²ÄÞ³½Ù ÌÞÛ¯¸ÖØ ¼ÀÅ× ÄÞÛ¯Ìß»·¦ ¿ÉÌÞÝ ±¹ÞÙ
6460   IF GV<DY THEN DY=DY-GW
6470   '±²Ã²Ù ·Þ®³¦ »¶Þ½
6480   'repeat{
6490     IF 32<FNS(CL+1,DL) THEN ELSE 6520
6500       DL=DL+1
6510       IF DL<22-DB THEN 6480
6520   '}
6530   '²ÄÞ³ÅÉÃÞ ±·¶ÞÅ² ºÄÊ ±Ø´Å²
6540   'ÄÁ­³É ·Þ®³Í ¿³Æ­³ ÃÞÊÅ² -> »²ºÞÆ Â²¶
6550   IF DL>DY THEN ELSE DY=DL:GOTO 6820
6560     'ÄÁ­³É ·Þ®³Í ¿³Æ­³
6570     '
6580     'ÌÞÛ¯¸ º³ÌÞÝ É ÄÁ­³?
6590     IF CHR$(FNS(CL+1,DY))="|" THEN ELSE 6660
6600       'ÌÞÛ¯¸º³ÌÞÝ É ÀÞÝ½³ ¦ ¼­Ä¸
6610       IF CHR$(FNS(CL+1+DD,DY))="|" THEN DD=DD+1:GOTO 6610
6620       '»×Æ ÌÞÛ¯¸ º³ÌÞÝ É µÜØ ¶Þ ±ÚÊÞ
6630       IF CHR$(FNS(CL+1+DD,DY))="~" THEN DD=DD+1
6640                         '½¸Û-Ù »¾Å² <--> »¾Ù
6650       IF FNS(CL+2,DY)<=32 THEN 6820 ELSE 6730
6660     'else if
6670     'ÌÞÛ¯¸ º³ÌÞÝ É µÜØ?
6680     IF CHR$(FNS(CL+1,DY))="~" THEN ELSE 6730
6690       DD=1 'ÌÞÛ¯¸º³ÌÞÝ É ÀÞÝ½³ ¦ ¼­Ä¸
6700       'Å×ÊÞ ÌÞÛ¯¸ º³ÌÞÝ Æ ¿³Æ­³
6710                      '1·Þ®³ ³´¶Þ ¸³·Þ®³ Å× ½¸Û-Ù ¼Å² <--> ½Ù
6720       IF FNS(CL+2,DY-1)<=32   THEN DY=DY-1:GOTO 6820 ELSE 6730
6730     'end if
6740     '·Þ®³ ºËß-
6750     DZ=DL+DB-1 'ÃÝ¿³ÓÄ »²¼­³·Þ®³
6760     IF 20<DZ THEN DZ=20
6770     FOR DI=DZ TO DY+DB STEP -1 'DZ~DY
6780       FOR DJ=CL TO 30
6790         VPOKE &H1800+DJ+DI*32,FNS(DJ,DI-DB)
6800       NEXT
6810     NEXT
6820   'ÊÞ¯Ì§É Å²Ö³¦ ÄÞÛ¯Ìß
6830   FOR DI=0 TO GW-1
6840     LOCATE CL+1,DY+DI
6850     PRINT LEFT$(STRING$(DD,"|")+DM$(DI),18);
6860     IF 0<31-POS(0) THEN PRINT SPC(31-POS(0));
6870   NEXT
6880 'end if
6890 PLAY"fc"
6900 RETURN
6910 '
6920 '-------------------------
6930 '
6940 '´×- É µÄ
6950 '
6960 IF PLAY(0)=0 THEN PLAY"ccc"
6970 RETURN
6980 '
6990 '-------------------------
7000 '
7010 'ÄÞ×¯¸ÞÁ­³ É º-ÄÞÌÞÛ¯¸ É ½Ìß×²Ä ¦ ¹½
7020 '
7030 FOR EI=8 TO 11
7040   PUT SPRITE EI,(0,192)
7050   SPRITE$(EI)=""
7060 NEXT
7070 RETURN
7080 '
7090 '-------------------------
7100 '
7110 '½ÅÄÞ¹² Æ ·Ø¶´Ù
7120 '
7130 PUT SPRITE  0,(MX,MY),6,1
7140 PUT SPRITE 24,(VPEEK(BASE(8)+1),VPEEK(BASE(8))+1),1,1
7150 RETURN
7160 '
7170 '----------
7180 '
7190 'Ô¼ÞÙ¼ ¶-¿Ù Æ ·Ø¶´Ù
7200 '
7210 PUT SPRITE  0,,7,0
7220 PUT SPRITE 24,(VPEEK(BASE(8)+1),VPEEK(BASE(8))+1),4,0
7230 RETURN
7240 '
7250 '-------------------------
7260 '
7270 '1·Þ®³ Ò¯¾°¼Þ ¦ Ë®³¼Þ ½Ù
7280 '
7290 'in  MM$  Ë®³¼Þ½Ù Ò¯¾°¼Þ
7300 '
7310 LOCATE 0,22:PRINT SPC(32);
7320 LOCATE 16-LEN(MM$)\2,22:PRINT MM$;
7330 RETURN
7340 '
7350 '-------------------------
7360 '
7370 'Ì§²ÙÒ²¦ Ë®³¼Þ ½Ù
7380 '
7390 LOCATE 13,0
7400 PRINT"WWWWWWWWWWWWWWWWWW"
7410 LOCATE 21-LEN(MN$)\2,0
7420 PRINT MN$;
7430 RETURN
7440 '
7450 '-------------------------
7460 '
7470 'Ã·½Ä¦ À²Ë¼Ã Ò¯¾-¼ÞÎÞ¯¸½ ¦ Ë®³¼Þ ½Ù
7480 '
7490 GOSUB 7110 '½ÅÄÞ¹²
7500 '³¨ÝÄÞ³ ÌÞÌÞÝ É À²Ë
7510 FOR MI=0 TO 4
7520   FOR MJ=0 TO 17
7530     MB(MJ,MI)=FNS(MV-1+MJ,MI-1+MW)
7540   NEXT
7550 NEXT
7560 LOCATE MV-1,MW-1:PRINT"XWWWWWWWWWWWWWWWWY"
7570 LOCATE MV-1,MW+0:PRINT"V                V"
7580 LOCATE MV-1,MW+1:PRINT"VPPPPPPPPPPPPPPPPV"
7590 LOCATE MV-1,MW+2:PRINT"V retOK escCANCELV"
7600 LOCATE MV-1,MW+3:PRINT"ZWWWWWWWWWWWWWWWW["
7610 GOSUB 7190 'ÓÄÉ ¶-¿Ù
7620 RETURN
7630 '
7640 '-------------------------
7650 '
7660 'Ò¯¾-¼ÞÎÞ¯¸½ ¦ ¼®³·® ¼Ã Ã·½Ä¦ Ì¸¹ÞÝ ½Ù
7670 '
7680 GOSUB 7110 '½ÅÄÞ¹²
7690 FOR MI=0 TO 4
7700   FOR MJ=0 TO 17
7710     VPOKE &H1800+(MV-1+MJ)+(MW-1+MI)*32,MB(MJ,MI)
7720   NEXT
7730 NEXT
7740 PLAY"fc"
7750 GOSUB 7190 'ÓÄÉ ¶-¿Ù
7760 RETURN
7770 '
7780 '
7790 '
7800 'F-----------------------F
7810 '
7820 '¸Ø¯¸ »ÚÀ ÊÞ¼® É ÌÞÛ¯¸ ¦ ¹½
7830 '
7840 '¸Ø¯¸ ²ÁÊ º-ÄÞÍß²Ý ¶?
7850 IF MX\8<CL THEN ELSE 7900
7860   '¸Ø¯¸ ²Á¶Þ º-ÄÞÍß²Ý ÃÞÅ¹ÚÊÞ Ñ¼
7870   GOSUB 6940 '´×- É µÄ
7880   IF STRIG(3) THEN 7880
7890   RETURN
7900 'end if
7910 GOSUB 7110 '½ÅÄÞ¹²
7920 FL=MY\8 '¼®ØÀ²¼®³ É ·Þ®³
7930 FU=FL   '»¸¼Þ®½Ù »²¼®É ·Þ®³
7940 FS=1    '»¸¼Þ®½Ù ·Þ®³É ¶³ÝÄ
7950 FD=0    '»¸¼Þ®½Ù ·Þ®³É ÌÞÛ¯¸º³ÌÞÝÉ ÀÞÝ½³
7960 '¸Ø¯¸ ·Þ®³É ¾ÝÄ³É Ó¼Þ
7970 FC$=CHR$(FNS(CL+1,FL))
7980 '¸³Ê¸·Þ®³ Å× ÅÆÓ¼Å²
7990 IF FC$<=" " THEN RETURN
8000 'ÌÞÛ¯¸º³ÌÞÝ É ÀÞÝ½³ ¦ ¼×ÍÞÙ
8010 'repeat{
8020   FC$=CHR$(FNS(CL+1+FD,FL))
8030   IF FC$="|" THEN FD=FD+1:GOTO 8010
8040 '}
8050 '¾ÝÄ³¶Þ ÌÞÛ¯¸·Þ®³ É Ê¼ÞÒ/µÜØ Å×
8060 IF (FC$="`") OR (FC$="~") THEN ELSE 8200
8070   'ÌÞÛ¯¸É ¾ÝÄ³·Þ®³ ¦ ¹Ý»¸
8080   IF CHR$(FNS(CL+1+FD,FL))<>"`" THEN FL=FL-1:GOTO 8080
8090   FU=FL '¾ÝÄ³·Þ®³
8100   'repeat{
8110     'ÌÞÛ¯¸É ³´¶× ¼ÀÏÃÞ ¹½
8120     FL=FL+1:FS=FS+1
8130     FC$=CHR$(FNS(CL+1+FD,FL))
8140     'ÌÞÛ¯¸º³ÌÞÝ É µÜØ Å× ÔÒÙ
8150     IF FC$="~" THEN 8200
8160     'º-ÄÞ´Ø± É µÜØ Å× ÔÒÙ
8170     IF FL=20  THEN FL=FL-1:FS=FS-1:GOTO 8200
8180     GOTO 8100
8190   '}
8200 'end if
8210 '±²Ã²Ù ·Þ®³¦ »¶Þ½ (º³¿¸¶ É ÀÒ)
8220 FB=1 'ÌÞÛ¯¸¶Þ±Ù »²ºÞÉ ·Þ®³
8230 'repeat{
8240 '`IF 32<FNS(CL+1+FD,FB) THEN ELSE 6660
8250   IF 32<FNS(CL+1,FB) THEN ELSE 8290
8260     FB=FB+1
8270     IF FB<21 THEN 8230
8280   'end if
8290 '}
8300 FB=FB-1
8310 '¹¼À ·Þ®³¦ ÂÒÙ
8320 IF FU<=20-FS THEN ELSE 8380 'ºÉ¾ÀÞ²ÉBASICÊ ¶Å×½Þ 1Ù-Ìß½Ù À²»¸
8330   FOR FI=FU TO FB-FS
8340     FOR FJ=CL TO 30
8350       VPOKE &H1800+FJ+FI*32,FNS(FJ,FI+FS)
8360     NEXT
8370   NEXT
8380 'end if
8390 '±²À ·Þ®³¦ ½Íß°½Æ½Ù
8400 'MM$="FB"+STR$(FB)+" FS"+STR$(FS)+" FOR"+STR$(FB-FS+1):GOSUB 7040:I$=INPUT$(1)'````
8410 FOR FI=FB-FS+1 TO 20
8420   LOCATE CL+1,FI:PRINT SPC(18);
8430 NEXT
8440 '
8450 IF STRIG(3) THEN 8450
8460 RETURN
8470 '
8480 'A-----------------------A
8490 '
8500 'Ë·½³ É ¼®Ø
8510 '
8520 ' out AN=0 ¼®Ø½ÞÐ(·¬Ý¾ÙÌ¸Ñ
8530 '  AN=0 ¼®Ø½ÞÐ(·¬Ý¾ÙÓ Ì¸Ñ)
8540 '  AN=1 ¸Ø¯¸²Á¶Þ Ë·½³ÃÞÊÅ²
8550 '
8560 AN=0
8570 AX=MX\8
8580 AY=MY\8
8590 AS=AX '{É²Á
8600 AE=AX '}É²Á
8610 '{ É ²Á ¦ »¶Þ½
8620 'repeat{
8630   IF CHR$(FNS(AS,AY))="{" THEN 8690
8640   AS=AS-1
8650   IF CL<AS THEN 8620
8660   'ÐÂ¶×Å²
8670   AN=1
8680   GOTO 8990
8690 '}
8700 '} É ²Á ¦ »¶Þ½
8710 'repeat{
8720   IF CHR$(FNS(AE,AY))="}" THEN 8740
8730   AE=AE+1:IF AE<31 THEN 8710 ELSE 8990 'ÐÂ¶×Å²
8740 '}
8750 '{}Å²É Ë·½³ ¦ ¼­Ä¸
8760 AR$=""
8770 IF AE-AS>1 THEN ELSE 8810 'ºÉ¼ÞÀÞ²É BASICÊ ¶Å×½Þ 1Ù-Ìß ½ÙÉÃÞ
8780   FOR AI=AS+1 TO AE-1
8790     AR$=AR$+CHR$(FNS(AI,AY))
8800   NEXT
8810 'end if
8820 '}É ±Ä¶× ·Þ®³ÏÂ ÏÃÞ¦ ¼­Ä¸
8830 AB$=""
8840 FOR AI=AE+1 TO 30
8850   AC=FNS(AI,AY)
8860   IF 32<AC THEN AB$=AB$+CHR$(AC)
8870 NEXT
8880 '
8890 WF$=AR$
8900 GOSUB 9040 'Æ­³Ø®¸ ³¨ÝÄÞ³
8910 IF WR=1 THEN ELSE 8980
8920   'Æ­³Ø®¸ ¶Þ ·¬Ý¾Ù »ÚÃ²Å¹ÚÊÞ ÊÝ´²½Ù
8930   AR$=WF$
8940   '1·Þ®³Æ Ê²×Å² ÌÞÝÊ ¶¯Ä½Ù
8950   IF 30-(AS+1)-LEN(AB$)<LEN(AR$) THEN AR$=LEFT$(AR$,30-(AS+1)-LEN(AB$))
8960   LOCATE AS+1,AY:PRINT AR$;"}";AB$;
8970   IF 0<31-POS(0) THEN PRINT SPC(31-POS(0));
8980 'end if
8990 'ØÀ-Ý
9000 RETURN
9010 '
9020 'W-----------------------W
9030 '
9040 'Ó¼Þ Æ­³Ø®¸
9050 '
9060 'in  WF$  ÃÞÌ«ÙÄÁ
9070 'out WR   0:·¬Ý¾Ù 1:¶¸Ã²
9080 '    WF$  Æ­³Ø®¸Á
9090 '
9100 WR=0
9110 GOSUB 7470 '³¨ÝÄÞ³ É Ê²¹²¦ À²Ë¼Ã ³¨ÝÄÞ³¦ ËÞ®³¶Þ
9120 WX=LEN(WF$)
9130 '
9140 'repeat{
9150   LOCATE MV,MW
9160   PRINT WF$;SPC(16-LEN(WF$));
9170   LOCATE MV+WX
9180   WA=ASC(INPUT$(1))
9190   IF WA=27         THEN 9380 'ESC=·¬Ý¾Ù
9200   IF WA=8 AND 0<WX THEN WF$=LEFT$(WF$,WX-1)+MID$(WF$,WX+1):WX=WX-1 'BS
9210   IF WA=127        THEN WF$=LEFT$(WF$,WX  )+MID$(WF$,WX+2) 'DEL
9220   IF WA=13         THEN WR=1:GOTO 9380 '¶¸Ã²
9230   '0~20H,7fH,FFh
9240   '¶-¿Ù ²ÄÞ³
9250   IF WA=&H1D THEN WX=WX-1
9260   IF WA=&H1C THEN WX=WX+1
9270   IF WX<0 THEN WX=0
9280   IF LEN(WF$)<WX THEN WX=LEN(WF$)
9290   '¶Ý¹²Å²Ó¼Þ¦ Ê¼Þ¸
9300   IF (WA<=&H20) OR (127=WA) THEN 9140
9310   '¿³Æ­³
9320   WF$=LEFT$(WF$,WX)+CHR$(WA)+MID$(WF$,WX+1)
9330   WF$=LEFT$(WF$,16)
9340   WX=WX+1
9350   IF LEN(WF$)<WX THEN WX=LEN(WF$)
9360   GOTO 9140
9370 '}
9380 GOSUB 7660 '³¨ÝÄÞ³ É Ê²¹² ¦ Ì¸¹ÞÝ ½Ù
9390 RETURN
9400 '
9410 '-------------------------
9420 '
9430 'OK/·¬Ý¾Ù É ¶¸ÆÝ
9440 '
9450 'in  WF$  Ë®³¼Þ½Ù Ò¯¾°¼Þ
9460 'out WR   0:·¬Ý¾Ù 1:¶¸Ã²
9470 '
9480 WR=0 '·¬Ý¾Ù ¦ ¼Ò½
9490 GOSUB 7470 '³¨ÝÄÞ³ É Ê²¹²¦ À²Ë¼Ã ³¨ÝÄÞ³¦ ËÞ®³¶Þ
9500 LOCATE MV,MW
9510 PRINT WF$;
9520 'repeat{
9530   WA=ASC(INPUT$(1))
9540   IF WA=27 THEN 9570 'ESC=·¬Ý¾Ù
9550   IF WA=13 THEN WR=1:GOTO 9570 '¶¸Ã²
9560   GOTO 9520
9570 '}
9580 GOSUB 7660 '³¨ÝÄÞ³ É Ê²¹² ¦ Ì¸¹ÞÝ ½Ù
9590 RETURN
9600 '
9610 'S-----------------------S
9620 '
9630 '¾-ÌÞ
9640 '
9650 GOSUB 7110 '½ÅÄÞ¹²
9660 MM$="NOW SAVING "+MN$:GOSUB 7270 '¼®ØÁ­³ Ë®³¼Þ
9670 OPEN MN$ FOR OUTPUT AS #1
9680 'º°ÄÞ´Ø± É Ó¼Þ¦ ËÛ² Ì§²Ù Æ ¼­ÂØ®¸
9690 FOR SI=1 TO 20
9700   SL$=""
9710   FOR SJ=CL+1 TO 30
9720     SC=FNS(SJ,SI)
9730     IF SC<32 THEN SC=32
9740     SL$=SL$+CHR$(SC)
9750   NEXT
9760   PRINT #1,SL$
9770 NEXT
9780 CLOSE #1
9790 LOCATE 0,22:PRINT SPC(32); '¼®ØÁ­³ Ë®³¼Þ ¦ ¹½
9800 GOSUB 7370 'Ì§²ÙÒ² ¦ Ë®³¼Þ½Ù
9810 RETURN
9820 '
9830 'L-----------------------L
9840 '
9850 'Û°ÄÞ
9860 '
9870 GOSUB 7110 '½ÅÄÞ¹²
9880 MM$="NOW LOADING "+MN$:GOSUB 7270 '¼®ØÁ­³ Ë®³¼Þ
9890 OPEN MN$ FOR INPUT AS #1
9900 'Ì§²Ù É Å²Ö³¦ º°ÄÞ´Ø± Æ ÃÝ¶²
9910 FOR LI=1 TO 20
9920   LINE INPUT #1,LL$
9930   LOCATE CL+1,LI
10030   PRINT LL$
10040 NEXT
10050 CLOSE #1
10060 LOCATE 0,22:PRINT SPC(32); '¼®ØÁ­³ Ë®³¼Þ ¦ ¹½
10070 GOSUB 7370 'Ì§²ÙÒ² ¦ Ë®³¼Þ½Ù
10080 RETURN
10090 '
10100 'R-----------------------R
10110 '
10120 '¼Þ¯º³(À°ÄÙ ¸Þ×Ì¨¯¸)
10130 '
10140 GOSUB 7110 '½ÅÄÞ¹²
10150 '²ÏÉ º-ÄÞ¦ Î¿ÞÝ½Ù
10160 GOSUB 9630
10170 '»²·ÄÞ³É ÀÒ Ì§²ÙÒ²¦ Î¿ÞÝ
10180 OPEN"lex.ini" FOR OUTPUT AS #1
10190 PRINT #1,MN$
10200 CLOSE #1
10210 MM$="NOW LOADING COMPILER":GOSUB 7270 '¼®ØÁ­³ Ë®³¼Þ
10220 RUN"lex-C.BAS"
