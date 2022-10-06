TITLE Example of ASM              (helloword.ASM)

; This program locates the cursor and displays the
; system time. It uses two Win32 API structures.
; Last update: 6/30/2005

INCLUDE Irvine32.inc

; Redefine external symbols for convenience
; Redifinition is necessary for using stdcall in .model directive 
; using "start" is because for linking to WinDbg.  added by Huang
.stack 4096
CountMatches PROTO,
	ptr1: PTR SDWORD,
	ptr2: PTR SDWORD,
	arrSize: DWORD
	
main          EQU start@0

;Comment @
;Definitions copied from SmallWin.inc:


.data
	array1 sdword 10,5,4,-6, 2,11,12
	array2 sdword 10,5,3, 1, 4, 2, -6
.code



main PROC  
	INVOKE CountMatches,OFFSET array1,OFFSET array2,LENGTHOF array2
 	exit
main ENDP
CountMatches PROC,
	ptr1: PTR SDWORD,
	ptr2: PTR SDWORD,
	arrSize: DWORD
	push esi
	push edi
	mov eax,0
	mov edi,ptr1
	mov esi,ptr2
	mov ecx,arrSize
	
L1:
	push ecx
	mov ecx,arrSize
;L2:
	mov ebx,[esi]
	cmp [edi],ebx
	jne L
	inc eax
L:
	add esi,4
	;loop L2
	add edi,4
	;mov esi,ptr2
	pop ecx
	LOOP L1
	ret
CountMatches ENDP
END main