[org 0x7c00] ; Початок BOOT сектора
[bits 16]

call interface

; hanging out
jmp $ ; Тут конструкція jmp стрибає на одній і тій же адресі

; Процедура, яка показує користувачу інтерфейс, а також зчитує його вибір
; Вхід: різні змінні в cегменті даних
; Вихід: -
interface:
       mov si, MESG ; Записуємо в SI адресу повідомлення, яке хочемо надрукувати
       call printf 
       mov si, COUNT
       call printf
       mov si, EXIT
       call printf
; Зчитуємо введений з клавіатури символ і порівняємо з наявними командами
; Вхід: -
; Вихід: -
reading_char:
       call read_char
       cmp al, 'e'
       je out ; Вихід з програми
       cmp al, 'q'
       je eval ; Обчислення виразу
       jmp reading_char  ; Якщо символ якийсь інший, то продовжуємо чекати інший символ

; Друкуємо повідомлення виходу з програми
; Вхід: змінна EXITED_MESG
; Вихід: -
out:
       mov si, EXITED_MESG
       call printf
       ret ; Ця інструкція поверне виконання програми одразу на рядок, де йде зависання на місці (тобто, це вихід з процедури interface)

; Обчислення виразу
; Вхід: змінні a1..a5, A1_EQ..A5_EQ, EXPRESSION, RESULT_MESG
; Вихід: AX - результат
eval:
       mov si, EXPRESSION
       call printf
       call print_values
       mov si, RESULT_MESG
       call printf  

       mov ax, a1 ; AX = a1
       add ax, a2 ; AX = AX + a2
       mov bx, a3 ; BX = a3
       imul bx  ; AX = AX * BX
       mov bx, a4 ; BX = a4
       idiv bl  ; AL = AX / BL
       cbw ;  Знакове розширення AL до AX
       add ax, a5 ; AX = AX + a5
       call print_number
       jmp interface 

; Зчитування введеного символа
; Вхід: -
; Вихід: читаний символ в AL
read_char:
       mov ah, 0 ; Зчитування одного символу
       int 0x16 ; Виклик переривання
       ret

; Ця процедура друкує на екран вхідні параметри виразу, що обчислюється
; Вхід: змінні a1..a5, A1_EQ..A5_EQ
; Вихід: -

print_values:
       mov si, A1_EQ
       call printf  
       mov ax, a1
       call print_number

       mov si, A2_EQ
       call printf  
       mov ax, a2
       call print_number

       mov si, A3_EQ
       call printf  
       mov ax, a3
       call print_number

       mov si, A4_EQ
       call printf  
       mov ax, a4
       call print_number

       mov si, A5_EQ
       call printf  
       mov ax, a5
       call print_number
       ret

; Функція, що друкує число (однорозрядне), додатнє або від'ємне
; Вхід: AX (число)
; Вихід: -
print_number:
       cmp ax, 0 ; Перевіряємо, чи є число від'ємним
       jge positive
       push ax
       mov al, '-' 
       mov ah, 0x0e
       int 0x10 ; Друкуємо на екран мінус
       pop ax
       neg ax
       positive:
               add ax, 0x30 ; Тепер в AX знаходиться ASCII код потрібної цифри
               mov ah, 0x0e
               int 0x10
               ret


%include "./printf.asm" ; Підключаємо процедуру printf з іншого файлу

MESG db 10,13,10,13,"You're in the main menu. Navigation: ",10,13,0 ; 0 - кінець рядка, який розпізнає наша процедура printf
COUNT db EVAL_KEY,' - evaluate the expression',10,13,0
SOUND db SOUND_KEY,' - play sound',10,13,0
EXIT db EXIT_KEY,' - to exit from program',10,13,0
RESULT_MESG: db 10,13,10,13,"Result: ",10,13,0
EXITED_MESG: db 'You exited from the program. Consider restarting your PC. ',10,13,0
EXPRESSION: db 10,13,'Evaluating expression: ',10,13,'( (a1 + a2) * a3 / a4 + a5 )',10,13,0

A1_EQ: db 10,13,"a1 = ",0
A2_EQ: db 10,13,"a2 = ",0
A3_EQ: db 10,13,"a3 = ",0
A4_EQ: db 10,13,"a4 = ",0
A5_EQ: db 10,13,"a5 = ",0


a1: equ -7
a2: equ 3
a3: equ 2
a4: equ 4
a5: equ 1

EVAL_KEY equ 'q'
SOUND_KEY equ 'W'
EXIT_KEY equ 'e'


times 510-($-$$) db 0 ; Відступ у сегменті бутлоадера (його розмір - 512 байт, тому треба дозаповнити пам'ять к-стю байт, рівною 512 мінус поточний розмір нашої програми)

dw 0xaa55 ; Спеціальне число, необхідне вкінці програми 
