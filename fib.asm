; nasm -felf64 fib.asm && gcc -no-pie fib.o && time ./a.out 45

        global  main
        extern  atoi
        extern  printf

        section .text
main:

        push    rbx                     ; we have to save this since we use it

       ; add     rsi, 8                  ; point to next argument
       ; dec     rdi                     ; count down
        
        push    rdi                     ; save registers that puts uses
        push    rsi
        sub     rsp, 8                  ; must align stack before call


        mov      rdi, [rsi+rdi*4]       ; argv[rdi]
       ; mov     rdi, [rsi]              ; the argument string to display
       ; call    puts                    ; print it
        call     atoi                   ; now rax has the int value of arg
        add     [sum], rax

        add     rsp, 8                  ; restore %rsp to pre-aligned value
        pop     rsi                     ; restore registers puts used
        pop     rdi

        
        mov     ecx, [sum]              ; ecx will countdown to 0

        xor     rax, rax                ; rax will hold the current number
        xor     rbx, rbx                ; rbx will hold the next number
        inc     rbx                     ; rbx is originally 1
fibo:

        mov     rdx, rax                ; save the current number
        mov     rax, rbx                ; next number is now current
        add     rbx, rdx                ; get the new next number
        dec     ecx                     ; count down
        jnz     fibo                    ; if not done counting, do some more

print:
        ; We need to call printf, but we are using rax, rbx, and rcx.  printf
        ; may destroy rax and rcx so we will save these before the call and
        ; restore them afterwards.

        push    rax                     ; caller-save register
        push    rcx                     ; caller-save register

        mov     rdi, format             ; set 1st parameter (format)
        mov     rsi, rax                ; set 2nd parameter (current_number)

        xor     rax, rax                ; because printf is varargs

        ; Stack is already aligned because we pushed three 8 byte registers
        call    printf                  ; printf(format, current_number)

        pop     rcx                     ; restore caller-save register
        pop     rax                     ; restore caller-save register


        pop     rbx                     ; restore rbx before returning
        ret

format:
        db  "%20ld", 10, 0

        section  .data
sum:  dq       0