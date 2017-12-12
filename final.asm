TITLE FINAL (SIMPLIFIED .EXE )
.MODEL SMALL
.386P
;---------------------------------------------
.DATA 
ENEMY_PARTY_COL DB ?,0ah, 0dh,"$" ;enemy col
ENEMY_PARTY_ROW DB ?,0ah, 0dh,"$" ;enemy row
ENEMY_MAX DB ?, 0ah,0dh,"$" ; to determine direction of the bounce
 
SCOREMSG DB "Score: $",0 ;display score
SCORECOUNT DB 1  ; stores over all score
PLAYER_INPUT DB  ?,0ah, 0dh,"$" ; keyboard input for movement/state of game
PLAYER_PARTY_COL DB ?,0ah, 0dh,"$" ; player col
PLAYER_PARTY_ROW DB ?,0ah, 0dh,"$" ; player row
PLAYER_MAX DB ?,0ah, 0dh,"$" ;distinguish col: left and right
PLAYER_MAX2 DB ?,0ah, 0dh,"$" ; distinguish row: UP or down
PLAYER_DIS DB ?,0ah, 0dh,"$" ;distinguish between row and col
;-------------------------

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
.CODE

;--------------------------------------------
 
 
MAIN PROC FAR
  MOV AX, @data
  MOV DS, AX
 
 ;clear the screen
  CALL CLEAR_SCREEN
 
  
  ;BORDER
  	MOV		DL, 9H
	MOV		DH, 3H
	CALL GENERAL_SET_CURSOR	
	CALL MAIN_BORDER
  ;BORDER
  
  NEXT:
  ;ENEMY  
  MOV ENEMY_MAX,01 ; set max to 1, meaning going up towards the right. 
  MOV DL, 0CH ; 
  MOV DH, 12
  CALL ENEMY_SET_CURSOR
   
 
  MOV ENEMY_PARTY_COL, 0AH  ;coordinates of where enemy starts out
  MOV ENEMY_PARTY_ROW, 12
 
  ;ENEMY 
  
  ;PLAYER 
 
  MOV DL, 0CH ; MIDDLE LEFTMOST OF THE SCREEN
  MOV DH, 24H
  CALL PLAYER_SET_CURSOR
 
  MOV PLAYER_DIS,0H; initialize as zero to signify starting from col
  MOV PLAYER_MAX,1H ; initialize to 1 to signify starting movement towards the right


  
  MOV PLAYER_PARTY_COL, 24H  ; starting coordinates of player to be ~middle of the screen
  MOV PLAYER_PARTY_ROW, 12 
  JMP PLAYER_ITERATE ; Activate player loop
	 ;PLAYER

 
  ENDING:
  MOV AH, 4CH
  INT 21H
 
 MAIN ENDP

 ;EVERYTHING BELOW RELATES TO THE BORDER
 MAIN_BORDER PROC NEAR
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
 


; EVERYTHING BELOW RELATES TO THE ENEMY MECHANICS 
 ENEMY_ITERATE PROC NEAR
    
    
   
   MOV DL, ENEMY_PARTY_COL
   MOV DH, ENEMY_PARTY_ROW ; set coordinates in spot when arrow  was pressed. 
   CALL ENEMY_SET_CURSOR
   CALL ENEMY_READ_CURSOR
      
   ;DISPLAY SMILEY CHAR
   MOV     AL, 02H
   MOV     AH, 02H
   MOV     DL, AL
   INT     21H
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

	
   RET

 ENEMY_ITERATE ENDP 
  
 ENEMY_RESET PROC NEAR ;RESET ENEMY MOVEMENT TO BOUNCE AFTER IT MEETS THE END
 
	RESET_DL: ; RESET COLUMN//RIGHT TO LEFT MOTION
 
	 CMP ENEMY_PARTY_COL,0AH
	 JE UPRIGHT
	 JMP UPLEFT
    	 
	RESET_DR:; RESET COLUMN//RIGHT TO LEFT MOTION
 
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
ENEMY_RESET ENDP	

ENEMY_DELETE_PREV PROC NEAR

  MOV AH, 02H
  MOV BH, 00
  MOV DH, ENEMY_PARTY_ROW  
  MOV DL, ENEMY_PARTY_COL
  INT 10H 
  
      
    MOV     AL, 20H
    MOV     AH, 02H
    MOV     DL, AL
    INT     21H
    
  RET

ENEMY_DELETE_PREV ENDP

;----------------------------------------------------
 
