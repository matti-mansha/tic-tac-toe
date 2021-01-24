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

    title: db   "TIC TAC TOE"
    len_title:  dw   11

    proj_by: db   "PROJECT BY"
    len_projby:  dw   10

    names: db   "MATTI UR REHMAN & ARSLAN"
    len_names:  dw   24

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
        ;printing "title"(TIC TAC TOE)
        mov ax, title
        mov dx, 330
        push ax
        push word [len_title]
        push dx
        call printstr
        pop dx
        pop word [len_title]
        pop ax


        ;printing "massage"(Player 1 (X), Player 2 (O))
        mov ax, message
        mov dx, 642
        push ax
        push word [len_massage]
        push dx
        call printstr
        pop dx
        pop word [len_massage]
        pop ax


        ;printing "var"(   |   |   ) on 802th location
        mov ax, ver 
        mov dx, 802
        push ax 
        push word [len_ver]
        push dx
        call printstr
        pop dx
        pop word [len_ver]
        pop ax


        ;printing "var"(   |   |   ) on 1122th location
        mov ax, ver 
        mov dx, 1122
        push ax 
        push word [len_ver]
        push dx
        call printstr
        pop dx
        pop word [len_ver]
        pop ax


        ;printing "var"(   |   |   ) on 1442th location
        mov ax, ver 
        mov dx, 1442
        push ax 
        push word [len_ver]
        push dx
        call printstr
        pop dx
        pop word [len_ver]
        pop ax


        ;printing "hori"(-----------) on 962th location
        mov ax, hori
        mov dx, 962
        push ax 
        push word [len_hori]
        push dx
        call printstr
        pop dx
        pop word [len_hori]
        pop ax


        ;printing "hori"(-----------) on 1282th location
        mov ax, hori
        mov dx, 1282
        push ax 
        push word [len_hori]
        push dx
        call printstr
        pop dx
        pop word [len_hori]
        pop ax


        ;printing "hori"(PROJECT BY) on 3646th location
        mov ax, proj_by
        mov dx, 3646
        push ax 
        push word [len_projby]
        push dx
        call printstr
        pop dx
        pop word [len_projby]
        pop ax


        ;printing "hori"(MATTI UR REHMAN & ARSLAN) on 3790th location
        mov ax, names
        mov dx, 3790
        push ax 
        push word [len_names]
        push dx
        call printstr
        pop dx
        pop word [len_names]
        pop ax


        ;printing "one"(1) on 804th location 
        mov ax, [one]
        mov dx, 804
        push ax 
        push dx
        call printnum
        pop dx
        pop ax


        ;printing "two"(2) on 812th location 
        mov ax, [two]
        mov dx, 812
        push ax 
        push dx
        call printnum
        pop dx
        pop ax


        ;printing "three"(3) on 820th location 
        mov ax, [three]
        mov dx, 820
        push ax 
        push dx
        call printnum
        pop dx
        pop ax


        ;printing "four"(4) on 1124th location 
        mov ax, [four]
        mov dx, 1124
        push ax 
        push dx
        call printnum
        pop dx
        pop ax


        ;printing "five"(5) on 1132th location 
        mov ax, [five]
        mov dx, 1132
        push ax 
        push dx
        call printnum
        pop dx
        pop ax


        ;printing "six"(6) on 1140th location 
        mov ax, [six]
        mov dx, 1140
        push ax 
        push dx
        call printnum
        pop dx
        pop ax


        ;printing "seven"(7) on 1444th location 
        mov ax, [seven]
        mov dx, 1444
        push ax 
        push dx
        call printnum
        pop dx
        pop ax


        ;printing "eight"(8) on 1452th location 
        mov ax, [eight]
        mov dx, 1452
        push ax 
        push dx
        call printnum
        pop dx
        pop ax


        ;printing "nine"(9) on 1460th location 
        mov ax, [nine]
        mov dx, 1460
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
    ;Print 'X' at (1) 804th location, setting value in Array as well.
    c1:
        mov ax, X
        mov dx, 804
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
        

    ;Print 'X' at (2) 812th location, setting value in Array as well.
    c2:
        mov ax, X
        mov dx, 812
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


    ;Print 'X' at (3) 820th location, setting value in Array as well.
    c3:
        mov ax, X
        mov dx, 820
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


    ;Print 'X' at (4) 1124th location, setting value in Array as well.
    c4:
        mov ax, X
        mov dx, 1124
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


    ;Print 'X' at (5) 1132th location, setting value in Array as well.
    c5:
        mov ax, X
        mov dx, 1132
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


    ;Print 'X' at (6) 1140th location, setting value in Array as well.
    c6:
        mov ax, X
        mov dx, 1140
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


    ;Print 'X' at (7) 1444th location, setting value in Array as well.
    c7:
        mov ax, X
        mov dx, 1444
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


    ;Print 'X' at (8) 1452th location, setting value in Array as well.
    c8:
        mov ax, X
        mov dx, 1452
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


    ;Print 'X' at (9) 1460th location, setting value in Array as well.
    c9:
        mov ax, X
        mov dx, 1460
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
    ;Print 'O' at (1) 804th location, setting value in Array as well.
    o1:
        mov ax, O
        mov dx, 804
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


    ;Print 'O' at (2) 812th location, setting value in Array as well.
    o2:
        mov ax, O
        mov dx, 812
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


    ;Print 'O' at (3) 820th location, setting value in Array as well.
    o3:
        mov ax, O
        mov dx, 820
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
        

    ;Print 'O' at (4) 1124th location, setting value in Array as well.
    o4:
        mov ax, O
        mov dx, 1124
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
        

    ;Print 'O' at (5) 1132th location, setting value in Array as well.
    o5:
        mov ax, O
        mov dx, 1132
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
        

    ;Print 'O' at (6) 1140th location, setting value in Array as well.
    o6:
        mov ax, O
        mov dx, 1140
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
        

    ;Print 'O' at (7) 1444th location, setting value in Array as well.
    o7:
        mov ax, O
        mov dx, 1444
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
        

    ;Print 'O' at (8) 1452th location, setting value in Array as well.
    o8:
        mov ax, O
        mov dx, 1452
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
        

    ;Print 'O' at (9) 1460th location, setting value in Array as well.
    o9:
        mov ax, O
        mov dx, 1460
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


    aa5:
        mov bx, 1
        cmp bx, [Array + 2]
        je abc
        jmp again


    aa6:
        mov bx, 1
        cmp bx, [Array + 6]
        je abc
        jmp again


    aa7:
        mov bx, 1
        cmp bx, [Array + 8]
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

        cmp bx, [Array + 4]
        je aa5

        cmp bx, [Array + 12]
        je aa6

        cmp bx, [Array + 16]
        je aa7

        jmp logic3

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

    bb4:
        mov bx, 1
        cmp bx, [Array + 0]
        je abc
        jmp again 


    bb5:
        mov bx, 1
        cmp bx, [Array + 8]
        je abc
        jmp again 


    bb1:
        mov bx, 1
        cmp bx, [Array + 0]
        je bb2

        cmp bx, [Array + 8]
        je bb3

        cmp bx, [Array + 4]
        je bb4

        cmp bx, [Array + 14]
        je bb5

        jmp logic4


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


    cc5:
        mov bx, 1
        cmp bx, [Array + 2]
        je abc
        jmp again

    cc6:
        mov bx, 1
        cmp bx, [Array + 10]
        je abc
        jmp again


    cc7:
        mov bx, 1
        cmp bx, [Array + 8]
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

        cmp bx, [Array + 0]
        je cc5

        cmp bx, [Array + 16]
        je cc6

        cmp bx, [Array + 12]
        je cc7

        jmp logic5


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


    dd4:
        mov bx, 1
        cmp bx, [Array + 0]
        je abc
        jmp again 


    dd5:
        mov bx, 1
        cmp bx, [Array + 8]
        je abc
        jmp again 


    dd1:
        mov bx, 1
        cmp bx, [Array + 0]
        je dd2

        cmp bx, [Array + 8]
        je dd3

        cmp bx, [Array + 12]
        je dd4

        cmp bx, [Array + 10]
        je dd5

        jmp again


    ee2:
        mov bx, 1
        cmp bx, [Array + 10]
        je abc
        jmp again 


    ee3:
        mov bx, 1
        cmp bx, [Array + 6]
        je abc
        jmp again 


    ee4:
        mov bx, 1
        cmp bx, [Array + 14]
        je abc
        jmp again 


    ee5:
        mov bx, 1
        cmp bx, [Array + 2]
        je abc
        jmp again


    ee6:
        mov bx, 1
        cmp bx, [Array + 16]
        je abc
        jmp again 


    ee7:
        mov bx, 1
        cmp bx, [Array + 0]
        je abc
        jmp again 


    ee8:
        mov bx, 1
        cmp bx, [Array + 12]
        je abc
        jmp again 


    ee9:
        mov bx, 1
        cmp bx, [Array + 4]
        je abc
        jmp again


    ee1:
        mov bx, 1
        cmp bx, [Array + 6]
        je ee2

        cmp bx, [Array + 10]
        je ee3

        cmp bx, [Array + 2]
        je ee4

        cmp bx, [Array + 14]
        je ee5

        cmp bx, [Array + 0]
        je ee6

        cmp bx, [Array + 16]
        je ee7

        cmp bx, [Array + 4]
        je ee8

        cmp bx, [Array + 12]
        je ee9

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


    ff4:
        mov bx, 1
        cmp bx, [Array + 4]
        je abc
        jmp again 


    ff5:
        mov bx, 1
        cmp bx, [Array + 8]
        je abc
        jmp again 


    ff1:
        mov bx, 1
        cmp bx, [Array + 4]
        je ff2

        cmp bx, [Array + 8]
        je ff3

        cmp bx, [Array + 16]
        je ff4

        cmp bx, [Array + 6]
        je ff5

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


    gg5:
        mov bx, 1
        cmp bx, [Array + 6]
        je abc
        jmp again

    gg6:
        mov bx, 1
        cmp bx, [Array + 14]
        je abc
        jmp again


    gg7:
        mov bx, 1
        cmp bx, [Array + 8]
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

        cmp bx, [Array + 0]
        je gg5

        cmp bx, [Array + 16]
        je gg6

        cmp bx, [Array + 4]
        je gg7
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


    hh4:
        mov bx, 1
        cmp bx, [Array + 12]
        je abc
        jmp again 


    hh5:
        mov bx, 1
        cmp bx, [Array + 8]
        je abc
        jmp again


    hh1:
        mov bx, 1
        cmp bx, [Array + 12]
        je hh2

        cmp bx, [Array + 8]
        je hh3

        cmp bx, [Array + 16]
        je hh4

        cmp bx, [Array + 2]
        je hh5

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


    ii5:
        mov bx, 1
        cmp bx, [Array + 10]
        je abc
        jmp again

    ii6:
        mov bx, 1
        cmp bx, [Array + 8]
        je abc
        jmp again


    ii7:
        mov bx, 1
        cmp bx, [Array + 14]
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

        cmp bx, [Array + 4]
        je ii5

        cmp bx, [Array + 0]
        je ii6

        cmp bx, [Array + 12]
        je ii7

        jmp again


    ;logic for "X's"
    logic1:
        mov bx, 1
        cmp bx, [Array + 16]
        je ii1

        mov bx, 1
        cmp bx, [Array + 14]
        je hh1

        mov bx, 1
        cmp bx, [Array + 12]
        je gg1

        mov bx, 1
        cmp bx, [Array + 10]
        je ff1

        mov bx, 1
        cmp bx, [Array + 8]
        je ee1

        mov bx, 1        
        cmp bx, [Array + 6]
        je dd1

        mov bx, 1
        cmp bx, [Array + 4]
        je cc1

        mov bx, 1
        cmp bx, [Array + 2]
        je bb1
        
        mov bx, 1
        cmp bx, [Array + 0]
        je aa1

        jmp again


    logic3:
        mov bx, 1
        cmp bx, [Array + 16]
        je ii1

        mov bx, 1
        cmp bx, [Array + 14]
        je hh1

        mov bx, 1
        cmp bx, [Array + 12]
        je gg1

        mov bx, 1
        cmp bx, [Array + 10]
        je ff1

        mov bx, 1
        cmp bx, [Array + 8]
        je ee1

        mov bx, 1        
        cmp bx, [Array + 6]
        je dd1

        mov bx, 1
        cmp bx, [Array + 4]
        je cc1

        mov bx, 1
        cmp bx, [Array + 2]
        je bb1


        jmp again



    logic4:
        mov bx, 1
        cmp bx, [Array + 16]
        je ii1

        mov bx, 1
        cmp bx, [Array + 14]
        je hh1

        mov bx, 1
        cmp bx, [Array + 12]
        je gg1

        mov bx, 1
        cmp bx, [Array + 10]
        je ff1

        mov bx, 1
        cmp bx, [Array + 8]
        je ee1

        mov bx, 1        
        cmp bx, [Array + 6]
        je dd1

        mov bx, 1
        cmp bx, [Array + 4]
        je cc1
        
        mov bx, 1
        cmp bx, [Array + 0]
        je aa1


        jmp again

    logic5:
        mov bx, 1
        cmp bx, [Array + 16]
        je ii1

        mov bx, 1
        cmp bx, [Array + 14]
        je hh1

        mov bx, 1
        cmp bx, [Array + 12]
        je gg1

        mov bx, 1
        cmp bx, [Array + 10]
        je ff1

        mov bx, 1
        cmp bx, [Array + 8]
        je ee1

        mov bx, 1        
        cmp bx, [Array + 6]
        je dd1


        mov bx, 1
        cmp bx, [Array + 2]
        je bb1
        
        mov bx, 1
        cmp bx, [Array + 0]
        je aa1

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


    _aa5:
        mov bx, 2
        cmp bx, [Array + 2]
        je def
        jmp again2


    _aa6:
        mov bx, 2
        cmp bx, [Array + 6]
        je def
        jmp again2


    _aa7:
        mov bx, 2
        cmp bx, [Array + 8]
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

        cmp bx, [Array + 4]
        je _aa5

        cmp bx, [Array + 12]
        je _aa6

        cmp bx, [Array + 16]
        je _aa7

        jmp logic6

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


    _bb4:
        mov bx, 2
        cmp bx, [Array + 0]
        je def
        jmp again2 


    _bb5:
        mov bx, 2
        cmp bx, [Array + 8]
        je def
        jmp again2 


    _bb1:
        mov bx, 2
        cmp bx, [Array + 0]
        je _bb2

        cmp bx, [Array + 8]
        je _bb3

        cmp bx, [Array + 4]
        je _bb4

        cmp bx, [Array + 14]
        je _bb5

        jmp logic7


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


    _cc5:
        mov bx, 2
        cmp bx, [Array + 2]
        je def
        jmp again2

    _cc6:
        mov bx, 2
        cmp bx, [Array + 10]
        je def
        jmp again2


    _cc7:
        mov bx, 2
        cmp bx, [Array + 8]
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

        cmp bx, [Array + 0]
        je _cc5

        cmp bx, [Array + 16]
        je _cc6

        cmp bx, [Array + 12]
        je _cc7

        jmp logic8


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


    _dd4:
        mov bx, 2
        cmp bx, [Array + 0]
        je def
        jmp again2


    _dd5:
        mov bx, 2
        cmp bx, [Array + 8]
        je def
        jmp again2


    _dd1:
        mov bx, 2
        cmp bx, [Array + 0]
        je _dd2

        cmp bx, [Array + 8]
        je _dd3

        cmp bx, [Array + 12]
        je _dd4

        cmp bx, [Array + 10]
        je _dd5

        jmp again2


    _ee2:
        mov bx, 2
        cmp bx, [Array + 10]
        je def
        jmp again2 


    _ee3:
        mov bx, 2
        cmp bx, [Array + 6]
        je def
        jmp again2


    _ee4:
        mov bx, 2
        cmp bx, [Array + 14]
        je def
        jmp again2


    _ee5:
        mov bx, 2
        cmp bx, [Array + 2]
        je def
        jmp again2


    _ee6:
        mov bx, 2
        cmp bx, [Array + 16]
        je def
        jmp again2


    _ee7:
        mov bx, 2
        cmp bx, [Array + 0]
        je def
        jmp again2


    _ee8:
        mov bx, 2
        cmp bx, [Array + 12]
        je def
        jmp again2


    _ee9:
        mov bx, 2
        cmp bx, [Array + 4]
        je def
        jmp again2


    _ee1:
        mov bx, 1
        cmp bx, [Array + 6]
        je _ee2

        cmp bx, [Array + 10]
        je _ee3

        cmp bx, [Array + 2]
        je _ee4

        cmp bx, [Array + 14]
        je _ee5

        cmp bx, [Array + 0]
        je _ee6

        cmp bx, [Array + 16]
        je _ee7

        cmp bx, [Array + 4]
        je _ee8

        cmp bx, [Array + 12]
        je _ee9

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


    _ff4:
        mov bx, 2
        cmp bx, [Array + 4]
        je def
        jmp again2


    _ff5:
        mov bx, 2
        cmp bx, [Array + 8]
        je def
        jmp again2


    _ff1:
        mov bx, 2
        cmp bx, [Array + 4]
        je _ff2

        cmp bx, [Array + 8]
        je _ff3

        cmp bx, [Array + 16]
        je _ff4

        cmp bx, [Array + 6]
        je _ff5

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


    _gg5:
        mov bx, 2
        cmp bx, [Array + 6]
        je def
        jmp again2

    _gg6:
        mov bx, 2
        cmp bx, [Array + 14]
        je def
        jmp again2

    _gg7:
        mov bx, 2
        cmp bx, [Array + 8]
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

        cmp bx, [Array + 0]
        je _gg5

        cmp bx, [Array + 16]
        je _gg6

        cmp bx, [Array + 4]
        je _gg7

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


    _hh4:
        mov bx, 2
        cmp bx, [Array + 12]
        je def
        jmp again2 


    _hh5:
        mov bx, 2
        cmp bx, [Array + 8]
        je def
        jmp again2


    _hh1:
        mov bx, 2
        cmp bx, [Array + 12]
        je _hh2

        cmp bx, [Array + 8]
        je _hh3

        cmp bx, [Array + 16]
        je _hh4

        cmp bx, [Array + 2]
        je _hh5

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


    _ii5:
        mov bx, 2
        cmp bx, [Array + 10]
        je def
        jmp again2


    _ii6:
        mov bx, 2
        cmp bx, [Array + 8]
        je def
        jmp again2


    _ii7:
        mov bx, 2
        cmp bx, [Array + 14]
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

        cmp bx, [Array + 4]
        je _ii5

        cmp bx, [Array + 0]
        je _ii6

        cmp bx, [Array + 12]
        je _ii7
        
        jmp again2

    ;logic for "O's"
    logic2:
        mov bx, 2
        cmp bx, [Array + 16]
        je _ii1

        mov bx, 2
        cmp bx, [Array + 14]
        je _hh1

        mov bx, 2
        cmp bx, [Array + 12]
        je _gg1

        mov bx, 2
        cmp bx, [Array + 10]
        je _ff1

        mov bx, 2
        cmp bx, [Array + 8]
        je _ee1

        mov bx, 2        
        cmp bx, [Array + 6]
        je _dd1

        mov bx, 2
        cmp bx, [Array + 4]
        je _cc1

        mov bx, 2
        cmp bx, [Array + 2]
        je _bb1

        mov bx, 2
        cmp bx, [Array + 0]
        je _aa1

        jmp again2


    logic6:
        mov bx, 2
        cmp bx, [Array + 16]
        je _ii1

        mov bx, 2
        cmp bx, [Array + 14]
        je _hh1

        mov bx, 2
        cmp bx, [Array + 12]
        je _gg1

        mov bx, 2
        cmp bx, [Array + 10]
        je _ff1

        mov bx, 2
        cmp bx, [Array + 8]
        je _ee1

        mov bx, 2        
        cmp bx, [Array + 6]
        je _dd1

        mov bx, 2
        cmp bx, [Array + 4]
        je _cc1

        mov bx, 2
        cmp bx, [Array + 2]
        je _bb1

        jmp again2


    logic7:
        mov bx, 2
        cmp bx, [Array + 16]
        je _ii1

        mov bx, 2
        cmp bx, [Array + 14]
        je _hh1

        mov bx, 2
        cmp bx, [Array + 12]
        je _gg1

        mov bx, 2
        cmp bx, [Array + 10]
        je _ff1

        mov bx, 2
        cmp bx, [Array + 8]
        je _ee1

        mov bx, 2        
        cmp bx, [Array + 6]
        je _dd1

        mov bx, 2
        cmp bx, [Array + 4]
        je _cc1

        mov bx, 2
        cmp bx, [Array + 0]
        je _aa1

        jmp again2


    logic8:
        mov bx, 2
        cmp bx, [Array + 16]
        je _ii1

        mov bx, 2
        cmp bx, [Array + 14]
        je _hh1

        mov bx, 2
        cmp bx, [Array + 12]
        je _gg1

        mov bx, 2
        cmp bx, [Array + 10]
        je _ff1

        mov bx, 2
        cmp bx, [Array + 8]
        je _ee1

        mov bx, 2        
        cmp bx, [Array + 6]
        je _dd1

        mov bx, 2
        cmp bx, [Array + 2]
        je _bb1

        mov bx, 2
        cmp bx, [Array + 0]
        je _aa1


        jmp again2
        
    ;-----------------------------------------------------------------------------------------------------------------
    ;end of Possibles of 'O'


    ;Printing winning statement of player 1, check 'draw_check'.
    abc:
        mov ax, player1won
        mov dx, 1770
        push ax
        push word [len_p1won]
        push dx
        call printstr_blinker
        mov word[draw_check], 1
        jmp drop


    ;Printing winning statement of player 2, check 'draw_check'.
    def:
        mov ax, player2won
        mov dx, 1770
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
            mov dx, 1602
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
            mov dx, 1602
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
            mov dx, 1770
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