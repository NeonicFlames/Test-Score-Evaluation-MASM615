TITLE TEST SCORE EVALUATION SYSTEM
.686
.MODEL flat, stdcall
.STACK
INCLUDE Irvine32.inc
.data

ArrayInteger DWORD 100 DUP(?)
ExitLoop SDWORD -1
AmountOfLoop DWORD ?
ErrorBound BYTE "Out of Range -> Rejected",0,0
EnterTestScore Byte "Enter a test score: ",0,0
TextFirst BYTE "Enter test scores from 0 to 100, or -1 to terminate input",0,0
SortedTestScore BYTE "Sorted Test Scores:",0,0
Space BYTE " ",0,0

GradeA DWORD 0
GradeB DWORD 0
GradeC DWORD 0
GradeD DWORD 0
GradeF DWORD 0

TextGradeA BYTE "A students = ",0,0
TextGradeB BYTE "B students = ",0,0
TextGradeC BYTE "C students = ",0,0
TextGradeD BYTE "D students = ",0,0
TextGradeF BYTE "F students = ",0,0

.code
main PROC
    call Clrscr
    lea edx,TextFirst
    call WriteString
	call ReadInput
	call Sort
    lea edx,SortedTestScore
    call WriteString
	call OutputSorted
	call CalcGrades
main ENDP

ReadInput PROC
mov esi,0
mov ecx, LENGTHOF ArrayInteger
L1:
    call Crlf
    lea edx, EnterTestScore
    call WriteString
    call ReadInt
    cmp ExitLoop,eax
    je EndLoop
    cmp eax,100
    ja OutOfBound
    mov ArrayInteger[esi*4],eax
    inc esi
    inc AmountOfLoop
loop L1

OutOfBound:
    lea edx, ErrorBound
    call Crlf
    call WriteString
    jmp L1

EndLoop:
ret
ReadInput ENDP

;OUTPUT ALL BACK
;mov esi,0
;mov ecx,AmountOfLoop
;L3:
;    mov eax,ArrayInteger[esi*4]
;;    call Crlf
;    call WriteDec
 ;   inc esi
;loop L3

Sort PROC
mov esi, OFFSET ArrayInteger
mov ecx, AmountOfLoop
outerloop:
    dec ecx
    jz sortdone
    mov edx,1
    push ecx
    push esi

innerloop:
    mov eax, [ESI]
    cmp eax, [esi+4]
    jle increment
    xchg eax,[esi+4]
    mov [esi],eax
    mov edx,0

increment:
    add ESI,4
    loop innerloop
    pop esi
    pop ecx
    cmp edx,1
    jne outerloop

sortdone:
ret
Sort ENDP

OutputSorted PROC
mov esi,0
mov ecx,AmountOfLoop
LoopSortedScore:
    mov eax,ArrayInteger[esi*4]
    lea edx, Space
    call WriteString
    call writedec
    inc esi
loop LoopSortedScore
ret
OutputSorted ENDP

CalcGrades PROC

;Calc GradeA
mov esi,0
mov ecx,AmountOfLoop
L4:
    mov eax,ArrayInteger[esi*4]
    inc esi
    cmp eax,100 ; if (eax <= 100 && eax >= 90)
    jg next
    cmp eax,90
    jl next
    inc GradeA
    next:
loop L4

call Crlf
lea edx,TextGradeA
call WriteString

mov eax,GradeA
call writedec


;CALC GRADEB
mov esi,0
mov ecx,AmountOfLoop
L5:
    mov eax,ArrayInteger[esi*4]
    inc esi
    cmp eax,80 ; if (eax => 80 && eax <= 89)
    jl next2
    cmp eax,89
    jg next2
    inc GradeB
    next2: 
loop L5

call Crlf
lea edx,TextGradeB
call WriteString

mov eax,GradeB
call writedec

;CALC GRADEC
mov esi,0
mov ecx,AmountOfLoop
L6:
    mov eax,ArrayInteger[esi*4]
    inc esi
    cmp eax,70 ; if (eax => 70 && eax <= 79)
    jl next3
    cmp eax,79
    jg next3
    inc GradeC
    next3: 
loop L6

call Crlf
lea edx,TextGradeC
call WriteString

mov eax,GradeC
call writedec


;CALC GradeD
mov esi,0
mov ecx,AmountOfLoop
L7:
    mov eax,ArrayInteger[esi*4]
    inc esi
    cmp eax,60 ; if (eax => 60 && eax <= 69)
    jl next4
    cmp eax,69
    jg next4
    inc GradeD
    next4: 
loop L7

call Crlf
lea edx,TextGradeD
call WriteString

mov eax,GradeD
call writedec

;CALC GRADEF
mov esi,0
mov ecx,AmountOfLoop
L8:
    mov eax,ArrayInteger[esi*4]
    inc esi
    cmp eax,0 ; if (eax => 0 && eax <= 59)
    jl next5
    cmp eax,59
    jg next5
    inc GradeF
    next5: 
loop L8

call Crlf
lea edx,TextGradeF
call WriteString

mov eax,GradeF
call writedec

CalcGrades ENDP

exit
;main ENDP
END main