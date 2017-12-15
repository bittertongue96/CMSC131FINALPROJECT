.MODEL SMALL
.STACK
.DATA
scoremsg db "Score: ",0
scorecount db 1
COL		DB	?
ROW		DB 	?
BORDER	DB 0C9H, 78 DUP(0CDH), 0BBH
		DB 	0BAH, 10, 13
		DB 	0BAH, 10, 13
		DB 	0BAH, 5 DUP(' '),"   ____      _      __  __  U _____ u  ",10, 13
		DB 	0BAH, 5 DUP(' '),"U / ___|uU  / \  uU|' \/ '|u\| ___ |/  ",10, 13
		DB 	0BAH, 5 DUP(' '),"\| |  _ / \/ _ \/ \| |\/| |/ |  _|     ",10, 13
		DB 	0BAH, 5 DUP(' ')," | |_| |  / ___ \  | |  | |  | |___    ",10, 13
		DB 	0BAH, 5 DUP(' '),"  \____| /_/   \_\ |_|  |_|  |_____|   ",10, 13
		DB 	0BAH, 5 DUP(' '),"  _)(|_   \\    >><<,-,,-.   <<   >>   ",10, 13
		DB 	0BAH, 5 DUP(' ')," (__)__) (__)  (__)(./  \.) (__) (__)  ",10, 13
		DB 	0BAH, 10, 13
		DB 	0BAH, 28 DUP(' '),"   U  ___ u__     __ U _____ u   ____",10, 13
		DB 	0BAH, 28 DUP(' '),"    \/ _ \/\ \   / /u\| ___ |/U |  _ \ u",10, 13
		DB  0BAH, 28 DUP(' '),'    | | | | \ \ / //  |  _|"   \| |_) |/',10, 13
		DB 	0BAH, 28 DUP(' '),".-,_| |_| | /\ V /_,-.| |___    |  _ <",10, 13
		Db  0BAH, 28 DUP(' ')," \_)-\___/ U  \_/-(_/ |_____|   |_| \_\",10, 13
		DB 	0BAH, 28 DUP(' '),"      \\     //       <<   >>   //   \\_",10, 13
		DB 	0BAH, 28 DUP(' '),"     (__)   (__)     (__) (__) (__)  (__)",10, 13
		DB  0BAH, 10, 13
		DB 	0BAH, 10, 13
		DB  0BAH, 12 DUP(' '),'CURRENT SCORE: 115                 HIGH SCORE: 350',10, 13
		DB 	0BAH, 10, 13
		DB  0BAH, 10, 13
		DB 	0C8H, 78 DUP(0CDH), 0BCH
	DELIMETER DB '$'

.CODE
AMAIN PROC FAR
	MOV AX, @data
	MOV DS, AX

	CALL CLEAR_SCREEN 
	MOV		DL, 0
	MOV		DH, 0
	CALL SET_CURSOR
	MOV AH, 09
	LEA DX, BORDER
	INT 21H

	
			MOV		COL, 79
			MOV 	ROW, 1
		ITERATE:
			;set cursor
			MOV		DL, COL
			MOV		DH, ROW
			CALL	SET_CURSOR

			;display char from register
			MOV		AL, 0BAH
			MOV		AH, 02H
			MOV		DL, AL
			INT		21H

			;CALL	DELAY

			INC		ROW
			CMP		ROW, 23
			JE		EXIT
			JMP ITERATE

			MOV AH, 09
			LEA DX, DELIMETER
			INT 21H


	EXIT:
	MOV AX, 4C00H
	INT 21H

AMAIN ENDP
	;-------------------------------------------
CLEAR_SCREEN PROC NEAR ;CLEAR SCREEN FUNCTION
 
            MOV AX, 0600H   ;full screen
            MOV BH, 0FH     ;white background (7), blue foreground (1)
            MOV CX, 0000H   ;upper left row:column (0:0)
            MOV DX, 184FH   ;lower right row:column (24:79)
            INT 10H
 
            MOV AX, 0600H   ;full screen
            MOV BH, 4FH;0CFH     ;RED(4), BRIGHT WHITE(F)
            MOV CX, 0102H   ;upper left row:column (1:1)  
            MOV DX, 164DH   ;lower right row:column (23:78)
            INT 10H
               
            RET
CLEAR_SCREEN ENDP 
 
;------------------------------------------------------
SET_CURSOR PROC	NEAR
			MOV		AH, 02H
			MOV		BH, 00
			INT		10H
			RET
SET_CURSOR ENDP
;-------------------------------------------

END AMAIN