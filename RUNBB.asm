TITLE FINAL (SIMPLIFIED .EXE )
.MODEL SMALL
.386P

;*******************************************************************************************************
.DATA 

ENEMY_PARTY_COL DB ?,0ah, 0dh,"$" ;enemy col
ENEMY_PARTY_ROW DB ?,0ah, 0dh,"$" ;enemy row
ENEMY_MAX DB ?, 0ah,0dh,"$" ; to determine direction of the bounce
;*******************************************************************************************************
SCOREMSG DB "Score: $",0 ;display score
SCOREMSG1 DB " Current Score: $",0
SCORECOUNT Dw 1  ; stores over all score
HIGHSCOREMSG DB "High Score: $",0
HIGHSCOREMSG1 DB "Previous High Score: $",0
;HIGHSCORECOUNT DW 1; STORES THE HIGH SCORE
NEWHIGH DB 'CONGRATS! NEW HIGH SCORE!$'
SAME DB 'YOU CAN DO BETTER NEXT TIME :)$'
HALA DB 'OH NO!$'
;*******************************************************************************************************
PLAYER_INPUT DB  ?,0ah, 0dh,"$" ; keyboard input for movement/state of game
PLAYER_PARTY_COL DB ?,0ah, 0dh,"$" ; player col
PLAYER_PARTY_ROW DB ?,0ah, 0dh,"$" ; player row
PLAYER_MAX DB ?,0ah, 0dh,"$" ;distinguish col: left and right
PLAYER_MAX2 DB ?,0ah, 0dh,"$" ; distinguish row: UP or down
PLAYER_DIS DB ?,0ah, 0dh,"$" ;distinguish between row and col
;*******************************************************************************************************
;DATA FOR FILE READ/write
PATHFILENAME1  DB 'record.txt', 00H
  FILEHANDLE1    DW ?
PATHFILENAME  DB 'record.txt', 00H
FILEHANDLE    DW ?
RECORD_STR    DB 5 DUP('$')  ;length = original length of record + 1 (for $)
RECORD_STR1   DB 4 DUP('$')
  ;ERROR1_STR    DB 'Error in opening file.$'
  ;ERROR2_STR    DB 'Error reading from file.$'
  ;ERROR3_STR    DB 'No record read from file.$'
;*******************************************************************************************************

BORDER_COL_OPENING	DB	?
BORDER_ROW_OPENING	DB 	?
BORDER_OPENING	DB 10, 13
	 
		DB 	1 DUP(' '),0C9H, 76 DUP(0CDH), 0BBH, 9,13
		DB 	' ',0BAH, 10, 13
		DB 	' ',0BAH, 10, 13
		DB 	' ',0BAH, 9 DUP(' '),"  _  .-')                   .-') _       .-. .-') .-. .-')",10, 13
		DB 	' ',0BAH, 9 DUP(' '),"( \( -O )                 ( OO ) )      \  ( OO )\  ( OO )",10, 13
		DB 	' ',0BAH, 9 DUP(' ')," ,------. ,--. ,--.   ,--./ ,--,'        ;-----.\ ;-----.\",10, 13
		DB 	' ',0BAH, 9 DUP(' ')," |   /`. '|  | |  |   |   \ |  |\        | .-.  | | .-.  |",10, 13
		DB 	' ',0BAH, 9 DUP(' ')," |  /  | ||  | | .-') |    \|  | )       | '-' /_)| '-' /_)",10, 13
		DB 	' ',0BAH, 9 DUP(' ')," |  |_.' ||  |_|( OO )|  .     |/        | .-. `. | .-. `.",10, 13
		DB 	' ',0BAH, 9 DUP(' ')," |  .  '.'|  | | `-' /|  |\    |         | |  \  || |  \  |",10, 13
		DB  ' ',0BAH, 9 DUP(' ')," |  |\  \('  '-'(_.-' |  | \   |         | '--'  /| '--'  /",10, 13
		DB 	' ',0BAH, 9 DUP(' ')," `--' '--' `-----'    `--'  `--'         `------' `------'",10, 13
		DB  ' ',0BAH, 10, 13
		DB 	' ',0BAH, 10, 13
		DB 	' ',0BAH, 10, 13
		DB  ' ',0BAH, 12 DUP(' '),'SELECT FROM MENU BELOW BY PRESSING A NUMBER KEY [1-3]',10, 13
		DB 	' ',0BAH, 10, 13
		DB 	' ',0BAH, 31 DUP(' '),'[1] HOW TO PLAY',10, 13
		Db  ' ',0BAH, 31 DUP(' '),'[2] PLAY GAME',10, 13
		DB 	' ',0BAH, 31 DUP(' '),'[3] EXIT',10, 13
		DB 	' ',0BAH, 10, 13
		DB 	' ',0BAH, 10, 13 
		DB 	1 DUP(' '),0C8H, 76 DUP(0CDH), 0BCH
	DELIMETER_OPENING DB '$'

