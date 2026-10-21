 ;*************************************************************************
 ; Your Name: 
 ; Project Due Date: 
 ; Project Name: 
 ; CSCI-10 M2465: Computer Architecture and Organization
 ; Fall 2026
 ; Project Description:
 ;*************************************************************************
;data section: contains initialized data, like variables and constants
section .data

;bss section: contains uninitialized data, declared but not assigned data yet (stands for Block Starting Symbol)
section .bss
input resb 1

;text section: contains the code for the program
section .text
global main
main:
    mov ebp, esp; for correct debugging 
    ;WRITE YOUR CODE UNDER THIS LINE***********************************
    mov eax, 3
    mov ebx, 0
    mov ecx, input ; shift num
    mov edx, 1
    int 0x80
    
    sub byte [input], `0`
    push input
    push 0x1F ; end of string
    
    mov esi, 0 ; counter
    read:
        inc esi
        
        mov eax, 3
        mov ebx, 0
        mov ecx, input ; character
        mov edx, 1
        int 0x80
        
        push input
        jmp read
    
    print:
        pop eax
        cmp eax, 
    
    
    ;Exit the program
    ;Your program will stop running after this executes!
    mov eax, 1 ;sys_exit system call number
    mov ebx, 0 ;sys_exit, return 0 status on exit - 'No Errors'
    int 80h ;interrupt to invoke a system call (and exit the program)
