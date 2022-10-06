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
MyID   DWORD ?
Digit0 BYTE 2
Digit1 BYTE 5
Digit2 BYTE 1
Digit3 BYTE 7
	
.code
main PROC		
	movzx ecx,Digit0
	shl ecx,24
	movzx ebx,Digit1
	shl ebx,16
	movzx eax,Digit2
	shl eax,8
	mov al,Digit3
	add eax,ebx
	add eax,ecx
	mov MyID,eax
	exit
main ENDP
END main