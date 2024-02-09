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
; Gernot Fink氏が作成し、Andreas Wichmann氏のHPにPDS扱いで
; 公開されているCosmic FlyをFX-870P/VX-4/VX-3に移植しました。
; オリジナル版はBASIC+マシン語構成で、固定アドレス(&h7000～)から
; しか実行できなかったのですが、こちらはオールマシン語でかつ
; 好きなアドレスに再アセンブル可能なように書き換えています。
; 実行には1520バイト以上のマシン語エリアを確保して下さい。
; 移植時に少々改造していますが、GAME自体はほぼオリジナルの通りです。
;
; HD61R041で正常にアセンブルできるように，RCS:のJP ($2)をJP $2に変更。
;---------------------------------------------------------------
FX870P:	EQU	1		;FX-870P
VX4:	EQU	2		;VX-4
VX3:	EQU	3		;VX-3
;---------------------------------------------------------------
; 機種の設定
;---------------------------------------------------------------
MODEL:	EQU	VX3		;VX3を選択

#if (MODEL=FX870P)|(MODEL=VX4)
LEDTP:	EQU	&H123C		;LCD先頭アドレス
IOBUF:	EQU	&H19D5		;SAVE/LOAD用 I/Oバッファ
;
DOTDS:	EQU	&H930F		;LCD再表示
BEEP:	EQU	&H33B3		;BEEP音発生
CLS:	EQU	&H2ADF		;画面消去(PRINT CHR$(12)と同等)
CROFF:	EQU	&H032E		;カーソルOFF(KYIN時のカーソル表示をOFFにする)
KYIN:	EQU	&H03A4		;標準キー入力処理（$0に入力されたキーコードが入る）
INKEY:	EQU	&H191D		;INKEY
BIOS2:	EQU	&H5323		;BIOS(BANK0)をコールしてBANK1に戻る時のスタック値
#if MODEL=FX870P
BASE:	EQU	0		;プログラム格納アドレス(FX-870P)
#else
BASE:	EQU	&H1CD0		;プログラム格納アドレス(FX-870P/VX-4)
#endif
#endif
#if MODEL=VX3
LEDTP:	EQU	&H6343		;LCD表示ドットバッファ
IOBUF:	EQU	&H69CE		;SAVE/LOAD用 I/Oバッファ
;
KYIN:	EQU	&H03D1	;標準キー入力処理（$0に入力されたキーコードが入る）
CROFF:	EQU	&H1FAE	;カーソルON(KYIN時のカーソル表示をOFFにする)
DOTDS:	EQU	&H1FD5		;LCD画面表示
CLS:	EQU	&H31CF		;画面消去(PRINT CHR$(12)と同等)
INKEY:	EQU	&H194E		;INKEY$処理
BEEP:	EQU	&H3A8B		;BEEP0
BIOS2:	EQU	&H5CA9		;BIOS(BANK0)をコールしてBANK1に戻る時のスタック値
BASE:	EQU	&H6CD0		;プログラム格納アドレス
#endif

	ORG	BASE			;←各自の環境に合わせてリロケートしてください
	START	MAIN
;-----------------------------------------------------
; MAIN処理
; 入力：なし
; 出力：なし
;-----------------------------------------------------
MAIN:
	PRE	IX,LEDTP+192*4		;利用ワークエリア(192バイト)を待避する
	PRE	IY,LEDTP+192*5-1	;
	PRE	IZ,IOBUF		;待避先=IOBUF
	BUP				;

	LDW	$0,SCORE		;SCOREクリア
	STW	0,($0)			;

TOP:
	LDW	$0,SHIPNUM		;SHIP残機初期化
	ST	3,($0)			;(3機)
	CAL	SSH			;FLYデータ初期化

	CAL	DISPTITLE		;TITLE表示
LOOP:
	CAL	INIT			;初期化
	CAL	GAME			;GAME処理
	JR	Z,BASIC			;BRK入力でBASICに戻る

	CAL	@BEEP			;SHIP破壊音(BEEP)
	CAL	@BEEP			;

	PRE	IZ,SHIPNUM		;SHIP残機更新
	SB	(IZ+$31),$30		;-1
	JR	NZ,LOOP			;

	PRE	IZ,SCORE		;SCORE/HISCORE取り出し
	LDIW	$0,(IZ+$31)		;(SCORE)
	LDW	$2,(IZ+$31)		;(HISCORE)
	SBCW	$2,$0			;HISCORE < SCORE ?
	JR	NC,MAIN0		;
	STW	$0,(IZ+$31)		;HISCORE更新
