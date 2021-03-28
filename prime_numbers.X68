*-----------------------------------------------------------
* Title      : Prime Numbers
* Written by : NOOR ALALI
* Date       : 2017-03-24
* Description: PROGRAMMING ASSIGNMENT
*-----------------------------------------------------------
    ORG    $4000
PROG:
        CLR D0          ;CLEARING REGISTERS
        CLR D1
        CLR D2
        CLR D4
        
        MOVE.L NUMB,D0  ;MY NUMBER
        MOVE.L PRIM,D1  ;BOOL VARIABLE 
        MOVE.L VARI,D2  ;INT i
        MOVE.L NUMB,D3  ;MY NUMBER TEMP
        
        DIVS #2,D3      ;DIVIDING D3/2. FINDING num/2 
                               
REDO    CMP.W D3,D2     ;COMPARING THE TWO REGISTERS (LOWER WORD)
        BLT LOOP        ;IF D2 IS < D4, GO TO LOOP
        BGE DONE        ;OTHERWISE GO TO DONE
 
LOOP    DIVS D2,D0      ;DIVIDING VALUE IN D0, WHICH IS THE NUMBER CHOSEN, BY VALUE IN D2        
        SWAP D0         ;THE REMAINDER IS IN THE UPPER PART OF THE REGISTER, THIS SERVERS AS THE MODULUS
        CMP.W #$0000,D0 ;COMPARE IF REMAINDER IS 0
        BEQ COND        ;IF YES, GO TO COND
        JMP INCR        ;OTHERWISE, GO TO INCR
        
COND    MOVE.L #$0,D1   ;VALUE IS NOT A PRIME NUMBER, SETTING BOOL VARIABLE (D1) TO FALSE (0)
        JMP DONE        ;GO TO DONE
        
INCR    CMP.W #$FFFF,D2 ;TO AVOID A DIVIDE BY ZERO ERROR
        BEQ DONE        
        ADD.L #$1,D2    ;INCREMENT VARIABLE i (D2) BY 1
        MOVE.L NUMB,D0  ;RE-INITIALIZE D0 TO ORIGINAL CHOSEN NUMBER
        JMP REDO        ;GO TO REDO

DONE    TRAP #15
        
NUMB    DC.L $11 ; CHOSEN NUMBER. IN THIS CASE A PRIME NUMBER. OUTPUT SHOULD BE 1 (TRUE)
VARI    DC.L $2  ; THIS IS VARIABLE i FOUND IN THE FOR-LOOP OF THE PROBLEM
PRIM    DC.L $1  ; BOOL VARIABLE, INITIALIZED TO 1

        end PROG
   




*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
