.globl relu

.text
# ==============================================================================
# FUNCTION: Performs an inplace element-wise ReLU on an array of ints
# Arguments:
#   a0 (int*) is the pointer to the array
#   a1 (int)  is the # of elements in the array
# Returns:
#   None
# Exceptions:
#   - If the length of the array is less than 1,
#     this function terminates the program with error code 36
# ==============================================================================
relu:

# t1 = loop(i)
# t3 = *a0
    addi t1, a1, 0
    add t3, a0, x0
    
    ebreak



# 1 < a1 loop_start
    blt x0, a1, loop_start
    li a0, 36
    j exit
    # Prologue

# t0 = 1
# t1 = offset

loop_start:

# a1 = 0 exit

    beq a1, x0, exit
    
# t2 = a0[t3]
    lw t2, 0(t3)
    

# if t2 < 0  set_zero(t2)
    blt t2, x0, relu_set_zero
# i++ , a1 -= 1
    addi t3, t3, 4
    addi t1, t1, -1
    j loop_start






relu_set_zero:
    sw x0, 0(t3)
    addi t1, t1, 4
    addi a1, a1, -1
    j loop_start





    # Epilogue
exit:

    jr ra
