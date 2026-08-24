 ;*************************************************************************
 ; Your Name: Melody Scott
 ; Project Due Date: 8/24/26 at end of class
 ; Project Name: Exercises
 ; CSCI-10 M2465: Computer Architecture and Organization
 ; Fall 2026
 ; Project Description: testing our understanding of some basic opcodes
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
    
    ;Exit the program
    ;Your program will stop running after this executes!
    mov eax, 1 ;sys_exit system call number
    mov ebx, 0 ;sys_exit, return 0 status on exit - 'No Errors'
    int 0x80 ;interrupt to invoke a system call (and exit the program)