;*******************************************************************************************************

BORDER_COL		DB	?
BORDER_ROW		DB 	?
BORDER	DB 0C9H, 60 DUP(0CDH), 0BBH, 10,13
		DB 	9 DUP(' '),0BAH, 10, 13
		DB 	9 DUP(' '),0BAH, 10, 13
		DB 	9 DUP(' '),0BAH, 10, 13
		DB 	9 DUP(' '),0BAH, 10, 13
		DB 	9 DUP(' '),0BAH, 10, 13
		DB 	9 DUP(' '),0BAH, 10, 13
		DB 	9 DUP(' '),0BAH, 10, 13
		DB 	9 DUP(' '),0BAH, 10, 13
		DB 	9 DUP(' '),0BAH, 10, 13
		DB 	9 DUP(' '),0BAH, 10, 13
		DB 	9 DUP(' '),0BAH, 10, 13
		DB 	9 DUP(' '),0BAH, 10, 13
		DB 	9 DUP(' '),0BAH, 10, 13
		DB 	9 DUP(' '),0BAH, 10, 13
		DB 	9 DUP(' '),0BAH, 10, 13
		DB 	9 DUP(' '),0BAH, 10, 13
		DB 	9 DUP(' '),0BAH, 10, 13
		DB 	9 DUP(' '),0C8H, 60 DUP(0CDH), 0BCH
	DELIMETER DB '$' 
	
;*******************************************************************************************************
BORDER_COL_FIN		DB	?
BORDER_ROW_FIN		DB 	?
BORDER_FIN	DB 10, 13
		DB 	1 DUP(' '),0C9H, 76 DUP(0CDH), 0BBH, 9,13
		DB 	' ',0BAH, 10, 13
		DB 	' ',0BAH, 5 DUP(' '),"   ____      _      __  __  U _____ u  ",10, 13
		DB 	' ',0BAH, 5 DUP(' '),"U / ___|uU  / \  uU|' \/ '|u\| ___ |/  ",10, 13
		DB 	' ',0BAH, 5 DUP(' '),"\| |  _ / \/ _ \/ \| |\/| |/ |  _|     ",10, 13
		DB 	' ',0BAH, 5 DUP(' ')," | |_| |  / ___ \  | |  | |  | |___    ",10, 13
		DB 	' ',0BAH, 5 DUP(' '),"  \____| /_/   \_\ |_|  |_|  |_____|   ",10, 13
		DB 	' ',0BAH, 5 DUP(' '),"  _)(|_   \\    >><<,-,,-.   <<   >>   ",10, 13
		DB 	' ',0BAH, 5 DUP(' ')," (__)__) (__)  (__)(./  \.) (__) (__)  ",10, 13
		DB 	' ',0BAH, 10, 13
		DB 	' ',0BAH, 28 DUP(' '),"   U  ___ u__     __ U _____ u   ____",10, 13
		DB 	' ',0BAH, 28 DUP(' '),"    \/ _ \/\ \   / /u\| ___ |/U |  _ \ u",10, 13
		DB  ' ',0BAH, 28 DUP(' '),'    | | | | \ \ / //  |  _|"   \| |_) |/',10, 13
		DB 	' ',0BAH, 28 DUP(' '),".-,_| |_| | /\ V /_,-.| |___    |  _ <",10, 13
		Db  ' ',0BAH, 28 DUP(' ')," \_)-\___/ U  \_/-(_/ |_____|   |_| \_\",10, 13
		DB 	' ',0BAH, 28 DUP(' '),"      \\     //       <<   >>   //   \\_",10, 13
		DB 	' ',0BAH, 28 DUP(' '),"     (__)   (__)     (__) (__) (__)  (__)",10, 13
		DB  ' ',0BAH, 10, 13 
		DB  ' ',0BAH, 12 DUP(' '),'SELECT FROM MENU BELOW BY PRESSING A NUMBER KEY [6-9]',10, 13
		DB 	' ',0BAH, 12 DUP(' '),'[6] HOW TO PLAY           [7] TRY AGAIN',10, 13
		DB 	' ',0BAH, 12 DUP(' '),'[8] RETURN TO HOME        [9] EXIT',10, 13
		DB 	' ',0BAH, 10, 13 
		DB 	1 DUP(' '),0C8H, 76 DUP(0CDH), 0BCH
	DELIMETER_FIN DB '$'	
;*******************************************************************************************************
 

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
;*******************************************************************************************************
.CODE

