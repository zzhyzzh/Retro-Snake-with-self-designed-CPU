j start // 0
add $zero, $zero, $zero // 4
add $zero, $zero, $zero // 8
add $zero, $zero, $zero // C
add $zero, $zero, $zero // 10
add $zero, $zero, $zero // 14
add $zero, $zero, $zero // 18
add $zero, $zero, $zero // 1C
//------------------��ʼ����ֵ-------------------
start:
	addi $s0, $zero, 0x10//x����1
	addi $s1, $zero, 0x200//y����1
	addi $k0, $zero, 0x1c00//y�߽磺14
	addi $k1, $zero, 0x130//x�߽磺19
	addi $t0, $zero, 0x0//�հ�
	addi $t1, $zero, 0x1//����
	addi $t2, $zero, 0x2//����
	addi $t3, $zero, 0x3//����
	addi $t4, $zero, 0x4//����
	addi $t5, $zero, 0x5//����
	addi $t6, $zero, 0x6//ͷ��
	addi $t7, $zero, 0x7//ͷ��
	addi $t8, $zero, 0x8//ͷ��
	addi $t9, $zero, 0x9//ͷ��
	add $at, $zero, $zero

	lui $fp, 0x3000
	lui $sp, 0x2000			//game over
	lui $v0, 0xc000			//VGA address
	lui $s3, 0x0008			//��ʱ����
	lui $s4, 0x1000			//BTN address

	addi $a1, $zero, 0x405//�洢β:00010,00000,0101
	sw $a1, 0x0($v0)      //��ʼ������β��
	addi $a2, $zero, 0x419//�洢ͷ:00010,00001,1001
	sw $a2, 0x0($v0)      //��ʼ������ͷ��
	addi $s2, $zero, 30
fruit:
	add $t0, $t0, $t1
	bne $t0, $s2, not_30
	add $t0, $zero, $t1
not_30:
	add $a0, $t0, $fp
	lw $a0, 0x0($a0)
	add $v1, $v0, $a0
	lw $a0, 0x0($v1)
	andi $at, $a0, 0xf
	bne $at, $zero, fruit
	xor $a0, $a0, $t1
	sw $a0, 0x0($v0)
reverse_reject:
	add $s2, $zero, $zero

loop:
	add $s2, $s2, $t1//ѭ��
	lw  $gp, 0x0($s4)//ȡBTN״̬
	beq $s2, $s3, next
	j loop

next:
	andi $at, $a2, 0xf//ȡͷ����λ
	and $s5, $t8, $gp//BTN3
	beq $s5, $t8, go_up
	and $s5, $t4, $gp//BTN2
	beq $s5, $t4, go_down
	and $s5, $t2, $gp//BTN1
	beq $s5, $t2, go_left
	and $s5, $t1, $gp//BTN0
	beq $s5, $t1, go_right

	beq $t6, $at, go_up
	beq $t7, $at, go_down
	beq $t8, $at, go_left
	beq $t9, $at, go_right

	j loop

go_up:
	andi $s7, $a2, 0x3e00//11111_00000_0000,ȡy����
	beq $s7, $zero, game_over
	beq $at, $t7, reverse_reject//�����������ƶ�

	sub $a0, $a2, $s1
    add $v1, $a0, $v0
	lw  $a0, 0x0($v1)
	andi $at, $a0, 0xf//ȡ����λ
	bne $t1, $at, not_fruit1
	addi $ra, $zero, 1//��־�Ե��˹���

not_fruit1:
	slt $at, $t1, $at
	beq $t1, $at, game_over
	andi $at, $a2, 0xf//ȡͷ����λ
	sub $a3, $a2, $at//ȥ������λ
	add $a3, $a3, $t2//����λ��״̬������
	sw  $a3,0x0($v0)
	sub $a2, $a2, $s1//y-1,ͷλ�ø���
	sub $a2, $a2, $at//ȥ������λ
	xor $a2, $a2, $t6//ͷ�����޸�Ϊ��
	sw $a2, 0x0($v0)
	j tail

go_down:
	andi $s7, $a2, 0x3e00//11111_00000_0000,ȡy����
	beq $s7, $k0, game_over
	beq $at, $t6, reverse_reject//�����������ƶ�

	add $a0, $a2, $s1
    add $v1, $a0, $v0
	lw  $a0, 0x0($v1)
	andi $at, $a0, 0xf//ȡͷ����λ
	bne $t1, $at, not_fruit2
	addi $ra, $zero, 1

