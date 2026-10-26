 ;*************************************************************************
 ; Your Name: Melody Scott
 ; Project Due Date: October 28, 2026
 ; Project Name: Encryption
 ; CSCI-10 M2465: Computer Architecture and Organization
 ; Fall 2026
 ; Project Description: Applies a caesar cipher that you define to a string that you give it
 ;*************************************************************************
;data section: contains initialized data, like variables and constants
section .data
    bufferLen equ 100
;bss section: contains uninitialized data, declared but not assigned data yet (stands for Block Starting Symbol)
section .bss
    buffer resb bufferLen

;text section: contains the code for the program
section .text
global main
main:
    mov ebp, esp; for correct debugging 
    ;WRITE YOUR CODE UNDER THIS LINE***********************************
    mov eax, 3
    mov ebx, 0
    mov ecx, buffer
    mov edx, bufferLen
    int 0x80
    
    sub byte [buffer], `0`
    
    mov esi, buffer
    inc esi
    mov edi, buffer
    add edi, eax
    
    
    print:
        cmp esi, edi
        je end
        
        mov eax, [buffer]
        add byte [esi], eax
        mov eax, 4
        mov ebx, 1
        mov ecx, esi
        mov edx, 1
        int 0x80
        
        inc esi
        jmp print
    end:
    
    
    ;Exit the program
    ;Your program will stop running after this executes!
    mov eax, 1 ;sys_exit system call number
    mov ebx, 0 ;sys_exit, return 0 status on exit - 'No Errors'
    int 80h ;interrupt to invoke a system call (and exit the program)