MAIN0:
	CAL	RELOAD			;ワークエリア情報復帰
	CAL	STATUS			;HI,SC,SHIP表示
	CAL	OVER			;GAMEOVER処理
	JR	Z,TOP			;SPC入力で再ゲーム

BASIC:
	CAL	RELOAD			;ワークエリア情報復帰
	PST	UA,&H54			;BASICに戻る
	RTN				;(BANK0)

;-----------------------------------------------------
;ワークエリア情報復帰
;-----------------------------------------------------
RELOAD:
	PRE	IZ,LEDTP+192*4		;利用ワークエリア(192バイト)を復帰する
	PRE	IX,IOBUF		;待避データ格納先=IOBUF
	PRE	IY,IOBUF+191		;
	BUP				;
	RTN				;

;-----------------------------------------------------
;画面及びワークエリア初期化
;-----------------------------------------------------
INIT:
	CAL	@CLS			;CLS

	PRE	IX,BOMBWK		;BOMB WORKクリア
	XRW	$0,$0			;
	LD	$2,8			;
WKCLR:	STIW	$0,(IX+$31)		;
	SB	$2,$30			;
	JR	NZ,WKCLR		;
	CAL	STATUS			;HI,SC,SHIP表示
	RTN

;-----------------------------------------------------
; SCORE/HI-SOCRE/残機数 表示
;-----------------------------------------------------
STATUS:	PRE	IZ,LEDTP+192+126	;HI-SC表示
	LDW	$0,HI			;
	OR	$3,$30			;
	CAL	PRINT			;
	LDW	$0,HISCORE		;HISCORE表示
	LDW	$0,($0)			;
	PRE	IZ,LEDTP+&H161		;
	CAL	NUM			;

	PRE	IZ,LEDTP+(192*2)+126	;SC表示
	LDW	$0,SC			;
	CAL	PRINT			;
	LDW	$0,SCORE		;SCORE表示
	LDW	$0,($0)			;
	PRE	IZ,LEDTP+&H221		;
	CAL	NUM			;

	PRE	IZ,LEDTP+(192*3)+126	;SHIP表示
	LDW	$0,SH			;
	CAL	PRINT			;

	LDW	$0,SHIPNUM		;SHIP残機数取り出し
	LD	$20,($0)		;
	AN	$20,$20			;残機ゼロなら空白を表示
	JR	Z,STR0			;
	PRE	IX,SHIPCHR		;SHIP表示データセット
STR:
	LDM	$0,(IX+$31),6		;SHIP表示
	STIM	$0,(IZ+$31),6		;
	SB	$20,$30			;
	JR	NZ,STR			;
	RTN
STR0:
	XRM	$0,$0,6			;表示パターンクリア
	STIM	$0,(IZ+$31),6		;空白表示
	RTN

;-----------------------------------------------------
; TITLE画面
;-----------------------------------------------------
DISPTITLE:
	CAL	@CLS			;CLS

	PRE	IZ,LEDTP		;TITLE1表示
	LDW	$0,TITLE1		;
	OR	$3,$30			;
	CAL	PRINT			;
	PRE	IZ,LEDTP+192		;TITLE2表示
	LDW	$0,TITLE2		;
	CAL	PRINT			;
	PRE	IZ,LEDTP+(192*2)	;TITLE3表示
	LDW	$0,TITLE3		;
	CAL	PRINT			;
	PRE	IZ,LEDTP+(192*3)	;TITLE4表示
	LDW	$0,TITLE4		;
	CAL	PRINT			;

	CAL	STATUS			;HI,SC,SHIP表示

	CAL	@BEEP			;BEEP

	CAL	@DOTDS			;DISPLAY LCD

	LDW	$0,SCORE		;SCOREクリア
	STW	0,($0)			;