MAIN PROC FAR
  MOV AX, @data
  MOV DS, AX
 
 ;clear the screen
  HOME:
  MOV AX,0B800H ; first page/title page
  CALL CLEAR_SCREEN 
  CALL OPENING_BORDER
  
  BEGIN:
  MOV AX,0B900H ; border maker and proceeds to main game
  CALL CLEAR_SCREEN
  CALL MAIN_BORDER
	
  NEXT:
  ;ENEMY  
  MOV ENEMY_MAX,01 ; set max to 1, meaning going up towards the right. 
  MOV DL, 0CH ; 
  MOV DH, 12
  CALL ENEMY_SET_CURSOR
  
  MOV ENEMY_PARTY_COL, 0AH  ;coordinates of where enemy starts out
  MOV ENEMY_PARTY_ROW, 12  
  
  ;PLAYER 
  MOV DL, 0CH ; MIDDLE LEFTMOST OF THE SCREEN
  MOV DH, 24H
  CALL PLAYER_SET_CURSOR
 
  MOV PLAYER_DIS,0H; initialize as zero to signify starting from col
  MOV PLAYER_MAX,1H ; initialize to 1 to signify starting movement towards the right
  
  MOV PLAYER_PARTY_COL, 24H  ; starting coordinates of player to be ~middle of the screen
  MOV PLAYER_PARTY_ROW, 12 
  JMP PLAYER_ITERATE ; Activate player loop
	 
 
  ENDING:
  MOV AH, 4CH
  INT 21H
 
 MAIN ENDP

 ;*******************************************************************************************************
 
 OPENING_BORDER PROC NEAR     

	MOV DL, 0H
	MOV DH, 0H
	CALL GENERAL_SET_CURSOR	 

	MOV AH, 09
	LEA DX, BORDER_OPENING
	INT 21H

	MOV	BORDER_COL_OPENING, 78
	MOV BORDER_ROW_OPENING, 2

	OPENING_ITERATE:
		;set cursor
		MOV	DL, BORDER_COL_OPENING
		MOV	DH, BORDER_ROW_OPENING
		CALL GENERAL_SET_CURSOR

		;display char from register
		MOV	AL, 0BAH
		MOV	AH, 02H
		MOV	DL, AL
		INT	21H

		INC	BORDER_ROW_OPENING
		CMP	BORDER_ROW_OPENING, 23
		JE	NEXT_PAGE
		JMP OPENING_ITERATE

		MOV AH, 09
		LEA DX, DELIMETER
		INT 21H

	NEXT_PAGE:	
		CALL GET_KEY
		CMP PLAYER_INPUT,31H 
		JE TUTORIAL

		CMP PLAYER_INPUT,32H
		JE BEGIN

		CMP PLAYER_INPUT,33H
		JE ENDING
		JMP NEXT_PAGE

	RET

 OPENING_BORDER ENDP
;*******************************************************************************************************
TUTORIAL PROC NEAR
	MOV AX,0BB00H

	CALL CLEAR_SCREEN 
	MOV	DL,0H
	MOV	DH,0H
	CALL GENERAL_SET_CURSOR	

	LEA DX, TUTORIAL_BORDER
	MOV AH, 09H
	INT 21H

	MOV	TUTORIAL_COL, 78
	MOV TUTORIAL_ROW, 2

TUTORIAL_ITERATE:
	;set cursor
	MOV	DL, TUTORIAL_COL
	MOV	DH, TUTORIAL_ROW
	CALL GENERAL_SET_CURSOR

	;display char from register
	MOV	AL, 0BAH
	MOV	AH, 02H
	MOV	DL, AL
	INT	21H

	;CALL DELAY

	INC	TUTORIAL_ROW
	CMP	TUTORIAL_ROW, 23
	JE	CHOICE
	JMP TUTORIAL_ITERATE

	MOV AH, 09
	LEA DX, TUTORIAL_DELIMETER
	INT 21H

CHOICE:
	CALL GET_KEY
	CMP PLAYER_INPUT,34H
	JE HOME
	CMP PLAYER_INPUT,35H
	JE BEGIN

	JMP CHOICE

RET
TUTORIAL ENDP 
;*******************************************************************************************************
;---------------------------------------
 ;EVERYTHING BELOW RELATES TO THE BORDER
 MAIN_BORDER PROC NEAR
 
  	MOV		DL, 9H
	MOV		DH, 3H
	CALL GENERAL_SET_CURSOR	
 
   MOV AH, 09H
	LEA DX, BORDER
	INT 21H
	
	MOV		BORDER_COL, 46H
	MOV 	BORDER_ROW, 4
		ITERATE:
			;set cursor
			MOV		DL, BORDER_COL
			MOV		DH, BORDER_ROW
			CALL	GENERAL_SET_CURSOR

			;display char from register
			MOV		AL, 0BAH
			MOV		AH, 02H
			MOV		DL, AL
			INT		21H

			INC		BORDER_ROW
			CMP		BORDER_ROW, 21
			JE	    NEXT
			JMP ITERATE
			
 RET
 MAIN_BORDER ENDP
 

