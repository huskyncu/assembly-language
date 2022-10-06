TITLE Example of ASM              (helloword.ASM)

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

.data
	Result byte 9 DUP(?)	
.code
main PROC		
	mov ecx,9
	mov esi,OFFSET result
	mov bl,1
L:
	mov al,9
	mul bl
	mov [esi],al
L2:
	inc bl
	inc esi
	LOOP L
	exit
main ENDP
END main