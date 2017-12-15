 
TITLE LAB6 (SIMPLIFIED .EXE )
.MODEL SMALL
.386P
;---------------------------------------------
.DATA
INPUT DB  ?,0ah, 0dh,"$" 
ENEMY_PARTY_COL DB ?,0ah, 0dh,"$"
ENEMY_PARTY_ROW DB ?,0ah, 0dh,"$"
ENEMY_MAX DB ?, 0ah,0dh,"$"
NUMBER DB ?, 0ah,0dh,"$"
.CODE

;--------------------------------------------
 
 
MAIN PROC FAR
  MOV AX, @data
  MOV DS, AX
 
 ;clear the screen
  CALL CLEAR_SCREEN
 MOV NUMBER,01
  ;MOV ENEMY_MAX, 01 ;for distinguishing
  MOV ENEMY_MAX,01
  
  ;set the STARTING cursor
   
  MOV DL, 0CH ; 
  MOV DH, 01
  CALL ENEMY_SET_CURSOR
   
 
  MOV ENEMY_PARTY_COL, 00H   
  MOV ENEMY_PARTY_ROW, 12
  JMP ENEMY_ITERATE
  
  ENDING:
  MOV AH, 4CH
  INT 21H
 
 MAIN ENDP

 ;__________TESTER________
 
 TESTER PROC NEAR

     MOV DL, 28H ; MIDDLE LEFTMOST OF THE SCREEN
  MOV DH, 04
  CALL TEST_SET_CURSOR
  
    MOV     AL, 2AH
   MOV     AH, 02H
   MOV     DL, AL
   INT     21H 
 
   
      MOV DL, 28H ; MIDDLE LEFTMOST OF THE SCREEN
  MOV DH, 05
  CALL TEST_SET_CURSOR
  
    MOV     AL, 2AH
   MOV     AH, 02H
   MOV     DL, AL
   INT     21H
  
 
    MOV DL, 13H ; MIDDLE LEFTMOST OF THE SCREEN
  MOV DH, 06
  CALL TEST_SET_CURSOR
       
   MOV     AL, 2AH
   MOV     AH, 02H
   MOV     DL, AL
   INT     21H 
   MOV     AL, 2AH
   MOV     AH, 02H
   MOV     DL, AL
   INT     21H
   MOV     AL, 2AH
   MOV     AH, 02H
   MOV     DL, AL
   INT     21H
   
     MOV     AL, 2AH
   MOV     AH, 02H
   MOV     DL, AL
   INT     21H
   MOV     AL, 2AH
   MOV     AH, 02H
   MOV     DL, AL
   INT     21H
     
   MOV     AL, 2AH
   MOV     AH, 02H
   MOV     DL, AL
   INT     21H
     
   MOV     AL, 2AH
   MOV     AH, 02H
   MOV     DL, AL
   INT     21H
     
   MOV     AL, 2AH
   MOV     AH, 02H
   MOV     DL, AL
   INT     21H
     
   MOV     AL, 2AH
   MOV     AH, 02H
   MOV     DL, AL
   INT     21H
     
   MOV     AL, 2AH
   MOV     AH, 02H
   MOV     DL, AL
   INT     21H
   
   MOV     AL, 2AH
   MOV     AH, 02H
   MOV     DL, AL
   INT     21H
     MOV     AL, 2AH
   MOV     AH, 02H
   MOV     DL, AL
   INT     21H
   MOV     AL, 2AH
   MOV     AH, 02H
   MOV     DL, AL
   INT     21H
     
   MOV     AL, 2AH
   MOV     AH, 02H
   MOV     DL, AL
   INT     21H
     
   MOV     AL, 2AH
   MOV     AH, 02H
   MOV     DL, AL
   INT     21H
     
   MOV     AL, 2AH
   MOV     AH, 02H
   MOV     DL, AL
   INT     21H
     
   MOV     AL, 2AH
   MOV     AH, 02H
   MOV     DL, AL
   INT     21H
     
   MOV     AL, 2AH
   MOV     AH, 02H
   MOV     DL, AL
   INT     21H
   
   MOV     AL, 2AH
   MOV     AH, 02H
   MOV     DL, AL
   INT     21H
       
   MOV     AL, 2AH
   MOV     AH, 02H
   MOV     DL, AL
   INT     21H
   MOV     AL, 2AH
   MOV     AH, 02H
   MOV     DL, AL
   INT     21H
     
   MOV     AL, 2AH
   MOV     AH, 02H
   MOV     DL, AL
   INT     21H
     
   MOV     AL, 2AH
   MOV     AH, 02H
   MOV     DL, AL
   INT     21H
     
   MOV     AL, 2AH
   MOV     AH, 02H
   MOV     DL, AL
   INT     21H
     
   MOV     AL, 2AH
   MOV     AH, 02H
   MOV     DL, AL
   INT     21H
     
   MOV     AL, 2AH
   MOV     AH, 02H
   MOV     DL, AL
   INT     21H
   
   MOV     AL, 2AH
   MOV     AH, 02H
   MOV     DL, AL
   INT     21H
 
 
    MOV DL, 28H ; MIDDLE LEFTMOST OF THE SCREEN
  MOV DH, 07
  CALL TEST_SET_CURSOR
   
   
   MOV     AL, 2AH
   MOV     AH, 02H
   MOV     DL, AL
   INT     21H
 
 
    MOV DL, 28H ; MIDDLE LEFTMOST OF THE SCREEN
  MOV DH, 08
  CALL TEST_SET_CURSOR
  
   
   
   MOV     AL, 2AH
   MOV     AH, 02H
   MOV     DL, AL
   INT     21H
 
    MOV DL, 28H ; MIDDLE LEFTMOST OF THE SCREEN
  MOV DH, 09
  CALL TEST_SET_CURSOR
  
   
   
   MOV     AL, 2AH
   MOV     AH, 02H
   MOV     DL, AL
   INT     21H
 
 
    MOV DL, 28H ; MIDDLE LEFTMOST OF THE SCREEN
  MOV DH, 10
  CALL TEST_SET_CURSOR
  
   
   
   MOV     AL, 2AH
   MOV     AH, 02H
   MOV     DL, AL
   INT     21H
 
    MOV DL, 28H ; MIDDLE LEFTMOST OF THE SCREEN
  MOV DH, 11
  CALL TEST_SET_CURSOR
  
   
   
   MOV     AL, 2AH
   MOV     AH, 02H
   MOV     DL, AL
   INT     21H
 
  MOV DL, 28H ; MIDDLE LEFTMOST OF THE SCREEN
  MOV DH, 12
  CALL TEST_SET_CURSOR
  
   MOV     AL, 2AH
   MOV     AH, 02H
   MOV     DL, AL
   INT     21H
  
   MOV DL, 28H ; MIDDLE LEFTMOST OF THE SCREEN
  MOV DH, 13
   CALL TEST_SET_CURSOR
   MOV     AL, 2AH
   MOV     AH, 02H
   MOV     DL, AL
   INT     21H
  
   
  MOV DL, 28H ; MIDDLE LEFTMOST OF THE SCREEN
  MOV DH, 14
  CALL TEST_SET_CURSOR
   
   
   MOV     AL, 2AH
   MOV     AH, 02H
   MOV     DL, AL
   INT     21H
  
   MOV DL, 28H ; MIDDLE LEFTMOST OF THE SCREEN
  MOV DH, 15
  CALL TEST_SET_CURSOR
  
   
   
   MOV     AL, 2AH
   MOV     AH, 02H
   MOV     DL, AL
   INT     21H
   
     MOV DL, 28H ; MIDDLE LEFTMOST OF THE SCREEN
  MOV DH, 16
  CALL TEST_SET_CURSOR
  
   
   
   MOV     AL, 2AH
   MOV     AH, 02H
   MOV     DL, AL
   INT     21H
   
     MOV DL, 28H ; MIDDLE LEFTMOST OF THE SCREEN
  MOV DH, 17
  CALL TEST_SET_CURSOR
  
   
   
   MOV     AL, 2AH
   MOV     AH, 02H
   MOV     DL, AL
   INT     21H
  
       MOV DL, 28H ; MIDDLE LEFTMOST OF THE SCREEN
  MOV DH, 18
  CALL TEST_SET_CURSOR
  
   
   
   MOV     AL, 2AH
   MOV     AH, 02H
   MOV     DL, AL
   INT     21H
   
        MOV DL, 28H ; MIDDLE LEFTMOST OF THE SCREEN
  MOV DH, 19
  CALL TEST_SET_CURSOR
   
   
   MOV     AL, 2AH
   MOV     AH, 02H
   MOV     DL, AL
   INT     21H
  
       MOV DL, 28H ; MIDDLE LEFTMOST OF THE SCREEN
  MOV DH, 20
  CALL TEST_SET_CURSOR
  
   
   
   MOV     AL, 2AH
   MOV     AH, 02H
   MOV     DL, AL
   INT     21H
  
         MOV DL, 28H ; MIDDLE LEFTMOST OF THE SCREEN
  MOV DH, 21
  CALL TEST_SET_CURSOR
  
   
   
   MOV     AL, 2AH
   MOV     AH, 02H
   MOV     DL, AL
   INT     21H
 
  
   RET
   TESTER ENDP
 ;________________________

 ;

 ENEMY_ITERATE PROC NEAR
    
   CALL TESTER ;DELETE UPON MERGING
   CALL GET_KEY
   CMP INPUT,1BH ;CHECK IF INPUT MATCHES ESCAPE KEY. IF NOT, CONITNUE MOVING. IF IT DOES, JUMP TO TERMINATE POC TO EXIT
   JE ENDING
   
   MOV DL, ENEMY_PARTY_COL
   MOV DH, ENEMY_PARTY_ROW ; set coordinates in spot when arrow  was pressed. 
   CALL ENEMY_SET_CURSOR
   CALL ENEMY_READ_CURSOR
      
   ;DISPLAY A CHAR
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
	CMP ENEMY_PARTY_ROW,01H ;REACHED THE TOP
	JE RESET_UR
	
	INC ENEMY_PARTY_COL
	CMP ENEMY_PARTY_COL,4EH   ;REACHED THE RIGHT.
	JE UPLEFT
	JMP ENEMY_ITERATE ; WHOLE LOOP
	
	DOWNRIGHT:
	CALL ENEMY_DELETE_PREV
	MOV ENEMY_MAX,02
	INC ENEMY_PARTY_ROW
	CMP ENEMY_PARTY_ROW,18H ;REACHED THE BOTTOM 
	JE RESET_DR
	INC ENEMY_PARTY_COL
	
	CMP ENEMY_PARTY_COL,4EH  
	JE DOWNLEFT
	JMP ENEMY_ITERATE
	
   
    DOWNLEFT:
	CALL ENEMY_DELETE_PREV
	MOV ENEMY_MAX,03
    INC ENEMY_PARTY_ROW
    DEC ENEMY_PARTY_COL
    CMP ENEMY_PARTY_ROW,18H
	JE RESET_DL
	CMP ENEMY_PARTY_COL,01H; REACHED THE LEFT
	JE DOWNRIGHT
	JMP ENEMY_ITERATE
	
    UPLEFT:
	CALL ENEMY_DELETE_PREV
	MOV ENEMY_MAX,04
    DEC ENEMY_PARTY_ROW
    DEC ENEMY_PARTY_COL
    CMP ENEMY_PARTY_ROW,01H; REACHED THE TOP
	JE RESET_UL
	CMP ENEMY_PARTY_COL,01H; REACHED THE LEFT
	JE UPRIGHT
	JMP ENEMY_ITERATE

	
   RET

 ENEMY_ITERATE ENDP 
  
  
	RESET_DL PROC NEAR ; RESET COLUMN//RIGHT TO LEFT MOTION
 
	 CMP ENEMY_PARTY_COL,0AH
	 JE UPRIGHT
	 
	 JMP UPLEFT
	 RET 
	RESET_DL ENDP   
  ;___________________
	RESET_DR PROC NEAR ; RESET COLUMN//RIGHT TO LEFT MOTION
 
	 CMP ENEMY_PARTY_COL,4EH
	 JE UPLEFT
	 
	 JMP UPRIGHT
	 RET 
	RESET_DR ENDP   
  ;____________________
   RESET_UR PROC NEAR  
   
	CMP ENEMY_PARTY_COL,4EH ;REACHED THE UPRIGHT
	JE DOWNLEFT
	
	JMP DOWNRIGHT
	
	RET
	
	RESET_UR ENDP 
    ;________________ 
	
	RESET_UL PROC NEAR 
 
	CMP ENEMY_PARTY_COL,01H
	JE DOWNRIGHT
	
	JMP DOWNLEFT
	 
	RET
	RESET_UL ENDP 
	
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
ENEMY_LASTPRINT PROC NEAR
 
   MOV DL, ENEMY_PARTY_COL
   MOV DH, ENEMY_PARTY_ROW ; set coordinates in spot when arrow  was pressed. 
   CALL ENEMY_SET_CURSOR
   CALL ENEMY_READ_CURSOR
      
   ;DISPLAY A CHAR
   MOV     AL, 02H
   MOV     AH, 02H
   MOV     DL, AL
   INT     21H
  
  JMP ENEMY_ITERATE

 RET
