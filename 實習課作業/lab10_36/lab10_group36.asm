TITLE Example of ASM              (helloword.ASM)

; This program locates the cursor and displays the
; system time. It uses two Win32 API structures.
; Last update: 6/30/2005

INCLUDE Irvine32.inc

; Redefine external symbols for convenience
; Redifinition is necessary for using stdcall in .model directive 
; using "start" is because for linking to WinDbg.  added by Huang
.stack 4096
Str_copyN PROTO,
    source:PTR BYTE,   
    target:PTR BYTE,   
    maxChars:DWORD
	
main          EQU start@0

;Comment @
;Definitions copied from SmallWin.inc:


.data
string_1 BYTE "109502517",0    
string_2 BYTE "109502555",0


.code

main PROC  
	INVOKE Str_copyN,OFFSET string_1,OFFSET string_2 + 9,(SIZEOF string_2) - 1       

    
	mov  edx, OFFSET string_2
	call WriteString
	call Crlf
	call WaitMsg

	
 	exit
main ENDP
Str_copyN PROC USES eax ecx esi edi,
    source:PTR BYTE,        
    target:PTR BYTE,        
    maxChars:DWORD
    mov ecx,maxChars
    mov esi,source
    mov edi,target
    cld
    rep movsb
    mov byte ptr [edi],0
    ret
Str_copyN ENDP


END main