;-----------------------------------------------------
; [EXE]キー入力待ち
;-----------------------------------------------------
KEYWAIT:
#if 0
	LDW	$2,INKEY		;INKEY$実行
	CAL	RCS			;
	SBC	$17,$31			;
	JR	Z,KEYWAIT		;

	LDW	$0,($15)		;[EXE]入力まで待つ
#else
	LDW	$2,CROFF		;カーソル表示OFF
	CAL	RCS			;

	LDW	$2,KYIN			;KYINを実行
	CAL	RCS			;
#endif
	SBC	$0,&H0D			;
	JR	NZ,KEYWAIT		;
	RTN

;-----------------------------------------------------
; GAME OVER処理
;-----------------------------------------------------
OVER:
	PRE	IZ,LEDTP+200		;GAME OVER表示
	LDW	$0,GAMEOVER		;
	OR	$3,$30			;
	CAL	PRINT			;
	PRE	IZ,LEDTP+(192*2)+24	;KEY TITLE表示
	LDW	$0,KEYTITLE		;
	CAL	PRINT			;

	CAL	@DOTDS			;DISPLAY LCD

	CAL	KEYWAIT			;[EXE]入力まで待つ
	RTN

;-----------------------------------------------------
; ゲームメイン処理
;-----------------------------------------------------
GAME:
;	XRW	$19,$19			;ワーク初期化
	LD	$22,$31			;SCORE表示要求フラグ初期化

	GPO	$0			;BEEP用データ取り出し
	AN	$0,127			;
	OR	$0,64			;
	PST	PD,$0			;中くらいの音量を設定

	LDW	$27,&H2C00		;SHIP位置 初期値セット
	XRW	$24,$24			;
;	PST	IA,&H3D			;KEYスキャンコード設定(乱数用)
L1:	CAL	SHT			;音だし処理
	SB	$29,$30			;
	JR	NZ,L1			;
	LD	$29,90			;・IV(MIN70)

	CAL	KEY			;KEY 入力
	RTN	Z			;BRKにて終了

	AD	$17,$30			;FLY処理は２スキャンに一回実行
	ANC	$17,$30			;
	JR	Z,LO2			;
	CAL	FLY			;FLY 移動
LO2:	CAL	SHIP			;SHIP 移動

	ANC	$17,$30			;画面更新要求あり ?
	JR	Z,LO1			;NO --> LO1

	CAL	@DOTDS			;DISPLAY LCD

	AN	$22,$22			;SCORE表示要求あり
	JR	Z,LO1			;NO --> LO1

	LDW	$0,SCORE		;SCORE 取り出し
	LDW	$0,($0)			;
	PRE	IZ,LEDTP+&H221		;SCOER表示アドレス設定
	CAL	NUM			;SCORE表示
	LD	$22,$31			;

LO1:	SBC	$28,255			;SHIP破壊
	JR	NZ,L1			;NO --> LO1
	OR	$0,$30			;
	RTN

;-----------------------------------------------------
; KEY入力処理
;-----------------------------------------------------
KEY:	PST	IA,5			;KEYスキャンコード設定
	CAL	SCAN			;
	SBC	$0,&H04			;左[4]
	JR	NZ,K1			;
	SBC	$28,$31			;座標0なら処理終了
	JR	Z,K1			;
	SB	$28,2			;

K1:	PST	IA,7			;KEYスキャンコード設定
	CAL	SCAN			;
	SBC	$0,&H1			;右[6]
	JR	NZ,K2			;
	SBC	$28,100			;
	JR	Z,K2			;
	AD	$28,2			;

K2:	PST	IA,9			;KEYスキャンコード設定
	CAL	SCAN			;
	SBC	$0,&H04			;SHOT[0]
	JR	NZ,K3			;
	ANC	$25,255			;
	JR	NZ,K3			;
	LD	$27,$30			;

K3:	PST	IA,1			;KEYスキャンコード設定
	CAL	SCAN			;
	SBC	$0,&H80			;BRK以外ならノンゼロ状態でリターン
	RTN	NZ			;
	XR	$0,$0			;BRKを押されたらゼロフラグを立てる
	RTN

;-----------------------------------------------------
; キースキャン処理
;-----------------------------------------------------
SCAN:	GRE	KY,$0			;キー入力(1)
	GRE	KY,$1			;キー入力(2)
	SBC	$0,$1			;(1)=(2)ならば、入力データを信用する。
	JR	NZ,SCAN			;
	RTN

