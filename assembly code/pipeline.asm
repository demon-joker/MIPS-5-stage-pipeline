.data

.align 4

.text
main:

# Parameters
la   $t0, 0x0000000
lw   $s0, 0($t0)    # set $s0 to n
move $a0, $s0       # set $a0 to n
addi $a1, $t0, 4    # set $a1 to &graph

# Call Bellman-Ford
jal  bellman_ford

# Count results
li   $t0, 4
li   $a0, 0
li   $t1, 0x100400
count_entry:
addi $t1, $t1, 4
lw   $t2, 0($t1)
add  $a0, $a0, $t2
addi $t0, $t0, 4
blt  $t0, $a2, count_entry
jal end

bellman_ford:
##### YOUR CODE HERE #####
la $s1, 0x100400            # $s1 is dist
sw $zero,0($s1)         # dist[0] = 0
addi $t0,$zero,1        # $t0 = 1
addi $t1,$zero,-1
move $t2,$s1
bge $t0,$a0,next
for_0:
addi $t2,$t2,4
sw $t1,0($t2)           # dist[i] = -1
addi $t0,$t0,1
blt $t0,$a0,for_0

next:
move $a2,$a0            # $a2 is n
sll $a2,$a2,2           # $a2 is n*4 (bias)

addi $t0,$zero,1        #$t0 is i
for_1:
bge $t0, $a0,finally
move $t1,$zero          # $t1 is u
for_2:
move $t2,$zero          # $t2 is v
for_3:
sll $t3,$t1,5
add $t3,$t3,$t2         # $t3 is addr
add $t4,$s1,$t1
lw $t4,0($t4)           # $t4 =dist[u]
addi $t5,$zero,-1
beq $t5,$t4,continue_3
add $t4,$a1,$t3
lw $t4,0($t4)           # $t4=graph[addr]
beq $t5,$t4,continue_3
add $t4,$s1,$t2
lw $t4,0($t4)           # $t4=dist[v]
add $t6,$s1,$t1
lw $t6,0($t6)           # $t6=dist[u]
add $t7,$a1,$t3
lw $t7,0($t7)           # $t7=graph[addr]
add $t6,$t6,$t7         # $t6 = dist[u] + graph[addr]
bgt $t4,$t6,if_2
beq $t5,$t4,if_2
j next_1
if_2:
add $t4,$s1,$t2
sw $t6,0($t4)           #  dist[v] = dist[u] + graph[addr]
next_1:

continue_3:
addi $t2,$t2,4
blt $t2,$a2,for_3

addi $t1,$t1,4
blt $t1,$a2,for_2

addi $t0,$t0,1
j for_1

finally:
jr $ra

