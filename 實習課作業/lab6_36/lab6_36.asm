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
	
	result BYTE 81 DUP(?)
.code
hi PROC uses ecx
	mov ecx,9
	mov eax,1
L:
	mul ebx
	mov result[esi],al
	mov edx,10
	sub edx,ecx
	mov eax,edx
	inc esi
	inc eax
	Loop L
	ret
hi ENDP

main PROC
	mov eax,0
	mov esi,0		
	mov ebx,1
	mov ecx,9
L1:
	CALL hi
	inc ebx
	Loop L1
	exit
main ENDP
END main