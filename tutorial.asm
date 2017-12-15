TITLE TUTOR (SIMPLIFIED .EXE )
.MODEL SMALL
.386P
.DATA 

TUTORIAL_COL DB	?
TUTORIAL_ROW DB 	?
TUTORIAL_BORDER	DB 10, 13
		DB 	1 DUP(' '),0C9H, 76 DUP(0CDH), 0BBH, 9,13
		DB 	0BAH, 9, 13
		DB 	' ',0BAH, 10, 13 
		DB 	' ',0BAH, 7 DUP(' '),"  _____   _   _   _____    ___   ___    ____     _     _",10, 13
		DB 	' ',0BAH, 7 DUP(' ')," |_   _| | | | | |_   _|  / _ \  | _ \ |_  _|   /_\   | |" ,10, 13
		DB 	' ',0BAH, 7 DUP(' '),"   | |   | |_| |   | |   | (_) | |   /  _| |_  / _ \  | |__",10, 13
		DB 	' ',0BAH, 7 DUP(' '),"   |_|    \___/    |_|    \___/  |_|_\ |____| /_/ \_\ |____|",10, 13
		DB  ' ',0BAH, 10, 13
		DB  ' ',0BAH, 10 DUP(' '),'WELCOME ! IN THIS PAGE, YOU WILL BE BRIEFED ',10, 13 
		DB  ' ',0BAH, 10 DUP(' '),'ON THE CHALLENGES THAT LAY AHEAD!',10, 13 
		DB 	' ',0BAH, 10, 13
		DB 	' ',0BAH, 10 DUP(' '),'THIS IS THE PLAYER(YOU) : ',02H,'    AND THIS IS THE ENEMY : ',04H,10, 13
		DB  ' ',0BAH, 10, 13
		DB 	' ',0BAH, 10 DUP(' '),'CONTROLS:',10, 13 
	    DB 	' ',0BAH, 10 DUP(' '),'TO MOVE AROUND, JUST USE ARROW KEYS',10, 13 
		DB 	' ',0BAH, 10 DUP(' '),"OBJECTIVE:",10, 13 
		DB 	' ',0BAH, 10 DUP(' '),"PUT DOWN AS MANY BLOCKS AS YOU CAN WHILE AVOIDING THE ENEMY.",10, 13 
		DB 	' ',0BAH, 10 DUP(' '),"TOUCH THE EDGES OF THE BORDER IF YOU WANT TO 'PAUSE' THE GAME. ",10, 13 
		DB 	' ',0BAH, 10 DUP(' '),'PS: THE ENEMY EATS BLOCKS ',10, 13
		DB  ' ',0BAH, 10 DUP(' '),'SELECT FROM MENU BELOW BY PRESSING A NUMBER KEY [4 OR 5]',10, 13
		DB 	' ',0BAH, 10, 13
		DB 	' ',0BAH, 10 DUP(' '),'[4] BACK TO HOME                      [5] PLAY GAME ',10, 13
		DB 	' ',0BAH, 10, 13 
		DB 	1 DUP(' '),0C8H, 76 DUP(0CDH), 0BCH
	TUTORIAL_DELIMETER DB '$'
.CODE

TUTORIAL PROC FAR
    MOV AX, @data
	MOV DS, AX
	
	CALL CLEAR_SCREEN 
	MOV	DL,0H
	MOV	DH,0H
	CALL SET_CURSOR	

	LEA DX, TUTORIAL_BORDER
	MOV AH, 09H
	INT 21H

	MOV	TUTORIAL_COL, 78
	MOV TUTORIAL_ROW, 2

TUTORIAL_ITERATE:
	;set cursor
	MOV	DL, TUTORIAL_COL
	MOV	DH, TUTORIAL_ROW
	CALL SET_CURSOR

	;display char from register
	MOV	AL, 0BAH
	MOV	AH, 02H
	MOV	DL, AL
	INT	21H

	;CALL DELAY

	INC	TUTORIAL_ROW
	CMP	TUTORIAL_ROW, 23
	JE	EXIT
	JMP TUTORIAL_ITERATE

	MOV AH, 09
	LEA DX, TUTORIAL_DELIMETER
	INT 21H
 
			 
	EXIT:
	MOV AX, 4C00H
	INT 21H

 
TUTORIAL ENDP
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

END TUTORIAL