;EVERYTHING BELOW RELATES TO THE ENEMY MECHANICS 
 ENEMY_ITERATE PROC NEAR

	MOV DL, ENEMY_PARTY_COL
	MOV DH, ENEMY_PARTY_ROW ; set coordinates in spot when arrow  was pressed. 
	CALL ENEMY_SET_CURSOR
	CALL ENEMY_READ_CURSOR

	;DISPLAY SMILEY CHAR
	MOV AL, 04H
	MOV AH, 02H
	MOV DL, AL
	INT 21H
	CALL DELAY


	CMP ENEMY_MAX,01
	JE UPRIGHT

	CMP ENEMY_MAX,02
	JE DOWNRIGHT

	CMP ENEMY_MAX,03
	JE DOWNLEFT

	CMP ENEMY_MAX,04
	JE UPLEFT


	UPRIGHT: ; GOING UP TO RIGHT
		CALL ENEMY_DELETE_PREV
		MOV ENEMY_MAX,01
		DEC ENEMY_PARTY_ROW
		INC ENEMY_PARTY_COL
		CMP ENEMY_PARTY_ROW,04H ;REACHED THE TOP
		JE RESET_UR
		CMP ENEMY_PARTY_COL,45H   ;REACHED THE RIGHT.
		JE UPLEFT
		JMP GETGOING ; WHOLE LOOP

	DOWNRIGHT:
		CALL ENEMY_DELETE_PREV
		MOV ENEMY_MAX,02
		INC ENEMY_PARTY_ROW
		INC ENEMY_PARTY_COL
		CMP ENEMY_PARTY_ROW,14H ;REACHED THE BOTTOM 
		JE RESET_DR
		CMP ENEMY_PARTY_COL,45H  
		JE DOWNLEFT
		JMP GETGOING

	DOWNLEFT:
		CALL ENEMY_DELETE_PREV
		MOV ENEMY_MAX,03
		INC ENEMY_PARTY_ROW
		DEC ENEMY_PARTY_COL
		CMP ENEMY_PARTY_ROW,14H
		JE RESET_DL
		CMP ENEMY_PARTY_COL,0AH; REACHED THE LEFT
		JE DOWNRIGHT
		JMP GETGOING

	UPLEFT:
		CALL ENEMY_DELETE_PREV
		MOV ENEMY_MAX,04
		DEC ENEMY_PARTY_ROW
		DEC ENEMY_PARTY_COL
		CMP ENEMY_PARTY_ROW,04H; REACHED THE TOP
		JE RESET_UL
		CMP ENEMY_PARTY_COL,0AH; REACHED THE LEFT
		JE UPRIGHT
		JMP GETGOING


	RESET_DL: ;  RIGHT TO LEFT MOTION

		CMP ENEMY_PARTY_COL,0AH
		JE UPRIGHT
		JMP UPLEFT

	RESET_DR:;  RIGHT TO LEFT MOTION

		CMP ENEMY_PARTY_COL,45H
		JE UPLEFT
		JMP UPRIGHT

	RESET_UR: 

		CMP ENEMY_PARTY_COL,45H ;REACHED THE UPRIGHT
		JE DOWNLEFT
		JMP DOWNRIGHT

	RESET_UL: ; REACHED UP LEFT

		CMP ENEMY_PARTY_COL,0AH
		JE DOWNRIGHT 
		JMP DOWNLEFT
	RET

 ENEMY_ITERATE ENDP 
;*******************************************************************************************************

ENEMY_DELETE_PREV PROC NEAR

	MOV AH, 02H
	MOV BH, 00
	MOV DH, ENEMY_PARTY_ROW  
	MOV DL, ENEMY_PARTY_COL
	INT 10H 

	  
	MOV AL, 20H
	MOV AH, 02H
	MOV DL, AL
	INT 21H
    
  RET

ENEMY_DELETE_PREV ENDP

;*******************************************************************************************************
 
ENEMY_SET_CURSOR PROC NEAR

  MOV AH, 02H   ;function code to request for set cursor
  MOV BH, 00    ;page number 0, i.e. current screen
  INT 10H
 
  RET
ENEMY_SET_CURSOR ENDP

;*******************************************************************************************************	
 
ENEMY_READ_CURSOR PROC NEAR
	MOV AH, 08H
	MOV BH, 00
	INT 10H

	CMP AL, 02H
	JE SORTER
	JMP NEVERMIND

	SORTER:
		DEC SCORECOUNT
		CMP ENEMY_MAX,01 ;  UPRIGHT 
		JE DOWNRIGHT
		CMP ENEMY_MAX,02 ;  DOWNRIGHT  
		JE DOWNLEFT
		CMP ENEMY_MAX,03;DOWNLEFT 
		JE UPRIGHT
		CMP ENEMY_MAX,04 ;UPLEFT 
		JE UPRIGHT
	
	NEVERMIND:
	RET
ENEMY_READ_CURSOR ENDP
 
