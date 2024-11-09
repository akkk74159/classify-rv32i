.globl dot

.text
# =======================================================
# FUNCTION: Strided Dot Product Calculator
#
# Calculates sum(arr0[i * stride0] * arr1[i * stride1])
# where i ranges from 0 to (element_count - 1)
#
# Args:
#   a0 (int *): Pointer to first input array
#   a1 (int *): Pointer to second input array
#   a2 (int):   Number of elements to process
#   a3 (int):   Skip distance in first array
#   a4 (int):   Skip distance in second array
#
# Returns:
#   a0 (int):   Resulting dot product value
#
# Preconditions:
#   - Element count must be positive (>= 1)
#   - Both strides must be positive (>= 1)
#
# Error Handling:
#   - Exits with code 36 if element count < 1
#   - Exits with code 37 if any stride < 1
# =======================================================
dot:
    li t0, 1
    blt a2, t0, error_terminate  
    blt a3, t0, error_terminate   
    blt a4, t0, error_terminate  

    li t0, 0            					# t0 = dot product value
    li t1, 0         						# t1 = element counter

	addi sp, sp, -12
	sw s0, 0(sp)
	sw s1, 4(sp)
	sw s2, 8(sp)
	
	mv t2, a0								# t2 = address of first array
	mv t3, a1								# t3 = address of second array
	slli a3, a3, 2
	slli a4, a4, 2
loop_start:
    bge t1, a2, loop_end
    # TODO: Add your own implementation
    lw t4, 0(t2)							# t4 = value of element of t2
    lw t5, 0(t3)							# t5 = value of element of t3
    
# =======================================
multiply:
	li t6, 0 								# t6 = t4 * t5
	li s0, 1
	xor s1, t4, t5							
	srai s1, s1, 31							
	
	bltz t4, neg_a
pos_a:
	bltz t5, neg_b
pos_b:

loop:
	and s2, t5, s0
	beqz s2, skip_add
	add t6, t6, t4
	
skip_add:
	slli t4, t4, 1
	srli t5, t5, 1
	bnez t5, loop
	
	beqz s1, end
	sub t6, x0, t6
	j end
	
neg_a:
	sub t4, x0, t4
	j pos_a
neg_b:
	sub t5, x0, t5
	j pos_b
	
end:
	
# =======================================
    
	
    add t0, t0, t6
    
    
loop_continue:
	addi t1, t1, 1
	add t2, t2, a3
	add t3, t3, a4
	j loop_start
	
loop_end:
    mv a0, t0
    
    lw s0, 0(sp)
    lw s1, 4(sp)
    lw s2, 8(sp)
    addi sp, sp, 12
    
    jr ra
    
    


error_terminate:
    blt a2, t0, set_error_36
    li a0, 37
    j exit

set_error_36:
    li a0, 36
    j exit