end:
    andi $t0, $a0, 0xf		
	srl $t1, $a0, 4
	andi $t1, $t1, 0xf
	srl $t2, $a0, 8
	andi $t2, $t2, 0xf
	srl $t3, $a0, 12
	andi $t3, $t3, 0xf
	li $a1 2100
	li $a2 0
	li $a3 0x40000010
	showloop_1:
		show_0:bne $t0 0 show_1
		li  $t4 0x013f 
		sw  $t4 0($a3)
		show_1:bne $t0 1 show_2
		li  $t4 0x0106 
		sw  $t4 0($a3)
		show_2:bne $t0 2 show_3
		li  $t4 0x015b
		sw  $t4 0($a3)
		show_3:bne $t0 3 show_4
		li  $t4 0x014f 
		sw  $t4 0($a3)
		show_4:bne $t0 4 show_5
		li  $t4 0x0166 
		sw  $t4 0($a3)
		show_5:bne $t0 5 show_6
		li  $t4 0x016d 
		sw  $t4 0($a3)
		show_6:bne $t0 6 show_7
		li  $t4 0x017d
		sw  $t4 0($a3)
		show_7:bne $t0 7 show_8
		li  $t4 0x0107
		sw  $t4 0($a3)
		show_8:bne $t0 8 show_9
		li  $t4 0x017f 
		sw  $t4 0($a3)
		show_9:bne $t0 9 show_a
		li  $t4 0x016f
		sw  $t4 0($a3)
		show_a:bne $t0 10 show_b
		li  $t4 0x015c
		sw  $t4 0($a3)
		show_b:bne $t0 11 show_c
		li  $t4 0x017c
		sw  $t4 0($a3)
		show_c:bne $t0 12 show_d
		li  $t4 0x0139
		sw  $t4 0($a3)
		show_d:bne $t0 13 show_e
		li  $t4 0x015e
		sw  $t4 0($a3)
		show_e:bne $t0 14 show_f
		li $t4 0x0179
		sw $t4 0($a3)
		show_f:bne $t0 15 endshowloop_1
		li $t4 0x0171
		sw $t4 0($a3)
		endshowloop_1:
		addi $a2 $a2 1
		blt $a2 $a1 showloop_1
	li $a2 0
	showloop_2:
		show_20:bne $t1 0 show_21
		li  $t4 0x023f 
		sw  $t4 0($a3)
		show_21:bne $t1 1 show_22
		li  $t4 0x0206 
		sw  $t4 0($a3)
		show_22:bne $t1 2 show_23
		li  $t4 0x025b
		sw  $t4 0($a3)
		show_23:bne $t1 3 show_24
		li  $t4 0x024f 
		sw  $t4 0($a3)
		show_24:bne $t1 4 show_25
		li  $t4 0x0266 
		sw  $t4 0($a3)
		show_25:bne $t1 5 show_26
		li  $t4 0x026d 
		sw  $t4 0($a3)
		show_26:bne $t1 6 show_27
		li  $t4 0x027d
		sw  $t4 0($a3)
		show_27:bne $t1 7 show_28
		li  $t4 0x0207
		sw  $t4 0($a3)
		show_28:bne $t1 8 show_29
		li  $t4 0x027f 
		sw  $t4 0($a3)
		show_29:bne $t0 9 show_2a
		li  $t4 0x026f
		sw  $t4 0($a3)
		show_2a:bne $t0 10 show_2b
		li  $t4 0x025c
		sw  $t4 0($a3)
		show_2b:bne $t0 11 show_2c
		li  $t4 0x027c
		sw  $t4 0($a3)
		show_2c:bne $t0 12 show_2d
		li  $t4 0x0239
		sw  $t4 0($a3)
		show_2d:bne $t0 13 show_2e
		li  $t4 0x025e
		sw  $t4 0($a3)
		show_2e:bne $t0 14 show_2f
		li $t4 0x0279
		sw $t4 0($a3)
		show_2f:bne $t0 15 endshowloop_2
		li $t4 0x0271
		sw $t4 0($a3)
		endshowloop_2:
		addi $a2 $a2 1
		blt $a2 $a1 showloop_2
	li $a2 0
	showloop_3:
		show_30:bne $t2 0 show_31
		li  $t4 0x043f 
		sw  $t4 0($a3)
		show_31:bne $t2 1 show_32
		li  $t4 0x0406 
		sw  $t4 0($a3)
		show_32:bne $t2 2 show_33
		li  $t4 0x045b
		sw  $t4 0($a3)
		show_33:bne $t2 3 show_34
		li  $t4 0x044f 
		sw  $t4 0($a3)
		show_34:bne $t2 4 show_35
		li  $t4 0x0466 
		sw  $t4 0($a3)
		show_35:bne $t2 5 show_36
		li  $t4 0x046d 
		sw  $t4 0($a3)
		show_36:bne $t2 6 show_37
		li  $t4 0x047d
		sw  $t4 0($a3)
		show_37:bne $t2 7 show_38
		li  $t4 0x0407
		sw  $t4 0($a3)
		show_38:bne $t2 8 show_39
		li  $t4 0x047f 
		sw  $t4 0($a3)
		show_39:bne $t0 9 show_3a
		li  $t4 0x046f
		sw  $t4 0($a3)
		show_3a:bne $t0 10 show_3b
		li  $t4 0x045c
		sw  $t4 0($a3)
		show_3b:bne $t0 11 show_3c
		li  $t4 0x047c
		sw  $t4 0($a3)
		show_3c:bne $t0 12 show_3d
		li  $t4 0x0439
		sw  $t4 0($a3)
		show_3d:bne $t0 13 show_3e
		li  $t4 0x045e
		sw  $t4 0($a3)
		show_3e:bne $t0 14 show_3f
		li $t4 0x0479
		sw $t4 0($a3)
		show_3f:bne $t0 15 endshowloop_3
		li $t4 0x0471
		sw $t4 0($a3)
		endshowloop_3:
		addi $a2 $a2 1
		blt $a2 $a1 showloop_3
	li $a2 0
	showloop_4:
		show_40:bne $t3 0 show_41
		li  $t4 0x083f 
		sw  $t4 0($a3)
		show_41:bne $t3 1 show_42
		li  $t4 0x0806 
		sw  $t4 0($a3)
		show_42:bne $t3 2 show_43
		li  $t4 0x085b
		sw  $t4 0($a3)
		show_43:bne $t3 3 show_44
		li  $t4 0x084f 
		sw  $t4 0($a3)
		show_44:bne $t3 4 show_45
		li  $t4 0x0866 
		sw  $t4 0($a3)
		show_45:bne $t3 5 show_46
		li  $t4 0x086d 
		sw  $t4 0($a3)
		show_46:bne $t3 6 show_47
		li  $t4 0x087d
		sw  $t4 0($a3)
		show_47:bne $t3 7 show_48
		li  $t4 0x0807
		sw  $t4 0($a3)
		show_48:bne $t3 8 show_49
		li  $t4 0x087f 
		sw  $t4 0($a3)
		show_49:bne $t0 9 show_4a
		li  $t4 0x086f
		sw  $t4 0($a3)
		show_4a:bne $t0 10 show_4b
		li  $t4 0x085c
		sw  $t4 0($a3)
		show_4b:bne $t0 11 show_4c
		li  $t4 0x087c
		sw  $t4 0($a3)
		show_4c:bne $t0 12 show_4d
		li  $t4 0x0839
		sw  $t4 0($a3)
		show_4d:bne $t0 13 show_4e
		li  $t4 0x085e
		sw  $t4 0($a3)
		show_4e:bne $t0 14 show_4f
		li $t4 0x0879
		sw $t4 0($a3)
		show_4f:bne $t0 15 endshowloop_4
		li $t4 0x0871
		sw $t4 0($a3)
		endshowloop_4:
		addi $a2 $a2 1
		blt $a2 $a1 showloop_4
    jal end