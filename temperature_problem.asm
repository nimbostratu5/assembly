*-----------------------------------------------------------
* Title      : Celsius/Farenheit conversion
* Written by : NOOR ALALI 
* Date       : 2017-03-24
* Description: 
*-----------------------------------------------------------
    ORG    $5000
START:                 

         CLR.L D0
         CLR.L D1
         CLR.L D2
         CLR.L D3
         CLR.L D4
         CLR.L D5
         CLR.L D6
         MOVEA.L #CELCIUS,A0 ;assigning celcius array to a0
         MOVEA.L #FAHREN,A1  ;assigning fahren array to a1
         
         MOVE.L #$20,D1  	 ; NUMBER TO ADD (32)
         MOVE.W #$16C,D2 	 ; 16C = 365-1

CONV     MOVE.W (A0)+,D0 	 ; insert value to D0, increment by 1
         MULS #$9,D0	 	 ; the following 3 lines consist of the Tc->Tf equation
         DIVS #$5,D0
         ADD  D1,D0
         *JSR ASCI
         MOVE.W D0,(A1)+ 	 ; STORING THE NEW VALUES TO ARRAY FAHREN         
         DBRA D2,CONV   	 ; LOOP BACK TO CONV
         
RESET    CLR.L D2
         MOVE.W #$16C,D2

AVRG     MOVE.W (A1)+,D5	 ; insert value to d5, increment by 1
         ADD D5,D6			 ; sums all the temeperatures of fahrenheit
         DBRA D2,AVRG		 ; loops until done, d2 = 364
         DIVS #$16C,D6	     ; divide sum by 365
         MOVE.W D6,AVERAGE   
         
         
*ASCI     MOVE.L D0,D4
*         DIVS #$10,D4 		 ; dividing by 16 to have individual digits of the byte
*                      		 ; upper part will contain 4bits, lower part will contain 4bits
*         MULS         		 ; lower part will be multiplied by 16^1
*         SWAP D4      		 ; swapping so that upper part -> lower part
*         MULS         		 ; new lower part will be multiplied by 16^0
*                      		 ; IDEALLY BOTH NIBBLE SHOULD BE STORED IN DIFFERENT Dn 
*                      		 ; NEXT, OUTPUT  IN ASCII
*		  TRAP #14	   		 ;
*         RTS          		 ; return back in order to store new value to fahren array

FAHREN   DS.L 365 *...this is where the 365 fahrenheit values are stored
CELCIUS  DC.W 1,2,3,4,5,6 *...the 365 different temperatures
AVERAGE  DS.L 1


    END    START        

	
	
	