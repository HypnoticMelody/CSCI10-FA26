 ;*************************************************************************
 ; Your Name: Melody Scott
 ; Project Due Date: at end of class
 ; Project Name: Short Exercises
 ; CSCI-10 M2465: Computer Architecture and Organization
 ; Fall 2026
 ; Project Description: stuff
 ;*************************************************************************

;data section: contains initialized data, like variables and constants
section .data

;bss section: contains uninitialized data, declared but not assigned data yet (stands for Block Starting Symbol)
section .bss

;text section: contains the code for the program
section .text

global main
main:
    mov ebp, esp; for correct debugging 
    ;WRITE YOUR CODE UNDER THIS LINE***********************************
    
    ; part 1
    mov eax, 5 ; 1
    
    mov ecx, 15 ; 2
    mov edx, ecx
    
    mov eax, 50 ; 3
    mov ebx, 25
    sub eax, ebx
    
    mov eax, 15 ; 4
    mov ebx, 20
    add eax, ebx
    mov eax, ecx
    
    dec ecx ; 5
    
    mov eax, 0 ; 6
    mov ebx, 0
    mov ecx, 0
    mov edx, 0
    
    inc eax ; 7
    add eax, eax
    
    add ebx, ecx ; 8
    dec ebx
    
    ; part 2
    mov eax, 12 ; 1
    add eax, 8
    
    mov edx, 40 ; 2
    sub edx, 15
    
    mov edx, 10 ; 3
    dec edx
    dec edx
    
    mov ebx, 7 ; 4
    mov ecx, ebx
    inc ecx
    
    mov eax, 30 ; 5
    mov ebx, 45
    sub ebx, eax

    ; part 3
    xor ecx, ecx ; 1
    
    mov eax, 25 ; 2
    mov ebx, 5
    mov edx, eax
    add edx, ebx
    
    mov eax, 100 ; 3
    mov ebx, 20
    mov ecx, 5
    sub eax, ebx
    sub eax, ecx
    dec eax
    
    jumpLabel: ; 4
        jmp jumpLabel
    
    ;Exit the program
    ;Your program will stop running after this executes!
    mov eax, 1 ;sys_exit system call number
    mov ebx, 0 ;sys_exit, return 0 status on exit - 'No Errors'
    int 0x80 ;interrupt to invoke a system call (and exit the program)
