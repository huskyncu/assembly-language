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
 ChStr BYTE 2Ah,2Ah,2Ah,2Ah,2Ah,2Ah,2Ah,2Ah 
       BYTE 20h,20h,20h,20h,20h,20h,2Ah,20h 
       BYTE 20h,20h,20h,20h,20h,2Ah,20h,20h 
       BYTE 20h,20h,20h,20h,2Ah,20h,20h,20h 
       BYTE 20h,20h,20h,2Ah,20h,20h,20h,20h 
       BYTE 20h,20h,2Ah,20h,20h,20h,20h,20h 
       BYTE 20h,2Ah,20h,20h,20h,20h,20h,20h
       BYTE 2Ah,20h,20h,20h,20h,20h,20h,20h
 BitStr BYTE 8 DUP(?)
.code
change PROC
 	mov bl,10000000b
 	mov dl,0 
 	mov edi,0
L:
 	mov al,ChStr[esi]
 	cmp al,20h
 	jz L1
 	add al,7h
 	add dl,bl
 	shr bl,1
 	jmp L2
L1:
 	add al,10h
 	shr bl,1
L2:
 	inc esi
 	cmp bl,0
 	jnz L4
 	mov BitStr[edi],dl
 	mov bl,10000000b
 	mov dl,0
 	inc edi
L4:
 	Loop L
 	ret
change ENDP

main PROC  
 	mov esi,0
 	mov ecx,64

 	CALL change

 	mov ecx,8
 	mov esi,0
L3:
 	movzx eax,BitStr[esi]
 	mov ebx,type byte
 	call writebinb
 	call crlf
 	inc esi
 	Loop L3
 	exit
main ENDP
END main