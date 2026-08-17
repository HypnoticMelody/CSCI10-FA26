; Welcome to JDoodle!
;
; You can execute code here in 110+ languages. Right now you’re in the NASM IDE.
;
;  1. Click the orange Execute button ▶ to execute the sample code below and see how it works.
;  2. Want help writing or debugging code? Type a query into JDroid on the right hand side ---------------->
;  3. Try the menu buttons on the left. Save your file, share code with friends and open saved projects.
;
; Want to change languages? Try the search bar up the top.


%macro print 2
    mov     ecx, %1 ; value
    mov     edx, %2 ; length
    mov     ebx, 1 ; stdout
    mov     eax, 4 ; sys_write
    int     0x80 ; call
%endmacro


%macro easyAdd 2
    
%endmacro


section .text

global _start

_start:
	print 	msg, len

    mov     eax, [x]
    sub     eax, '0'
    mov     ebx, [y]
    sub     ebx, '0'
    add     eax, ebx
    add     eax, '0'

    mov     [sum], eax

    print 	sum, 1
	print 	msg2, len2 ; space


	mov     eax, [x]
    sub     eax, '0'
    mov     ebx, [y]
    sub     ebx, '0'
    mul     ebx
    add     eax, '0'
	mov     [mult], eax

	print 	mult, 1
	print 	msg2, len2 ; space

    ; xor cx,cx ; cx-register is the counter, set to 0
    ; powLoop: ; Whatever you wanna do goes here, should not change cx
    ;     inc cx ; Increment
    ;     cmp cx,[y] ; Compare cx to the limit
    
    ;     jle powLoop ; Loop while less or equal

	print 	pow, 1
	print 	msg3, len3 ; end bracket

    mov     eax, 1
    int     0x80 ; call

section .data
    x db '5'
    y db '3'
    
    msg db  "[sum, mult, pow] of x and y is "
    len equ $ - msg
	msg2 db " "
	len2 equ $ - msg2
	msg3 db "]"
	len3 equ $ - msg3

segment .bss

    sum resb 1
    mult resb 2
    pow resb 3