;-----------------------------------------------------
; SHIP移動/ミサイル制御
;-----------------------------------------------------
SHIP:	SBC	$28,255			;SHIP破壊されたら、処理終了
	RTN	Z
	PRE	IX,LEDTP+&H23E		;LCD表示アドレス設定
	LDI	$0,(IX+$28)
	ANC	$27,7
	JR	Z,SH2
	XRC	$23,255
	JR	Z,SH2
	GRE	IX,$24
SH2:	PRE	IZ,SHIPG		;SHIP描画データアドレスセット
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
; FLY破壊処理
;-----------------------------------------------------
TR:	LD	$23,255			;FLY破壊セット
	LDW	$16,$30
	LD	$22,$30			;SCORE更新要求セット

	LDW	$2,SCORE		;SCORE取り出し
	LDW	$0,($2)			;
	ADBW	$0,$16			;SCORE増加(+1)
	STW	$0,($2)			;SCORE更新

	LD	$25,$31			;
	ST	$25,(IX+199)		;
	LD	$27,5			;
	GRE	IX,$19			;FLY画面アドレス保存
	PRE	IZ,CRASHG		;爆発用データセット
CLEX:	LD	$0,12
T1:	LDI	$1,(IZ+$31)		;FLY爆発パターン表示
	STI	$1,(IX+$31)		;
	LD	$1,(IZ+11)		;
	ST	$1,(IX+191)		;
	SB	$0,$30
	JR	NZ,T1
	RTN

;-----------------------------------------------------
; 音だし
;-----------------------------------------------------
SHT:	GPO	$2			;現在のポート状態を読み出す
	LDW	$0,4
	ANC	$27,255			;通常の音だし
	JR	Z,W2
	SBW	$26,$0
	SBC	$23,255			;FLY爆発音 ?
	JR	Z,W4
	ANC	$26,$23
	JR	Z,W1
W4:	XR	$2,192			;ポート反転(音出し)
	PST	PD,$2
W1:	RTN

W2:	LD	$23,&H21
	ANC	$20,255
	JR	Z,NC1
	PRE	IZ,SHIPWK		;0パターンを描画する(&H739E)
	PRE	IX,$19			;FLY画面アドレスセット
	CAL	CLEX
	LD	$20,$31
NC1:	RTN

;-----------------------------------------------------
; FLY移動/BOMB制御
;-----------------------------------------------------
FLY:	LD	$13,8			;FLY機数読み込み(MAX8)
	LDW	$14,FLYDAT		;FLYデータエリアポインタ設定
	LD	$12,$31			;
Y1:	LDW	$2,($14)
	CAL	SHAPE			;FLY消去
	ADW	$14,$30			;FLYワークアドレス更新
	ADW	$14,$30
	SB	$13,$30			;FLY機数が無くなるまで繰り返し
	JR	NZ,Y1

;	CAL	BOMB
	CAL	BOMB			;BOMB処理

	LD	$13,8			;FLY機数読み込み
	LDW	$14,FLYDAT		;FLYデータエリアポインタ設定 &HC0
	LD	$10,$31

Y2:	PRE	IX,$14			;IX = FLYデータエリアポインタ

	GRE	KY,$0			;KEYレジスタを乱数の種とする
	LD	$0,$31			;

	LD	$11,(IX+$31)		;$11 = FLY座標
	SBC	$28,$11			;
	JR	C,NORE			;

	LD	$0,2			;$0 = 2

NORE:	GST	TM,$11			;$11 = (TM xor FLYカウンタ値) and 5
	XR	$11,$13			;
	AN	$11,5			;
	JR	Z,ZIEL			;
	LD	$0,$1			;$0 = $1(KEYコード)

ZIEL:	AN	$0,2			;BIT<1>取り出し(0 or 2)
	LD	$1,(IX+$31)		;$1 = FLY座標
	XRC	$1,255			;FLY 破壊されている?
	JR	Z,Y3			;次のFLY処理へ

	LD	$10,$30			;$10 = 1
	SBC	$1,100			;FLY座標 < 100 ?
	JR	NC,Y4			;
	AD	(IX+$31),$0		;FLY座標更新+2(または0)

