PROC selection_sort
; params - array dx
; array length cx
push si
push bx
;push dx
push ax
    mov ax, cx; save initial length

    outer:
        push ax; save length again
        push cx ;save counter
        sub ax, cx; maximal index

        push ax;save max index
            ;increment loop index
            mov ax, cx
            inc ax
            mov cx, ax
            ;end incr
        pop ax
        
        inner:
            ;mov bx, ax; index of max
            ;mov si, cx; index of loop current
            ;add to si and bx
            push ax
                add ax, dx
                mov bx, ax
                mov ax, cx
                add ax, dx
                mov si, ax
            pop ax

            cmp [si], [bx] ; if curr > max
                JLGE greater; curr > max
                JMP lessEqueals ;else
            greater
                mov ax, cx ;set as maximal
            lessEqueals:

        loop inner

        ;swap elements
        mov bx, ax
        push[dx + bx];maximal value
            mov bx, cx
            push[dx + bx];current value
            pop si
            mov bx, ax
            mov [dx + bx], si; current val on max place
        pop dx
        mov bx, cx
        mov [dx + bx], si; max val on curr place
        ;end of swap

        ;return from stack
        pop cx
        pop ax
    loop outer

pop ax
;pop dx 
pop bx 
pop si 

ret 
ENDP