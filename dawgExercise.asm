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
prompt db `"YOOOOOO DAWG YOU DOWN TO CLOWN??? (y/n)\n`
promptLen equ $-prompt

y db `YEAH DAWG!\n`
yLen equ $-y
n db `NO DAWG!\n`
nLen equ $-n
huh db `Apologies my Dawg, but it seems you put down something other than "y" or "n" and that's not bueno. Would retry that for me?\n`
huhLen equ $-huh

;bss section: contains uninitialized data, declared but not assigned data yet (stands for Block Starting Symbol)
section .bss
input resb 1
;text section: contains the code for the program
section .text
global main
main:
    mov ebp, esp; for correct debugging 
    ;WRITE YOUR CODE UNDER THIS LINE***********************************
    
    ;Print a prompt, then read one character. If the character is 'y', print Yes!.
    ; Otherwise print No!. Exactly one of the two messages should print, and then the program exits.
    ;Add on to the previous question. If you do not get 'y' or 'n' as input,
    ; print '???' and repeat the process. Stop repeating when you get one of the allowed inputs.
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, promptLen
    int 0x80
    
    jmp skip
    retry:
        mov eax, 4
        mov ebx, 1
        mov ecx, huh
        mov edx, huhLen
        int 0x80
    skip:
    
    mov eax, 3
    mov ebx, 0
    mov ecx, input
    mov edx, 1
    int 0x80
    
    cmp byte [input], `y`
    je yes
    cmp byte [input], `n`
    je no
    jmp retry
    
    yes:
        mov eax, 4
        mov ebx, 1
        mov ecx, y
        mov edx, yLen
        int 0x80
        jmp end
    no:
        mov eax, 4
        mov ebx, 1
        mov ecx, n
        mov edx, nLen
        int 0x80
    end:
    ;Exit the program
    ;Your program will stop running after this executes!
    mov eax, 1 ;sys_exit system call number
    mov ebx, 0 ;sys_exit, return 0 status on exit - 'No Errors'
    int 80h ;interrupt to invoke a system call (and exit the program)
