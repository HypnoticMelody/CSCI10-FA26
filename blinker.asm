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
    prompt db `Gimme yer inputs!`
    promptLen equ $-prompt
    
    left db `<-`
    right db `blink->`
    blinkLen equ $-right
;bss section: contains uninitialized data, declared but not assigned data yet (stands for Block Starting Symbol)
section .bss
    input resb 1
    count resb 1
;text section: contains the code for the program
section .text
global main
Q:
DIR:
main:
    mov ebp, esp; for correct debugging 
    ;WRITE YOUR CODE UNDER THIS LINE***********************************
    cycle:
        mov eax, 3
        mov ebx, 0
        mov ecx, input
        mov edx, 1
        int 0x80
        
        cmp byte, `Q`
        je Q
        cmp byte, `L`
        je DIR
        cmp byte, `R`
        je DIR
        
        noooComeBack:
        
        jmp cycle:
    
    ;Exit the program
    ;Your program will stop running after this executes!
    mov eax, 1 ;sys_exit system call number
    mov ebx, 0 ;sys_exit, return 0 status on exit - 'No Errors'
    int 80h ;interrupt to invoke a system call (and exit the program)
