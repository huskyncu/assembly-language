TITLE Example of ASM               (helloword.ASM)

; This program locates the cursor and displays the
; system time. It uses two Win32 API structures.
; Last update: 6/30/2005

INCLUDE Irvine32.inc

; Redefine external symbols for convenience
; Redifinition is necessary for using stdcall in .model directive 
; using "start" is because for linking to WinDbg.  added by Huang
 
main          EQU start@0

;Comment @
;Definitions copied from SmallWin.inc:
divide MACRO dd,dr,q,r
	mov edx,0
	mov ecx,100
	div cx
	mov q,ax
	mov r,dx
ENDM
.data
dividend WORD 2517
divisor WORD 100
quotient WORD 1 DUP(?)
remainder WORD 1 DUP(?)
.code

main PROC
	movsx eax,dividend		
	call WriteDec
	call Crlf
	divide dividend,divisor,quotient,remainder
	movsx eax,quotient
	call WriteDec
	call Crlf
	movsx eax,remainder
	call WriteDec
	call Crlf
	exit
main ENDP
END main