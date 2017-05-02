#NoEnv
#MaxMem 4096
#MaxThreads 255
SetBatchLines, -1
ListLines, Off
SendMode, Input
;SendMode, Play
SetKeyDelay, 0
SetMouseDelay, 0
SetWinDelay, 0
SetControlDelay, 0
SetDefaultMouseSpeed, 0
;--- ここより上はauto hot key を早くするための記載です。
;--- AutoHotKey wiki を参考にしています。

TARGET_WORD = ねずみ てくてく          ;---文字列でひっかけています
IfWinNotExist,%TARGET_WORD% ;--- 起動しているかどうか
{
ExitApp ; 起動していない場合は終了
}
WinGet, TARGET_ahk_id,, %TARGET_WORD% ;--- WinActivate用にIDを取得
WinActivate , ahk_id %TARGET_ahk_id%  ;--- ウィンドウをアクティブにする

;=========================================================
; 座標差分
;  ブラウザの左上が0でキャンバスの位置がdx,dy
;=========================================================
;dx := 99
;dy := 114
dx := 501
dy := 140


;=========================================================
; funcs
;=========================================================
Click(x1,y1)
{
	sleep,50
	MouseClick,left,x1,y1
}

Move(x1,y1,x2,y2)
{
	global dx,dy
	
	sleep,50
	MouseClick,left,x1,y1,,0,D
	sleep,50
	
	;--- 動く量が大きいとずれるので２回に分ける
	tx := 0
	ty := 0
	if x2 > 150
	{
		tx = 150
	}
	if x2 < -150
	{
		tx = -150
	}
	if y2 > 150
	{
		ty = 150
	}
	if y2 < -150
	{
		ty = -150
	}
	if tx <> 0 and ty <> 0
	{
		MouseMove,x1+x2 - tx,y1+y2 - ty
		sleep,90
	}
	MouseMove,x1+x2,y1+y2
	sleep,90
	MouseClick,left,x1+x2,y1+y2,,0,U
}
;--- 余分な待ちなしバージョン
Move2(x1,y1,x2,y2)
{
	global dx,dy
	
	sleep,40
	MouseClick,left,x1,y1,,0,D
	sleep,40
	MouseMove,x1+x2,y1+y2
	sleep,90
	MouseClick,left,x1+x2,y1+y2,,0,U
}

movex:=0
movey:=0
MoveStart(x1,y1)
{
	global movex,movey
	movex := x1
	movey := y1
	
	sleep,50
	MouseClick,left,x1,y1,,0,D
	sleep,50
}
MoveMove(x1,y1)
{
	global movex,movey
	movex := movex + x1
	movey := movey + y1
	
	
	MouseMove,movex,movey
	sleep,90
}
MoveEnd()
{
	global movex,movey
	
	MouseClick,left,movex,movey,,0,U
}


StageSelect(x,y)
{
	global dx,dy
	
	sleep,50
	MouseClick,left,x,y	; 1-1
	sleep,320
	MouseClick,left,dx+230,dy+500	; はじめる
}
SpeedUp(time)
{
	global dx,dy
	sleep,40
	MouseClick,left,dx+230,dy+500,,,D	; 加速
	sleep,time
	MouseClick,left,dx+230,dy+500,,,U	; 加速
}
StageBack(time1)
{
	global dx,dy
	
	Sleep,time1
	MouseClick,left,dx+230,dy+460	; 戻る
	Sleep,250
}

Next()
{
	global dx,dy
	sleep,50
	MouseClick,left,dx+320,dy+380
}
;http://nezutako.rakusaba.jp/game/tekuteku/

;=========================================================
; ここから計測開始のタイミングです
;=========================================================




Click(dx+335,dy+461)	; タップで開始
Click(dx+335,dy+461)	; はじめる
Click(dx+323,dy+85)	; LEVEL1