;*******************************************************************************************************
  PLAYER_ITERATE PROC NEAR
 ;DISPLAY SCORE SA SCREEN
	MOV DL, 15
	MOV DH, 22
	CALL GENERAL_SET_CURSOR
	MOV AH, 09
	LEA DX, SCOREMSG
	INT 21H
;DISPLAY SCORECOUNT
	MOV DL, 25
	MOV DH, 22
	CALL GENERAL_SET_CURSOR
	MOV AX, 0000
	MOV AX, SCORECOUNT
	DEC AL
	XOR AH,AH
	CALL DISPNUM

	;DISPLAY HIGHSCORE SA SCREEN 				;CHANGES
	MOV DL, 50
	MOV DH, 22
	CALL GENERAL_SET_CURSOR
	MOV AH, 09
	LEA DX, HIGHSCOREMSG
	INT 21H

	CALL HSDISPLAY
	;display record
	MOV DL, 65
	MOV DH, 22
	CALL GENERAL_SET_CURSOR
	LEA DX, RECORD_STR
	MOV AH, 09
	INT 21H

	CALL GET_KEY
 
    CMP PLAYER_INPUT,1BH ;CHECK IF INPUT MATCHES ESCAPE KEY. IF NOT, CONITNUE MOVING. IF IT DOES, JUMP TO TERMINATE POC TO EXIT
    JE HOME
	
    CMP AX,4800H; UP
    JE UP 
   
    CMP AX,5000H; DOWN
    JE DOWN
   
    CMP AX,4B00H;LEFT
    JE LEFT
   
    CMP AX,4D00H; RIGHT
    JE RIGHT
	
    CALL ENEMY_ITERATE
   
   GETGOING:
   
    MOV DL, PLAYER_PARTY_COL
    MOV DH, PLAYER_PARTY_ROW ; set coordinates in spot when arrow  was pressed. 
    CALL PLAYER_SET_CURSOR
	CALL PLAYER_READ_CURSOR
      
    ;DISPLAY BLOCK CHAR
    MOV  AL, 02H
    MOV     AH, 02H
    MOV     DL, AL
    INT     21H
     ;CALL DELAY
    
	MOV AL, ENEMY_PARTY_COL
	CMP PLAYER_PARTY_COL, AL
	JE NEXT_CMP1
	JNE DIR
	  
	NEXT_CMP1: 
    MOV AL, ENEMY_PARTY_ROW
	CMP PLAYER_PARTY_ROW, AL
	JE GAME_OVER
	JNE DIR
	

    DIR: ;direction to go either row or column
	CMP PLAYER_DIS,0H
	JE COL
	JNE ROW
	
	
	
	COL:
    CMP PLAYER_MAX,1H
    JE RIGHT

    CMP PLAYER_MAX,0H
    JE LEFT	
	
	ROW:
	CMP PLAYER_MAX2,0H
	JE UP
	
	CMP PLAYER_MAX2,1H
    JE DOWN
 
 
	RIGHT: 
	CALL DELETE_PREV 
	MOV PLAYER_DIS,0H; TO DISTINGUISH BETWEEN ROL AND COL
	MOV PLAYER_MAX,1H  
    INC PLAYER_PARTY_COL
    INC SCORECOUNT
    CMP PLAYER_PARTY_COL,46H ;RIGHT ARROW  
	JE RESTART
	JMP PLAYER_ITERATE
	
	LEFT:
	CALL DELETE_PREV 
	MOV PLAYER_DIS,0H; TO DISTINGUISH BETWEEN ROL AND COL
	MOV PLAYER_MAX,0H 
	DEC PLAYER_PARTY_COL
	INC SCORECOUNT
    CMP PLAYER_PARTY_COL,0AH
	JE RESTART
	JMP PLAYER_ITERATE
	
	UP:
	CALL DELETE_PREV 
	MOV PLAYER_DIS,1H ; TO DISTINGUISH BETWEEN ROL AND COL
	MOV PLAYER_MAX2,0H;TO DISTINGUISH BETWEEN UP AND DOWN 
    DEC PLAYER_PARTY_ROW
    INC SCORECOUNT
    CMP PLAYER_PARTY_ROW,03H
    JE RESTART
    JMP PLAYER_ITERATE	

	DOWN:
	CALL DELETE_PREV 
    MOV PLAYER_DIS,1H ; TO DISTINGUISH BETWEEN ROL AND COL
	MOV PLAYER_MAX2,1H;TO DISTINGUISH BETWEEN UP AND DOWN
    INC PLAYER_PARTY_ROW
    INC SCORECOUNT
    CMP PLAYER_PARTY_ROW,15H
    JE RESTART
    JMP PLAYER_ITERATE	
	
 
       RET

 PLAYER_ITERATE ENDP  
