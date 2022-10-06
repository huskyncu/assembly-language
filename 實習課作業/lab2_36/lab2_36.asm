TITLE Example of ASM               (helloword.ASM)

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
val1 SBYTE 03h
val2 SBYTE 02h
val3 SBYTE 8fh
result SDWORD ?	
.code
main PROC
	mov edx,0		
	movzx ax,val1
	movzx bx,val2
	add ax,bx
	mov bx,ax
	mov cx,ax
	shl ax,3
	shl bx,2
	shl cx,1
	add ax,bx
	add ax,cx
	movsx dx,val3
	sub dx,ax
	neg dx
	movzx edx,dx
	mov result,edx
	
	
	
	exit
main ENDP
END main