global  _main
extern  _getenv
extern  _dirname
extern  _printf
extern  _asprintf
extern  _strstr
extern  _strdup
extern  _fopen
extern  _fprintf
extern  _fclose
extern  _free
extern  _strlen
extern  _system

; I'm useful


section .text

_main:
push rbp
mov rbp, rsp
sub rsp, 0x20
mov dword[rsp], 5
mov dword[rsp+4], 1

check_first_quine:
lea rdi, [rel getenv_arg]
call _getenv
mov rdi, rax
lea rsi, [rel strstr_pattern]
call _strstr
cmp rax, 0
jne check_rerun_quine
mov eax, dword[rsp]
inc eax
mov dword[rsp], eax

check_rerun_quine:
cmp dword[rsp], 0
jg get_filename_to_open
mov rax, 1
jmp exit

get_filename_to_open:
lea rdi, [rel file_source]
call _dirname
mov rdx, rax
lea rdi, [rsp+8]
lea rsi, [rel filename_asprintf]
mov ecx, dword[rsp]
dec ecx
mov dword[rsp], ecx
call _asprintf

open_file:
mov rdi, [rsp+8]
lea rsi, [rel mode]
call _fopen
cmp rax, 0
jne write_file_and_close
mov rax, 1
jmp free_alloc_1

write_file_and_close:
mov r9d, dword[rsp]
push rax
push rax
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

prepare_command_str:
mov rdi, [rsp+8]
call _strdup
mov [rsp+16], rax
mov rdi, [rsp+16]
call _strlen
sub rax, 2
mov r8, [rsp+16]
mov byte [r8+rax], 0
lea rdi, [rel rsp+24]
lea rsi, [rel command]
mov rdx, [rsp+8]
mov ecx, dword[rsp]
call _asprintf
cmp dword[rsp], 0
jle free_alloc_2

exec_command:
mov rdi, [rsp+24]
call _system
mov dword[rsp+4], eax

free_alloc_2:
mov rdi, [rsp+24]
call _free
mov rdi, [rsp+16]
call _free

free_alloc_1:
mov rdi, [rsp+8]
call _free

exit:
mov eax, dword[rsp+4]
mov rsp, rbp
pop rbp
ret


section .data

getenv_arg: db "_", 0
strstr_pattern: db "Sully_", 0
source: db "global  _main%2$cextern  _getenv%2$cextern  _dirname%2$cextern  _printf%2$cextern  _asprintf%2$cextern  _strstr%2$cextern  _strdup%2$cextern  _fopen%2$cextern  _fprintf%2$cextern  _fclose%2$cextern  _free%2$cextern  _strlen%2$cextern  _system%2$c%2$c; I'm useful%2$c%2$c%2$csection .text%2$c%2$c_main:%2$cpush rbp%2$cmov rbp, rsp%2$csub rsp, 0x20%2$cmov dword[rsp], %4$d%2$cmov dword[rsp+4], 1%2$c%2$ccheck_first_quine:%2$clea rdi, [rel getenv_arg]%2$ccall _getenv%2$cmov rdi, rax%2$clea rsi, [rel strstr_pattern]%2$ccall _strstr%2$ccmp rax, 0%2$cjne check_rerun_quine%2$cmov eax, dword[rsp]%2$cinc eax%2$cmov dword[rsp], eax%2$c%2$ccheck_rerun_quine:%2$ccmp dword[rsp], 0%2$cjg get_filename_to_open%2$cmov rax, 1%2$cjmp exit%2$c%2$cget_filename_to_open:%2$clea rdi, [rel file_source]%2$ccall _dirname%2$cmov rdx, rax%2$clea rdi, [rsp+8]%2$clea rsi, [rel filename_asprintf]%2$cmov ecx, dword[rsp]%2$cdec ecx%2$cmov dword[rsp], ecx%2$ccall _asprintf%2$c%2$copen_file:%2$cmov rdi, [rsp+8]%2$clea rsi, [rel mode]%2$ccall _fopen%2$ccmp rax, 0%2$cjne write_file_and_close%2$cmov rax, 1%2$cjmp free_alloc_1%2$c%2$cwrite_file_and_close:%2$cmov r9d, dword[rsp]%2$cpush rax%2$cpush rax%2$cmov rdi, rax%2$clea rsi, [rel source]%2$clea rdx, [rel source]%2$cmov rcx, 10%2$cmov r8, 34%2$ccall _fprintf%2$cpop rax%2$cpop rax%2$cmov rdi, rax%2$ccall _fclose%2$c%2$cprepare_command_str:%2$cmov rdi, [rsp+8]%2$ccall _strdup%2$cmov [rsp+16], rax%2$cmov rdi, [rsp+16]%2$ccall _strlen%2$csub rax, 2%2$cmov r8, [rsp+16]%2$cmov byte [r8+rax], 0%2$clea rdi, [rel rsp+24]%2$clea rsi, [rel command]%2$cmov rdx, [rsp+8]%2$cmov ecx, dword[rsp]%2$ccall _asprintf%2$ccmp dword[rsp], 0%2$cjle free_alloc_2%2$c%2$cexec_command:%2$cmov rdi, [rsp+24]%2$ccall _system%2$cmov dword[rsp+4], eax%2$c%2$cfree_alloc_2:%2$cmov rdi, [rsp+24]%2$ccall _free%2$cmov rdi, [rsp+16]%2$ccall _free%2$c%2$cfree_alloc_1:%2$cmov rdi, [rsp+8]%2$ccall _free%2$c%2$cexit:%2$cmov eax, dword[rsp+4]%2$cmov rsp, rbp%2$cpop rbp%2$cret%2$c%2$c%2$csection .data%2$c%2$cgetenv_arg: db %3$c_%3$c, 0%2$cstrstr_pattern: db %3$cSully_%3$c, 0%2$csource: db %3$c%1$s%3$c, 0%2$cfilename_asprintf: db %3$c%%s/Sully_%%d.s%3$c, 0%2$cfile_source: db __FILE__, 0%2$cmode: db %3$cw%3$c, 0%2$ccommand: db %3$cnasm -f macho64 %%1$s -o Sully_%%2$d.o && clang -Wall -Wextra -Werror Sully_%%2$d.o -o Sully_%%2$d && %%3$s%3$c, 0%2$c", 0
filename_asprintf: db "%s/Sully_%d.s", 0
file_source: db __FILE__, 0
mode: db "w", 0
command: db "nasm -f macho64 %1$s -o Sully_%2$d.o && clang -Wall -Wextra -Werror Sully_%2$d.o -o Sully_%2$d && %3$s", 0
