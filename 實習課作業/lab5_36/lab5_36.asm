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
	myID BYTE 31h, 30h, 39h, 35h, 30h, 32h, 35h, 31h, 37h
	myID2 BYTE 31h, 30h, 39h, 35h, 30h, 32h, 35h, 35h, 35h
	size_ID DWORD 9
	result BYTE 9 DUP(?)
.code


main PROC		
	mov esi ,0
	mov ecx,size_ID
L1:
	mov al,myID[esi]
	cmp al,myID2[esi]
	ja L2
	jb L3
	jz L4
L2:
	mov result[esi],42h
	inc esi
	Loop L1
	jmp L5
L3:
	mov result[esi],43h
	inc esi	
	Loop L1
	jmp L5
L4:
	mov result[esi],41h
	inc esi
	Loop L1
	jmp L5
L5:
	exit
main ENDP
END main