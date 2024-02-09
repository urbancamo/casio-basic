;---------------------------------------------------------------
; Cosmic Fly 
; a publich domain game for the Casio PB-1000
; written by Gernot Fink <gernot.fink@munich.netsurf.de>
; published by Andreas Wichmann on 2000-03-03 on
; http://www.itkp.uni-bonn.de/~wichmann/pb1000.html
;---------------------------------------------------------------
; rewrited by BLUE on 2003-02-16 for the Casio FX-870P/VX-4
; rewrited by BLUE on 2003-11-30 for the Casio VX-3
;---------------------------------------------------------------
; Gernot Fink�����쐬���AAndreas Wichmann����HP��PDS������
; ���J����Ă���Cosmic Fly��FX-870P/VX-4/VX-3�ɈڐA���܂����B
; �I���W�i���ł�BASIC+�}�V����\���ŁA�Œ�A�h���X(&h7000�`)����
; �������s�ł��Ȃ������̂ł����A������̓I�[���}�V����ł���
; �D���ȃA�h���X�ɍăA�Z���u���\�Ȃ悤�ɏ��������Ă��܂��B
; ���s�ɂ�1520�o�C�g�ȏ�̃}�V����G���A���m�ۂ��ĉ������B
; �ڐA���ɏ��X�������Ă��܂����AGAME���̂͂قڃI���W�i���̒ʂ�ł��B
;
; HD61R041�Ő���ɃA�Z���u���ł���悤�ɁCRCS:��JP ($2)��JP $2�ɕύX�B
;---------------------------------------------------------------
FX870P:	EQU	1		;FX-870P
VX4:	EQU	2		;VX-4
VX3:	EQU	3		;VX-3
;---------------------------------------------------------------
; �@��̐ݒ�
;---------------------------------------------------------------
MODEL:	EQU	VX3		;VX3��I��

#if (MODEL=FX870P)|(MODEL=VX4)
LEDTP:	EQU	&H123C		;LCD�擪�A�h���X
IOBUF:	EQU	&H19D5		;SAVE/LOAD�p I/O�o�b�t�@
;
DOTDS:	EQU	&H930F		;LCD�ĕ\��
BEEP:	EQU	&H33B3		;BEEP������
CLS:	EQU	&H2ADF		;��ʏ���(PRINT CHR$(12)�Ɠ���)
CROFF:	EQU	&H032E		;�J�[�\��OFF(KYIN���̃J�[�\���\����OFF�ɂ���)
KYIN:	EQU	&H03A4		;�W���L�[���͏����i$0�ɓ��͂��ꂽ�L�[�R�[�h������j
INKEY:	EQU	&H191D		;INKEY
BIOS2:	EQU	&H5323		;BIOS(BANK0)���R�[������BANK1�ɖ߂鎞�̃X�^�b�N�l
#if MODEL=FX870P
BASE:	EQU	0		;�v���O�����i�[�A�h���X(FX-870P)
#else
BASE:	EQU	&H1CD0		;�v���O�����i�[�A�h���X(FX-870P/VX-4)
#endif
#endif
#if MODEL=VX3
LEDTP:	EQU	&H6343		;LCD�\���h�b�g�o�b�t�@
IOBUF:	EQU	&H69CE		;SAVE/LOAD�p I/O�o�b�t�@
;
KYIN:	EQU	&H03D1	;�W���L�[���͏����i$0�ɓ��͂��ꂽ�L�[�R�[�h������j
CROFF:	EQU	&H1FAE	;�J�[�\��ON(KYIN���̃J�[�\���\����OFF�ɂ���)
DOTDS:	EQU	&H1FD5		;LCD��ʕ\��
CLS:	EQU	&H31CF		;��ʏ���(PRINT CHR$(12)�Ɠ���)
INKEY:	EQU	&H194E		;INKEY$����
BEEP:	EQU	&H3A8B		;BEEP0
BIOS2:	EQU	&H5CA9		;BIOS(BANK0)���R�[������BANK1�ɖ߂鎞�̃X�^�b�N�l
BASE:	EQU	&H6CD0		;�v���O�����i�[�A�h���X
#endif

	ORG	BASE			;���e���̊��ɍ��킹�ă����P�[�g���Ă�������
	START	MAIN
;-----------------------------------------------------
; MAIN����
; ���́F�Ȃ�
; �o�́F�Ȃ�
;-----------------------------------------------------
MAIN:
	PRE	IX,LEDTP+192*4		;���p���[�N�G���A(192�o�C�g)��Ҕ�����
	PRE	IY,LEDTP+192*5-1	;
	PRE	IZ,IOBUF		;�Ҕ��=IOBUF
	BUP				;

	LDW	$0,SCORE		;SCORE�N���A
	STW	0,($0)			;

TOP:
	LDW	$0,SHIPNUM		;SHIP�c�@������
	ST	3,($0)			;(3�@)
	CAL	SSH			;FLY�f�[�^������

	CAL	DISPTITLE		;TITLE�\��
LOOP:
	CAL	INIT			;������
	CAL	GAME			;GAME����
	JR	Z,BASIC			;BRK���͂�BASIC�ɖ߂�

	CAL	@BEEP			;SHIP�j��(BEEP)
	CAL	@BEEP			;

	PRE	IZ,SHIPNUM		;SHIP�c�@�X�V
	SB	(IZ+$31),$30		;-1
	JR	NZ,LOOP			;

	PRE	IZ,SCORE		;SCORE/HISCORE���o��
	LDIW	$0,(IZ+$31)		;(SCORE)
	LDW	$2,(IZ+$31)		;(HISCORE)
	SBCW	$2,$0			;HISCORE < SCORE ?
	JR	NC,MAIN0		;
	STW	$0,(IZ+$31)		;HISCORE�X�V
MAIN0:
	CAL	RELOAD			;���[�N�G���A��񕜋A
	CAL	STATUS			;HI,SC,SHIP�\��
	CAL	OVER			;GAMEOVER����
	JR	Z,TOP			;SPC���͂ōăQ�[��

BASIC:
	CAL	RELOAD			;���[�N�G���A��񕜋A
	PST	UA,&H54			;BASIC�ɖ߂�
	RTN				;(BANK0)

;-----------------------------------------------------
;���[�N�G���A��񕜋A
;-----------------------------------------------------
RELOAD:
	PRE	IZ,LEDTP+192*4		;���p���[�N�G���A(192�o�C�g)�𕜋A����
	PRE	IX,IOBUF		;�Ҕ��f�[�^�i�[��=IOBUF
	PRE	IY,IOBUF+191		;
	BUP				;
	RTN				;

;-----------------------------------------------------
;��ʋy�у��[�N�G���A������
;-----------------------------------------------------
INIT:
	CAL	@CLS			;CLS

	PRE	IX,BOMBWK		;BOMB WORK�N���A
	XRW	$0,$0			;
	LD	$2,8			;
WKCLR:	STIW	$0,(IX+$31)		;
	SB	$2,$30			;
	JR	NZ,WKCLR		;
	CAL	STATUS			;HI,SC,SHIP�\��
	RTN

;-----------------------------------------------------
; SCORE/HI-SOCRE/�c�@�� �\��
;-----------------------------------------------------
STATUS:	PRE	IZ,LEDTP+192+126	;HI-SC�\��
	LDW	$0,HI			;
	OR	$3,$30			;
	CAL	PRINT			;
	LDW	$0,HISCORE		;HISCORE�\��
	LDW	$0,($0)			;
	PRE	IZ,LEDTP+&H161		;
	CAL	NUM			;

	PRE	IZ,LEDTP+(192*2)+126	;SC�\��
	LDW	$0,SC			;
	CAL	PRINT			;
	LDW	$0,SCORE		;SCORE�\��
	LDW	$0,($0)			;
	PRE	IZ,LEDTP+&H221		;
	CAL	NUM			;

	PRE	IZ,LEDTP+(192*3)+126	;SHIP�\��
	LDW	$0,SH			;
	CAL	PRINT			;

	LDW	$0,SHIPNUM		;SHIP�c�@�����o��
	LD	$20,($0)		;
	AN	$20,$20			;�c�@�[���Ȃ�󔒂�\��
	JR	Z,STR0			;
	PRE	IX,SHIPCHR		;SHIP�\���f�[�^�Z�b�g
STR:
	LDM	$0,(IX+$31),6		;SHIP�\��
	STIM	$0,(IZ+$31),6		;
	SB	$20,$30			;
	JR	NZ,STR			;
	RTN
STR0:
	XRM	$0,$0,6			;�\���p�^�[���N���A
	STIM	$0,(IZ+$31),6		;�󔒕\��
	RTN

;-----------------------------------------------------
; TITLE���
;-----------------------------------------------------
DISPTITLE:
	CAL	@CLS			;CLS

	PRE	IZ,LEDTP		;TITLE1�\��
	LDW	$0,TITLE1		;
	OR	$3,$30			;
	CAL	PRINT			;
	PRE	IZ,LEDTP+192		;TITLE2�\��
	LDW	$0,TITLE2		;
	CAL	PRINT			;
	PRE	IZ,LEDTP+(192*2)	;TITLE3�\��
	LDW	$0,TITLE3		;
	CAL	PRINT			;
	PRE	IZ,LEDTP+(192*3)	;TITLE4�\��
	LDW	$0,TITLE4		;
	CAL	PRINT			;

	CAL	STATUS			;HI,SC,SHIP�\��

	CAL	@BEEP			;BEEP

	CAL	@DOTDS			;DISPLAY LCD

	LDW	$0,SCORE		;SCORE�N���A
	STW	0,($0)			;

;-----------------------------------------------------
; [EXE]�L�[���͑҂�
;-----------------------------------------------------
KEYWAIT:
#if 0
	LDW	$2,INKEY		;INKEY$���s
	CAL	RCS			;
	SBC	$17,$31			;
	JR	Z,KEYWAIT		;

	LDW	$0,($15)		;[EXE]���͂܂ő҂�
#else
	LDW	$2,CROFF		;�J�[�\���\��OFF
	CAL	RCS			;

	LDW	$2,KYIN			;KYIN�����s
	CAL	RCS			;
#endif
	SBC	$0,&H0D			;
	JR	NZ,KEYWAIT		;
	RTN

;-----------------------------------------------------
; GAME OVER����
;-----------------------------------------------------
OVER:
	PRE	IZ,LEDTP+200		;GAME OVER�\��
	LDW	$0,GAMEOVER		;
	OR	$3,$30			;
	CAL	PRINT			;
	PRE	IZ,LEDTP+(192*2)+24	;KEY TITLE�\��
	LDW	$0,KEYTITLE		;
	CAL	PRINT			;

	CAL	@DOTDS			;DISPLAY LCD

	CAL	KEYWAIT			;[EXE]���͂܂ő҂�
	RTN

;-----------------------------------------------------
; �Q�[�����C������
;-----------------------------------------------------
GAME:
;	XRW	$19,$19			;���[�N������
	LD	$22,$31			;SCORE�\���v���t���O������

	GPO	$0			;BEEP�p�f�[�^���o��
	AN	$0,127			;
	OR	$0,64			;
	PST	PD,$0			;�����炢�̉��ʂ�ݒ�

	LDW	$27,&H2C00		;SHIP�ʒu �����l�Z�b�g
	XRW	$24,$24			;
;	PST	IA,&H3D			;KEY�X�L�����R�[�h�ݒ�(�����p)
L1:	CAL	SHT			;����������
	SB	$29,$30			;
	JR	NZ,L1			;
	LD	$29,90			;�EIV(MIN70)

	CAL	KEY			;KEY ����
	RTN	Z			;BRK�ɂďI��

	AD	$17,$30			;FLY�����͂Q�X�L�����Ɉ����s
	ANC	$17,$30			;
	JR	Z,LO2			;
	CAL	FLY			;FLY �ړ�
LO2:	CAL	SHIP			;SHIP �ړ�

	ANC	$17,$30			;��ʍX�V�v������ ?
	JR	Z,LO1			;NO --> LO1

	CAL	@DOTDS			;DISPLAY LCD

	AN	$22,$22			;SCORE�\���v������
	JR	Z,LO1			;NO --> LO1

	LDW	$0,SCORE		;SCORE ���o��
	LDW	$0,($0)			;
	PRE	IZ,LEDTP+&H221		;SCOER�\���A�h���X�ݒ�
	CAL	NUM			;SCORE�\��
	LD	$22,$31			;

LO1:	SBC	$28,255			;SHIP�j��
	JR	NZ,L1			;NO --> LO1
	OR	$0,$30			;
	RTN

;-----------------------------------------------------
; KEY���͏���
;-----------------------------------------------------
KEY:	PST	IA,5			;KEY�X�L�����R�[�h�ݒ�
	CAL	SCAN			;
	SBC	$0,&H04			;��[4]
	JR	NZ,K1			;
	SBC	$28,$31			;���W0�Ȃ珈���I��
	JR	Z,K1			;
	SB	$28,2			;

K1:	PST	IA,7			;KEY�X�L�����R�[�h�ݒ�
	CAL	SCAN			;
	SBC	$0,&H1			;�E[6]
	JR	NZ,K2			;
	SBC	$28,100			;
	JR	Z,K2			;
	AD	$28,2			;

K2:	PST	IA,9			;KEY�X�L�����R�[�h�ݒ�
	CAL	SCAN			;
	SBC	$0,&H04			;SHOT[0]
	JR	NZ,K3			;
	ANC	$25,255			;
	JR	NZ,K3			;
	LD	$27,$30			;

K3:	PST	IA,1			;KEY�X�L�����R�[�h�ݒ�
	CAL	SCAN			;
	SBC	$0,&H80			;BRK�ȊO�Ȃ�m���[����ԂŃ��^�[��
	RTN	NZ			;
	XR	$0,$0			;BRK�������ꂽ��[���t���O�𗧂Ă�
	RTN

;-----------------------------------------------------
; �L�[�X�L��������
;-----------------------------------------------------
SCAN:	GRE	KY,$0			;�L�[����(1)
	GRE	KY,$1			;�L�[����(2)
	SBC	$0,$1			;(1)=(2)�Ȃ�΁A���̓f�[�^��M�p����B
	JR	NZ,SCAN			;
	RTN

;-----------------------------------------------------
; SHIP�ړ�/�~�T�C������
;-----------------------------------------------------
SHIP:	SBC	$28,255			;SHIP�j�󂳂ꂽ��A�����I��
	RTN	Z
	PRE	IX,LEDTP+&H23E		;LCD�\���A�h���X�ݒ�
	LDI	$0,(IX+$28)
	ANC	$27,7
	JR	Z,SH2
	XRC	$23,255
	JR	Z,SH2
	GRE	IX,$24
SH2:	PRE	IZ,SHIPG		;SHIP�`��f�[�^�A�h���X�Z�b�g
	LD	$0,13
SH1:	LD	$1,(IZ+$0)
	LD	$9,(IX+$0)
	AN	$9,248
	OR	$1,$9
	ST	$1,(IX+$0)
	SB	$0,$30
	JR	NZ,SH1
	LDW	$0,LEDTP-2
	SBCW	$24,$0
	JR	C,SH5
	LD	$0,255
	PRE	IX,$24
	LD	$2,(IX+7)
	SBC	$2,7
	JR	Z,SH8
	ANC	$2,255
SH8:	ST	$0,(IX+7)
	JR	NZ,TR
	SBC	$2,7
	LDW	$0,192
	ST	$1,(IX+199)
	SBW	$24,$0,JR SH4
SH5:	ANC	$25,255
	JR	Z,SH6
	PRE	IX,$24
	LD	$0,$31
	ST	$0,(IX+199)
SH6:	LD	$25,$31
SH4:	RTN

;-----------------------------------------------------
; FLY�j�󏈗�
;-----------------------------------------------------
TR:	LD	$23,255			;FLY�j��Z�b�g
	LDW	$16,$30
	LD	$22,$30			;SCORE�X�V�v���Z�b�g

	LDW	$2,SCORE		;SCORE���o��
	LDW	$0,($2)			;
	ADBW	$0,$16			;SCORE����(+1)
	STW	$0,($2)			;SCORE�X�V

	LD	$25,$31			;
	ST	$25,(IX+199)		;
	LD	$27,5			;
	GRE	IX,$19			;FLY��ʃA�h���X�ۑ�
	PRE	IZ,CRASHG		;�����p�f�[�^�Z�b�g
CLEX:	LD	$0,12
T1:	LDI	$1,(IZ+$31)		;FLY�����p�^�[���\��
	STI	$1,(IX+$31)		;
	LD	$1,(IZ+11)		;
	ST	$1,(IX+191)		;
	SB	$0,$30
	JR	NZ,T1
	RTN

;-----------------------------------------------------
; ������
;-----------------------------------------------------
SHT:	GPO	$2			;���݂̃|�[�g��Ԃ�ǂݏo��
	LDW	$0,4
	ANC	$27,255			;�ʏ�̉�����
	JR	Z,W2
	SBW	$26,$0
	SBC	$23,255			;FLY������ ?
	JR	Z,W4
	ANC	$26,$23
	JR	Z,W1
W4:	XR	$2,192			;�|�[�g���](���o��)
	PST	PD,$2
W1:	RTN

W2:	LD	$23,&H21
	ANC	$20,255
	JR	Z,NC1
	PRE	IZ,SHIPWK		;0�p�^�[����`�悷��(&H739E)
	PRE	IX,$19			;FLY��ʃA�h���X�Z�b�g
	CAL	CLEX
	LD	$20,$31
NC1:	RTN

;-----------------------------------------------------
; FLY�ړ�/BOMB����
;-----------------------------------------------------
FLY:	LD	$13,8			;FLY�@���ǂݍ���(MAX8)
	LDW	$14,FLYDAT		;FLY�f�[�^�G���A�|�C���^�ݒ�
	LD	$12,$31			;
Y1:	LDW	$2,($14)
	CAL	SHAPE			;FLY����
	ADW	$14,$30			;FLY���[�N�A�h���X�X�V
	ADW	$14,$30
	SB	$13,$30			;FLY�@���������Ȃ�܂ŌJ��Ԃ�
	JR	NZ,Y1

;	CAL	BOMB
	CAL	BOMB			;BOMB����

	LD	$13,8			;FLY�@���ǂݍ���
	LDW	$14,FLYDAT		;FLY�f�[�^�G���A�|�C���^�ݒ� &HC0
	LD	$10,$31

Y2:	PRE	IX,$14			;IX = FLY�f�[�^�G���A�|�C���^

	GRE	KY,$0			;KEY���W�X�^�𗐐��̎�Ƃ���
	LD	$0,$31			;

	LD	$11,(IX+$31)		;$11 = FLY���W
	SBC	$28,$11			;
	JR	C,NORE			;

	LD	$0,2			;$0 = 2

NORE:	GST	TM,$11			;$11 = (TM xor FLY�J�E���^�l) and 5
	XR	$11,$13			;
	AN	$11,5			;
	JR	Z,ZIEL			;
	LD	$0,$1			;$0 = $1(KEY�R�[�h)

ZIEL:	AN	$0,2			;BIT<1>���o��(0 or 2)
	LD	$1,(IX+$31)		;$1 = FLY���W
	XRC	$1,255			;FLY �j�󂳂�Ă���?
	JR	Z,Y3			;����FLY������

	LD	$10,$30			;$10 = 1
	SBC	$1,100			;FLY���W < 100 ?
	JR	NC,Y4			;
	AD	(IX+$31),$0		;FLY���W�X�V+2(�܂���0)

Y4:	LD	$0,$30			;$0 = 1
	ANC	$1,255			;FLY��ʒ[($1 = 255) ?
	JR	Z,Y5			;YES --> Y5
	SB	(IX+$31),$0		;FLY���W�X�V-2(�܂���0)

Y5:	LD	$1,(IX+$30)		;$1 = FLY�X�e�[�^�X
	ANC	$1,255			;FLY�j��
	JR	Z,B3			;
	SB	(IX+$30),$0		;

B3:	GST	TM,$0			;$0 = TM���W�X�^
	XR	$0,$8			;
	AN	$0,$30			;
	BIU	$0			;
	LD	$1,(IX+$30)		;$1 = FLY�X�e�[�^�X
	SBC	$1,15			;$1 > 15
	JR	NC,B2			;
	AD	(IX+$30),$0		;
B2:	LDW	$2,($14)		;
	LD	$12,255			;
	CAL	SHAPE			;

Y3:	ADW	$14,$30			;FLY���[�N�A�h���X�X�V
	ADW	$14,$30			;

	SB	$13,$30			;FLY�J�E���g -1
	JR	NZ,Y2

	ANC	$10,$30			;FLY�c�@�Ȃ�
	JR	Z,SSH			;FLY���[�N�f�[�^������������
	RTN

;-----------------------------------------------------
; FLY���W������
;-----------------------------------------------------
SSH:	PRE	IX,FLYDAT		;FLY���[�N�擪�|�C���^�ݒ�
	LD	$10,16			;���[�N�o�C�g��=16

SSH1:	LD	$0,(IX+16)		;�P�o�C�g�]��
	STI	$0,(IX+$31)		;

	SB	$10,$30			;�]���I��
	JR	NZ,SSH1
	RTN

;-----------------------------------------------------
; FLY�\������
;-----------------------------------------------------
SHAPE:	LD	$9,$31			;$9 = 0

	XRC	$2,255			;�����v������
	JR	Z,NOSH			;

	LD	$0,$3			;$0 = FLY�X�e�[�^�X(Y���W)
	AN	$0,7			;�}�X�N(07h)

	AN	$2,127			;FLY X���W�}�X�N(7fh)
	LD	$1,$3			;$1 = FLY�X�e�[�^�X
	PRE	IX,LEDTP-1		;LCD��ʐ擪���W�Z�b�g(&H6200)

S1:	ANC	$1,&H18			;�X�e�[�^�X BIT<4>=0 and BIT<0>=0 ?
	JR	Z,S2			;

	LDI	$4,(IX+191)		;��ʍ��W�X�V(IX=IX+192)
	SB	$1,8,JR S1		;�X�e�[�^�X�X�V(-8)

S2:	LDI	$4,(IX+$2)		;FLY�\��
	PRE	IZ,FLYG			;
	LD	$4,5
S3:	LD	$6,(IZ+$4)
	LD	$5,$31
	LD	$8,$0

	XRC	$12,$31
	JR	Z,S5

S4:	ANC	$8,7
	JR	Z,S5
	BIDW	$6
	SB	$8,$30,JR S4

S5:	LD	$8,(IX+$31)		;
	XR	$8,$6			;
	AN	$8,$12			;
	ST	$8,(IX+$31)		;
	LD	$8,(IX+192)		;

	SBC	$8,&HAA
	JR	NZ,SHA1

	LD	$12,15			;FLY�j��Z�b�g
	LD	$9,255			;
	ST	$9,($14)		;

SHA1:	XR	$8,$5
	AN	$8,$12

	ST	$8,(IX+192)
	LDI	$8,(IX+$31)

	SB	$4,$30
	JR	NZ,S3
NOSH:	RTN

;-----------------------------------------------------
; BOMB����
;-----------------------------------------------------
BOMB:	LDW	$0,BOMBWK		;FLYDATA+&H20;&H73E0
	AD	$21,$30			;FLY�J�E���g�X�V
	LD	$2,8			;BOMB��(MAX15)

B1:	LDW	$6,($0)			;BOMB���W�ǂݍ���
	ANC	$6,255			;��ʒ[�Ŗ�����΁A�`�揈��(B9)��
	JR	NZ,B9			;

	LDW	$3,FLYDAT		;FLY���W��荞��(&H73C0)
	LD	$5,$21			;FLY�J�E���g�l����
	AD	$21,$30			;+1�i�J�E���g�X�V)
	AN	$5,7			;$5 = $5 MOD 7
	BIU	$5			;*2
	OR	$3,$5			;&H73C0+(0,2,4,..,14)
	LDW	$3,($3)			;FLY���W�ǂݍ���

	SBC	$3,255			;FLY�j��Ȃ�A����BOMB������
	JR	Z,B8			;

	OR	$3,$30			;$3 = $3 or 1
	STW	$3,($0)			;���[�N�A���A���e�X�V
	LDW	$6,$3			;�X�V�������W��^����

B9:	LD	$3,$7			;BOMB�\������
	PRE	IX,LEDTP-1		;&H6200
	LDI	$8,(IX+$6)		;BOMB���W�f�[�^�ǂݍ���
	LD	$6,128			;

B4:	AN	$3,7			;
	JR	Z,B12			;
	BID	$6			;
	SB	$3,$30,JR B4		;

B12:	SBC	$7,30			;
	JR	NZ,B6			;

	LD	$6,7			;BOMB���ˉ�
	CAL	SB			;

B6:	AN	$7,&H18			;
	JR	Z,B7			;

	LDI	$3,(IX+191)
	SB	$7,8,JR B6

B7:	ST	$6,(IX+2)
	AN	$6,127
	JR	NZ,B10
	ST	$6,(IX-190)
B10:	LDW	$6,($0)
	AD	$7,$30
	STW	$6,($0)
	SBC	$7,32
	JR	C,B8
	LD	$3,$31
	ST	$3,(IX+2)

	SB	$6,$28			;SHIP�j��?
	SB	$6,9			;
	JR	NC,B11			;NO-->B11
	LD	$28,255			;SHIP�j��Z�b�g

B11:	XRW	$6,$6			;BOMB���[�N����
	STW	$6,($0)			;

B8:	ADW	$0,$30			;���[�N�A�h���X�X�V
	ADW	$0,$30			;

	SB	$2,$30			;BOMB�� -1
	JP	NC,B1
	RTN

;-----------------------------------------------------
; BOMB�p����������
;-----------------------------------------------------
SB:	LD	$12,3			;���o������
SB1:	GPO	$13			;
	XR	$13,192			;���̏�Ԃ𔽓]����
	PST	PD,$13			;
	SB	$12,$30			;�ݒ肳�ꂽ�񐔕��A�J��Ԃ�
	JR	NZ,SB1			;
	RTN

;-----------------------------------------------------
; SCORE�\��
; BANK2�擪�ɂ���FONT�f�[�^���g���ē��_��\������
; ���� IZ=LCD�\���J�n�A�h���X
;-----------------------------------------------------
NUM:
	GST	UA,$2			;BANK�ۑ�
	PST	UA,&H65			;BANK 2�ݒ�(IX)
	LD	$3,4			;�\�����ݒ�(5��)
LL:	
	PRE	IX,&H10*6		;����FONT�A�h���X�擪�w��
	LD	$4,$1			;�ŏ�ʌ����o��
	AN	$4,&HF0			;

	BID	$4			;�t�H���g�A�h���X�v�Z
	LD	$5,$4			;
	BID	$5			;
	BID	$5			;
	SB	$4,$5			;

	LDM	$5,(IX+$4),6		;�t�H���g�\��
	STIM	$5,(IZ+$31),6		;

	DIUW	$0			;������
	SB	$3,$30			;
	JR	NC,LL			;

	PST	UA,$2			;BANK�����ɖ߂�
	RTN

;-----------------------------------------------------
; PRINT ����
; IZ����n�܂�LCD��ʏ��($0)�Ŏw�肳�ꂽ�������\������B
; ���́F$0,$1=�w�蕶����|�C���^
;       $3=�������](0�ȊO:NORMAL�0:���])
;       IZ= LCD�\���|�C���^
; �j�󂳂�郌�W�X�^ IZ,IX,$0�`$8
;-----------------------------------------------------
PRINT:
PRL:
	LD	$4,($0)			;�P�������o��
	AN	$4,$4			;NULL�Ȃ�I��
	JR	Z,PREND			;

	SB	$4,&H20			;�L�����N�^�R�[�h�␳

	LD	$5,$31			;�t�H���g�A�h���X�v�Z
	BIUW	$4			;*2(2�{)
	LDW	$6,$4			;
	BIUW	$6			;*2(4�{)
	ADW	$4,$6			;(6�{���쐬)
	PRE	IX,$4			;FONT�A�h���X�w��

	GST	UA,$2			;BANK�ۑ�
	PST	UA,&H65			;BANK 2�ݒ�(IX)
	LDM	$4,(IX+$31),6		;FONT�ǂݍ���
	PST	UA,$2			;BANK�����ɖ߂�

	STIM	$4,(IZ+$31),6		;FONT�\��

	ADW	$0,$30			;������|�C���^�X�V
	JR	PRL			;
PREND:
	RTN

;-----------------------------------------------------
; CLS
;-----------------------------------------------------
@CLS:
	LDW	$2,CLS			;CLS
	JR	RCS			;

;-----------------------------------------------------
; BEEP����
;-----------------------------------------------------
@BEEP:
	LDW	$2,BEEP			;BEEP
	JR	RCS			;

;-----------------------------------------------------
; LCD�ĕ\��
;-----------------------------------------------------
@DOTDS:
	LDW	$2,DOTDS		;DISPLAY LCD

;-----------------------------------------------------
; BIOS���[�`���Ăяo������
;-----------------------------------------------------
RCS:	LDW	$0,BIOS2
	PHSW	$1
	PST	UA,&H54
	JP	$2

;-----------------------------------------------------
; ���[�N/�ϐ�
;-----------------------------------------------------
SHIPNUM:DB	0			;SHIP�c�@�����[�N
SCORE:	DW	0			;SCORE�f�[�^
HISCORE:DW	0			;HI-SCORE�f�[�^

;-----------------------------------------------------
; �\��������
;-----------------------------------------------------
TITLE1:	DB	"## Cosmic Fly ##",0
TITLE2:	DB	"Key Function",0
TITLE3:	DB	"Left[4] Right[6]",0
TITLE4:	DB	"Shot[0] Start[EXE]",0
GAMEOVER:DB	"** GAME OVER **",0
KEYTITLE:DB	"PUSH [EXE]",0
HI:	DB	"HI-SC:",0
SC:	DB	"SCORE:",0
SH:	DB	"SHIP :",0
SHIPCHR:DB	&H04,&H0C,&H1C,&H0C,&H04,&H00	;SHIP�L�����N�^

;-----------------------------------------------------
; FLY & BOMB�p�\���f�[�^/���[�N�G���A
;-----------------------------------------------------
;16�o�C�g�A���C����Ƀf�[�^���i�[����K�v������
GDATA:	ORG	(GDATA+16)#&HFFF0
SHIPG:	DB	0,0,0,&H01,&H03,&H03,&H03,&H07,&H03,&H03,&H03,&H01,&H00
FLYG:	DB	0,&HC0,&HD0,&H20,&HD0,&HC0,&H00,&H00,&H00
CRASHG:	DB	&H51,&H0A,&HA5,&H8F,&H46,&HAA,&H49,&HAA,&H8F,&HA5,&H0A,&H51
	DB	&H8A,&H50,&HA5,&HF2,&H4E,&HAA,&H4B,&HAA,&HF2,&HA5,&H50,&H8A
SHIPWK:	DB	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	DS	10
FLYDAT:	DB	&H00,&H01,&H18,&H03,&H38,&H07,&H58,&H03
	DB	&H00,&H11,&H18,&H12,&H38,&H13,&H58,&H14
	DB	&H00,&H01,&H18,&H03,&H38,&H07,&H58,&H03
	DB	&H00,&H10,&H18,&H10,&H38,&H10,&H58,&H10
BOMBWK:	DB	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	DB	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
