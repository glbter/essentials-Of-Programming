;------------------------------------------------------------------
; ЛР №8
;------------------------------------------------------------------
; Архітектура комп'ютера
; Тема     : АРХІТЕКТУРА  ІА-32 (Х86) У	REAL ADRESS MODE
; Завдання : 1. Створити графічний інтерфейс
;            2. Вивести імена учасників бригади
;            3. Образування арифметичного виразу
;            4. Відігравання звукового сигналу
;            
; ВУЗ      : НТУУ "КПІ ім. Ігоря Сікороського"
; Факультет: ФІОТ
; Курс     : 2
; Група    : ІТ-91
;------------------------------------------------------------------
; Бригада  : №5
; Студенти : Ткаченко В.
;            Тонкошкур О.
;            Терентьєв Г. 
; Дата     : 6.12.2020
;------------------------------------------------------------------
;
;
;----------------I.ЗАГОЛОВОК ПРОГРАМИ------------------------------
title strmenu(exe)
.model small
.stack 256

;--------------------III.ПОЧАТОК СЕГМЕНТУ ДАНИХ--------------------
.data
	a1 equ -1
	a2 equ 1
	a3 equ 1
	a4 equ 2
	a5 equ 3
	portB equ 61h
	commandReg equ 43h      ; Адреса командного регістру
	channel2 equ 42h        ; Адреса каналу 2
	
	topRow equ 04
	bottomRow equ 11
	leftColumn equ 26
	attribute db ?
	result dw ?
	row db 0
	shadow db 19 dup(0DBh)                          ; Текст меню та його рамка
	menu    db 0C9h, 17 dup(0CDh), 0BBh
			db 0BAh, ' See authors     ', 0BAh
			db 0BAh, ' Calculate       ', 0BAh
			db 0BAh, ' Play Sound      ', 0BAh
			db 0BAh, ' Exit            ', 0BAh
			db 0BAh, '                 ', 0BAh
			db 0BAh, '                 ', 0BAh
			db 0C8h, 17 dup(0CDh), 0BCh
	prompt  db 'To select an item, use <Up/Down Arraw> and press <Enter>.'

	
	promptLength=$-prompt                     ; Довжина меню               
	hello db 13, 10, 'Hello! This program was made by group #5'  ; Змінна для процедури printHello
          db 13, 10,  'Tkachenko Viktor'
		  db 13, 10,  'Tonkoshkur Oleh'
		  db 13, 10,  'Terentiev Hlib'
		  
	helloLen = $-hello
	bye db 'Bye! It was nice to  meet you!'   ; Змінна для процедури printBye
	byeLen = $-bye
	answer db 'Answer is  '
	answerLen=$-answer
	beep db 'Beeeeep'
	beepLen = $-beep

	selected_item dw 0
.386
;----------------------IV. ПОЧАТОК СЕГМЕНТУ КОДУ--------------------
.code
	Init MACRO                       ; Макрос ініціалізації
		mov ax, @data
		mov ds, ax
		mov es, ax
	ENDM
	main proc far
		Init
		call initializeScreen            ; Задає колір консолі, а також очищує її
		mov row, bottomRow+4             ; Верхня координата
		step:
			call showMenu                 ; Вивід меню
			mov row, topRow+1             ; Координата пункту меню
			mov attribute, 17h            
			call highlightOption          ; Виділення синім першого пункту меню
			call readKey                  ; Клавіша
			jmp step
	main endp

;------------------------------------------------------------------
; Процедура виводу меню
	showMenu proc near
		pusha                             ; Заносить до стеку ax, cx, dx, bx
		mov ax, 1301h                     ; 'print string' mode, 1 - оновлення курсору
		mov bh, 0020h                     ; 5 - код фіолетового кольору для фону, 
		                                  ; 0 - код синього кольору для тексту
		lea bp, shadow                    ; Меню відбрасує тінь
		mov cx, 19                        ; Довжина рядка
		mov dh, topRow+1                  ; Верхня межа         
		mov dl, leftColumn+1              ; Ліва межа
		showShadowRow:
			int 10h
			inc dh                        ; перехід до наступного рядка
			cmp dh, bottomRow+2           ; Перевірка для виводу тіні або виводу наступного рядка
			jne showShadowRow                    
		mov attribute, 70h                ; 7 - світло-сіре меню, 0 - чорний текст
		
		mov ax, 1300h                     ; 'print string' mode, 0 - оновити курсор
		movzx bx, attribute                        
		lea bp, menu                           
		mov cx, 19                       
		mov dh, topRow                    ; верзній край
		mov dl, leftColumn                ; лівий край
		showMenuRow:
			int 10h                            
			add bp, 19                    ; перехід до наступного пункта меню
			inc dh                        ; перехід до наступного рядка
			cmp dh, bottomRow+1           ; if dh==bottomRow+1 then menu is printed
			jne showMenuRow               ; else print next row of menu
		mov ax, 1301h                     ; 'print string' mode, 1 - оновити курсор
		movzx bx, attribute     
		lea bp, prompt                    ; показчик на меню
		mov cx, promptLength                    
		mov dh, bottomRow+4 
		mov dl, 0 
		int 10h 
		popa 
		ret
	showMenu endp
	
