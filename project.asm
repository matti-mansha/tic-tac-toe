[org 0x0100]

    jmp start

    message:        db   "Player 1 (X), Player 2 (O)"
    len_massage:    dw   26

    player1message: db   "Player 1, Enter a number: "
    len_p1massage:  dw   26

    player2message: db   "Player 2, Enter a number: "
    len_p2massage:  dw   26

    Array: dw 0, 0, 0, 0, 0, 0, 0, 0, 0

    draw_check dw 0

    value: db 0

    X: db   "X"
    len_X:  dw   1

    O: db   "O"
    len_O:  dw   1

    one:    dw 1
    two:    dw 2
    three:  dw 3
    four:   dw 4
    five:   dw 5
    six:    dw 6
    seven:  dw 7
    eight:  dw 8
    nine:   dw 9
    len_digit:        dw  1

    ver:    db   "   |   |   "
    len_ver:        dw  11

    hori:   db   "-----------"
    len_hori:       dw  11

    player1won: db   "Player 1 WON"
    len_p1won:  dw   12

    player2won: db   "Player 2 WON"
    len_p2won:  dw   12

    draw: db   "Match draw"
    len_draw:  dw   10

    ;clear screen function
    clrscr:     
        push es
        push ax
        push di

        mov  ax, 0xb800
        mov  es, ax
        mov  di, 0

        nextloc:
            mov  word [es:di], 0x0720
            add  di, 2
            cmp  di, 4000
            jne  nextloc

        pop  di 
        pop  ax
        pop  es
        ret


    ;Generic Print function to print strings
    printstr:
        push bp
        mov  bp, sp
        push es
        push ax
        push cx 
        push si 
        push di 

        mov ax, 0xb800 
        mov es, ax 
        mov di, [bp + 4]               


        mov si, [bp + 8]
        mov cx, [bp + 6]
        mov ah, 0x06 

        nextchar: 
            mov al, [si]
            mov [es:di], ax 
            add di, 2 
            add si, 1 
            
            loop nextchar 


        pop di 
        pop si 
        pop cx 
        pop ax 
        pop es 
        pop bp 
        ret


    ;Generic Print function to print strings but also blink the string.
    printstr_blinker:
        push bp
        mov  bp, sp
        push es
        push ax
        push cx 
        push si 
        push di 

        mov ax, 0xb800 
        mov es, ax 
        mov di, [bp + 4]               


        mov si, [bp + 8]
        mov cx, [bp + 6]
        mov ah, 0x84

        nextchar1: 
            mov al, [si]
            mov [es:di], ax 
            add di, 2 
            add si, 1 
            
            loop nextchar1


        pop di 
        pop si 
        pop cx 
        pop ax 
        pop es 
        pop bp 
        ret


    ;Generic Print function to print numbers(0to9)
    printnum: 
        push bp 
        mov  bp, sp
        push es 
        push ax 
        push bx 
        push cx 
        push dx 
        push di 


        mov ax, 0xb800 
        mov es, ax 
        mov di, [bp + 4]         


        mov bl, [bp + 6]
        mov ah, 0x04
        
        mov al, bl
        add al, 0x30

        mov [es:di], ax 
            
        pop di 
        pop dx 
        pop cx 
        pop bx 
        pop ax 
        pop es
        pop bp 
        ret


    ;A function that print introductory lines and game structure(GUI).
    ;-----------------------------------------------------------------------------------------------------------------
    structure:
        ;printing "massage"(Player 1 (X), Player 2 (O))
        mov ax, message
        mov dx, 0
        push ax
        push word [len_massage]
        push dx
        call printstr
        pop dx
        pop word [len_massage]
        pop ax


        ;printing "var"(   |   |   ) on 160th location
        mov ax, ver 
        mov dx, 160
        push ax 
        push word [len_ver]
        push dx
        call printstr
        pop dx
        pop word [len_ver]
        pop ax


        ;printing "var"(   |   |   ) on 480th location
        mov ax, ver 
        mov dx, 480
        push ax 
        push word [len_ver]
        push dx
        call printstr
        pop dx
        pop word [len_ver]
        pop ax


        ;printing "var"(   |   |   ) on 800th location
        mov ax, ver 
        mov dx, 800
        push ax 
        push word [len_ver]
        push dx
        call printstr
        pop dx
        pop word [len_ver]
        pop ax


        ;printing "hori"(-----------) on 320th location
        mov ax, hori
        mov dx, 320
        push ax 
        push word [len_hori]
        push dx
        call printstr
        pop dx
        pop word [len_hori]
        pop ax


        ;printing "hori"(-----------) on 640th location
        mov ax, hori
        mov dx, 640
        push ax 
        push word [len_hori]
        push dx
        call printstr
        pop dx
        pop word [len_hori]
        pop ax


        ;printing "one"(1) on 162th location 
        mov ax, [one]
        mov dx, 162
        push ax 
        push dx
        call printnum
        pop dx
        pop ax


        ;printing "two"(2) on 170th location 
        mov ax, [two]
        mov dx, 170
        push ax 
        push dx
        call printnum
        pop dx
        pop ax


        ;printing "three"(3) on 178th location 
        mov ax, [three]
        mov dx, 178
        push ax 
        push dx
        call printnum
        pop dx
        pop ax


        ;printing "four"(4) on 482th location 
        mov ax, [four]
        mov dx, 482
        push ax 
        push dx
        call printnum
        pop dx
        pop ax


        ;printing "five"(5) on 490th location 
        mov ax, [five]
        mov dx, 490
        push ax 
        push dx
        call printnum
        pop dx
        pop ax


        ;printing "six"(6) on 498th location 
        mov ax, [six]
        mov dx, 498
        push ax 
        push dx
        call printnum
        pop dx
        pop ax


        ;printing "seven"(7) on 802th location 
        mov ax, [seven]
        mov dx, 802
        push ax 
        push dx
        call printnum
        pop dx
        pop ax


        ;printing "eight"(8) on 810th location 
        mov ax, [eight]
        mov dx, 810
        push ax 
        push dx
        call printnum
        pop dx
        pop ax


        ;printing "nine"(9) on 818th location 
        mov ax, [nine]
        mov dx, 818
        push ax 
        push dx
        call printnum
        pop dx
        pop ax

        
        ret
    ;-----------------------------------------------------------------------------------------------------------------
    ;structure end


    ;"condition1" for 'X' conditions.
    ;A function that have value from start compare it with following conditions, 
    ;if matches it will jump on specific label.
    condition1:
        cmp bx, 1
        je c1
    
        cmp bx, 2
        je c2
    
        cmp bx, 3
        je c3
    
        cmp bx, 4
        je c4        
    
        cmp bx, 5
        je c5
    
        cmp bx, 6
        je c6
    
        cmp bx, 7
        je c7
    
        cmp bx, 8
        je c8
    
        cmp bx, 9
        je c9
    ;"condition1" end


    ;"condition2" for 'O' conditions.
    ;A function that have value from start compare it with following conditions, 
    ;if matches it will jump on specific label.
    condition2:
        cmp bx, 1
        je o1

        cmp bx, 2
        je o2
        
        cmp bx, 3
        je o3
        
        cmp bx, 4
        je o4        
        
        cmp bx, 5
        je o5
        
        cmp bx, 6
        je o6
        
        cmp bx, 7
        je o7
        
        cmp bx, 8
        je o8
        
        cmp bx, 9
        je o9
    ;"condition2" end

    ;-----------------------------------------------------------------------------------------------------------------
    ;Print 'X' at (1) 162th location, setting value in Array as well.
    c1:
        mov ax, X
        mov dx, 162
        mov bx, 1
        mov [Array + 0], bx
        push ax
        push word [len_X]
        push dx
        call printstr
        pop dx
        pop word [len_X]
        pop ax

        ;label in 'start' for further 
        jmp jump1
        

    ;Print 'X' at (2) 170th location, setting value in Array as well.
    c2:
        mov ax, X
        mov dx, 170
        mov bx, 1
        mov [Array + 2], bx
        push ax
        push word [len_X]
        push dx
        call printstr
        pop dx
        pop word [len_X]
        pop ax

        ;label in 'start' for further
        jmp jump1


    ;Print 'X' at (3) 178th location, setting value in Array as well.
    c3:
        mov ax, X
        mov dx, 178
        mov bx, 1
        mov [Array + 4], bx
        push ax
        push word [len_X]
        push dx
        call printstr
        pop dx
        pop word [len_X]
        pop ax

        ;label in 'start' for further
        jmp jump1


    ;Print 'X' at (4) 482th location, setting value in Array as well.
    c4:
        mov ax, X
        mov dx, 482
        mov bx, 1
        mov [Array + 6], bx
        push ax
        push word [len_X]
        push dx
        call printstr
        pop dx
        pop word [len_X]
        pop ax

        ;label in 'start' for further
        jmp jump1


    ;Print 'X' at (5) 490th location, setting value in Array as well.
    c5:
        mov ax, X
        mov dx, 490
        mov bx, 1
        mov [Array + 8], bx
        push ax
        push word [len_X]
        push dx
        call printstr
        pop dx
        pop word [len_X]
        pop ax

        ;label in 'start' for further
        jmp jump1


    ;Print 'X' at (6) 498th location, setting value in Array as well.
    c6:
        mov ax, X
        mov dx, 498
        mov bx, 1
        mov [Array + 10], bx
        push ax
        push word [len_X]
        push dx
        call printstr
        pop dx
        pop word [len_X]
        pop ax

        ;label in 'start' for further
        jmp jump1


    ;Print 'X' at (7) 802th location, setting value in Array as well.
    c7:
        mov ax, X
        mov dx, 802
        mov bx, 1
        mov [Array + 12], bx
        push ax
        push word [len_X]
        push dx
        call printstr
        pop dx
        pop word [len_X]
        pop ax

        ;label in 'start' for further
        jmp jump1


    ;Print 'X' at (8) 810th location, setting value in Array as well.
    c8:
        mov ax, X
        mov dx, 810
        mov bx, 1
        mov [Array + 14], bx
        push ax
        push word [len_X]
        push dx
        call printstr
        pop dx
        pop word [len_X]
        pop ax

        ;label in 'start' for further
        jmp jump1


    ;Print 'X' at (9) 818th location, setting value in Array as well.
    c9:
        mov ax, X
        mov dx, 818
        mov bx, 1
        mov [Array + 16], bx
        push ax
        push word [len_X]
        push dx
        call printstr
        pop dx
        pop word [len_X]
        pop ax

        ;label in 'start' for further
        jmp jump1
    ;-----------------------------------------------------------------------------------------------------------------
    ;end of 'c' conditions(c1 to c9)


    ;-----------------------------------------------------------------------------------------------------------------
    ;Print 'O' at (1) 162th location, setting value in Array as well.
    o1:
        mov ax, O
        mov dx, 162
        mov bx, 2
        mov [Array + 0], bx
        push ax
        push word [len_O]
        push dx
        call printstr
        pop dx
        pop word [len_O]
        pop ax

        ;label in 'start' for further
        jmp jump2        


    ;Print 'O' at (2) 170th location, setting value in Array as well.
    o2:
        mov ax, O
        mov dx, 170
        mov bx, 2
        mov [Array + 2], bx
        push ax
        push word [len_O]
        push dx
        call printstr
        pop dx
        pop word [len_O]
        pop ax

        ;label in 'start' for further
        jmp jump2        


    ;Print 'O' at (3) 178th location, setting value in Array as well.
    o3:
        mov ax, O
        mov dx, 178
        mov bx, 2
        mov [Array + 4], bx
        push ax
        push word [len_O]
        push dx
        call printstr
        pop dx
        pop word [len_O]
        pop ax

        ;label in 'start' for further
        jmp jump2
        

    ;Print 'O' at (4) 482th location, setting value in Array as well.
    o4:
        mov ax, O
        mov dx, 482
        mov bx, 2
        mov [Array + 6], bx    
        push ax
        push word [len_O]
        push dx
        call printstr
        pop dx
        pop word [len_O]
        pop ax

        ;label in 'start' for further
        jmp jump2
        

    ;Print 'O' at (5) 490th location, setting value in Array as well.
    o5:
        mov ax, O
        mov dx, 490
        mov bx, 2
        mov [Array + 8], bx    
        push ax
        push word [len_O]
        push dx
        call printstr
        pop dx
        pop word [len_O]
        pop ax

        ;label in 'start' for further
        jmp jump2
        

    ;Print 'O' at (6) 498th location, setting value in Array as well.
    o6:
        mov ax, O
        mov dx, 498
        mov bx, 2
        mov [Array + 10], bx    
        push ax
        push word [len_O]
        push dx
        call printstr
        pop dx
        pop word [len_O]
        pop ax

        ;label in 'start' for further
        jmp jump2
        

    ;Print 'O' at (7) 802th location, setting value in Array as well.
    o7:
        mov ax, O
        mov dx, 802
        mov bx, 2
        mov [Array + 12], bx    
        push ax
        push word [len_O]
        push dx
        call printstr
        pop dx
        pop word [len_O]
        pop ax

        ;label in 'start' for further
        jmp jump2
        

    ;Print 'O' at (8) 810th location, setting value in Array as well.
    o8:
        mov ax, O
        mov dx, 810
        mov bx, 2
        mov [Array + 14], bx    
        push ax
        push word [len_O]
        push dx
        call printstr
        pop dx
        pop word [len_O]
        pop ax

        ;label in 'start' for further
        jmp jump2
        

    ;Print 'O' at (9) 818th location, setting value in Array as well.
    o9:
        mov ax, O
        mov dx, 818
        mov bx, 2
        mov [Array + 16], bx    
        push ax
        push word [len_O]
        push dx
        call printstr
        pop dx
        pop word [len_O]
        pop ax

        ;label in 'start' for further
        jmp jump2
    ;-----------------------------------------------------------------------------------------------------------------
    ;end of 'o' conditions(o1 to o9)




    ;Possibles for 'X'
    ;-----------------------------------------------------------------------------------------------------------------
    aa2:
        mov bx, 1
        cmp bx, [Array + 4]
        je abc
        jmp again

    aa3:
        mov bx, 1
        cmp bx, [Array + 12]
        je abc
        jmp again


    aa4:
        mov bx, 1
        cmp bx, [Array + 16]
        je abc
        jmp again

    aa1:


        mov bx, 1
        cmp bx, [Array + 2]
        je aa2

        cmp bx, [Array + 6]
        je aa3

        cmp bx, [Array + 8]
        je aa4

        jmp again

    bb3:
        mov bx, 1
        cmp bx, [Array + 14]
        je abc
        jmp again 


    bb2:
        mov bx, 1
        cmp bx, [Array + 4]
        je abc
        jmp again 


    bb1:
        mov bx, 1
        cmp bx, [Array + 0]
        je bb2

        cmp bx, [Array + 8]
        je bb3

        jmp again


    cc2:
        mov bx, 1
        cmp bx, [Array + 0]
        je abc
        jmp again

    cc3:
        mov bx, 1
        cmp bx, [Array + 16]
        je abc
        jmp again


    cc4:
        mov bx, 1
        cmp bx, [Array + 12]
        je abc
        jmp again

    cc1:
        mov bx, 1
        cmp bx, [Array + 2]
        je cc2

        cmp bx, [Array + 10]
        je cc3

        cmp bx, [Array + 8]
        je cc4

        jmp again


    dd3:
        mov bx, 1
        cmp bx, [Array + 10]
        je abc
        jmp again 


    dd2:
        mov bx, 1
        cmp bx, [Array + 12]
        je abc
        jmp again 


    dd1:
        mov bx, 1
        cmp bx, [Array + 0]
        je dd2

        cmp bx, [Array + 8]
        je dd3

        jmp again


    ff3:
        mov bx, 1
        cmp bx, [Array + 6]
        je abc
        jmp again 


    ff2:
        mov bx, 1
        cmp bx, [Array + 16]
        je abc
        jmp again 


    ff1:
        mov bx, 1
        cmp bx, [Array + 4]
        je ff2

        cmp bx, [Array + 8]
        je ff3

        jmp again


    gg2:
        mov bx, 1
        cmp bx, [Array + 0]
        je abc
        jmp again

    gg3:
        mov bx, 1
        cmp bx, [Array + 4]
        je abc
        jmp again


    gg4:
        mov bx, 1
        cmp bx, [Array + 16]
        je abc
        jmp again

    gg1:
        mov bx, 1
        cmp bx, [Array + 6]
        je gg2

        cmp bx, [Array + 8]
        je gg3

        cmp bx, [Array + 14]
        je gg4

        jmp again


    hh3:
        mov bx, 1
        cmp bx, [Array + 2]
        je abc
        jmp again 


    hh2:
        mov bx, 1
        cmp bx, [Array + 16]
        je abc
        jmp again 


    hh1:
        mov bx, 1
        cmp bx, [Array + 12]
        je hh2

        cmp bx, [Array + 8]
        je hh3

        jmp again


    ii2:
        mov bx, 1
        cmp bx, [Array + 4]
        je abc
        jmp again

    ii3:
        mov bx, 1
        cmp bx, [Array + 0]
        je abc
        jmp again


    ii4:
        mov bx, 1
        cmp bx, [Array + 12]
        je abc
        jmp again

    ii1:
        mov bx, 1
        cmp bx, [Array + 10]
        je ii2

        cmp bx, [Array + 8]
        je ii3

        cmp bx, [Array + 14]
        je ii4

        jmp again


    ;logic for "X's"
    logic1:
        mov bx, 1
        cmp bx, [Array + 0]
        je aa1

        cmp bx, [Array + 2]
        je bb1

        cmp bx, [Array + 4]
        je cc1

        cmp bx, [Array + 6]
        je dd1

        cmp bx, [Array + 10]
        je ff1

        cmp bx, [Array + 12]
        je gg1

        cmp bx, [Array + 14]
        je hh1

        cmp bx, [Array + 16]
        je ii1

        jmp again
    ;-----------------------------------------------------------------------------------------------------------------
    ;end of Possibles of 'X'




    ;Possibles for 'O'
    ;-----------------------------------------------------------------------------------------------------------------
    _aa2:
        mov bx, 2
        cmp bx, [Array + 4]
        je def
        jmp again2

    _aa3:
        mov bx, 2
        cmp bx, [Array + 12]
        je def
        jmp again2


    _aa4:
        mov bx, 2
        cmp bx, [Array + 16]
        je def
        jmp again2

    _aa1:


        mov bx, 2
        cmp bx, [Array + 2]
        je _aa2

        cmp bx, [Array + 6]
        je _aa3

        cmp bx, [Array + 8]
        je _aa4

        jmp again2

    _bb3:
        mov bx, 2
        cmp bx, [Array + 14]
        je def
        jmp again2 


    _bb2:
        mov bx, 2
        cmp bx, [Array + 4]
        je def
        jmp again2 


    _bb1:
        mov bx, 2
        cmp bx, [Array + 0]
        je _bb2

        cmp bx, [Array + 8]
        je _bb3

        jmp again2


    _cc2:
        mov bx, 2
        cmp bx, [Array + 0]
        je def
        jmp again2

    _cc3:
        mov bx, 2
        cmp bx, [Array + 16]
        je def
        jmp again2


    _cc4:
        mov bx, 2
        cmp bx, [Array + 12]
        je def
        jmp again2

    _cc1:
        mov bx, 2
        cmp bx, [Array + 2]
        je _cc2

        cmp bx, [Array + 10]
        je _cc3

        cmp bx, [Array + 8]
        je _cc4

        jmp again2


    _dd3:
        mov bx, 2
        cmp bx, [Array + 10]
        je def
        jmp again2 


    _dd2:
        mov bx, 2
        cmp bx, [Array + 12]
        je def
        jmp again2 


    _dd1:
        mov bx, 2
        cmp bx, [Array + 0]
        je _dd2

        cmp bx, [Array + 8]
        je _dd3

        jmp again2


    _ff3:
        mov bx, 2
        cmp bx, [Array + 6]
        je def
        jmp again2


    _ff2:
        mov bx, 2
        cmp bx, [Array + 16]
        je def
        jmp again2


    _ff1:
        mov bx, 2
        cmp bx, [Array + 4]
        je _ff2

        cmp bx, [Array + 8]
        je _ff3

        jmp again2


    _gg2:
        mov bx, 2
        cmp bx, [Array + 0]
        je def
        jmp again2

    _gg3:
        mov bx, 2
        cmp bx, [Array + 4]
        je def
        jmp again2


    _gg4:
        mov bx, 2
        cmp bx, [Array + 16]
        je def
        jmp again2

    _gg1:
        mov bx, 2
        cmp bx, [Array + 6]
        je _gg2

        cmp bx, [Array + 8]
        je _gg3

        cmp bx, [Array + 14]
        je _gg4

        jmp again2


    _hh3:
        mov bx, 2
        cmp bx, [Array + 2]
        je def
        jmp again2 


    _hh2:
        mov bx, 2
        cmp bx, [Array + 16]
        je def
        jmp again2 


    _hh1:
        mov bx, 2
        cmp bx, [Array + 12]
        je _hh2

        cmp bx, [Array + 8]
        je _hh3

        jmp again2


    _ii2:
        mov bx, 2
        cmp bx, [Array + 4]
        je def
        jmp again2

    _ii3:
        mov bx, 2
        cmp bx, [Array + 0]
        je def
        jmp again2


    _ii4:
        mov bx, 2
        cmp bx, [Array + 12]
        je def
        jmp again2

    _ii1:
        mov bx, 2
        cmp bx, [Array + 10]
        je _ii2

        cmp bx, [Array + 8]
        je _ii3

        cmp bx, [Array + 14]
        je _ii4

        jmp again2

    ;logic for "O's"
    logic2:
        mov bx, 2
        cmp bx, [Array + 0]
        je _aa1

        cmp bx, [Array + 2]
        je _bb1

        cmp bx, [Array + 4]
        je _cc1

        cmp bx, [Array + 6]
        je _dd1


        cmp bx, [Array + 10]
        je _ff1

        cmp bx, [Array + 12]
        je _gg1

        cmp bx, [Array + 14]
        je _hh1

        cmp bx, [Array + 16]
        je _ii1

        jmp again2
    ;-----------------------------------------------------------------------------------------------------------------
    ;end of Possibles of 'O'


    ;Printing winning statement of player 1, check 'draw_check'.
    abc:
        mov ax, player1won
        mov dx, 1120
        push ax
        push word [len_p1won]
        push dx
        call printstr_blinker
        mov word[draw_check], 1
        jmp drop


    ;Printing winning statement of player 2, check 'draw_check'.
    def:
        mov ax, player2won
        mov dx, 1120
        push ax
        push word [len_p2won]
        push dx
        call printstr_blinker
        mov word[draw_check], 1
        jmp drop




    ;main label
    start:
        ;Screen will cleared
        call clrscr 
        
        
        ;structure will printed
        call structure


        mov cx, 5   ;loop conditon
        ;loop that will take 9 values from 2 users alternatevly.
        iter:
            ;For player 1.
            ;-----------------------------------------------------------------------------------------------------------
            mov ax, player1message          ;"(Player 1, Enter a number: )"
            mov dx, 960
            push ax
            push word [len_p1massage]       ;length of string
            push dx
            call printstr
            pop dx
            pop word [len_p1massage]
            pop ax

            ;interrupt for input from user(keyboard)
            mov ah, 1
            int 21h
            
            ;input from user is stored in 'al'
            mov bx, 0
            mov bl, al          ;moving in bl
            sub bx, 48          ;value is in ascii so it is subtracted with 48


            push bx
            call condition1     ;A function that have conditions to match, if matched than jump on other respective labels
            pop bx

            ;label that is for (c1 to c9) to return back in start
            jump1:

            ;check logic/Possible combination checker for 'X'
            jmp logic1

            ;return label from Possible combination checker labels(aa1 to ii4)
            again:

            cmp cx, 1   ;because we want 9 iterations not 10
            je drop
            ;----------------------------------------------------------------------------------------------------------

            ;For player 2.
            ;----------------------------------------------------------------------------------------------------------
            mov ax, player2message          ;"(Player 2, Enter a number: )"
            mov dx, 960
            push ax
            push word [len_p1massage]       ;length of string
            push dx
            call printstr
            pop dx
            pop word [len_p1massage]       ;length of string
            pop ax

            ;interrupt for input from user(keyboard)
            mov ah, 1
            int 21h

            ;input from user is stored in 'al'            
            mov bx, 0
            mov bl, al          ;moving in bl
            sub bx, 48          ;value is in ascii so it is subtracted with 48


            push bx
            call condition2     ;A function that have conditions to match, if matched than jump on other respective labels
            pop bx



            ;label that is for (o1 to o9) to return back in start
            jump2:
            
            ;check logic/Possible combination checker for 'O'
            jmp logic2

            ;return label from Possible combination checker labels(_aa1 to _ii4)
            again2:
            ;----------------------------------------------------------------------------------------------------------

        loop iter


        ;draw printer
        draw_checker:
            mov ax, draw
            mov dx, 1120
            push ax
            push word [len_draw]
            push dx
            call printstr_blinker
            jmp drop1


        drop:

        cmp word[draw_check], 1
        jne draw_checker

        drop1:

        mov ax, 0x4c00 
        int 0x21 