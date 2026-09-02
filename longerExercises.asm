 ;*************************************************************************
 ; Your Name: Melody Scott
 ; Project Due Date: at end of class
 ; Project Name: Longer Exercises
 ; CSCI-10 M2465: Computer Architecture and Organization
 ; Fall 2026
 ; Project Description: stuff
 ;*************************************************************************
;data section: contains initialized data, like variables and constants
section .data
    digit db '0'
;bss section: contains uninitialized data, declared but not assigned data yet (stands for Block Starting Symbol)
section .bss

;text section: contains the code for the program
section .text
global main
main:
    mov ebp, esp; for correct debugging 
    ;WRITE YOUR CODE UNDER THIS LINE***********************************
    
    ; count up from 1 to 9 but NO 5. absolutely not. all my homies HATE 5. disgusting.
    counter:
        inc byte [digit]
        
        cmp byte [digit], '5'
        je skipFive
        mov eax, 4 ; print
        mov ebx, 1 ; stdout
        mov ecx, digit ; value
        mov edx, 1 ; len
        int 0x80
        skipFive:
        
        cmp byte [digit], '8'
    jle counter
    
    
    ;Exit the program
    ;Your program will stop running after this executes!
    mov eax, 1 ;sys_exit system call number
    mov ebx, 0 ;sys_exit, return 0 status on exit - 'No Errors'
    int 80h ;interrupt to invoke a system call (and exit the program)
