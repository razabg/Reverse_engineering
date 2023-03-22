;raz abergel ex.2 nested loop

include 'win32a.inc'

format PE console
entry start

section '.data' data readable writeable
    j    dd  0
	i    dd	 1
	num     dd  ?
	space   db  ' '

	
section '.text' code readable executable
; ======================================
	
start:
	 
	call read_hex
	mov ecx,eax ;ecx =num
	inc ecx
	mov ebx,1 ; ebx = i
	mov edx,1; edx = j
	
outter: ;the outter loop 
     cmp ebx,ecx 
	 je done ;when all the iteration are done we'll go to done tag
	 

	
inner: ; the inner loop
	
	cmp edx,ebx
	ja innerdone ; 
	
	mov eax,edx
	call print_eax
	
	inc edx
	jmp inner
	
	
	
innerdone:	     ;every time the inner loop finished one iteration it will come to this tag
	
	inc ebx ;i+1
	xor edx,edx
	inc edx ; j will be again 1
	jmp outter
	
	
done:

; ====================================

	push	0
	call	[ExitProcess]

include 'training.inc'

