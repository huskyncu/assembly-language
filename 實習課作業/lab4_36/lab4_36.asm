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
	myID BYTE 31h, 30h, 39h, 35h, 30h, 32h, 30h, 31h, 37h
	myID2 BYTE 31h, 30h, 39h, 35h, 30h, 32h, 35h, 35h, 35h
	size_ID DWORD 9
	size_ID2 DWORD 9
.code
Convert PROC USES eax
L1:
	mov eax,[esi]
	add eax,11h
	mov [esi],eax
	inc esi
	loop L1
	ret
Convert ENDP

Convert2 PROC 
	push eax
L2:
	
	mov eax,[esi]
	add eax,11h
	mov [esi],eax
	inc esi
	loop L2	
	pop eax
	ret

Convert2 ENDP


main PROC		
	mov eax,9999h
	mov ebx,9999h
	mov edx,9999h
	mov esi ,OFFSET myID
	mov ecx,size_ID
	call Convert
	mov esi ,OFFSET myID2
	mov ecx,size_ID2
	call Convert2
	exit
main ENDP
END main