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
string db "Hi! I'm a string!", 0, 0
;bss section: contains uninitialized data, declared but not assigned data yet (stands for Block Starting Symbol)
section .bss

;text section: contains the code for the program
section .text
global main
main:
    mov ebp, esp; for correct debugging 
    ;WRITE YOUR CODE UNDER THIS LINE***********************************
    mov esi, string
    loop:
        mov eax, 4
        mov ebx, 1
        mov ecx, esi
        mov edx, 1
        int 0x80
        
        inc esi
        inc esi
        cmp byte [esi], 0
        je end
        jmp loop
    end:
    
    ;Exit the program
    ;Your program will stop running after this executes!
    mov eax, 1 ;sys_exit system call number
    mov ebx, 0 ;sys_exit, return 0 status on exit - 'No Errors'
    int 80h ;interrupt to invoke a system call (and exit the program)
