.globl argmax

.text
# =================================================================
# FUNCTION: Maximum Element First Index Finder
#
# Scans an integer array to find its maximum value and returns the
# position of its first occurrence. In cases where multiple elements
# share the maximum value, returns the smallest index.
#
# Arguments:
#   a0 (int *): Pointer to the first element of the array
#   a1 (int):  Number of elements in the array
#
# Returns:
#   a0 (int):  Position of the first maximum element (0-based index)
#
# Preconditions:
#   - Array must contain at least one element
#
# Error Cases:
#   - Terminates program with exit code 36 if array length < 1
# =================================================================
argmax:
    li t6, 1
    blt a1, t6, handle_error

    lw t0, 0(a0)							# t0 = max element

    li t1, 0								# t1 = index of first max element
    li t2, 1								# t2 = current index
    
    beq a1, t6, loop_end					# array contains only one element, return 0
    
    mv t3, a0								# t3 = pointer to current element
    addi t3, t3, 4
loop_start:
    # TODO: Add your own implementation
    lw t4, 0(t3)
    ble t4, t0, loop_continue
    mv t0, t4								# update max element
    mv t1, t2								# update index of max element
    
loop_continue:
	addi t2, t2, 1
	addi t3, t3, 4
    bne t2, a1, loop_start
    
loop_end:
	mv a0, t1
    jr ra

handle_error:
    li a0, 36
    j exit
