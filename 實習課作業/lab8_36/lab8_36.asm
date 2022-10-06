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
FindLargest PROTO,
	ptrarr:PTR SDWORD,
	szarr:DWORD
.data
Ex1Array sdword 105522063,109502517,109502555
Ex2Array sdword -105522063,-109502517,-109502555
.code

main PROC  
 	invoke FindLargest,OFFSET EX1Array,LENGTHOF EX1Array
	invoke FindLargest,OFFSET EX2Array,LENGTHOF EX2Array
	call WaitMsg
	invoke ExitProcess,0
 	exit
main ENDP
FindLargest PROC,
	ptrarr:PTR SDWORD,
	szarr:DWORD
	
	push esi
	push ecx
	mov eax,80000000h
	mov esi,ptrarr
	mov ecx,szarr
L1:
	cmp [esi],eax
	jl L2
	mov eax,[esi]
L2:
	add esi,4
	LOOP L1
	call WriteInt
	call Crlf
	pop ecx
	pop esi
	ret
FindLargest ENDP
END main