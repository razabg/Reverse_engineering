;raz abergel

include 'win32a.inc'

format PE console
entry start

section '.data' data readable writeable
   res dd 0
	
section '.text' code readable executable
; ======================================
	
my_mul: ;Void my_mul(int a, int b, int *result)
	push	ebp
	mov		ebp, esp
	mov		eax, [ebp+16];int a
	imul    eax,[ebp+12] ; int b
	mov     ebx,[ebp+8]	;int * result. take the address of res(which is in ecx) into ebx
	mov 	[ebx],eax  ; 
	pop		 ebp
	ret 	 12
	

start:
		
		lea ecx,[res] ;take the address of res and load it into ecx
		push 3
		push 2
		push ecx
		
		call my_mul
		xor eax,eax
		mov eax,[res]
		call print_eax ;print the result 6
	
exit:
	push	0
	call	[ExitProcess]
	
	
include 'training.inc'

		

