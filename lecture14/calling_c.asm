[SECTION .data]
;;; Here we declare initialized data. For example: messages, prompts,
;;; and numbers that we know in advance

[SECTION .bss]
;;; Here we declare uninitialized data. We're reserving space (and
;;; potentially associating names with that space) that our code
;;; will use as it executes. Think of these as "global variables"

[SECTION .text]
;;; This is where our program lives.
global _start                   ; make start global so ld can find it
extern _add2

_start:                         ; the program actually starts here
        push 1
        push 2
        call _add2
        ;; result is in eax, leave it there as the return code
        add esp, 8

        ;; call sys_exit to finish things off
        mov ebx, 0              ; no error
        int 80H                 ; kernel interrupt