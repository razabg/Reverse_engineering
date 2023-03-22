;raz abergel ex.2 for loop

include 'win32a.inc'

format PE console
entry start

	
section '.text' code readable executable
; ======================================
	
start:
	call read_hex
	mov  ebx,eax  ; num = ebx
	inc  ebx ; num + 1
	
	xor  edx,edx ; i = 0
	xor  ecx,ecx
	
again:
	cmp edx,ebx 
	je done ; 
	add ecx,edx ;ecx = total 
	inc edx
	jmp again
	
done:
mov eax,ecx
call print_eax
; ====================================

	push	0
	call	[ExitProcess]

include 'training.inc'

