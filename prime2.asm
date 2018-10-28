extern printf
extern scanf

section .data

	req: db "enter the number" ,10,0
	reqf: dd "%s" ,0
	num: dd 0
	numf: dd "%d",0
	count: dd 0
	str: db "number is prime!" ,10,0
	strf: db "number is composite!" ,10,0
	
section .text

	global_start:
	
	_start:
	
	push ebp
	mov ebp, esp

	push req
	push reqf
	call printf

	push num
	push numf
	call scanf

	l2:
	add count,1

	push eax,1
	push ebx,0
	l1:
	mod ebx,dword[num] , eax 
	cmp ebx,0
	je l2
	cmp eax, dword[num]
	add eax,1
	jle l1
	
	cmp count,2
	jge l3
	
	push str
	push reqf
	call printf

	l3:
	push strf
	push reqf
	call printf

	mov eax,0
	mov esp,ebp
	pop ebp
	ret

	
		
	
