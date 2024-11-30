.import utils.s

.text
main:
    # Allocate an array of size 10
    li a0, 40       # 10 ints, 4 bytes each
    jal malloc      # Call malloc to allocate memory
    mv t0, a0       # Save the original pointer in s0

    # Fill the array with 0's
    li t1, 0        # t1 is the index
    li t2, 10       # t2 is the size of the array

loop:
    # Store 0 at the current index
    sw x0, 0(a0)
    # Increment the index
    addi t1, t1, 1
    # Increment the pointer
    addi a0, a0, 4
    # Check if we are done
    blt t1, t2, loop

    # Restore the original pointer
    mv a0, t0

    # Free the memory
    jal free        # Call free to release the allocated memory

    # Exit the program
    li a0, 0
    jal exit
