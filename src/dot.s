.globl dot

.text
# =======================================================
# FUNCTION: Dot product of 2 int arrays
# Arguments:
#   a0 (int*) is the pointer to the start of arr0
#   a1 (int*) is the pointer to the start of arr1
#   a2 (int)  is the number of elements to use
#   a3 (int)  is the stride of arr0
#   a4 (int)  is the stride of arr1
# Returns:
#   a0 (int)  is the dot product of arr0 and arr1
# Exceptions:
#   - If the number of elements to use is less than 1,
#     this function terminates the program with error code 36
#   - If the stride of either array is less than 1,
#     this function terminates the program with error code 37
# =======================================================
dot:
    ebreak
    ble a2, x0, dot_exit1
    ble a3, x0, dot_exit2
    ble a4, x0, dot_exit2
    
    # t0 = *a0
    # t1 = *a1
    add t0, a0, x0
    add t1, a1, x0
    
    # t2 = step a0
    # t3 = step a1
    slli t2, a3, 2
    slli t3, a4, 2
    
    add a0, x0, x0
    
    
    j loop_start

    # Prologue


loop_start:
    
    beq a2, x0, loop_end
    
    # t4 = a0[t0]
    # t5 = a1[t1]
    lw t4 0(t0)
    lw t5 0(t1)
    
    mul t6, t4, t5
    
    add t0, t0, t2
    add t1, t1, t3
    
    
    add a0, a0, t6
    
    addi a2, a2, -1
    
    j loop_start











loop_end:
    # Epilogue
    jr ra

dot_exit1:
    li a0, 36
    j exit
    
dot_exit2:
    li a0, 37
    j exit