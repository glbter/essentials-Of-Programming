IDEAL
MODEL small
STACK 256
DATASEG

string db 254 ;string variable def. There is max len ,
str_len db 0    ;под запись реально
                ; числа символов: str_len
db 254 dup ('*') ; Буфер
system_message_1 DB "Input something", 13, 10, '$'

display_message_0 DB "------------menu begin--------", 13, 10, '$'
display_message_1 DB "G - for count", 13, 10, '$'
display_message_2 DB "H - for sound", 13, 10, '$'
display_message_3 DB "k - for exit", 13, 10, '$'
display_message_4 DB "----------The end----------", 13, 10, '$'
display_message_5 DB "------------menu end--------", 13, 10, '$'
display_message_6 DB "c - for max number", 13, 10, '$'
new_line DB " ", 13, 10, '$'
message DB ?

test_message_1 DB "COUNT ((a1+a2) * a3 * a4+a5)", 13, 10, '$'
test_message_2 DB "a1=-1, a2=1, a3=1, a4=2, a5=3", 13, 10
test_message_3 DB "EXIT", 13, 10, '$'
test_message_4 DB "MAX NUM", 13, 10, '$'

var_a1 db -1
var_a2 db 1
var_a3 db 1
var_a4 db 2
var_a5 db 3
result db ?

NUMBER_CYCLES EQU 2000
FREQUENCY EQU 600
PORT_B EQU 61H
COMMAND_REG EQU 43H ; Адреса командного регістру
CHANNEL_2 EQU 42H
simvol db ?

CODESEG

;team 6

Start:
        mov ax, @data
        mov ds, ax


        Main_cусle:

            call display_foo_main ;display

            call input_foo

            cmp ax, "G" 
            je Count
            cmp ax, "k" 
            je Exit
            cmp ax, "H" 
            je Sound
            cmp ax, "c" 
            je Max_Number
            jmp Main_cусle

        Count:
        ; ((a1+a2) * a3 * a4+a5) a1=-1, a2=1, a3=1, a4=2, a5=3
            mov dx, offset test_message_1
            call display_foo
            mov dx, offset test_message_2
            call display_foo
            call count_print
            jmp Main_cусle
        Max_Number:
            mov dx, offset test_message_4
            call display_foo
            call max_num
            mov dx, offset test_message_3
            call display_foo
            jmp Main_cусle
        Sound:
            call beep_sound
            jmp Main_cусle
        Exit:
            mov dx, offset display_message_4
            call display_foo
            mov ax,04C00h
            int 21h ; пpеpывания DOS
            
        ;-------------------------------------------------------
        PROC display_foo_main
            mov dx, offset display_message_0
            call display_foo
            mov dx, offset display_message_1
            call display_foo
            mov dx, offset display_message_2
            call display_foo
            mov dx, offset display_message_3
            call display_foo
            mov dx, offset display_message_6
            call display_foo
            mov dx, offset system_message_1
            call display_foo
            mov dx, offset display_message_5
            call display_foo
            ret
        ENDP display_foo_main
        
        ;-------------------------------------------------------
        PROC display_foo; input dx is offset
            mov ah, 9
            int 21h
            xor dx, dx
            ret
        ENDP display_foo
        
        ;-----------------------------------------------------
        PROC input_foo          ; input string out ax
            mov ah, 0ah             ; ah <- 0ah input
            mov dx, offset string   ; dx <- offset string
            int 21h                 ; call 0ah function DOS int 21h

            xor ax, ax
            mov bx, offset string
            mov ax, [bx+1]
            shr ax, 8
            ret
        ENDP input_foo
        
        
        PROC count_print
            mov ah, [var_a1]
            ;add ah, [var_a2]
            sub ah, [var_a2]
            mov bl, [var_a3]
            imul bl
            mov bl, [var_a4]
            imul bl
            add ah, [var_a5]
            mov al, ah
            mov ah, 0Eh
            add al, 30h
            int 10h
            mov dx, offset new_line
            call display_foo
            ret
        ENDP count_print
        
        
        PROC beep_sound
                int 16h ; Зберігає отримане значення з клавіатури в змінній
                mov [simvol],al ; simvol
                cmp [simvol],'e' ; Перевірка на відповідність і встановлення прапору ознаки 0
                jz Return
                ;jz Exit
                ; Перехід на Exit: у випадку відповідності
            ;Встановлення частоти 440 гц
            ;--- дозвіл каналу 2 встановлення порту В мікросхеми 8255
            IN AL,PORT_B ;Читання
            OR AL,3 ;Встановлення двох молодших бітів
            OUT PORT_B,AL ;пересилка байта в порт B мікросхеми 8255
            ;--- встановлення регістрів порту вводу-виводу
            MOV AL,10110110B ;біти для каналу 2
            
            OUT COMMAND_REG, AL ;байт в порт командний регістр
            ;--- встановлення лічильника
            MOV AX,2705 ;лічильник = 1190000/440
            OUT CHANNEL_2,AL ;відправка AL
            MOV AL,AH ;відправка старшого байту в AL
            OUT CHANNEL_2,AL ;відправка старшого байту
            ;--- виклик преривання з клавіатури для зупинки
            MOV AH,8 ;номер функції преривання 8
            INT 21H ;виклик преривання
            ;--- виключення звуку
            IN AL,PORT_B ;отримуємо байт з порту В
            AND AL,11111100B ;скидання двох молодших бітів
            OUT PORT_B,AL ;пересилка байтів в зворотному напрямку
            Return:
            ret
        ENDP beep_sound

        PROC max_num

            mov al, [var_a1]
            mov bl, [var_a2]
            cmp al, bl
            jg compare_with_a3
            mov al, bl
            
            compare_with_a3:
            mov bl, [var_a3]
            cmp al, bl
            jg compare_with_a4
            mov al, bl
            
            compare_with_a4:
            mov bl, [var_a4]
            cmp al, bl
            jg compare_with_a5
            mov al, bl
            
            compare_with_a5:
            mov bl, [var_a5]
            cmp al, bl
            jg greater
            mov al, bl
            
            greater:
            
            mov ah, 0Eh
            add al, 30h
            int 10h
            mov dx, offset new_line
            call display_foo
            
            ret    
        ENDP
        
    END Start