;*******************************************************************************************************
 
 RESTART  PROC NEAR
         
		 CMP PLAYER_DIS,0H ;DISTINGUISH WHETHER INFO CAME FROM ROW OR COL
		 JE ROW_ONLY; IF FROM DIS 0--WHICH IS COL, JUMP TO ROW ONLY
		 JNE COL_ONLY
		  
		  ROW_ONLY:	  
		  MOV PLAYER_DIS,1H
		  CMP PLAYER_MAX2,1H
		  JE DOWNY
		  JNE UPPY
		   
		     UPPY:
		  MOV PLAYER_MAX2,1H   ;GOING UP/DECREMENTING
		  CMP PLAYER_PARTY_COL,46H
		  JE DECREMENT_COL
		  CMP PLAYER_PARTY_COL,0AH
		  JE INCREMENT_COL
	
			 DOWNY:
		  MOV PLAYER_MAX2,0H   ;GOING DOWN/INCREMENTING
          CMP PLAYER_PARTY_COL,46H
		  JE DECREMENT_COL
		  CMP PLAYER_PARTY_COL,0AH
		  JE INCREMENT_COL
		  
		  DECREMENT_COL:
          DEC PLAYER_PARTY_COL
		  JMP BAPPLE
		  
          INCREMENT_COL:
          INC PLAYER_PARTY_COL
          JMP BAPPLE		  
		  
		  COL_ONLY:
		  MOV PLAYER_DIS,0H 
		  CMP PLAYER_MAX,1H
		  JE RIGHTY
		  JNE LEFTY
		  
		  RIGHTY:
		  MOV PLAYER_MAX,1H; GOING RIGHT, INREMENTING
		  CMP PLAYER_PARTY_ROW,15H
		  JE DECREMENT_ROW
		  
		  CMP PLAYER_PARTY_ROW,03H
		  JE INCREMENT_ROW
		  
		  LEFTY:
		  MOV PLAYER_MAX,0H ;GOING LEFT, DECREMENTING
		  CMP PLAYER_PARTY_ROW,03H
		  JE INCREMENT_ROW
		  
		  CMP PLAYER_PARTY_ROW,15H
		  JE DECREMENT_ROW
		   
		  DECREMENT_ROW:
          DEC PLAYER_PARTY_ROW
		  JMP BAPPLE
		  
          INCREMENT_ROW:
          INC PLAYER_PARTY_ROW
          JMP BAPPLE		  
		
		  JMP BAPPLE
                     
           BAPPLE:
			
            MOV     AH, 01H     ;check for input.
            INT     16H
 
            JZ      BAPPLE  ;NO INPUT DETECTED, TRY TO DETECT INPUT AGAIN
          

         
			 
          JMP PLAYER_ITERATE ; SEE WHAT TO DO NEXT
  
 RET
 RESTART ENDP 
 
;*******************************************************************************************************
DELETE_PREV PROC NEAR

  MOV AH, 02H
  MOV BH, 00
  MOV DH, PLAYER_PARTY_ROW 
  MOV DL, PLAYER_PARTY_COL
  INT 10H 
  
      
    MOV     AL, 02H
    MOV     AH, 02H
    MOV     DL, AL
    INT     21H
    
  RET

DELETE_PREV ENDP

;*******************************************************************************************************
 
PLAYER_SET_CURSOR PROC NEAR
   
 
  MOV AH, 02H   ;function code to request for set cursor
  MOV BH, 00    ;page number 0, i.e. current screen
 
  INT 10H
   
 
  RET
PLAYER_SET_CURSOR ENDP
 
;*******************************************************************************************************
PLAYER_READ_CURSOR PROC NEAR
	MOV AH, 08H
	MOV BH, 00
	INT 10H
	
	CMP AL, 02H
	JE DO 
	JNE THISONE
	DO:
   MOV DL, PLAYER_PARTY_COL
   MOV DH, PLAYER_PARTY_ROW ; set coordinates in spot when arrow  was pressed. 
 
   
	JMP GAME_OVER
	
	THISONE:
	RET
PLAYER_READ_CURSOR ENDP 

;*******************************************************************************************************

