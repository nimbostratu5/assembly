*-----------------------------------------------------------
* Title      : Name Display
* Written by : NOOR ALALI 
* Date       : 2017-04-12
* Description: 
*-----------------------------------------------------------

PFDR    EQU    $FFFA18
DDRF    EQU    $FFFA1C
PFPAR   EQU    $FFFA1E
PEDR    EQU    $FFFA10
DDRE    EQU    $FFFA14
PEPAR   EQU    $FFFA16

ORG $4000
START   MOVE.W    #$00F0,PEPAR
        MOVE.W    #$00FF,DDRE
        MOVE.W    #$0000,PFPAR
        MOVE.W    #$00FF,DDRF
        BSR        DELAY
        MOVE.W    #$0004,PEDR
        MOVE.W    #$0001,PFDR
        MOVE.W    #$0000,PEDR
        BSR     DELAY
        MOVE.W    #$0004,PEDR
        MOVE.W    #$000F,PFDR
        MOVE.W    #$0000,PEDR
        BSR        DELAY
        
        MOVE.W    #$0005,PEDR
        MOVE.W    #'N',PFDR
        BSR        DELAY
        MOVE.W    #$0001,PEDR
        
        MOVE.W    #$0005,PEDR
        MOVE.W    #'O',PFDR
        BSR        DELAY
        MOVE.W    #$0001,PEDR
        
        MOVE.W    #$0005,PEDR
        MOVE.W    #'O',PFDR
        BSR        DELAY
        MOVE.W    #$0001,PEDR
        
        MOVE.W    #$0005,PEDR
        MOVE.W    #'R',PFDR
        BSR        DELAY
        MOVE.W    #$0001,PEDR
        
        
        
ORG $3000
DELAY   MOVE.W    #$EFFF,D1
DECR    CMP        #$0,D1
        BEQ        END
        SUB        #$1,D1
        BRA        DECR
END        RTS