ENEMY_LASTPRINT ENDP 

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
  ;MOV CX,20H
  INT 10H
  
 
  RET
ENEMY_SET_CURSOR ENDP

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~	
 
ENEMY_READ_CURSOR PROC NEAR
	MOV AH, 08H
	MOV BH, 00
	INT 10H
	
	
	CMP AL, 2AH
    JE SORTER
    JMP NEVERMIND
    
   	 SORTER:
     CMP ENEMY_MAX,01 ;  UPRIGHT 
	 JE DOWNRIGHT
	 CMP ENEMY_MAX,02 ;  DOWNRIGHT  
	 JE DOWNLEFT
	 CMP ENEMY_MAX,03;DOWNLEFT 
	 JE DOWNRIGHT
	 CMP ENEMY_MAX,04 ;UPLEFT 
	 JE UPRIGHT
	 
	 
   NEVERMIND:
	RET
ENEMY_READ_CURSOR ENDP

;-------------------------------------------------------

TEST_SET_CURSOR PROC NEAR

  MOV AH, 02H   ;function code to request for set cursor
  MOV BH, 00    ;page number 0, i.e. current screen
  ;MOV CX,20H
  INT 10H
  
  RET
TEST_SET_CURSOR ENDP
  
	
GET_KEY PROC    NEAR
 
           CHECK:
         
           
           
            MOV     AH, 01H     ;check for input.
            INT     16H
 
            JZ      LEAVETHIS  ;NO INPUT DETECTED.LEAVE THE PROC
 
           
            MOV     AH, 00H     ; INPUT DETECTED
            INT     16H
            MOV     INPUT,AL
   
           
 
 
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

DELAY PROC  NEAR
            mov bp,2 ;lower value faster
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
 
 
END MAIN