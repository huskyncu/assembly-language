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
Str_remove PROTO,
	pStart:PTR byte,
	nChars:DWORD
.data
target1 BYTE "109502517",0 
target2 BYTE "109502555",0 
target3 BYTE "999999999",0

.code

main PROC  
 	INVOKE Str_remove, OFFSET target1, 5 
	mov edx,OFFSET target1
	call WriteString
	call Crlf

	INVOKE Str_remove, OFFSET target2, 2 
	mov edx,OFFSET target2
	call WriteString
	call Crlf

	INVOKE Str_remove, OFFSET [target2+1], 15  
	mov edx,OFFSET target2
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
	.IF nChars <= ecx	
	  sub ecx,nChars	
	.ENDIF

	mov	esi,pStart		
	add	esi,nChars			
	mov	edi,pStart		

	cld					
	rep	movsb			
        mov	BYTE PTR [edi],0	

Exit_proc:
	ret
Str_remove ENDP
END main