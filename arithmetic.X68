*-----------------------------------------------------------
* Title      : Arithmetic
* Written by : Noor Alali
* Date       : 2017/02/20
* Description:
*-----------------------------------------------------------
        ORG    $1000
START:                  ; first instruction of program

* Put program code here

        SUB D0,D0
        SUB D1,D1
        SUB D2,D2
        SUB D3,D3
                
        MOVEA D0,A0 ; A0 <- 0
        MOVE CONST(A0),D3 ; D3 <- 4
        MOVE CONST+2(A0),D1 ; D1 <- 8
        MOVE CONST+4(A0),D2 ; D2 <- 1
        MOVE #$5,D0 ; D0 <- 5 "X"
        
        CMP #$4,D0
        BEQ THEN
        CMP #$00B9,D0
        BGT THEN
        CMP #$FF4B,D0
        BLT THEN
        
        MOVE D0,X(A0)
        
        SUB D3,D0 ; 5-4 = 1 = D0
        MULS D0,D0 ; 1*1 = 1 = D0 
        DIVS D0,D2 ; 1/1 = 1 = D2
        ADD D1,D2 ; 1+8 = 9 = f = D2
        TRAP #15
        
THEN    MOVE DUMP(A0),D0
        TRAP #15
        
X       DS.B 1 ; 1 byte of uninitialized storage
CONST   DC 4,8,1
DUMP    DC 0
        END    START


*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
