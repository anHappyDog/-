#feb
#����һ������������쳲�������
.data

###����
.macro end
li $v0,10
syscall
.end_macro
###

###�������
.macro outputInt(%ans)
li $v0,1
addi $a0,%ans,0
syscall
.end_macro
###

###��������
.macro inputInt(%ans)
li $v0,5
syscall
addi %ans,$v0,0
.end_macro
###

###��ջ
.macro push(%ans)
sw %ans,0($sp)
subi $sp,$sp,4
.end_macro
###

###��ջ
.macro pop(%ans)
addi $sp,$sp,4
lw %ans,0($sp)
.end_macro


.text
###������
main:
inputInt($s0) 			#�������
push($s0)
push($s1)
addi $a0,$s1,0		#����
addi $a1,$s0,-2 			#��0��ʼ
addi $a2,$zero,0
addi $a3,$zero,1
jal feb
move $t0,$v0
pop($s1)
pop($s0)
move $t0,$v0
outputInt($t0)
end
###

###feb����feb(a1,a2(����),a3 = 0,a4 = 1)
feb:
 beq $a1,-1,feb0
 beq $a1,0,feb1
 beq $a0,$a1,febequal
 addi $t0,$a2,0
 move $a2,$a3
 add $a3,$t0,$a2
 addi $a0,$a0,1
 push($ra)
 jal feb
 pop($ra)
 jr $ra
 
 
feb0:
addi $v0,$zero,0
jr $ra
feb1:
addi $v0,$zero,1
jr $ra
febequal:
addi $v0,$a3,0
jr $ra
###















