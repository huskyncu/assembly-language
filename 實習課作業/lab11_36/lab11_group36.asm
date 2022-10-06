TITLE Example of ASM              (helloword.ASM)

; This program locates the cursor and displays the
; system time. It uses two Win32 API structures.
; Last update: 6/30/2005

INCLUDE Irvine32.inc

; Redefine external symbols for convenience
; Redifinition is necessary for using stdcall in .model directive 
; using "start" is because for linking to WinDbg.  added by Huang
.stack 4096
Str_remove PROTO,pStart:PTR BYTE,nChars:DWORD
	
main          EQU start@0

;Comment @
;Definitions copied from SmallWin.inc:


.data
	target BYTE "109502517109502555ABCDEF",0

.code



main PROC  
	mov edi,offset target
	mov al,[edi+17]
	mov ecx,LENGTHOF target
	cld
	repne scasb
	dec edi
	mov eax,offset target
	sub edi,eax
	call DumpRegs
	mov edx,offset target
	call WriteString
	call Crlf
	invoke Str_remove,offset target,edi
	mov edx,offset target
	call WriteString
	call Crlf
	call WaitMsg
 	exit
main ENDP
Str_remove PROC,
	pStart:PTR BYTE,	
	nChars:DWORD		

	INVOKE Str_length, pStart
	mov	ecx,eax			

	.IF nChars <= ecx	; check range of nChars
	  sub ecx, nChars 	; set counter for REP prefix
	.ENDIF

	mov esi, pStart	;esi = 字串起始位置
	add esi, nChars	;esi += 要移除的字元數
	mov edi, pStart	;edi = 字串起始位置

	cld               ;clear direction flag
	rep movsb	     ;do the move

	mov	BYTE PTR [edi],0	; insert new null byte

Exit_proc:
	ret
Str_remove ENDP

END main