Y4:	LD	$0,$30			;$0 = 1
	ANC	$1,255			;FLY画面端($1 = 255) ?
	JR	Z,Y5			;YES --> Y5
	SB	(IX+$31),$0		;FLY座標更新-2(または0)

Y5:	LD	$1,(IX+$30)		;$1 = FLYステータス
	ANC	$1,255			;FLY破壊
	JR	Z,B3			;
	SB	(IX+$30),$0		;

B3:	GST	TM,$0			;$0 = TMレジスタ
	XR	$0,$8			;
	AN	$0,$30			;
	BIU	$0			;
	LD	$1,(IX+$30)		;$1 = FLYステータス
	SBC	$1,15			;$1 > 15
	JR	NC,B2			;
	AD	(IX+$30),$0		;
B2:	LDW	$2,($14)		;
	LD	$12,255			;
	CAL	SHAPE			;

Y3:	ADW	$14,$30			;FLYワークアドレス更新
	ADW	$14,$30			;

	SB	$13,$30			;FLYカウント -1
	JR	NZ,Y2

	ANC	$10,$30			;FLY残機なし
	JR	Z,SSH			;FLYワークデータを初期化する
	RTN

;-----------------------------------------------------
; FLY座標初期化
;-----------------------------------------------------
SSH:	PRE	IX,FLYDAT		;FLYワーク先頭ポインタ設定
	LD	$10,16			;ワークバイト数=16

SSH1:	LD	$0,(IX+16)		;１バイト転送
	STI	$0,(IX+$31)		;

	SB	$10,$30			;転送終了
	JR	NZ,SSH1
	RTN

;-----------------------------------------------------
; FLY表示処理
;-----------------------------------------------------
SHAPE:	LD	$9,$31			;$9 = 0

	XRC	$2,255			;処理要求あり
	JR	Z,NOSH			;

	LD	$0,$3			;$0 = FLYステータス(Y座標)
	AN	$0,7			;マスク(07h)

	AN	$2,127			;FLY X座標マスク(7fh)
	LD	$1,$3			;$1 = FLYステータス
	PRE	IX,LEDTP-1		;LCD画面先頭座標セット(&H6200)

S1:	ANC	$1,&H18			;ステータス BIT<4>=0 and BIT<0>=0 ?
	JR	Z,S2			;

	LDI	$4,(IX+191)		;画面座標更新(IX=IX+192)
	SB	$1,8,JR S1		;ステータス更新(-8)

S2:	LDI	$4,(IX+$2)		;FLY表示
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

	LD	$12,15			;FLY破壊セット
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
; BOMB処理
;-----------------------------------------------------
BOMB:	LDW	$0,BOMBWK		;FLYDATA+&H20;&H73E0
	AD	$21,$30			;FLYカウント更新
	LD	$2,8			;BOMB個数(MAX15)

B1:	LDW	$6,($0)			;BOMB座標読み込み
	ANC	$6,255			;画面端で無ければ、描画処理(B9)へ
	JR	NZ,B9			;

	LDW	$3,FLYDAT		;FLY座標取り込み(&H73C0)
	LD	$5,$21			;FLYカウント値を代入
	AD	$21,$30			;+1（カウント更新)
	AN	$5,7			;$5 = $5 MOD 7
	BIU	$5			;*2
	OR	$3,$5			;&H73C0+(0,2,4,..,14)
	LDW	$3,($3)			;FLY座標読み込み

	SBC	$3,255			;FLY破壊なら、次のBOMB処理へ
	JR	Z,B8			;

	OR	$3,$30			;$3 = $3 or 1
	STW	$3,($0)			;ワークアリア内容更新
	LDW	$6,$3			;更新した座標を与える

B9:	LD	$3,$7			;BOMB表示処理
	PRE	IX,LEDTP-1		;&H6200
	LDI	$8,(IX+$6)		;BOMB座標データ読み込み
	LD	$6,128			;

B4:	AN	$3,7			;
	JR	Z,B12			;
	BID	$6			;
	SB	$3,$30,JR B4		;