ENEMY_SET_CURSOR PROC NEAR

 
 
 
  MOV AH, 02H   ;function code to request for set cursor
  MOV BH, 00    ;page number 0, i.e. current screen
 
  INT 10H
  
 
  RET
ENEMY_SET_CURSOR ENDP

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~	
 
ENEMY_READ_CURSOR PROC NEAR
	MOV AH, 08H
	MOV BH, 00
	INT 10H
	
    CMP AL, 16H
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
 
 

;EVERYTHING BELOW RELATES TO THE PLAYER MECHANICS
 
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
          

         
			 
          JMP STARTER ; SEE WHAT TO DO NEXT
  
 RET
 RESTART ENDP
 ;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  STARTER PROC NEAR ; CHECK IF THERE IS AN INPUT
     ;STOP AND GO
	
  
 ;DISPLAY SCORE SA SCREEN
	MOV DL, 10
	MOV DH, 22
	CALL GENERAL_SET_CURSOR
	MOV AH, 09
	LEA DX, SCOREMSG
	INT 21H
;DISPLAY SCORECOUNT
	MOV DL, 20
	MOV DH, 22
	CALL GENERAL_SET_CURSOR
	MOV AL, SCORECOUNT
	DEC AL
	XOR AH,AH
	CALL DISPNUM

 

	CALL GET_KEY
	
 
    CMP PLAYER_INPUT,1BH ;CHECK IF INPUT MATCHES ESCAPE KEY. IF NOT, CONITNUE MOVING. IF IT DOES, JUMP TO TERMINATE POC TO EXIT
    JE ENDING
	
    CMP AX,4800H; UP
    JE UP 
   
    CMP AX,5000H; DOWN
    JE DOWN
    
 
    CMP AX,4B00H;LEFT
    JE LEFT
   
    CMP AX,4D00H; RIGHT
    JE RIGHT
    
   
 
   RET
  STARTER ENDP
  ;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  PLAYER_ITERATE PROC NEAR
    
   CALL STARTER 
   CALL ENEMY_ITERATE
   
   GETGOING:
   
    MOV DL, PLAYER_PARTY_COL
    MOV DH, PLAYER_PARTY_ROW ; set coordinates in spot when arrow  was pressed. 
    CALL PLAYER_SET_CURSOR
	CALL PLAYER_READ_CURSOR
      
    ;DISPLAY BLOCK CHAR
    MOV     AL, 16H
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
	JE ENDING
	JNE DIR
	

    DIR:
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
 
 
 ;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
DELETE_PREV PROC NEAR

  MOV AH, 02H
  MOV BH, 00
  MOV DH, PLAYER_PARTY_ROW 
  MOV DL, PLAYER_PARTY_COL
  INT 10H 
  
      
    MOV     AL, 16H
    MOV     AH, 02H
    MOV     DL, AL
    INT     21H
    
  RET

DELETE_PREV ENDP

;----------------------------------------------------
 
PLAYER_SET_CURSOR PROC NEAR
   
 
  MOV AH, 02H   ;function code to request for set cursor
  MOV BH, 00    ;page number 0, i.e. current screen
 
  INT 10H
   
 
  RET
PLAYER_SET_CURSOR ENDP
 
;------------------------------------------------------
PLAYER_READ_CURSOR PROC NEAR
	MOV AH, 08H
	MOV BH, 00
	INT 10H
	
	CMP AL, 16H
	JE DO 
	JNE THISONE
	DO:
   MOV DL, PLAYER_PARTY_COL
   MOV DH, PLAYER_PARTY_ROW ; set coordinates in spot when arrow  was pressed. 
 ;  CALL PLAYER_SET_CURSOR
 
   
	JMP ENDING
	
	THISONE:
	RET
PLAYER_READ_CURSOR ENDP 


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
 
;-------------------------------------------
CLEAR_SCREEN PROC NEAR ;CLEAR SCREEN FUNCTION
 
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
;-------------------------------------------------
GENERAL_SET_CURSOR PROC	NEAR  ;USED FOR SCOREBOARD AND BORDER
			MOV		AH, 02H
			MOV		BH, 00
			INT		10H
			RET
GENERAL_SET_CURSOR ENDP 

;-------------------------------------------------------
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
 
;*******************************************************************
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
;*******************************************************************
DISPDIGIT PROC NEAR
    ADD DL, '0'
    MOV AH, 02H
    INT 21H
    RET
DISPDIGIT ENDP 
;*****************************************************************
END MAIN