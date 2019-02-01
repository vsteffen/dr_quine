global  _main
extern  _printf

section .text

; This is gonna be amazing

_main:
push rbp
mov rbp, rsp
; Very cool function below

print_source_code:
lea rdi, [rel source]
lea rsi, [rel source]
mov rdx, 10
mov rcx, 34
call _printf

exit:
mov rsp, rbp
pop rbp
xor rax, rax
ret


section .data
source: db "global  _main%2$cextern  _printf%2$c%2$csection .text%2$c%2$c; This is gonna be amazing%2$c%2$c_main:%2$cpush rbp%2$cmov rbp, rsp%2$c; Very cool function below%2$c%2$cprint_source_code:%2$clea rdi, [rel source]%2$clea rsi, [rel source]%2$cmov rdx, 10%2$cmov rcx, 34%2$ccall _printf%2$c%2$cexit:%2$cmov rsp, rbp%2$cpop rbp%2$cxor rax, rax%2$cret%2$c%2$c%2$csection .data%2$csource: db %3$c%1$s%3$c%2$c"
