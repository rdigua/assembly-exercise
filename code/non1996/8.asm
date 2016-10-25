C_SEG SEGMENT
	AUGEND 	DD 99251
	SUM DD ?
C_SEG ENDS

E_SEG SEGMENT
	ADDEND	DD -15962
E_SEG ENDS

CODE SEGMENT
	ASSUME CS:CODE, DS:C_SEG, ES:E_SEG
START:
	MOV AX, C_SEG
	MOV DS, AX
	MOV AX, E_SEG
	MOV ES, AX		;init segment register

	MOV AX, WORD PTR AUGEND
	MOV BX, WORD PTR ES:ADDEND
	ADD AX, BX
	MOV SUM, AX		;add low word of these num
	
	MOV AX, WORD PTR AUGEND + 2
	MOV BX, WORD PTR ES:ADDEND + 2
	ADC AX, BX
	MOV SUM + 2, AX		;add height word of these num

	MOV AL, 4CH
	INT 21H
CODE ENDS
	END START
	
		

