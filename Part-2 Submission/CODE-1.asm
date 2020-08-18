.MODEL SMALL
  .STACK 100H
 
  .DATA
    MSG_1 DB "Enter Integer 1: $"
    MSG_2 DB "Enter Integer 2: $"
    MSG_3 DB "MUL of the Integers: $"
    
    INT_1 DB ?
    INT_2 DB ?
    INT_3 DB ?
    
  .CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX
        
        LEA DX, MSG_1
        MOV AH, 9
        INT 21H
        
        MOV AH, 1
        INT 21H
        
        SUB AL, 30H
        MOV INT_1, AL
        
        MOV AH, 2
        MOV DL, 0DH
        INT 21H
        
        LEA DX, MSG_2
        MOV AH, 9
        INT 21H
        
        MOV AH, 1
        INT 21H
        
        SUB AL, 30H
        MOV INT_2, AL
        
        MOV AH, 2
        MOV DL, 0DH
        INT 21H
        
        MOV DL, 0AH
        INT 21H
        
        MOV AL, INT_1
        MOV BL, INT_2
        MUL INT_2
        MOV INT_3, AX
        INT 21H
        
        ADD AX, 30H
        
        MOV AH, 2
        MOV DL, AL
        INT 21H
        
        MOV AH, 4CH
        INT 21H
    MAIN ENDP
  END MAIN
    