GAME_OVER PROC NEAR 

	CALL CMP_HIGHSCORE_AND_CURRENTSCORE
    MOV AX,0BA00h
	CALL CLEAR_SCREEN
	 ;DISPLAY SCORE SA SCREEN
	 CALL CMP_HIGHSCORE_AND_CURRENTSCORE
	 
	MOV		DL, 0
	MOV		DH, 0
	CALL GENERAL_SET_CURSOR  
	MOV AH, 09
	LEA DX, BORDER_FIN
	INT 21H
            
			MOV DL, 50
			MOV DH, 4
			CALL GENERAL_SET_CURSOR
			
			MOV AH, 09
			LEA DX, SCOREMSG1
			INT 21H
	
	        ;DISPLAY SCORECOUNT
			MOV DL, 66
			MOV DH, 4
			CALL GENERAL_SET_CURSOR
			MOV AX, SCORECOUNT
			DEC AL
			XOR AH,AH
			CALL DISPNUM

			MOV DL, 50
			MOV DH, 5
			CALL GENERAL_SET_CURSOR
			
			MOV AH, 09
			LEA DX, HIGHSCOREMSG1
			INT 21H

			CALL HSDISPLAY
			;display record
  			MOV DL, 71
  			MOV DH, 5
  			CALL GENERAL_SET_CURSOR
  			LEA DX, RECORD_STR
  			MOV AH, 09
  			INT 21H
			
			MOV		BORDER_COL_FIN, 78
			MOV 	BORDER_ROW_FIN, 2
		FIN_ITERATE:
			;set cursor
			MOV		DL, BORDER_COL_FIN
			MOV		DH, BORDER_ROW_FIN
			CALL	GENERAL_SET_CURSOR

			;display char from register
			MOV		AL, 0BAH
			MOV		AH, 02H
			MOV		DL, AL
			INT		21H

			;CALL	DELAY

			INC		BORDER_ROW_FIN
			CMP		BORDER_ROW_FIN, 23
			JE		OPTIONS
			JMP FIN_ITERATE
      
			MOV AH, 09
			LEA DX, DELIMETER_FIN
			INT 21H

		
			OPTIONS:
			CALL GET_KEY
			CMP PLAYER_INPUT,36H ; PRESS 6 TO VISIT TUTORIAL 
			JE TUTORIAL
			CMP PLAYER_INPUT,37H ; PRESS 7 TO PLAY AGAIN
			JE BEGIN
			CMP PLAYER_INPUT,38H ; PRESS 8 TO RETURN TO HOME 
            JE HOME
			CMP PLAYER_INPUT,39H ;PRESS 9 TO EXIT PROGRAM
			JE ENDING
			
            JMP OPTIONS
            
	RET

GAME_OVER ENDP

;*******************************************************************************************************

;EVERYTHING BELOW ARE GENERAL USED PROCS	

GET_KEY PROC    NEAR
 
           CHECK:
         
           
           
            MOV     AH, 01H     ;check for input.
            INT     16H
 
            JZ      LEAVETHIS  ;NO INPUT DETECTED.LEAVE THE PROC
 
           
            MOV     AH, 00H     ; INPUT DETECTED
            INT     16H
            MOV     PLAYER_INPUT,AL
   
           
 
 
     LEAVETHIS:
            RET
 GET_KEY    ENDP
  
;*******************************************************************************************************

CLEAR_SCREEN PROC NEAR ;CLEAR SCREEN FUNCTION
           MOV AX,0B900H
            MOV AX, 0600H   ;full screen
            MOV BH, 71H     ;white background (7), blue foreground (1)
            MOV CX, 0000H   ;upper left row:column (0:0)
            MOV DX, 184FH   ;lower right row:column (24:79)
            INT 10H
 
            MOV AX, 0600H   ;full screen
            MOV BH, 4FH     ;RED(4), BRIGHT WHITE(F)
            MOV CX, 0101H   ;upper left row:column (1:1)  
            MOV DX, 174EH   ;lower right row:column (23:78)
            INT 10H
               
            RET
CLEAR_SCREEN ENDP
;*******************************************************************************************************
GENERAL_SET_CURSOR PROC	NEAR  ;USED FOR SCOREBOARD AND BORDER
			MOV		AH, 02H
			MOV		BH, 00
			INT		10H
			RET
GENERAL_SET_CURSOR ENDP 

;*******************************************************************************************************
DELAY PROC  NEAR
            mov bp, 2 ;lower value faster
            mov si, 2 ;lower value faster
        delay2:
            dec bp
            nop
            jnz delay2
            dec si
            cmp si,0
            jnz delay2
            RET
DELAY ENDP
 
;*******************************************************************************************************
DISPNUM PROC NEAR
    TEST AX, AX
    JZ RETZ
    XOR DX, DX
    ;ax contains the number to be displayed
    ;bx must contain 10
    MOV BX,10
    DIV BX
    ;dispnum ax first.
    PUSH DX
    CALL DISPNUM  
    POP DX
    CALL DISPDIGIT
    ret
RETZ:
    MOV AH, 02  
    RET    
DISPNUM ENDP
;*******************************************************************************************************
DISPDIGIT PROC NEAR
    ADD DL, '0'
    MOV AH, 02H
    INT 21H
    RET
DISPDIGIT ENDP 
;*******************************************************************************************************
HSDISPLAY PROC NEAR
	;open file
  MOV AH, 3DH           ;requst open file
  MOV AL, 00            ;read only; 01 (write only); 10 (read/write)
  LEA DX, PATHFILENAME
  INT 21H
  ;JC DISPLAY_ERROR1
  MOV FILEHANDLE, AX

  ;read file
  MOV AH, 3FH           ;request read record
  MOV BX, FILEHANDLE    ;file handle
  MOV CX, 4            ;record length
  LEA DX, RECORD_STR    ;address of input area
  INT 21H
  ;JC DISPLAY_ERROR2
  CMP AX, 00            ;zero bytes read?
  ;JE DISPLAY_ERROR3

  ;display record
  ;MOV DL, 65
  ;MOV DH, 22
  ;CALL GENERAL_SET_CURSOR
  ;LEA DX, RECORD_STR
  ;MOV AH, 09
  ;INT 21H

   ;close file handle
  MOV AH, 3EH           ;request close file
  MOV BX, FILEHANDLE    ;file handle
  INT 21H

  RET

