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
1100 ' LEX-MAIN.BAS Ҳ���۸���
1110 ' LEX-C.BAS    ���߲�
1120 ' LEX-CMD.DAT  ��ۯ�ò��
1130 ' LEX-DRAW.DAT ����ڰ�
1140 '
1760 '���ײ� ��
1770 ' 0- 7 ����
1780 ' 8-11 Ҳڲ��ۯ�
1790 '24-31 ���� � ���
1800 '
1810 '----------
1820 ' ��� ���
1830 '----------
1840 CLEAR 2048
1850 DEFINT A-Z
1860 DEF FNS(SX,SY)=VPEEK(6144+SX+SY*32) '����� Ӽަ ��ĸ�� �ݽ�
1870 '
1880 PUT SPRITE  0,(120,100),0,1
1890 PUT SPRITE 24,(120,100),0,1
1900 '
1910 '��
1920 PLAY"t150o5l32s0m500"
1930 '
1940 'ò��
1950 '
1960 CL=12 '�-�޴ر � X��ˮ�
1970 MV=8:MW=9 '����޳ � ��
1980 '
1990 '�ݽ�
2000 '
2010 DIM MB(17,4) '����޳ ��� �ޯ̧
2020 DIM DM$(1) '���� ERASE����
2030 MN$="NONAME00.LEX"'�-�̧��
2040 MX=120 'ϳ�����
2050 MY=100
2060 MT=0   '��ۯ��ر� ��ݺ�
2070 GOSUB 7110 '���޹�
2080 '
2090 '÷����ۯ� � �к�
2100 CC=60 '��ۯ� � ���
2110 DIM CL$(CC),CM$(CC),CH$(CC)
2120 OPEN"lex-cmd.dat"FOR INPUT AS #1
2130 FOR MI=0 TO CC-1
2140   LINE INPUT #1,MT$:CL$(MI)=MID$(MT$,7)
2150   LINE INPUT #1,MT$:CM$(MI)=MID$(MT$,7)
2160   LINE INPUT #1,MT$ '����޽ (BASIC�� �ݶ�� ��Ӽޭ-���� ����Ų)
2170   LINE INPUT #1,MT$:CH$(MI)=MID$(MT$,7)
2180 NEXT
2190 CLOSE #1
2200 '
2210 '
2220 '------------
2230 ' ���� �ޮ���
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
2350 '÷����ۯ� ˮ���
2360 GOSUB 3850
2400 '
2410 MP=MX:MQ=MY '��ׯ���Ļ�ˮ�
2420 MD=0   '��ׯ�����
2430 MF$="" '̧ݸ��ݷ� ��� ���
2440 MG=0   '���ް�� ֳ ����
2450 '
2460 'Ӽ lex.ini �� ���� �кн�
2470 ON ERROR GOTO 2550
2480   OPEN "lex.ini" FOR INPUT AS #1
2490   ON ERROR GOTO 0 '��-�ׯ�� ���ޮ
2500   INPUT #1, MN$
2510   CLOSE #1
2520   KILL"lex.ini"
2530   GOSUB 9850 '����޳ϴ� �-�� �к�
2540   GOTO 2570
2550 '��- �ׯ��
2560 RESUME 2570 '��-�� ����
2570 '��-� ��� ���׽� ���� ����
2580 ON ERROR GOTO 0
2590 GOSUB 7370 '̧��Ҳ � ˮ���
2600 '̧ݸ��ݷ� �غ� ��ò
2610 ON KEY GOSUB 4220,4230,4240,4250,4260
2620 FOR MI=1 TO 5
2630   KEY(MI) ON
2640 NEXT
2650 '----------
2660 ' Ҳ� ���
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
2800 '�-�� ��޳
2810 IF MD=0 THEN ELSE 2860
2820   '��ׯ�� ��� ���Ų
2830   PUT SPRITE  0,(MX,MY),7,0
2840   PUT SPRITE 24,(MX,MY+1),4,0
2850   GOTO 2940
2860 'else
2870   '��ׯ�� ��� � ÷����ۯ� � ˮ���
2880   PUT SPRITE  8,(MX   ,MY),7,8
2890   PUT SPRITE  9,(MX+16,MY),7,9
2900   PUT SPRITE 10,(MX+32,MY),7,10
2910   PUT SPRITE 11,(MX+48,MY),7,11
2920   PUT SPRITE  0,(0,192),0
2930   PUT SPRITE 24,(0,192),0
2940 'end if
2950 '��ۯ��ر� ��-��� �-��
2960 PUT SPRITE  1,(9+MT*24,0),6,2
2970 PUT SPRITE 25,(9+MT*24,1),1,2
2980 'ϳ��د� ��ĸ
2990 MS=STRIG(1)+STRIG(0)
3000 '���� �������� �� �����
3010 IF MS   AND MD=0 THEN ELSE 3430
3020   '�د����ɶ� ���޴ر ��
3030   '˷��� �ݻ���
3040   IF (CL<MX\8) AND (MY\8<22) THEN ELSE 3080
3050     GOSUB 8500 '˷�� � ���
3060     IF AN=0 THEN 3410
3070     'else ���� ��ɼ���
3080   'else
3090     '�د� ��� �޼�� ���� � �۳
3100     GOSUB 4300
3110     IF GS$>"" THEN ELSE 3400
3120       '��ݺ޷ض� � �د���ķ� ���
3130       IF GS$="eN"  THEN MU=MT:MT=0:GOTO 3400
3140       IF GS$="jP"  THEN MU=MT:MT=1:GOTO 3400
3150       IF GS$="mSX" THEN MU=MT:MT=2:GOTO 3400
3160       '�ƭ� � �د���ķ� ���
3170       IF GS$="eXIT" THEN GOTO 3750 '���خ�
3180       IF GS$="lOAD" THEN GOSUB 3940:GOTO 3400 '�к�
3190       IF GS$="sAVE" THEN GOSUB 4070:GOTO 3400 'ο��
3200       IF GS$="oVERWRITE" THEN GOSUB 9630:PLAY"fc":GOTO 3400 '�ܶ޷
3210       IF GS$="rUN"       THEN GOSUB 10130:GOTO 3400 '�ޯ��
3220       '�ƭ-�� Ź��� ��ׯ�� ���
3230       MD=1
3240       '��ׯ���� ��ˮ� ο��
3250       MP=MX:MQ=MY
3260       '������ ����ү�-�� � ��޽
3270       MI=0
3280       'repeat{
3290         IF LEFT$(CL$(MI),LEN(GS$))=GS$ THEN ELSE 3330
3300           MM$=CH$(MI)
3310           GOSUB 7270 'ү�-�� � ˮ���
3320           GOTO 3370 'break
3330         'else
3340           MI=MI+1
3350           GOTO 3280
3360         'end if
3370       '}
3380       '˷�� � ²�
3390       IF GT$="" THEN GS$=GS$+CM$(MI) ELSE GS$=GS$+GT$
3400     'end if
3401     '÷����ۯ� ˮ���
3402     IF MT<>MU THEN ELSE 3409
3403       GOSUB 3850
3404       MU=MT
3409     'end if
3410   'end if
3420   MF$="" '������� ̧ݸ��ݷ� � Ѽ
3430 'end if
3440 '�������� �� �Ż��� ��ۯ��
3450 IF MS=0 AND MD THEN ELSE 3490
3460   GOSUB 5120 '÷����ۯ� � ��ۯ��
3470   MD=0       '��ׯ�� ���خ�
3480   LOCATE 0,22:PRINT SPC(32); '���ߦ �����
3490 'end if
3500 'з޸د� ���� ��ۯ�� ��
3510 IF STRIG(3) OR MK$=CHR$(27) THEN GOSUB 7820
3520 '
3530 '̧ݸ��ݷ� ��� ���
3540 IF MF$>"" THEN ELSE 3620
3550   GS$=MF$
3560   MF$=""
3570   IF GS$="eXIT" THEN GOTO 3750 '���خ�
3580   IF GS$="lOAD" THEN GOSUB 3940:GOTO 3620 '�к�
3590   IF GS$="sAVE" THEN GOSUB 4070:GOTO 3620 'ο��
3600   IF GS$="oVERWRITE" THEN GOSUB 9630:PLAY"fc":GOTO 3620 '�ܶ޷
3610   IF GS$="rUN"  THEN GOSUB 10130:GOTO 3620 '�ޯ��
3620 'end if
3630 '
3640 '�� ƭ�خ�
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
3750 ' ���خ� ���
3760 '------------
3770 WF$="ARE YOU SURE?"
3780 GOSUB 9430 'OK/��ݾ� ����
3790 IF WR=0 THEN 2660
3800 SCREEN 0:WIDTH 80
3810 END
3820 '
3830 '-------------------------
3840 '
3850 '��ۯ��ر ˮ���
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
3940 'LOAD ϴ���
3950 '
3960 WF$=MN$ 'ƭ�خ� ��̫���
3970 GOSUB 9040 'Ӽ� ƭ�خ�
3980 'Ӽ�ƭ�خ��� �ޯ�� ��ò��� �к�
3990 IF WR=1 THEN ELSE 4020
4000   MN$=WF$
4010   GOSUB 9850
4020 'end if
4030 RETURN
4040 '
4050 '-------------------------
4060 '
4070 'SAVE ϴ���
4080 '
4090 WF$=MN$ 'ƭ�خ� ��̫���
4100 GOSUB 9040 'Ӽ� ƭ�خ�
4110 'Ӽ�ƭ�خ��� �ޯ�� ��ò��� ο��
4120 IF WR=1 THEN ELSE 4150
4130   MN$=WF$
4140   GOSUB 9630
4150 'end if
4160 RETURN
4170 '
4180 '-------------------------
4190 '
4200 '̧ݸ��ݷ� ��� ���
4210 '
4220 MF$="eXIT":RETURN 'f1
4230 MF$="lOAD":RETURN 'f2
4240 MF$="sAVE":RETURN 'f3
4250 MF$="oVERWRITE":RETURN 'f4
4260 MF$="rUN" :RETURN 'f5
4270 '
4280 'G-----------------------G
4290 '
4300 '�د�����޼�� ÷�� � �۳
4310 '
4320 'out ���ݶ� �ۯ� ÷�� ɳ�
4330 '    GS$ Ҳڲ��ۯ� ����
4340 '    GT$ ˷�� � �����
4350 '  GV  ��ׯ������� � ���� � �ޮ�
4360 '  GW  �ż޸ �ޮ���
4370 '     (��ۯ��ر �� �� 0)
4380 '
4390 GS$=""
4400 GT$=""
4410 GV=0
4420 GW=0
4430 GX=MX\8
4440 GY=MY\8
4450 GD=0 '��ۯ������ � ��ݽ�
4460 '
4470 GOSUB 7110 '���޹�
4480 '��ĳ��� ������
4490 IF (0<=GX) AND (32<FNS(GX,GY)) THEN GX=GX-1:GOTO 4490
4500 '÷�Ħ �۳
4510 'repeat{
4520   GX=GX+1
4530   GA=FNS(GX,GY)
4540   IF (32<GA) AND (GX<32) THEN GS$=GS$+CHR$(GA):GOTO 4510
4550 '}
4560 '��ĳ� ������(|)� ���ޮ��
4570 'repeat{
4580   IF LEFT$(GS$,1)="|" THEN ELSE 4620
4590     GS$=MID$(GS$,2)
4600     GD=GD+1 '������� ��ݽ�
4610     GOTO 4580
4620 '}
4630 IF GS$="" THEN PLAY"cc":RETURN
4640 PLAY"cf"
4650 '�د� ���� �ƭ� ��Ź���
4660 IF GY<23 THEN ELSE 5070
4670   GV=GY '��ۯ������ � ��ĳ�ޮ�
4680   '��ۯ������ � �ޮ���(��ۯ��ر=0)
4690   IF CL<MX\8 THEN GW=1 ELSE GW=0
4700   '�د� ���� �-�޴ر �� ��ĸ�� Ӽ���� ��ĳ�� ��ۯ������ � ʼ��` � ���~��
4710   IF (CL<MX\8) AND (LEFT$(GS$,1)="`") OR (LEFT$(GS$,1)="~") THEN ELSE 4930
4720     '��ۯ�� ��ĳ�ޮ� � �ݻ�
4730     IF CHR$(FNS(CL+1+GD,GY))<>"`" THEN GY=GY-1:GOTO 4730
4740     GV=GY '��ĳ�ޮ�
4750     'Ӽަ �۳
4760     GS$=""
4770     GX=CL+GD
4780     'repeat{
4790       GX=GX+1
4800       GA=FNS(GX,GY)
4810       IF (32<GA) AND (GX<32) THEN GS$=GS$+CHR$(GA):GOTO 4780
4820     '}
4830     '��ۯ������� ���� ����� ���
4840     'repeat{
4850       GY=GY+1:GW=GW+1
4860       GA$=CHR$(FNS(CL+1+GD,GY))
4870       '��ۯ������ � ��� �� ���
4880       IF GA$="~" THEN 4920
4890       '�-�޴ر � ��� �� ���
4900       IF GY=20  THEN GY=GY-1:GW=GW-1:GOTO 4920
4910       GOTO 4840
4920     '}
4930   'end if
4940   '˷��� ���ؽ�
4950   GP=INSTR(GS$,"{")
4960   IF 0<GP THEN ELSE 4990
4970     GT$=MID$( GS$,GP)
4980     GS$=LEFT$(GS$,GP-1)
4990   'endif
5000   '��ۯ� ��ׯ��ֳ� ���ײ� ���-�� ����
5010   FOR GI=0 TO LEN(GS$)-1
5020     '���ײ������ 8-11
5030     FOR GJ=0 TO 7
5040       VPOKE &H3900+GI*16+GJ,VPEEK(ASC(MID$(GS$,GI+1,1))*8+GJ)
5050     NEXT
5060   NEXT
5070 'end if
5080 RETURN
5090 '
5100 'D-----------------------D
5110 '
5120 '��ۯ�߻���޼�� ÷����ۯ�� ��
5130 '
5140 DD=0 '��ۯ�߻�� �ޮ� � ��ۯ������ � ��ݽ�
5150 GOSUB 7110 '���޹�
5160 '��ۯ�� ��� �-���߲� �?
5170 IF MX\8<CL THEN ELSE 5220
5180   '��ۯ�� ���� �-���߲� ��Ź��� Ѽ
5190   GOSUB 6940 '��- � ��
5200   GOSUB 7010 '���ײ� � ��
5210   RETURN
5220 'endif
5230 DY=(MY+3)\8 '��ۯ�� ��
5240 '
5250 DB=1:IF LEFT$(GS$,1)="`" THEN DB=2 '��ֳ� ���ޮ�
5260 DL=1 '���ޮ� �ݻ�
5270 '���ײĦ ��
5280 GOSUB 7010
5290 '��ۯ��ر ��� ��ۯ�� ��
5300 IF GW=0 THEN ELSE 5880
5310   '��ò� �ޮ�� ��޽
5320   'repeat{
5330     IF 32<FNS(CL+1,DL) THEN ELSE 5390
5340       DL=DL+1
5350       IF DL<22-DB THEN 5320
5360   '}
5370   '����Ź��� �����
5380   GOSUB 6940:GOTO 5860
5390   '
5400   '����� �ޮ�� ��ƭ� ���Ų -> ����� ²�
5410   IF DL>DY THEN ELSE DY=DL:GOTO 5750
5420     '����� �ޮ�� ��ƭ�
5430     '
5440     '��ۯ� ����� � ����?
5450     IF CHR$(FNS(CL+1,DY))="|" THEN ELSE 5520
5460       '��ۯ������ � ��ݽ� � ��ĸ
5470       IF CHR$(FNS(CL+1+DD,DY))="|" THEN DD=DD+1:GOTO 5470
5480       '��� ��ۯ� ����� � ��� �� ����
5490       IF CHR$(FNS(CL+1+DD,DY))="~" THEN DD=DD+1
5500                         '���-� ��Ų <--> ���
5510       IF FNS(CL+2,DY)<=32 THEN 5750 ELSE 5610
5520     'endif
5530     '��ۯ������� �������Ų
5540     '��ۯ� ����� � ���?
5550     IF CHR$(FNS(CL+1,DY))="~" THEN ELSE 5600
5560       DD=1 '��ۯ������ � ��ݽ� � ��ĸ
5570       '���� ��ۯ� ����� � ��ƭ�
5580                      '1�ޮ� ���� ���ޮ� �� ���-� �Ų <--> ��
5590       IF FNS(CL+2,DY-1)<=32   THEN DY=DY-1:GOTO 5750 ELSE 5610
5600     'end if
5610     'Ӽ ��ۯ������� �� ���޽��
5620     IF 31<CL+1+DD+LEN(GS$) THEN ELSE 5660
5630       '����Ź��� �����
5640       GOSUB 6940 '�װ � ��
5650       RETURN
5660     'end if
5670     '�ޮ� ���-
5680     DZ=DL+DB-1 '�ݿ��� ������ޮ�
5690     IF 20<DZ THEN DZ=20
5700     FOR DI=DZ TO DY+DB STEP -1 'DZ~DY
5710       FOR DJ=CL TO 30
5720         VPOKE &H1800+DJ+DI*32,FNS(DJ,DI-DB)
5730       NEXT
5740     NEXT
5750   'endif
5760   '��ۯ�� � ������� ��ۯ������ �� ���� ·�ɷޮ� ���� ˮ��޽�
5770   IF LEFT$(GS$,1)="`" THEN ELSE 5830
5780     LOCATE CL+1,DY  :PRINT STRING$(DD,"|");GS$;
5790     IF 0<31-POS(0) THEN PRINT SPC(31-POS(0));
5800     LOCATE CL+1,DY+1:PRINT STRING$(DD,"|");"~end";'STRING$(LEN(GS$)-1,"�");
5810     IF 0<31-POS(0) THEN PRINT SPC(31-POS(0));
5820     GOTO 5860
5830   'else
5840     LOCATE CL+1,DY:PRINT STRING$(DD,"|");GS$;
5850     IF 0<31-POS(0) THEN PRINT SPC(31-POS(0));
5860   'end if
5870   GOTO 6880
5880 'else
5890   '���޴ر ��� ��ۯ��
5900   '(�ޮ��� ̴�� ͯ�� �Ų)
5910   '
5920   DD=0 '��ׯ����� ��ݽ�
5930   DW=0 '��ۯ�Ų ������ Ӽ޽�
5940   '��ۯ�߻��� ��ۯ������ ��ӼŲ
5950   IF GV<=DY AND DY<=GV+GW-1 THEN 6880'break
5960   '�ޯ̧ � ���
5970   ERASE DM$
5980   DIM DM$(20)
5990   '��ۯ������� � ���
6000   FOR DI=0 TO GW-1
6010     DM$(DI)=""
6020     DS=0'��ʸ ��޲� Ӽަ �¹� �׸�
6030     FOR DJ=30 TO CL+1 STEP -1
6040       DC=FNS(DJ,GV+DI)
6050       IF 32<DC THEN DS=1 '��ʸ ��޲� Ӽަ �¹�
6060       IF DS=1 THEN DM$(DI)=CHR$(DC)+DM$(DI)
6070     NEXT
6080     '1�ޮ���� ��ׯ����� ������ ��ݽ�� ��ĸ
6090     IF DI=0 THEN ELSE 6110
6100       IF MID$(DM$(DI),DD+1,1)="|" THEN DD=DD+1:GOTO 6100
6110     'endif
6120     '��ĳ� ������(|)� ���ޮ
6130     DM$(DI)=MID$(DM$(DI),DD+1)
6140     '��ۯ�Ų ������ Ӽ޽�
6150     IF DW<LEN(DM$(DI)) THEN DW=LEN(DM$(DI))
6160 'MM$="<"+DM$(DI)+">":GOSUB 7040:I$=INPUT$(1)'````
6170   NEXT
6180   DD=0
6190   '��ۯ� ����� � ����?
6200   IF CHR$(FNS(CL+1,DY))="|" THEN ELSE 6250
6210     '��ۯ������ � ��ݽ� � ��ĸ
6220     IF CHR$(FNS(CL+1+DD,DY))="|" THEN DD=DD+1:GOTO 6220
6230     '��� ��ۯ� ����� � ��� �� ����
6240     IF CHR$(FNS(CL+1+DD,DY))="~" THEN DD=DD+1
6250   'endif
6260   'Ӽ ��ۯ������� �� ���޽��
6270 'MM$=STR$(DD)+STR$(DW):GOSUB 7040:I$=INPUT$(1)'````
6280   IF 31<CL+1+DD+DW THEN ELSE 6320
6290     '����Ź��� �����
6300     GOSUB 6940 '�װ � ��
6310     RETURN
6320   'end if
6330   '��ۯ������ � ���ޮ
6340   '��ׯ����� ��ˮ�
6350   SWAP MX,MP
6360   SWAP MY,MQ
6370   '��ۯ� ���ޮ
6380   GOSUB 7820
6390   '��ˮ� ̸���
6400   SWAP MX,MP
6410   SWAP MY,MQ
6420   GOSUB 7110 '���޹�
6430   '��ֳ� ���ޮ�
6440   DB=GW
6450   '��ۯ�߻� �� ��޳�� ��ۯ��� ���� ��ۯ�߻�� ����� ����
6460   IF GV<DY THEN DY=DY-GW
6470   '��ò� �ޮ�� ��޽
6480   'repeat{
6490     IF 32<FNS(CL+1,DL) THEN ELSE 6520
6500       DL=DL+1
6510       IF DL<22-DB THEN 6480
6520   '}
6530   '��޳���� ����Ų ��� �شŲ
6540   '����� �ޮ�� ��ƭ� ���Ų -> ����� ²�
6550   IF DL>DY THEN ELSE DY=DL:GOTO 6820
6560     '����� �ޮ�� ��ƭ�
6570     '
6580     '��ۯ� ����� � ����?
6590     IF CHR$(FNS(CL+1,DY))="|" THEN ELSE 6660
6600       '��ۯ������ � ��ݽ� � ��ĸ
6610       IF CHR$(FNS(CL+1+DD,DY))="|" THEN DD=DD+1:GOTO 6610
6620       '��� ��ۯ� ����� � ��� �� ����
6630       IF CHR$(FNS(CL+1+DD,DY))="~" THEN DD=DD+1
6640                         '���-� ��Ų <--> ���
6650       IF FNS(CL+2,DY)<=32 THEN 6820 ELSE 6730
6660     'else if
6670     '��ۯ� ����� � ���?
6680     IF CHR$(FNS(CL+1,DY))="~" THEN ELSE 6730
6690       DD=1 '��ۯ������ � ��ݽ� � ��ĸ
6700       '���� ��ۯ� ����� � ��ƭ�
6710                      '1�ޮ� ���� ���ޮ� �� ���-� �Ų <--> ��
6720       IF FNS(CL+2,DY-1)<=32   THEN DY=DY-1:GOTO 6820 ELSE 6730
6730     'end if
6740     '�ޮ� ���-
6750     DZ=DL+DB-1 '�ݿ��� ������ޮ�
6760     IF 20<DZ THEN DZ=20
6770     FOR DI=DZ TO DY+DB STEP -1 'DZ~DY
6780       FOR DJ=CL TO 30
6790         VPOKE &H1800+DJ+DI*32,FNS(DJ,DI-DB)
6800       NEXT
6810     NEXT
6820   '�ޯ̧� Ųֳ� ��ۯ��
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
6940 '��- � ��
6950 '
6960 IF PLAY(0)=0 THEN PLAY"ccc"
6970 RETURN
6980 '
6990 '-------------------------
7000 '
7010 '��ׯ����� � �-����ۯ� � ���ײ� � ��
7020 '
7030 FOR EI=8 TO 11
7040   PUT SPRITE EI,(0,192)
7050   SPRITE$(EI)=""
7060 NEXT
7070 RETURN
7080 '
7090 '-------------------------
7100 '
7110 '���޹� � �ض��
7120 '
7130 PUT SPRITE  0,(MX,MY),6,1
7140 PUT SPRITE 24,(VPEEK(BASE(8)+1),VPEEK(BASE(8))+1),1,1
7150 RETURN
7160 '
7170 '----------
7180 '
7190 'Լ�ټ �-�� � �ض��
7200 '
7210 PUT SPRITE  0,,7,0
7220 PUT SPRITE 24,(VPEEK(BASE(8)+1),VPEEK(BASE(8))+1),4,0
7230 RETURN
7240 '
7250 '-------------------------
7260 '
7270 '1�ޮ� ү���� � ˮ��� ��
7280 '
7290 'in  MM$  ˮ��޽� ү����
7300 '
7310 LOCATE 0,22:PRINT SPC(32);
7320 LOCATE 16-LEN(MM$)\2,22:PRINT MM$;
7330 RETURN
7340 '
7350 '-------------------------
7360 '
7370 '̧��Ҳ� ˮ��� ��
7380 '
7390 LOCATE 13,0
7400 PRINT"WWWWWWWWWWWWWWWWWW"
7410 LOCATE 21-LEN(MN$)\2,0
7420 PRINT MN$;
7430 RETURN
7440 '
7450 '-------------------------
7460 '
7470 '÷�Ħ ��˼� ү�-���ޯ�� � ˮ��� ��
7480 '
7490 GOSUB 7110 '���޹�
7500 '����޳ ����� � ���
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
7610 GOSUB 7190 '��� �-��
7620 RETURN
7630 '
7640 '-------------------------
7650 '
7660 'ү�-���ޯ�� � ����� �� ÷�Ħ ̸��� ��
7670 '
7680 GOSUB 7110 '���޹�
7690 FOR MI=0 TO 4
7700   FOR MJ=0 TO 17
7710     VPOKE &H1800+(MV-1+MJ)+(MW-1+MI)*32,MB(MJ,MI)
7720   NEXT
7730 NEXT
7740 PLAY"fc"
7750 GOSUB 7190 '��� �-��
7760 RETURN
7770 '
7780 '
7790 '
7800 'F-----------------------F
7810 '
7820 '�د� ��� �޼� � ��ۯ� � ��
7830 '
7840 '�د� ��� �-���߲� �?
7850 IF MX\8<CL THEN ELSE 7900
7860   '�د� ���� �-���߲� ��Ź��� Ѽ
7870   GOSUB 6940 '��- � ��
7880   IF STRIG(3) THEN 7880
7890   RETURN
7900 'end if
7910 GOSUB 7110 '���޹�
7920 FL=MY\8 '�������� � �ޮ�
7930 FU=FL   '���ޮ�� ����� �ޮ�
7940 FS=1    '���ޮ�� �ޮ�� ����
7950 FD=0    '���ޮ�� �ޮ�� ��ۯ������� ��ݽ�
7960 '�د� �ޮ�� ��ĳ� Ӽ�
7970 FC$=CHR$(FNS(CL+1,FL))
7980 '��ʸ�ޮ� �� ��ӼŲ
7990 IF FC$<=" " THEN RETURN
8000 '��ۯ������ � ��ݽ� � �����
8010 'repeat{
8020   FC$=CHR$(FNS(CL+1+FD,FL))
8030   IF FC$="|" THEN FD=FD+1:GOTO 8010
8040 '}
8050 '��ĳ�� ��ۯ��ޮ� � ʼ��/��� ��
8060 IF (FC$="`") OR (FC$="~") THEN ELSE 8200
8070   '��ۯ�� ��ĳ�ޮ� � �ݻ�
8080   IF CHR$(FNS(CL+1+FD,FL))<>"`" THEN FL=FL-1:GOTO 8080
8090   FU=FL '��ĳ�ޮ�
8100   'repeat{
8110     '��ۯ�� ���� ����� ��
8120     FL=FL+1:FS=FS+1
8130     FC$=CHR$(FNS(CL+1+FD,FL))
8140     '��ۯ������ � ��� �� ���
8150     IF FC$="~" THEN 8200
8160     '�-�޴ر � ��� �� ���
8170     IF FL=20  THEN FL=FL-1:FS=FS-1:GOTO 8200
8180     GOTO 8100
8190   '}
8200 'end if
8210 '��ò� �ޮ�� ��޽ (����� � ��)
8220 FB=1 '��ۯ��ޱ� ����� �ޮ�
8230 'repeat{
8240 '`IF 32<FNS(CL+1+FD,FB) THEN ELSE 6660
8250   IF 32<FNS(CL+1,FB) THEN ELSE 8290
8260     FB=FB+1
8270     IF FB<21 THEN 8230
8280   'end if
8290 '}
8300 FB=FB-1
8310 '��� �ޮ�� ���
8320 IF FU<=20-FS THEN ELSE 8380 '�ɾ�޲�BASIC� ��׽� 1�-�߽� ����
8330   FOR FI=FU TO FB-FS
8340     FOR FJ=CL TO 30
8350       VPOKE &H1800+FJ+FI*32,FNS(FJ,FI+FS)
8360     NEXT
8370   NEXT
8380 'end if
8390 '��� �ޮ�� ��߰�ƽ�
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
8500 '˷�� � ���
8510 '
8520 ' out AN=0 ��ؽ��(��ݾ�̸�
8530 '  AN=0 ��ؽ��(��ݾ�� ̸�)
8540 '  AN=1 �د����� ˷�����Ų
8550 '
8560 AN=0
8570 AX=MX\8
8580 AY=MY\8
8590 AS=AX '{ɲ�
8600 AE=AX '}ɲ�
8610 '{ � �� � ��޽
8620 'repeat{
8630   IF CHR$(FNS(AS,AY))="{" THEN 8690
8640   AS=AS-1
8650   IF CL<AS THEN 8620
8660   '�¶�Ų
8670   AN=1
8680   GOTO 8990
8690 '}
8700 '} � �� � ��޽
8710 'repeat{
8720   IF CHR$(FNS(AE,AY))="}" THEN 8740
8730   AE=AE+1:IF AE<31 THEN 8710 ELSE 8990 '�¶�Ų
8740 '}
8750 '{}Ų� ˷�� � ��ĸ
8760 AR$=""
8770 IF AE-AS>1 THEN ELSE 8810 '�ɼ��޲� BASIC� ��׽� 1�-�� �����
8780   FOR AI=AS+1 TO AE-1
8790     AR$=AR$+CHR$(FNS(AI,AY))
8800   NEXT
8810 'end if
8820 '}� �Ķ� �ޮ��� ��ަ ��ĸ
8830 AB$=""
8840 FOR AI=AE+1 TO 30
8850   AC=FNS(AI,AY)
8860   IF 32<AC THEN AB$=AB$+CHR$(AC)
8870 NEXT
8880 '
8890 WF$=AR$
8900 GOSUB 9040 'ƭ�خ� ����޳
8910 IF WR=1 THEN ELSE 8980
8920   'ƭ�خ� �� ��ݾ� ��òŹ��� �ݴ���
8930   AR$=WF$
8940   '1�ޮ�� ʲ�Ų ���� ��Ľ�
8950   IF 30-(AS+1)-LEN(AB$)<LEN(AR$) THEN AR$=LEFT$(AR$,30-(AS+1)-LEN(AB$))
8960   LOCATE AS+1,AY:PRINT AR$;"}";AB$;
8970   IF 0<31-POS(0) THEN PRINT SPC(31-POS(0));
8980 'end if
8990 '��-�
9000 RETURN
9010 '
9020 'W-----------------------W
9030 '
9040 'Ӽ� ƭ�خ�
9050 '
9060 'in  WF$  ��̫���
9070 'out WR   0:��ݾ� 1:��ò
9080 '    WF$  ƭ�خ��
9090 '
9100 WR=0
9110 GOSUB 7470 '����޳ � ʲ��� ��˼� ����޳� �ޮ���
9120 WX=LEN(WF$)
9130 '
9140 'repeat{
9150   LOCATE MV,MW
9160   PRINT WF$;SPC(16-LEN(WF$));
9170   LOCATE MV+WX
9180   WA=ASC(INPUT$(1))
9190   IF WA=27         THEN 9380 'ESC=��ݾ�
9200   IF WA=8 AND 0<WX THEN WF$=LEFT$(WF$,WX-1)+MID$(WF$,WX+1):WX=WX-1 'BS
9210   IF WA=127        THEN WF$=LEFT$(WF$,WX  )+MID$(WF$,WX+2) 'DEL
9220   IF WA=13         THEN WR=1:GOTO 9380 '��ò
9230   '0~20H,7fH,FFh
9240   '�-�� ��޳
9250   IF WA=&H1D THEN WX=WX-1
9260   IF WA=&H1C THEN WX=WX+1
9270   IF WX<0 THEN WX=0
9280   IF LEN(WF$)<WX THEN WX=LEN(WF$)
9290   '�ݹ�ŲӼަ ʼ޸
9300   IF (WA<=&H20) OR (127=WA) THEN 9140
9310   '��ƭ�
9320   WF$=LEFT$(WF$,WX)+CHR$(WA)+MID$(WF$,WX+1)
9330   WF$=LEFT$(WF$,16)
9340   WX=WX+1
9350   IF LEN(WF$)<WX THEN WX=LEN(WF$)
9360   GOTO 9140
9370 '}
9380 GOSUB 7660 '����޳ � ʲ�� � ̸��� ��
9390 RETURN
9400 '
9410 '-------------------------
9420 '
9430 'OK/��ݾ� � ����
9440 '
9450 'in  WF$  ˮ��޽� ү����
9460 'out WR   0:��ݾ� 1:��ò
9470 '
9480 WR=0 '��ݾ� � �ҽ
9490 GOSUB 7470 '����޳ � ʲ��� ��˼� ����޳� �ޮ���
9500 LOCATE MV,MW
9510 PRINT WF$;
9520 'repeat{
9530   WA=ASC(INPUT$(1))
9540   IF WA=27 THEN 9570 'ESC=��ݾ�
9550   IF WA=13 THEN WR=1:GOTO 9570 '��ò
9560   GOTO 9520
9570 '}
9580 GOSUB 7660 '����޳ � ʲ�� � ̸��� ��
9590 RETURN
9600 '
9610 'S-----------------------S
9620 '
9630 '�-��
9640 '
9650 GOSUB 7110 '���޹�
9660 MM$="NOW SAVING "+MN$:GOSUB 7270 '������ ˮ���
9670 OPEN MN$ FOR OUTPUT AS #1
9680 '���޴ر � Ӽަ �۲ ̧�� � ���خ�
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
9790 LOCATE 0,22:PRINT SPC(32); '������ ˮ��� � ��
9800 GOSUB 7370 '̧��Ҳ � ˮ��޽�
9810 RETURN
9820 '
9830 'L-----------------------L
9840 '
9850 '۰��
9860 '
9870 GOSUB 7110 '���޹�
9880 MM$="NOW LOADING "+MN$:GOSUB 7270 '������ ˮ���
9890 OPEN MN$ FOR INPUT AS #1
9900 '̧�� � Ųֳ� ���޴ر � �ݶ�
9910 FOR LI=1 TO 20
9920   LINE INPUT #1,LL$
9930   LOCATE CL+1,LI
10030   PRINT LL$
10040 NEXT
10050 CLOSE #1
10060 LOCATE 0,22:PRINT SPC(32); '������ ˮ��� � ��
10070 GOSUB 7370 '̧��Ҳ � ˮ��޽�
10080 RETURN
10090 '
10100 'R-----------------------R
10110 '
10120 '�ޯ��(���� ���̨��)
10130 '
10140 GOSUB 7110 '���޹�
10150 '��� �-�ަ ο�ݽ�
10160 GOSUB 9630
10170 '����޳� �� ̧��Ҳ� ο��
10180 OPEN"lex.ini" FOR OUTPUT AS #1
10190 PRINT #1,MN$
10200 CLOSE #1
10210 MM$="NOW LOADING COMPILER":GOSUB 7270 '������ ˮ���
10220 RUN"lex-C.BAS"
