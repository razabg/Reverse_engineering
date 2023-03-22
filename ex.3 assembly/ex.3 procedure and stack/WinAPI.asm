;raz abergel


; Program receives a string from console, 
; calculates length and prints message to console
; Implementing syscalls GetStdHandle, ReadFile, printf
; Author - Barak Gonen

include 'win32a.inc'

format PE console
entry start

INPUT_SIZE_LIMIT = 100h

; ======================================
section '.data' data readable writeable
    prompt_string	db	'Please enter text', 13, 10, 0
	bytes_read		dd	?
	user_string		db	INPUT_SIZE_LIMIT dup (?), 0
	result_string	db 	'User entered: %sLength: %d'
	
; ======================================	
section '.text' code readable executable
start:
	; Show prompt message
	
	push  	prompt_string
	call	[printf]
	add   	esp,4 ;return esp to its previeus spot
	
	
	; Get console input handle - returned in EAX
	push 	STD_INPUT_HANDLE	; from win32a.inc, default is console
	call	[GetStdHandle]
	
	; Read from the device pointed by EAX
			;microsoft documentaion-
			
			;	BOOL ReadFile(
			; [in]                HANDLE       hFile,
			; [out]               LPVOID       lpBuffer,address of number of bytes read 
			; [in]                DWORD        nNumberOfBytesToRead,
			;[out, optional]     LPDWORD      lpNumberOfBytesRead,
			;[in, out, optional] LPOVERLAPPED lpOverlapped
	
			; according to https://docs.microsoft.com the function has 5 param
			
	push 	0 
	push   	bytes_read       ;address
	push   	INPUT_SIZE_LIMIT ;100h
	push   	user_string	;where to insert the input
	push    eax ; ;read from the reg
	call	[ReadFile]
	
	; Get string length, pointed by EAX 
	push 	user_string
	call	[strlen]
	sub 	eax,2 ;substruct the end of line
	
	
	; print string to console
	;according to msdn printf get 3 param,format,argument,locale
	push 	eax
	push 	user_string;argument
	push	result_string ;format
	call	[printf]
		
	
	push	0
	call	[ExitProcess]

section '.idata' import data readable

library kernel32, 'kernel32.dll',\
		msvcrt, 'msvcrt.dll'
		
import	kernel32,\
		ExitProcess, 'ExitProcess',\
		GetStdHandle, 'GetStdHandle',\
		ReadFile, 'ReadFile'
		
import	msvcrt,\
		printf, 'printf',\
		strlen, 'strlen'
		

