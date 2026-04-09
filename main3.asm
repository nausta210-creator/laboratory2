section .data
    prompt_n db 'Введите количество чисел N: ', 0
    prompt_numbers db 'Введите числа: ', 0
    result_msg db 'Результат: ', 0
    space db ' ', 0
    minus db '-', 0
    newline db 10, 0
    
    format_int db '%d', 0
    format_space db ' ', 0

section .bss
    n resd 1              ; N - количество чисел
    num resd 1            ; текущее число
    count resd 1          ; счётчик чётных цифр
    temp resd 1           ; временная переменная
    i resd 1              ; счётчик цикла
    digit resd 1          ; текущая цифра

section .text
    global main
    extern printf, scanf, getchar

main:
    push rbp
    mov rbp, rsp
    
    ; Ввод N
    mov rdi, prompt_n
    call print_string
    
    mov rdi, format_int
    mov rsi, n
    call scanf
    
    ; Вывод приглашения для чисел
    mov rdi, prompt_numbers
    call print_string
    
    ; Цикл для обработки каждого числа
    mov dword [i], 0
    
loop_start:
    mov eax, [i]
    cmp eax, [n]
    jge loop_end
    
    ; Ввод числа
    mov rdi, format_int
    mov rsi, num
    call scanf
    
    ; Проверка: если число < 10
    cmp dword [num], 10
    jl print_minus
    
    ; Подсчёт чётных цифр
    mov dword [count], 0
    mov eax, [num]
    mov [temp], eax
    
count_loop:
    cmp dword [temp], 0
    je print_count
    
    ; Получаем последнюю цифру
    mov eax, [temp]
    mov edx, 0
    mov ecx, 10
    div ecx          ; eax = temp / 10, edx = temp % 10
    mov [temp], eax
    mov [digit], edx
    
    ; Проверяем, чётная ли цифра
    mov eax, [digit]
    and eax, 1       ; проверка младшего бита (1 - нечётное, 0 - чётное)
    cmp eax, 0
    jne count_loop
    
    ; Если чётная - увеличиваем счётчик
    mov eax, [count]
    inc eax
    mov [count], eax
    jmp count_loop

print_minus:
    mov rdi, minus
    call print_string
    jmp after_print

print_count:
    mov rdi, format_int
    mov esi, [count]
    xor eax, eax
    call printf

after_print:
    ; Выводим пробел (кроме последнего элемента)
    mov eax, [i]
    inc eax
    cmp eax, [n]
    jge skip_space
    
    mov rdi, space
    call print_string
    
skip_space:
    ; Увеличиваем счётчик i
    mov eax, [i]
    inc eax
    mov [i], eax
    jmp loop_start

loop_end:
    ; Выводим перевод строки
    mov rdi, newline
    call print_string
    
    pop rbp
    mov eax, 0
    ret

; Функция для вывода строки
print_string:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    
    mov [rsp], rdi        ; сохраняем строку
    mov rax, 0
    call printf
    
    leave
    ret