HSDISPLAY ENDP

;*******************************************************************************************************
CMP_HIGHSCORE_AND_CURRENTSCORE PROC NEAR
	CALL STR_TO_NUM 						;CONVERT RECORD_STR TO NUMBER 
											;AND STORE ASCII VALUE TO AX
	MOV BX, 0000
	MOV BX, SCORECOUNT

	CMP BX, AX
	JA NEWHIGHSCORE
	JBE DILIHIGHSCORE
	MOV DL, 60
	MOV DH, 10
	CALL GENERAL_SET_CURSOR
  	MOV AH, 09
  	LEA DX, HALA
  	INT 21H
  	JMP retu

	NEWHIGHSCORE:
	MOV DL, 50
	MOV DH, 7
	CALL GENERAL_SET_CURSOR
  	MOV AH, 09
  	LEA DX, NEWHIGH
  	INT 21H

  	;CALL REPLACE_HIGHSCORE
  	JMP retu

	  DILIHIGHSCORE:
	  MOV DL, 46
	  MOV DH, 7
	  CALL GENERAL_SET_CURSOR
	  MOV AH, 09
	  LEA DX, SAME
	  INT 21H
	  JMP retu

retu:
	RET
CMP_HIGHSCORE_AND_CURRENTSCORE ENDP

;*******************************************************************************************************

STR_TO_NUM PROC NEAR
;STRING TO NUMBER but what's get stored in AX is the ascii value of the number
atoi:
mov cl, 10
lea si, RECORD_STR
push    ebx        ; preserve working registers
push    edx
push    esi

mov eax, 0        ; initialize the accumulator
nxchr:
    mov ebx, 0       ; clear all the bits in EBX
    mov bl,[esi]  ; load next character in BL
    cmp bl, '$'
    je inval
    inc esi            ; and advance source index

    cmp bl, 0      ; does character preceed '0'?
    jb  inval           ; yes, it's not a numeral jb:jump below
    cmp bl,'9'       ; does character follow '9'?
    ja  inval           ; yes, it's not a numeral ja:jump above

    sub bl,'0'       ; else convert numeral to int
    mul cl            ; multiply accumulator by ten. eax * 10
    add eax,ebx      ; and then add the new integer
    jmp nxchr           ; go back for another numeral

inval:
   pop  esi            ; recover saved registers
   pop  edx
   pop  ebx
   RET
STR_TO_NUM ENDP

;*******************************************************************************************************

REPLACE_HIGHSCORE PROC NEAR

	;CALL NUM_TO_STRING
	MOV DL, 40
	MOV DH, 5
	CALL GENERAL_SET_CURSOR
	MOV AH, 09
	LEA DX, RECORD_STR1
	INT 21H

	MOV AH, 3CH           ;request create file
  MOV CX, 00            ;normal attribute
  LEA DX, PATHFILENAME1  ;load path and file name
  INT 21H
  ;JC DISPLAY_ERROR1     ;if there's error in creating file, carry flag = 1, otherwise 0
  MOV FILEHANDLE1, AX

  ;write filede
  MOV AH, 40H           ;request write record
  MOV BX, FILEHANDLE1    ;file handle
  MOV CX, 4            ;record length
  LEA DX, RECORD_STR1    ;address of output area
  INT 21H
  ;JC DISPLAY_ERROR2     ;if carry flag = 1, there's error in writing (nothing is written)
  CMP AX, 4            ;after writing, set AX to size of chars nga na write
  ;JNE DISPLAY_ERROR3

  ;close file handle
  MOV AH, 3EH           ;request close file
  MOV BX, FILEHANDLE1    ;file handle
  INT 21H

  
RET
REPLACE_HIGHSCORE ENDP
;*******************************************************************************************************

NUM_TO_STRING PROC NEAR

;number to string
  MOV AX, 0000
  ;MOV SCORECOUNT, 350
  LEA DI, SCORECOUNT
  MOV AX, [DI]

  mov  bx, 10 
  mov  cx, 0 
cycle1:       
  mov  dx, 0
  div  bx 
  push dx 
  inc  cx
  cmp  ax, 0  
  jne  cycle1 

  mov  si, offset RECORD_STR1
cycle2:  
  pop  dx        
  add  dl, 48 
  mov  [ Si ], dl
  inc  Si
  loop cycle2 
NUM_TO_STRING ENDP

;*******************************************************************************************************

END MAIN
