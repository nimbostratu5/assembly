*-----------------------------------------------------------
* Title      : Subroutine
* Written by : NOOR ALALI 
* Date       : 2017-04-16
* Description: 
*-----------------------------------------------------------

PFDR 	EQU $FFFA18 *SAVE DATA FOR PORT*
DDRF 	EQU $FFFA1C
PFPAR 	EQU $FFFA1E

PEDR	EQU	$FFFA10
DDRE	EQU $FFFA14
PEPAR	EQU $FFFA16	
		
		ORG $3000
START	MOVE.W #$0000,PFPAR	*USE 8PINS*
		MOVE.W #$00FF,DDRF	*WRITE MODE*
		MOVE.W #$000F,PFDR
		
		MOVE.W #$00F0,PEPAR *E 4PINS
		MOVE.W #$00FF,DDRE	*E WRITE MODE
		MOVE.W #$0000,PFPAR *F 8PINS*
		MOVE.W #$00FF,DDRF 	*F WRITE MODE
		
		BSR DELAY
		
		MOVE #$0004,PEDR 
		MOVE #$0001,PFDR
		MOVE #$0000,PEDR
		BSR DELAY 
MOVE #$0004,PEDR
		MOVE #$000F,PFDR
		MOVE #$0000,PEDR
		
		BSR DELAY
		
NAME		MOVE #$0005,PEDR
		MOVE BUF,A0
		MOVE #$0,D5
		
		MOVE A0,PFDR
		MOVE #$0001,PEDR
		BSR INCR
		BSR DELAY
		
FIN		TRAP #15
		DC.W $63	
		END
		
INCR		ADD.L #$1,D5
		ADDA D5,A0
		CMP.L #$4,D0
		BEQ FIN
		RTS
		
DELAY	MOVE.W #$EFFF,D1
DECR		CMP #$0,D1
		BEQ END
		SUB #$1,D1
		BRA DECR
END 		RTS
		
BUF		DC.B 'N','O','O','R'
