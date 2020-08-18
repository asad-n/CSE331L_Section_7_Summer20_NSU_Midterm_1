.MODEL SMALL
.STACK 64
.DATA
  STRING DB ?
  SYM DB '$'
  INPUT_M DB 0ah,0dh,0AH,0DH,'Enter a string: ',0DH,0AH,'$'
  OUTPUT_M DB 0ah,0dh,0AH,0DH,'The string is: ',0DH,0AH,'$'
  
 .CODE
 MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    MOV DX,OFFSET INPUT_M
    MOV AH,09
    INT 21H
    LEA SI,STRING
    
    
 INPUT:
    MOV AH,01
    INT 21H
    MOV [SI],AL
    
    INC SI
    CMP AL,0DH
    JNZ INPUT
    
    MOV [SI],'$'
    
    
 OUTPUT:
    MOV AX,@STRING
    MOV DS,AX
    MOV DX,OFFSET STRING
    MOV AH,09H
    INT21H
    
    MOV AX,@STRING
    MOV DS,AX
    MOV DX,OFFSET STRING
    MOV AH,09H
    INT21H
    
    MOV AH,4CH
    INT 21H
    
    
    