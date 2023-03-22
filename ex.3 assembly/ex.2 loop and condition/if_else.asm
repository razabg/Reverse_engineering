;raz abergel ex.2 for loop

include 'win32a.inc'

format PE console
entry start

	
section '.text' code readable executable
; ======================================
	
start:
	call read_hex
	mov  ebx,eax  ; num1 = ebx
	call read_hex
	mov  ecx,eax; num2 = ecx
	
again:
	cmp ecx,ebx 
	je tag_if	; if equals go to if tag and print 1
	mov eax,0
	call print_eax ; else print 0;
	jmp final; unconditional junp to final
tag_if:
mov eax,1
call print_eax

final:
; ====================================

	push	0
	call	[ExitProcess]

include 'training.inc'

