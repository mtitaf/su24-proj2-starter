.globl argmax

.text
# =================================================================
# FUNCTION: Given a int array, return the index of the largest
#   element. If there are multiple, return the one
#   with the smallest index.
# Arguments:
#   a0 (int*) is the pointer to the start of the array
#   a1 (int)  is the # of elements in the array
# Returns:
#   a0 (int)  is the first index of the largest element
# Exceptions:
#   - If the length of the array is less than 1,
#     this function terminates the program with error code 36
# =================================================================
argmax:
    # t0 = *a0
    add t0, x0, a0
    # t1 = i
    add t1, x0, a1
    # t2 = index
    add t2, x0, x0
    # max_index = 0
    add t3, x0 ,x0
    
    lw t4, 0(t0)
    addi t1, t1, -1
    # Prologue
    blt x0, a1, loop_start
    li a0, 36
    j exit

loop_start:
    beq t1, x0, loop_end
    
    addi t2, t2, 1

    addi t0, t0, 4
    lw t5, 0(t0)
    addi t1, t1, -1
    blt t4, t5, loop_continue
    j loop_start
    

loop_continue:
    lw t4, 0(t0)
    add t3, t2, x0
    j loop_start


loop_end:
    add a0, t3, x0
    # Epilogue

    jr ra
