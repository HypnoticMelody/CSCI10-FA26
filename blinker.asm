 ;*************************************************************************
 ; Your Name: Melody Scott
 ; Project Due Date: Oct 7
 ; Project Name: Blinker
 ; CSCI-10 M2465: Computer Architecture and Organization
 ; Fall 2026
 ; Project Description: blinks left or right however many times and like, exits when it needs to / is told to or whatever
 ;*************************************************************************
;data section: contains initialized data, like variables and constants
section .data
    prompt1 db `What direction?\n`
    prompt1Len equ $-prompt1
    prompt2 db `How many?\n`
    prompt2Len equ $-prompt2
    
    dummy db `You didn't use a viable character, ya dummy!\n`
    dummyLen equ $-dummy
    
    left db `<-blink\n`
    right db `blink->\n`
    blinkLen equ $-right
;bss section: contains uninitialized data, declared but not assigned data yet (stands for Block Starting Symbol)
section .bss
    input resb 1
    count resb 1
;text section: contains the code for the program
section .text
global main
L:
    mov ecx, left
    jmp DIR
R:
    mov ecx, right
DIR:
    mov eax, 4
    mov ebx, 1
    mov edx, blinkLen
    int 0x80
    dec byte [count]
    cmp byte [count], 0
    jne DIR
    jmp cycle
main:
    mov ebp, esp; for correct debugging 
    ;WRITE YOUR CODE UNDER THIS LINE***********************************
    cycle:
        mov eax, 4
        mov ebx, 1
        mov ecx, prompt1
        mov edx, prompt1Len
        int 0x80
        
        mov eax, 3
        mov ebx, 0
        mov ecx, input
        mov edx, 1
        int 0x80
        
        cmp byte [input], `Q`
        je Q
        
        mov eax, 4
        mov ebx, 1
        mov ecx, prompt2
        mov edx, prompt2Len
        int 0x80
        
        mov eax, 3
        mov ebx, 0
        mov ecx, count
        mov edx, 1
        int 0x80
        sub byte [count], "0"
        
        cmp byte [input], `L`
        je L
        cmp byte [input], `R`
        je R
        
        jmp yaDummy
    
    yaDummy:
        mov eax, 4
        mov ebx, 1
        mov ecx, dummy
        mov edx, dummyLen
        int 0x80
    Q:
    ;Exit the program
    ;Your program will stop running after this executes!
    mov eax, 1 ;sys_exit system call number
    mov ebx, 0 ;sys_exit, return 0 status on exit - 'No Errors'
    int 80h ;interrupt to invoke a system call (and exit the program)
