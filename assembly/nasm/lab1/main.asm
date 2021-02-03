[org 0x7c00] ; Початок BOOT сектора
[bits 16]

call main_func

; hanging out
jmp $ ; Тут конструкція jmp стрибає на одній і тій же адресі

main_func:              ; прапорець безумовного переходу
	 ;вивід першого повідомлення
    mov si, messageHlib
	call printf	;виклик процедури print
;         вивід другого повідомлення
    mov si, messageOleh
	call printf
;   	вивід третього повідомлення
    mov si, messageViktor
	call printf
	ret
	

%include "./printf.asm" ; Підключаємо процедуру printf з іншого файлу


messageHlib db "Hlib Terentyev",10,13,0
messageOleh db "Oleh Tonkoshkur", 10,13,0
messageViktor db "Viktor Tkachenko",10,13,0
exCode db 0

times 510-($-$$) db 0 ; Відступ у сегменті бутлоадера (його розмір - 512 байт, тому треба дозаповнити пам'ять к-стю байт, рівною 512 мінус поточний розмір нашої програми)

dw 0xaa55 ; Спеціальне число, необхідне вкінці програми 