If( 1=1 )
{

StageSelect(dx+120,dy+140)	;1-1
Move(dx+190,dy+220,0,80)	;--赤
SpeedUp(1700)
Move(dx+330,dy+310,0,-200)	;--緑
SpeedUp(2000)
StageBack(4200)



StageSelect(dx+220,dy+140)	;1-2
Move(dx+140,dy+227, 90,0)	;--赤
SpeedUp(4000)
Move(dx+228,dy+227, -60,0)	;--赤
SpeedUp(1900)
Move(dx+160,dy+227, 130, 0)	;--赤
SpeedUp(1200)
Move(dx+300,dy+227, -60, 0)	;--赤
StageBack(4400)





StageSelect(dx+320,dy+140)	;1-3
Move(dx+90,dy+80, 0 , 20)	;--赤
SpeedUp(1000)
Move(dx+253,dy+255, 0, 130)	;--緑
SpeedUp(1000)
Move(dx+253,dy+396, 0, -93)	;--緑
SpeedUp(2800)
Move(dx+253,dy+300, 0, 100)	;--緑
SpeedUp(1000)
Move(dx+253,dy+400, 0,-120)	;--緑
SpeedUp(350)
;sleep,100
Move(dx+253,dy+280, 0,120)	;--緑
SpeedUp(500)
Move(dx+253,dy+400, 0,-120)	;--緑
SpeedUp(1500)
StageBack(3900)



StageSelect(dx+120,dy+260)	;1-4
SpeedUp(200)
Move(dx+45,dy+280, 0 , -160)	;--赤
Move(dx+169,dy+280, -60 , 0)	;--緑
Move(dx+219,dy+200, 200 , 40)	;--青
Move(dx+45,dy+140, 350 , 0)	;--赤
SpeedUp(1900)
Move(dx+353,dy+158, 0 , 120)	;--青
Move(dx+275,dy+106, 80 , 0)	;--赤
SpeedUp(1000)
StageBack(3900)




StageSelect(dx+220,dy+260)	;1-5
Move(dx+141,dy+158, 0 , 60)	;--赤
SpeedUp(300)
Move(dx+141,dy+200, -60 , 60)	;--赤
SpeedUp(200)
Move(dx+100,dy+240, 80 , 0)	;--赤
SpeedUp(2600)
Move(dx+236,dy+157, 100 , 80)	;---緑
Move(dx+336,dy+237, -80 , -80)	;---緑
SpeedUp(2000)
StageBack(4400)




StageSelect(dx+320,dy+260)	;1-6
Move(dx+170,dy+270, 0 , -160)	;---赤
Move(dx+140,dy+370, 80 , -100)	;---緑
Move(dx+236,dy+348, 140 , 0)	;---青
SpeedUp(2700)
MoveStart(dx+376,dy+348)	;---青
MoveMove( 0 , 30)
MoveMove( -140 , 0 )
MoveEnd()
Move(dx+220,dy+270, -80 , 100)	;---緑
SpeedUp(1000)
MoveStart(dx+236,dy+348)	;---青
MoveMove( 70 ,-200)
MoveMove( -90 ,110)
MoveMove( -80 ,0)
MoveEnd()
SpeedUp(1000)
Move( dx+136,dy+258, -60 , -90)	;---青
Move( dx+170,dy+110, 0 , 160)	;---赤
SpeedUp(1400)
MoveStart(dx+75,dy+189)	;---青
MoveMove( 50 , -40)
sleep,100
MoveMove( 140 , -30)
MoveEnd()
SpeedUp(200)
Move( dx+210,dy+126, -140 , 0)	;---青
SpeedUp(500)
Move( dx+137,dy+126, 260 , 120)	;---青
SpeedUp(4000)
StageBack(3200)





StageSelect(dx+120,dy+380)	;1-7
Move2(dx+202,dy+233, 140 , 0)	;---緑
Move2(dx+190,dy+290, -75 , -75)	;---青
Move2(dx+190,dy+150, 0 , 180)	;---赤
MoveStart(dx+130,dy+224)	;---青
MoveMove( 60 ,0)
MoveMove( 0 ,-120)
MoveMove( 60 ,0)
MoveEnd()
SpeedUp(550)
Move(dx+180,dy+380, 0 , -130)	;---赤
Move(dx+248,dy+110, -90 , 0)	;---青
Move(dx+180,dy+150, 0 , 130)	;---赤
Move(dx+158,dy+110, 20 , 70)	;---青
SpeedUp(650)
Move(dx+178,dy+180, 130 , -70)	;---青
StageBack(4200)





StageSelect(dx+220,dy+380)	;1-8
Move(dx+240,dy+356, 0 , -150)	;---赤
SpeedUp(2300)
Move(dx+240,dy+206, 0 , 120)	;---赤
SpeedUp(2000)
Move(dx+240,dy+326, 0 , 30)	;---赤
SpeedUp(1750)
Move(dx+240,dy+356, 0 , -130)	;---赤
SpeedUp(530)	;---
Move(dx+353,dy+230, 0 , -60)	;---緑
Move(dx+240,dy+226, 0 , 90)	;---赤
SpeedUp(2150)
Move(dx+240,dy+316, 0 , -130)	;---赤
SpeedUp(400)
Move(dx+240,dy+206, 0 , 120)	;---赤
SpeedUp(5000)
StageBack(3700)



Next()



StageSelect(dx+120,dy+140)	;2-1
Click(dx+106,dy+136)
Click(dx+205,dy+195)
Click(dx+361,dy+327)
Click(dx+400,dy+165)
SpeedUp(2500)
Click(dx+105,dy+335)
SpeedUp(5000)
Click(dx+400,dy+165)
SpeedUp(5000)
StageBack(4800)



StageSelect(dx+220,dy+140)	;2-2
SpeedUp(700)
Move(dx+109,dy+189, 140 , 0)	;---赤
Click(dx+137,dy+65)
Click(dx+400,dy+129)
Click(dx+400,dy+255)
Click(dx+55,dy+322)
SpeedUp(1500)
Click(dx+400,dy+255)
MoveStart(dx+170,dy+418)	;---緑
MoveMove( 0 ,-30)
MoveMove( -60 ,0)
MoveMove( 0 ,30)
MoveEnd()
SpeedUp(2500)
Move(dx+249,dy+189, 100 , 0)	;---赤
SpeedUp(1300)
Move(dx+349,dy+189, -190 , 0)	;---赤
SpeedUp(1600)
Move(dx+90,dy+420, 240 , 0)	;---緑
StageBack(4400)




StageSelect(dx+320,dy+140)	;2-3
Move(dx+227,dy+229, 140 , 0)	;---緑
SpeedUp(300)
Move(dx+367,dy+229, -140 , 130)	;---緑
Move(dx+95,dy+333, 0 , -30)	;---赤
SpeedUp(300)
Move(dx+330,dy+336, -130 , -60)	;---青
Move(dx+213,dy+288, 0 ,-230)	;---青
MoveStart(dx+95,dy+303)	;---赤
MoveMove( 0 ,-30)
MoveMove( 150 ,0)
MoveMove( 110 ,30)
MoveEnd()
StageBack(4400)



StageSelect(dx+120,dy+260)	;2-4
Click(dx+44,dy+351)
Click(dx+235,dy+286)
Click(dx+235,dy+160)
SpeedUp(2000)
Move(dx+153,dy+306, 0 , -90)	;---赤
SpeedUp(200)
Move(dx+153,dy+206, 0 , -30)	;---赤
SpeedUp(3000)
Move(dx+320,dy+334, 0 , -130)	;---緑
Click(dx+235,dy+286)
Move(dx+153,dy+206, 0 , 120)	;---赤
SpeedUp(4000)
StageBack(4000)



StageSelect(dx+220,dy+260)	;2-5
Move(dx+144,dy+400, 0 , -30)	;---青
Move(dx+240,dy+410, 30 , -60)	;---茶
Move(dx+330,dy+250, 0 , -30)	;---緑
Move(dx+150,dy+250, 0 , -90)	;---赤
SpeedUp(10000)
Move(dx+150,dy+160, 0 , -30)	;---赤
SpeedUp(5000)
StageBack(3700)




StageSelect(dx+320,dy+260)	;2-6
Click(dx+45,dy+126)
MoveStart(dx+215,dy+300)	;---赤
MoveMove( 0 ,-70)
MoveMove( -210 ,00)
MoveEnd()
SpeedUp(450)
Move(dx+58,dy+200, 30 , 0)	;---赤
SpeedUp(200)
Move(dx+58,dy+200, 190 , 0)	;---赤
SpeedUp(1300)
Move(dx+248,dy+200, -30 , 0)	;---赤
SpeedUp(100)
Move(dx+248,dy+200, 30 , 0)	;---赤
SpeedUp(200)
Move(dx+248,dy+200, -100 , 0)	;---赤
SpeedUp(1200)
Move(dx+218,dy+200, 160 , 0)	;---赤
StageBack(4300)




StageSelect(dx+120,dy+380)	;2-7
Move(dx+250,dy+200, 60 , 30)	;---緑
Move(dx+160,dy+200, 0 , -30)	;---赤
Move(dx+380,dy+300, 0 , 60)	;---茶
SpeedUp(1000)
Move(dx+380,dy+360, 0 , -30)	;---茶
SpeedUp(670)
MoveStart(dx+310,dy+230)	;---緑
MoveMove( -150 ,0)
MoveMove( 0 ,-30)
MoveEnd()
SpeedUp(3500)
StageBack(4500)



StageSelect(dx+220,dy+380)	;2-8
Move(dx+380,dy+331, 0 , -100)	;---青
Move(dx+129,dy+382,200  , 0)	;---茶
Move(dx+66,dy+138,0  , 90)	;---赤
Click(dx+305,dy+66)
MoveStart(dx+170,dy+130)	;---緑
MoveMove( -90 ,0)
MoveMove( 0 ,-30)
MoveMove( -30 ,0)
MoveEnd()
SpeedUp(300)
MoveStart(dx+45,dy+90)	;---緑
MoveMove( 0 ,30)
MoveMove( 140 ,0)
MoveMove( 150 ,0)
MoveEnd()
SpeedUp(800)
Move(dx+300,dy+138, 0  , -30)	;---緑
Move(dx+57,dy+278,0  , -60)	;---赤
Move(dx+329,dy+382,-200  , 0)	;---茶
Move(dx+380,dy+231, 0 , 100)	;---青
SpeedUp(100) ;!!!
Move(dx+300,dy+97, 30  , -30)	;---緑
SpeedUp(300)
MoveStart(dx+330,dy+67)	;---緑
MoveMove( -30 ,0)
MoveMove( 0 ,140)
MoveMove( 30 ,0)
MoveMove( 0 ,30)
MoveMove( -60 ,0)
MoveMove( -60 ,-120)
MoveEnd()
Move(dx+380,dy+331, 0 , -100)	;---青
SpeedUp(500)
Move(dx+380,dy+231, 0 , 100)	;---青
SpeedUp(800)
Move(dx+380,dy+331, 0 , -100)	;---青
Move(dx+129,dy+382,150  , 0)	;---茶
Move(dx+279,dy+382,-150  , 0)	;---茶
Move(dx+380,dy+231, 0 , 100)	;---青
SpeedUp(400)
Move(dx+380,dy+331, 0 , -100)	;---青
SpeedUp(700)
Move(dx+380,dy+231, 0 , 100)	;---青
SpeedUp(450)
Move(dx+380,dy+331, 0 , -100)	;---青
Move(dx+209,dy+130, 100  , 0)	;---緑
SpeedUp(650)
Move(dx+305,dy+115, 60  , -60)	;---緑
StageBack(4200)





Next()



StageSelect(dx+120,dy+140)	;3-1
Move(dx+157,dy+114, -180  , 0)	;---赤
SpeedUp(3200)
Click(dx+200,dy+300)
SpeedUp(2800)
Click(dx+200,dy+300)
SpeedUp(5000)
StageBack(4600)



StageSelect(dx+220,dy+140)	;3-2
Move(dx+220,dy+417, 160  , 0)	;---赤
Move(dx+380,dy+417, -300  , 0)	;---赤
SpeedUp(100)
Move(dx+100,dy+417, 300  , 0)	;---赤
Move(dx+267,dy+219, -190  , 0)	;---緑
SpeedUp(3600)
Move(dx+70,dy+219, 300  , 0)	;---緑
SpeedUp(200)
Move(dx+375,dy+219, -300  , 0)	;---緑
SpeedUp(800)
Move(dx+82,dy+231, 60  , 0)	;---緑
SpeedUp(8000)
StageBack(3400)



StageSelect(dx+320,dy+140)	;3-3
Move(dx+412,dy+128,-270,0)	;---赤
Move(dx+417,dy+260,-190,0)	;---緑
Move(dx+417,dy+317,-140,0)	;---青
Move(dx+412,dy+128,-210,0)	;---赤
Move(dx+417,dy+317,-30,0)	;---青
SpeedUp(150)
Move(dx+417,dy+260,-250,0)	;---緑
Move(dx+417,dy+317,-220,0)	;---青
SpeedUp(250)
Move(dx+417,dy+317,-60,0)	;---青
SpeedUp(500)
StageBack(4200)



StageSelect(dx+120,dy+260)	;3-4
Move(dx+368,dy+178,0,-30)	;---青
Move(dx+237,dy+270,-128,90)	;---赤
Move(dx+117,dy+366,200,-130)	;---赤
SpeedUp(1000)
Move(dx+309,dy+241,-30,-30)	;---赤
Move(dx+261,dy+361,0,-60)	;---緑
SpeedUp(3900)
Move(dx+261,dy+301,0,-30)	;---緑
SpeedUp(1000)
Move(dx+261,dy+271,0,30)	;---緑
Move(dx+368,dy+148,0,30)	;---青
Move(dx+276,dy+208,-60,30)	;---赤
SpeedUp(700)
Move(dx+208,dy+237,90,0)	;---赤
SpeedUp(2700)
StageBack(4700)




StageSelect(dx+220,dy+260)	;3-5
Move(dx+357,dy+300,-30,00)	;---赤
Click(dx+105,dy+53)
Click(dx+272,dy+163)
SpeedUp(5500)
Click(dx+106,dy+227)
SpeedUp(2000)
StageBack(3900)



StageSelect(dx+320,dy+260)	;3-6
Move(dx+173,dy+400,30,-60)	;---緑
SpeedUp(1500)
Move(dx+203,dy+340,-30,60)	;---緑
SpeedUp(1600)
Move(dx+173,dy+400,0,-60)	;---緑
SpeedUp(3900)
MoveStart(dx+92,dy+110)	;---赤
MoveMove( 100 ,-30)
MoveMove( 150 ,0)
MoveMove( -120 ,0)
MoveMove( 0 ,150)
MoveEnd()
SpeedUp(2100)
MoveStart(dx+226,dy+241)	;---赤
MoveMove( 120 ,0)
MoveMove( -120 ,0)
MoveMove( 0 ,-150)
MoveMove( 150 ,0)
MoveEnd()
SpeedUp(4000)
MoveStart(dx+388,dy+79)	;---赤
MoveMove( -150 ,0)
MoveMove( 0 ,150)
MoveMove( 150 ,0)
MoveEnd()
SpeedUp(3300)
StageBack(4700)



StageSelect(dx+120,dy+380)	;3-7
MoveStart(dx+379,dy+361)	;---緑
MoveMove( -280 ,0)
MoveMove( 0 ,-120)
MoveEnd()
Move(dx+400,dy+82 , 0, 100)	;---赤
SpeedUp(2750)
Move(dx+96,dy+220 , 190, -80)	;---緑
Move(dx+400,dy+182 , 0, -30)	;---赤
Move(dx+286,dy+140 , -100, 0)	;---緑
SpeedUp(500)
MoveStart(dx+400,dy+150)	;---赤
MoveMove( 0 ,30)
MoveMove( -130 ,0)
MoveEnd()
SpeedUp(2000)
StageBack(3700)



StageSelect(dx+220,dy+380)	;3-8
Click(dx+176,dy+64)
Move(dx+366,dy+158 , -160, 0)	;---赤
SpeedUp(500)
Move(dx+206,dy+158 , 150, 0)	;---赤
Click(dx+176,dy+64)
SpeedUp(1200)
Click(dx+176,dy+64)
Click(dx+179,dy+321)
Click(dx+238,dy+318)
SpeedUp(1000)
Move(dx+326,dy+158 , -250, 0)	;---赤
SpeedUp(1000)
MoveStart(dx+111,dy+159)	;---赤
MoveMove( 30 ,0)
MoveMove( 180 ,0)
MoveMove( -130 ,0)
MoveMove( 0 ,130)
MoveMove( 0 ,100)
MoveEnd()
Click(dx+179,dy+321)
SpeedUp(1400)
Move(dx+190,dy+390 , 90, 0)	;---赤
SpeedUp(300)
Move(dx+250,dy+390 , 0, -30)	;---赤
SpeedUp(700)
MoveStart(dx+280,dy+360)	;---赤
MoveMove( 30 ,0)
MoveMove( 0 ,30)
MoveMove( -90 ,0)
sleep,100
MoveMove( -90 ,0)
MoveEnd()
StageBack(4500)


Next()



StageSelect(dx+120,dy+140)	;4-1
Click(dx+306,dy+190)
Click(dx+226,dy+252)
Click(dx+37,dy+252)
Click(dx+118,dy+378)
SpeedUp(5000)
Click(dx+306,dy+190)
SpeedUp(500)
sleep,100
Click(dx+226,dy+252)
SpeedUp(4000)
StageBack(4300)



StageSelect(dx+220,dy+140)	;4-2
Click(dx+364,dy+225)
Move(dx+409,dy+405 , 0, -100)	;---緑
SpeedUp(2170)
Click(dx+364,dy+225)
Move(dx+409,dy+305 , 0, -130)	;---緑
SpeedUp(2000)
StageBack(3900)




StageSelect(dx+320,dy+140)	;4-3
Click(dx+50,dy+385)
SpeedUp(1950)
Move2(dx+119,dy+361 , 0, -190)	;---赤
SpeedUp(1000)
Move(dx+371,dy+240 , 0, -30)	;---緑
MoveStart(dx+119,dy+161)	;---赤
MoveMove( 0 ,200)
MoveMove( 60 ,0)
MoveEnd()
SpeedUp(4500) ;---
Move(dx+179,dy+361 , 30, 0)	;---赤
SpeedUp(2000)
Move(dx+371,dy+240 , 0, 30)	;---緑
SpeedUp(4000)
StageBack(4300)



StageSelect(dx+120,dy+260)	;4-4
Click(dx+113,dy+73)
Move(dx+212,dy+249 , -60, 0)	;---赤
SpeedUp(1000)
Move(dx+152,dy+249 , 60, 0)	;---赤
Move(dx+29,dy+236 , 0, -30)	;---緑
SpeedUp(2000)
Move(dx+212,dy+249 , 0, -30)	;---赤
SpeedUp(900)
Move(dx+212,dy+219 , 0, -30)	;---赤
SpeedUp(1800)
Move(dx+29,dy+236 , 0, -30)	;---緑
SpeedUp(6000)
StageBack(4300)




StageSelect(dx+220,dy+260)	;4-5
Click(dx+75,dy+388)
Click(dx+57,dy+255)
Click(dx+108,dy+156)
Click(dx+178,dy+156)
Click(dx+243,dy+156)
Move(dx+315,dy+177 , 0, 90)	;---赤
SpeedUp(600)
Click(dx+75,dy+388)
SpeedUp(3600)
MoveStart(dx+313,dy+271)	;---赤
MoveMove( 0 ,-100)
MoveMove( -100 ,0)
MoveMove( -100 ,0)
MoveEnd()
SpeedUp(1000)
Move(dx+127,dy+169 , 30, 30)	;---赤
SpeedUp(2000)
Move(dx+157,dy+199 , 60, 0)	;---赤
SpeedUp(2400)
StageBack(4400)




StageSelect(dx+320,dy+260)	;4-6
Click(dx+300,dy+100)
Move(dx+400,dy+381 , 0, -250)	;---赤
Click(dx+200,dy+100)
SpeedUp(1500)
Move(dx+400,dy+131 , 0, 150)	;---赤
SpeedUp(2500)
Move(dx+400,dy+281 , 0, 130)	;---赤
SpeedUp(3600)
Move(dx+400,dy+401 , 0, -30)	;---赤
SpeedUp(3000)
StageBack(4200)



StageSelect(dx+120,dy+380)	;4-7
Click(dx+109,dy+162)
Click(dx+109,dy+225)
Move(dx+270,dy+223 , -200, 60)	;---赤
SpeedUp(1700)
MoveStart(dx+80,dy+290)	;---赤
MoveMove( 180 ,0)
MoveMove( 100 ,0)
MoveEnd()
Move(dx+360,dy+290 , -200, 0)	;---赤
SpeedUp(3200)
StageBack(4000)




StageSelect(dx+220,dy+380)	;4-8
Click(dx+80,dy+192)
Click(dx+328,dy+189)
SpeedUp(700)
Move(dx+51,dy+310 , 90, 0)	;---赤
SpeedUp(2500)
Move(dx+147,dy+310 ,180, 0)	;---赤
SpeedUp(900)
Move(dx+327,dy+310 ,-180, 0)	;---赤
SpeedUp(2200)
StageBack(3700)



Next()


StageSelect(dx+120,dy+140)	;5-1
SpeedUp(2000)
Click(dx+316,dy+351)
Move(dx+360,dy+225 ,-30, -30)	;---赤
SpeedUp(3050)
Move(dx+330,dy+195 ,-30, 0)	;---赤
SpeedUp(250)
Move(dx+300,dy+195 ,30, 0)	;---赤
SpeedUp(1100)
Move(dx+330,dy+195 ,-60, 30)	;---赤
SpeedUp(800)
Move(dx+255,dy+225 ,60, -30)	;---赤
SpeedUp(3500)
StageBack(4500)



StageSelect(dx+220,dy+140)	;5-2
Click(dx+164,dy+191)
Move(dx+362,dy+350 ,0, -30)	;---赤
SpeedUp(6300)
MoveStart(dx+362,dy+320)	;---赤
MoveMove( 0 ,-60)
MoveMove( -90 ,0)
MoveMove( 60 ,0)
MoveEnd()
SpeedUp(800)
MoveStart(dx+362,dy+248)	;---赤
MoveMove( 30 ,0)
MoveMove( 0 , 90)
MoveMove( 0 , -120)
MoveEnd()
SpeedUp(7200)
Move(dx+362,dy+225 , 0, 120)	;---赤
SpeedUp(3100)
StageBack(3900)




StageSelect(dx+320,dy+140)	;5-3
SpeedUp(500)
Click(dx+184,dy+131)
Click(dx+338,dy+131)
SpeedUp(500)
MoveStart(dx+117,dy+230)	;---赤
MoveMove( 0 , 60)
MoveMove( -60 , 0)
MoveEnd()
Click(dx+47,dy+120)	;--- 左ブロック
Click(dx+279,dy+191)
Click(dx+396,dy+188)
sleep,50
MoveStart(dx+57,dy+290)	;---赤
MoveMove( 90 , 0)
MoveMove( -30 , 0)
MoveMove( 0 , -60)
MoveEnd()
SpeedUp(600)
MoveStart(dx+104,dy+219)	;---赤
MoveMove( 0 , 60)
MoveMove( 60 , 0)
sleep,300
MoveMove( -90 , 0)
MoveEnd()
SpeedUp(1000)
Click(dx+338,dy+131)
SpeedUp(500)
Click(dx+338,dy+131)
SpeedUp(3000)
StageBack(3900)




StageSelect(dx+120,dy+260)	;5-4
Click(dx+112,dy+69)
Click(dx+136,dy+125)
Click(dx+265,dy+65)
Click(dx+331,dy+65)
Click(dx+42,dy+225)
Click(dx+278,dy+321)
Click(dx+148,dy+416)
SpeedUp(4000)
Click(dx+265,dy+65)
SpeedUp(1150)
sleep,130
Click(dx+300,dy+128)
SpeedUp(4000)
Click(dx+42,dy+225)
Click(dx+278,dy+321)
Click(dx+148,dy+416)
SpeedUp(6000)
StageBack(3900)





StageSelect(dx+220,dy+260)	;5-5
SpeedUp(2100)
Click(dx+281,dy+150)
SpeedUp(2000)
Click(dx+204,dy+150)
SpeedUp(3450) ;--- チーズ
sleep,350
Click(dx+367,dy+150)
SpeedUp(5200)
StageBack(3800)




StageSelect(dx+320,dy+260)	;5-6
Move(dx+154,dy+222 , 0, -90)	;---赤
Click(dx+400,dy+64)
Click(dx+400,dy+222)
SpeedUp(250)
Move(dx+154,dy+132 , 0, 120)	;---赤
SpeedUp(600)
MoveStart(dx+154,dy+252)	;---赤
MoveMove( 100 , 0)
MoveMove(  80 , 0)
MoveMove(  0 , 30)
MoveEnd()
SpeedUp(1200)
MoveStart(dx+353,dy+282)	;---赤
MoveMove( -100 , 0)
MoveMove( -80 , 0)
MoveMove( 0 , -130)
MoveEnd()
SpeedUp(700)
Move(dx+187,dy+157 , -60, -30)	;---赤
Click(dx+330,dy+386)
Move(dx+387,dy+390 , 0, -180)	;---緑
SpeedUp(4000)
StageBack(4500)



StageSelect(dx+120,dy+380)	;5-7
SpeedUp(1500)
Click(dx+118,dy+123)	;--左上
Click(dx+371,dy+300)	;--右
Click(dx+140,dy+284)	;--左
SpeedUp(6000)
Click(dx+371,dy+300)	;--右
SpeedUp(4000)
Click(dx+371,dy+300)	;--右
Click(dx+300,dy+354)	;--右下
SpeedUp(4000)
Click(dx+371,dy+300)	;--右
Click(dx+140,dy+284)	;--左
SpeedUp(7000)
StageBack(4400)




StageSelect(dx+220,dy+380)	;5-8
SpeedUp(170)
Click(dx+336,dy+270)
MoveStart(dx+266,dy+274)	;---赤
MoveMove( 30 , -60)
MoveMove( -150 , 0)
MoveMove( 0 , -60)
MoveMove( 0 , 60)
MoveMove( 120 , 0)
MoveMove( 0 , -30)
MoveEnd()
SpeedUp(1000)
MoveStart(dx+264,dy+178)	;---赤
MoveMove( 0 , 30)
MoveMove( -120 , 0)
MoveMove( 0 , 150)
MoveMove( 0 , 150)
MoveEnd()
SpeedUp(1800)
MoveStart(dx+161,dy+361)	;---赤
MoveMove( 0 , -150)
MoveMove( 0 , -150)
MoveMove( 150 , 0)
MoveEnd()
MoveStart(dx+272,dy+379)	;---緑
MoveMove( -150 , 0)
MoveMove( 0 , -150)
MoveMove( 0 , -40)
MoveEnd()
SpeedUp(3200)
Move(dx+128,dy+188 , 0, -30)	;---緑
SpeedUp(400)
MoveStart(dx+120,dy+150)	;---緑
MoveMove( 0 , 60)
MoveMove( 150 , 0)
MoveMove( 0 , 60)
MoveEnd()
SpeedUp(710)
MoveStart(dx+300,dy+285)	;---緑
MoveMove( 0 , -30)
MoveMove( 30 , 0)
MoveEnd()
SpeedUp(500)
StageBack(4500)






StageSelect(dx+320,dy+380)	;FINAL
Move(dx+220,dy+420 , -60, 0)	;---赤
SpeedUp(330)
MoveStart(dx+160,dy+420)	;---赤
MoveMove( 0 , -30)
MoveMove( -30 , 0)
MoveEnd()
SpeedUp(550)
MoveStart(dx+135,dy+400)	;---赤
MoveMove( 0 , 30)
MoveMove( 90 , 0)
MoveEnd()
Click(dx+366,dy+227)
Click(dx+77,dy+200)
SpeedUp(3600)
Click(dx+400,dy+57)	;---右上
SpeedUp(1800)
sleep,200
Click(dx+366,dy+227)
Click(dx+366,dy+157)
SpeedUp(100)
Click(dx+366,dy+157)
SpeedUp(1000)
Move(dx+220,dy+420 , -90, -30)	;---赤
SpeedUp(4200) ;3800
MoveStart(dx+130,dy+390)	;---赤
MoveMove( 120 , 0)
MoveMove( 30 , -60)
MoveEnd()
SpeedUp(3000)


}


