TITLE Example of ASM              (helloword.ASM)

; This program locates the cursor and displays the
; system time. It uses two Win32 API structures.
; Last update: 6/30/2005

INCLUDE Irvine32.inc

; Redefine external symbols for convenience
; Redifinition is necessary for using stdcall in .model directive 
; using "start" is because for linking to WinDbg.  added by Huang
.stack 4096
ExitProcess proto,dwExitCode:dword	
DifferentInputs proto, v1:dword, v2:dword, v3:dword	
main          EQU start@0

;Comment @
;Definitions copied from SmallWin.inc:

.data

.code

main PROC  
 	invoke DifferentInputs,2,2,3
    	invoke DifferentInputs,2,3,2
    	invoke DifferentInputs,3,5,5
    	invoke DifferentInputs,2,2,2
    	invoke DifferentInputs,104522064,109502517,109502555

	call WaitMsg
	invoke ExitProcess,0
 	exit
main ENDP
DifferentInputs proc,
	v1:dword, v2:dword, v3:dword
	mov eax,v1   	 
	cmp v2,eax             
	je  Label_Equal 
	cmp v3,eax        
	je   Label_Equal
	mov eax,v2
	cmp v3,eax        
	je   Label_Equal
	mov eax,1
	jmp exit_label
Label_Equal: 
    mov  eax,0      ; return false
	
exit_label:
    call DumpRegs
    ret
DifferentInputs endp

END main