;---------------------------------------------------------------------
; Поцедура розпізнає натискання клаіші і реагує в залежності від неї
	readKey proc near
		pusha 
		xor si, si
		begin:
			mov ah, 10h 
			int 16h
			cmp ah, 50h             ; стрілка вниз
			je moveUp               ; перенесення виділення синім
			cmp ah, 48h             ; стрілка догори
			je moveDown             ; перенесення виділення синім
			cmp al, 064h            ; d ascii = 064h 
			je exitProgram 
			cmp al, 053h            ; s ascii = 053h
			je playSoundProc
			cmp al, 068h            ; h ascii = 068h
			je printHelloProc
			cmp al, 061h            ; a ascii = 061h 
			je calculateProc

            cmp ah, 1Ch
            je pressEnter
            ;je redrawMenu           ; оновлення меню
			jmp begin
		moveUp:
            call inc_counter
            ;mov si, selected_item
            ;dec si
            ;mov selected_item, si
			mov attribute, 71h 
			call highlightOption          ; виділення синім зупиняється
			inc row                       ; перехід
			cmp row, bottomRow-1          ; перевірка на останній пункт меню
			jbe refreshMenu               ; оновлення меню якщо не останній пункт
			mov row, topRow+1             ; якщо останній пункт - переходимо на перший
			jmp refreshMenu
		
		moveDown:
            call dec_counter
            ;mov si, selected_item
            ;inc si
            ;mov selected_item, si
			mov attribute, 71h ; 
			call highlightOption          ; виділення синім зупиняється
			dec row                       ; перехід
			cmp row, topRow+1             ; перевірка на перший пункт меню
			jae refreshMenu               ; лновлення меню якщо не перший пункт
			mov row, bottomRow-1          ; якщо перший - переходимо на останній
			jmp refreshMenu
		refreshMenu:
			mov attribute, 17h            ; поточний пункт меню
			call highlightOption          ; Виділяє синім поточний пункт меню
			jmp begin
		printHelloProc:
			call printHello               ; Друкує імена учасників
			jmp begin
		calculateProc:
			call calculate
			jmp begin
		playSoundProc:
			call printBeep
			call playSound     			;Звук
			jmp begin
        pressEnter:
            mov si, selected_item

            cmp si, 0
                je printHelloProc
            cmp si, 1
                je calculateProc
            cmp si, 2
                je playSoundProc
            cmp si, 3
                je exitProgram
                    
            ;jmp enter_key
                
            jmp begin
		exitProgram:
			call printBye                 ; Друкує 'Bye! It was nice to  meet you!'
			mov ax, 4C00h 
			int 21h 
		redrawMenu:
			popa 
		ret
	readKey endp
;---------------------------------------------------------------------
; Поцедура друкує 'Hello!' та імена учасників бригади при натисканні клавіші 	
	printHello proc near
		call initializeScreen
		call showMenu
		pusha 
		mov ax, 1301h                     ; 'print string' mode, 01 - не оновлювати курсор
		mov bx, 0071h                     ; Піксельні атрибути
		lea bp, hello 
		mov cx, helloLen 
		mov dh, bottomRow+5               ; верхня межа
		mov dl, 1                         ; ліва межа
		int 10h                           ; друкує
		popa 
		ret
	printHello endp
	
;---------------------------------------------------------------------
; Поцедура друкує 'Bye! ' при натисканні клавіші для виходу 
	printBye proc near
		call initializeScreen
		call showMenu
		pusha 
		mov ax, 1301h          ; 'print string' mode, 01 - не оновлювати курсор
		mov bx, 0071h 
		lea bp, bye 
		mov cx, byeLen 
		mov dh, bottomRow+7    ; верхня межа
		mov dl, 0               ; ліва межа
		int 10h                 ; друкує
		popa 
		ret
	printBye endp
;---------------------------------------------------------------------
; Процедура обраховує формулу
	calculate proc near
		call initializeScreen
		call showMenu
		pusha
		mov ax, a1            ; ax = a1
		sub ax, a2            ; ax = a1-a2
		mov bx, a3            
		imul bx               ; ax = ax*a3
		mov bx, a4            ; ax = ax*a4
		imul bx
		add ax, a5            ; ax = ax+a5
		call printAnswer      
		call printNumber       
		popa 
		ret
	calculate endp
	
;----------------------------------------
	printAnswer proc near
		pusha 
		mov ax, 1301h 
		mov bx, 0071h 
		lea bp, answer
		mov cx, answerLen 
		mov dh, bottomRow+8          ; верхня координата
		mov dl, 0                     ; ліва координата
		int 10h 
		popa 
		ret
	printAnswer endp