not_fruit2:
	slt $at, $t1, $at
	beq $t1, $at, game_over
	andi $at, $a2, 0xf//ȡͷ����λ
	sub $a3, $a2, $at//ȥ������λ
	add $a3, $a3, $t3//����λ��״̬������
	sw  $a3,0x0($v0)
	add $a2, $a2, $s1//y+1,ͷλ�ø���
	sub $a2, $a2, $at//ȥ������λ
	xor $a2, $a2, $t7//ͷ�����޸�Ϊ��
	sw $a2, 0x0($v0)
	j tail

go_left:
	andi $s6, $a2, 0x1f0//11111_0000,ȡx����
	beq $s6, $zero, game_over
	beq $at, $t9, reverse_reject//�����������ƶ�

	sub $a0, $a2, $s0
    add $v1, $a0, $v0
	lw  $a0, 0x0($v1)
	andi $at, $a0, 0xf//ȡ����λ
	bne $t1, $at, not_fruit3
	addi $ra, $zero, 1

not_fruit3:
	slt $at, $t1, $at
	beq $t1, $at, game_over
	andi $at, $a2, 0xf//ȡͷ����λ
	sub $a3, $a2, $at//ȥ������λ
	add $a3, $a3, $t4//����λ��״̬������
	sw  $a3,0x0($v0)
	sub $a2, $a2, $s0//x-1,ͷλ�ø���
	sub $a2, $a2, $at//ȥ������λ
	xor $a2, $a2, $t8//ͷ�����޸�Ϊ��
	sw  $a2, 0x0($v0)
	j tail

go_right:
	andi $s6, $a2, 0x1f0//11111_0000,ȡx����
	beq $s6, $k1, game_over
	beq $at, $t8, reverse_reject//�����������ƶ�

	add $a0, $a2, $s0
    add $v1, $a0, $v0
	lw  $a0, 0x0($v1)
	andi $at, $a0, 0xf
	bne $t1, $at, not_fruit4
	addi $ra, $zero, 1

not_fruit4:
	slt $at, $t1, $at
	beq $t1, $at, game_over
	andi $at, $a2, 0xf//ȡͷ����λ
	sub $a3, $a2, $at//ȥ������λ
	add $a3, $a3, $t5//����λ��״̬������
	sw  $a3,0x0($v0)
	add $a2, $a2, $s0//x+1,ͷλ�ø���
	sub $a2, $a2, $at//ȥ������λ
	xor $a2, $a2, $t9//ͷ�����޸�Ϊ��
	sw  $a2, 0x0($v0)
	j tail
tail:
	beq $ra, $t1, tail_stay_still//�Ե��˹��ӣ�β�Ͳ���
	andi $at, $a1, 0xf//ȡβ����λ
	beq $at, $t2, tail_points_to_up
	beq $at, $t3, tail_points_to_down
	beq $at, $t4, tail_points_to_left
	beq $at, $t5, tail_points_to_right

tail_points_to_up:
	sub $a3, $a1, $t2//����λ��״̬��Ϊ��
	sw $a3, 0x0($v0)
	sub $a1, $a1, $s1//y-1
	j update
	
tail_points_to_down:
	sub $a3, $a1, $t3//����λ��״̬��Ϊ��
	sw $a3, 0x0($v0)
	add $a1, $a1, $s1//y+1
	j update
	
tail_points_to_left:
	sub $a3, $a1, $t4//����λ��״̬��Ϊ��
	sw $a3, 0x0($v0)
	sub $a1, $a1, $s0//x-1
	j update
	
tail_points_to_right:
	sub $a3, $a1, $t5//����λ��״̬��Ϊ��
	sw $a3, 0x0($v0)
	add $a1, $a1, $s0//x+1
	j update

update:
	xor $v1, $v0, $a1
	lw $a1, 0x0($v1)//βλ�ø���
	add $s2, $zero, $zero
	j loop

tail_stay_still:
	add $s2, $zero, $zero
	j fruit
game_over:
	add $s2, $zero, $zero

back:
	sw $t1, 0x0($sp)
	add $s2, $s2, $t1//ѭ��
	beq $s2, $s3, start
	j back
