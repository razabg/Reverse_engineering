;raz abergel ex.2 while loop printing fibo seq

include 'win32a.inc'

format PE console
entry start

section '.data' data readable writeable
    fib1    dd  0
	fib2    dd	1
	num     dd  ?
	space   db  ' '

	
section '.text' code readable executable
; ======================================
	
start:
	mov ebx,[fib2]; fib2
	xor ecx,ecx ; temp = ecx
	call read_hex
	mov [num],eax 
	xor eax,eax
	mov  eax,[fib1]
	call print_eax
	xor eax,eax
	mov eax,[fib2]
	call print_eax
	
	
	
again: ;start of while loop
	
	xor ecx,ecx ; reset tmp evert iteration
	add ecx,ebx
	add ecx,[fib1] ;tmp = fib1+fib2
	
	
	
	mov [fib1],ebx ;ebx = fib2
	
	mov ebx,ecx ; fib2 = tmp
	
	mov edx,[num] ; edx = num
	
	cmp edx,ebx 
	JB done ; 
	
	mov eax,ebx
	call print_eax
	jmp again
	
done:

; ====================================

	push	0
	call	[ExitProcess]

include 'training.inc'