;---------------------------------------------------------
; Процедура друкування цифри
printNumber proc near
		pusha 
		cbw 
		mov dh, bottomRow+8            ; верхня координата
		mov dl, answerLen               ; ліва координата
		cmp ax, 0                       ; Порівняння числа з нулем
		jge positive                    ; Варіант для позитивних чисел
		push ax                         ; до стеку
		mov result, '-'                 ; додаємо мінус 'до відповіді
		lea bp, result                         
		mov dl, answerLen               ; "Answer is"
		call printChar                  ; "-"
		pop ax                          ; зі стеку
		mov dl, answerLen+1             ; число розміщується за повідомленням
		neg ax                          ; інвертування числа
		positive:                       ; Варіант для позитивних чисел
			add ax, 30h                 ; перехід до коду ASCII
			mov result, ax                     
			lea bp, result                     
			call printChar               ; Виклик процедури для друку символа
			mov dh, bottomRow+10         ; Початок виводу
			int 10h
		popa  
		ret
	printNumber endp
	
	; Input params:
	; - bp - the sign to be printed
	; - dl - left coord
	; - dh - top coord
	; Output params:
	; --------------------------------------
	printChar proc near
		pusha 
		mov ax, 1301h 
		mov bx, 0071h 
		mov cx, 1     ;довжина символу
		int 10h 
		popa 
		ret
	printChar endp
	;---------------------------------------------------------------------
; Поцедура програє звук	
	playSound proc near
		pusha 
		; Дозвіл каналу 2 встановлення порту В мікросхеми 8255 
		call printBeep
		in al, portB                           ; Читання
		or al, 11b                             ; Встановлення двох молодших бітів
		out portB, al                          ; Пересилка байта в порт B мікросхеми 8255	                                                
		mov al, 0B6h                           ; Біти для каналу 2
		out commandReg, al                     ; Байт в порт командний регістр

		 ;--- встановлення лічильника
		mov ax, 2705                           ; лічильник = 1190000/440
		out channel2, al                       ; відправка AL
		mov al, ah                             ; відправка старшого байту в AL
		out channel2, al                       ; відправка старшого байту
		;--- виклик преривання з клавіатури для зупинки
		mov ah, 8                              ;номер функції преривання 8
		int 21h                                ;виклик преривання
 ;--- виключення звуку
		in al, portB                            ;отримуємо байт з порту В
		and al, 11111100b                       ; скидання двох молодших бітів
		out portB, al                           ; пересилка байтів в зворотному напрямку
		popa ;
		ret
	playSound endp
	
;-----------------------------------------------------
; Процедура друкує "Beeep". Викликається разом із процедурою playSound
 printBeep proc near
		pusha
		call initializeScreen
		call showMenu
		mov ax, 1301h          ; 'print string' mode, 01 - не оновлювати курсор
		mov bx, 0071h 
		lea bp, beep 
		mov cx, beepLen 
		mov dh, bottomRow+5    ; верхня межа
		mov dl, 0               ; ліва межа
		int 10h   
		popa 
		ret
	printBeep endp
;----------------------------------------------------
; Процедура виділяє синім кольором поточний пункт меню
	highlightOption proc near
		pusha 
		movzx ax, row
		sub ax, topRow
		imul ax, 19                      ; Довжина пункту меню
		lea si, menu+1
		add si, ax                       ; Адреса першого символа
		mov ax, 1300h                    ; 'print string' mode, 00 - оновлення курсору
		movzx bx, attribute              ; pixel attributes
		mov bp, si                       ; Показчик на перший символ до bp
		mov cx, 17                       ; Довжина рядка
		mov dh, row                                
		mov dl, leftColumn+1                       
		int 10h 
		popa 
		ret
	highlightOption endp
	
;---------------------------------------------------
; Процедура очищує консоль і задає стиль інтерфейсу
	initializeScreen proc near
		pusha 
		mov ah, 06h                 
		mov bh, 40h            ; 5 - фон(червоний), 0 - текст (чорний)
		mov cx, 0000h          ; 00 - верхній рядок 00 - ліва колонка
		mov dx, 184Fh          ; 18 - нижній рядок, 4F - права колонка
		int 10h
		popa 
		ret
	initializeScreen endp
	
	inc_counter proc near 
        pusha
        
        mov si, selected_item
        inc si
        mov selected_item, si
        
        cmp si, 6
            jl greater 
        mov selected_item, 0
        less:
        popa 
        ret
	inc_counter endp
	
    dec_counter proc near 
        pusha
        mov si, selected_item
        dec si
        mov selected_item, si
        
        cmp si, -1
            jg greater
        mov selected_item, 5
        greater:
        popa 
        ret
	dec_counter endp
end main
			
