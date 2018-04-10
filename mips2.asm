addi $t9,$zero,12 #t9 =n
addi $t6,$zero,-4 #t6 =k
addi $s4,$zero,1
addi $s5, $zero,4
addi $s6,$zero,-4
loop: add $t6,$t6,$s5
	add $t7,$zero,$s6  #t7 =i
	slt $s3,$t6,$t9
	loop2: add $t7,$t7,$s5
		slt $s2,$t7,$t9
		add $t8,$zero,$s6
		loop3: add $t8,$t8,$s5 #t8 =j
			slt $s1,$t8,$t9
			add $t1,$t7,$t7 
			add $t1,$t1,$t1 #t1 == 4i
			add $t2,$t1,$zero #t2 == 4i
			add $t1,$t1,$t8 #t1 == 4i + j
			add $t2,$t2,$t6 #t2 == 4i +  k
			add $t3,$t6,$t6
			add $t3,$t3,$t3 #t3== 4k
			add $t3,$t3,$t8 #t3== 4k+j
			add $t2,$t2,$gp
			add $t3,$t3,$gp
			add $t1,$t1,$gp
			lw $t4,0($t2) #t4=m[i][k]
			lw $t5,0($t3) #t5=m[k][j]
			add $t4,$t4,$t5 #t4=t4+t5  m[k][j] + m[i][k]
			lw $t5,0($t1) #t5=m[i][j]
			slt $t5,$t4,$t5 #t4=1 se  m[k][j] + m[i][k]<m[i][j], else 0
			nop
			nop
				beq $t5,$zero,jump 
				sw $t4,0($t1)
				jump: beq $s1,$s4,loop3
	beq $s2,$s4,loop2
beq $s3,$s4,loop
