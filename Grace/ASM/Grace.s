%define GRACE_ASM _main
%define SOURCE "%%define GRACE_ASM _main%2$c%%define SOURCE %3$c%1$s%3$c%2$c%2$cglobal  GRACE_ASM%2$cextern  _printf%2$cextern  _fopen%2$cextern  _fprintf%2$cextern  _fclose%2$c%2$c; I'm useful%2$c%2$csection .text%2$c%2$cGRACE_ASM:%2$cpush rbp%2$cmov rbp, rsp%2$c%2$copen_file:%2$clea rdi, [rel filename]%2$clea rsi, [rel mode]%2$ccall _fopen%2$ccmp rax, 0%2$cje exit%2$cpush rax%2$cpush rax%2$c%2$cwrite_file_and_close:%2$cmov rdi, rax%2$clea rsi, [rel source]%2$clea rdx, [rel source]%2$cmov rcx, 10%2$cmov r8, 34%2$ccall _fprintf%2$cpop rax%2$cpop rax%2$cmov rdi, rax%2$ccall _fclose%2$cxor rax, rax%2$cjmp exit%2$c%2$ccall _printf%2$c%2$copen_fail:%2$cmov rax, 1%2$c%2$cexit:%2$cmov rsp, rbp%2$cpop rbp%2$cret%2$c%2$c%2$csection .data%2$csource: db SOURCE, 0%2$cfilename: db %3$cGrace_kid.s%3$c, 0%2$cmode: db %3$cw%3$c, 0%2$c"

global  GRACE_ASM
extern  _printf
extern  _fopen
extern  _fprintf
extern  _fclose

; I'm useful

section .text

GRACE_ASM:
push rbp
mov rbp, rsp

open_file:
lea rdi, [rel filename]
lea rsi, [rel mode]
call _fopen
cmp rax, 0
je exit
push rax
push rax

write_file_and_close:
mov rdi, rax
lea rsi, [rel source]
lea rdx, [rel source]
mov rcx, 10
mov r8, 34
call _fprintf
pop rax
pop rax
mov rdi, rax
call _fclose
xor rax, rax
jmp exit

call _printf

open_fail:
mov rax, 1

exit:
mov rsp, rbp
pop rbp
ret


section .data
source: db SOURCE, 0
filename: db "Grace_kid.s", 0
mode: db "w", 0