B12:	SBC	$7,30			;
	JR	NZ,B6			;

	LD	$6,7			;BOMB発射音
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

	SB	$6,$28			;SHIP破壊?
	SB	$6,9			;
	JR	NC,B11			;NO-->B11
	LD	$28,255			;SHIP破壊セット

B11:	XRW	$6,$6			;BOMBワーク消滅
	STW	$6,($0)			;

B8:	ADW	$0,$30			;ワークアドレス更新
	ADW	$0,$30			;

	SB	$2,$30			;BOMB数 -1
	JP	NC,B1
	RTN

;-----------------------------------------------------
; BOMB用音だし処理
;-----------------------------------------------------
SB:	LD	$12,3			;音出し処理
SB1:	GPO	$13			;
	XR	$13,192			;音の状態を反転する
	PST	PD,$13			;
	SB	$12,$30			;設定された回数分、繰り返す
	JR	NZ,SB1			;
	RTN

;-----------------------------------------------------
; SCORE表示
; BANK2先頭にあるFONTデータを使って得点を表示する
; 入力 IZ=LCD表示開始アドレス
;-----------------------------------------------------
NUM:
	GST	UA,$2			;BANK保存
	PST	UA,&H65			;BANK 2設定(IX)
	LD	$3,4			;表示桁設定(5桁)
LL:	
	PRE	IX,&H10*6		;数字FONTアドレス先頭指定
	LD	$4,$1			;最上位桁取り出し
	AN	$4,&HF0			;

	BID	$4			;フォントアドレス計算
	LD	$5,$4			;
	BID	$5			;
	BID	$5			;
	SB	$4,$5			;

	LDM	$5,(IX+$4),6		;フォント表示
	STIM	$5,(IZ+$31),6		;

	DIUW	$0			;桁下げ
	SB	$3,$30			;
	JR	NC,LL			;

	PST	UA,$2			;BANKを元に戻す
	RTN

;-----------------------------------------------------
; PRINT 処理
; IZから始まるLCD画面上に($0)で指定された文字列を表示する。
; 入力：$0,$1=指定文字列ポインタ
;       $3=文字反転(0以外:NORMAL､0:反転)
;       IZ= LCD表示ポインタ
; 破壊されるレジスタ IZ,IX,$0～$8
;-----------------------------------------------------
PRINT:
PRL:
	LD	$4,($0)			;１文字取り出し
	AN	$4,$4			;NULLなら終了
	JR	Z,PREND			;

	SB	$4,&H20			;キャラクタコード補正

	LD	$5,$31			;フォントアドレス計算
	BIUW	$4			;*2(2倍)
	LDW	$6,$4			;
	BIUW	$6			;*2(4倍)
	ADW	$4,$6			;(6倍を作成)
	PRE	IX,$4			;FONTアドレス指定

	GST	UA,$2			;BANK保存
	PST	UA,&H65			;BANK 2設定(IX)
	LDM	$4,(IX+$31),6		;FONT読み込み
	PST	UA,$2			;BANKを元に戻す

	STIM	$4,(IZ+$31),6		;FONT表示

	ADW	$0,$30			;文字列ポインタ更新
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
; BEEP発生
;-----------------------------------------------------
@BEEP:
	LDW	$2,BEEP			;BEEP
	JR	RCS			;

;-----------------------------------------------------
; LCD再表示
;-----------------------------------------------------
@DOTDS:
	LDW	$2,DOTDS		;DISPLAY LCD

;-----------------------------------------------------
; BIOSルーチン呼び出し処理
;-----------------------------------------------------
RCS:	LDW	$0,BIOS2
	PHSW	$1
	PST	UA,&H54
	JP	$2

;-----------------------------------------------------
; ワーク/変数
;-----------------------------------------------------
SHIPNUM:DB	0			;SHIP残機数ワーク
SCORE:	DW	0			;SCOREデータ
HISCORE:DW	0			;HI-SCOREデータ

;-----------------------------------------------------
; 表示文字列
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
SHIPCHR:DB	&H04,&H0C,&H1C,&H0C,&H04,&H00	;SHIPキャラクタ

;-----------------------------------------------------
; FLY & BOMB用表示データ/ワークエリア
;-----------------------------------------------------
;16バイトアライン上にデータを格納する必要がある
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
