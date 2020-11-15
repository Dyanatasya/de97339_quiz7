#include<p18f4550.inc>

		org 0x00
		goto start
		org 0x08
		retfie
		org 0x18
		retfie
		
start	clrf TRISD,A ; clear TRISD file
		setf TRISB,A ; Set TRISB file
		clrf PORTD,A ; clear PORTD file
		check btfsc PORTB,0,A ;bit test file , skip clear
		bra onLED0 ;on the first LED
		btfsc PORTB,1,A ;bit test file , skip clear
		bra onLED1 ;on the second LED
		clrf PORTD,A ;Clear PORTD
		bra check ; branch to 'check' subroutine
		
onLED0	bsf PORTD,0,A
		bra check
		
onLED1	bsf PORTD,1,A
		bra check
		end