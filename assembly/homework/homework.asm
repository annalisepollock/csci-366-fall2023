//==========================================================================================
// PROBLEM 1: Counting Up From 1 to 10 in Little Man Assembly
//==========================================================================================

// You can develop your code via the online emulator and then paste it in here
// Please use a jump in your solution
// Please use the OUT instruction to print values

STA COUNTER // Initialize the counter to 1
LOOP:
    LDA COUNTER // Load the counter
    OUT         // Print the counter
    LDA COUNTER // Load the counter again
    ADD ONE     // Increment the counter by 1
    STA COUNTER // Store the updated counter
    LDA COUNTER // Load the counter
    SUB TEN     // Subtract 10 from the counter
    BRP LOOP    // If the result is positive, jump back to the loop
    HLT         // Halt the program

COUNTER DAT 1   // Counter variable
ONE     DAT 1   // Constant value 1
TEN     DAT 10  // Constant value 10

//==========================================================================================
// PROBLEM 2: Counting Up From 1 to 10 in MIPS Assembly
//==========================================================================================

// You can develop your code via the MARS emulator and then paste it in here
// Please use a jump in your solution
// Please use sys-calls to output the value
.data
newline: .asciiz "\n"  // Newline character for printing

.text
main:
    li $t0, 1         // Initialize the counter to 1
    li $t1, 10        // Set the upper limit to 10

loop:
    // Print the current value
    move $a0, $t0
    li $v0, 1         // Print integer syscall
    syscall

    # Print a newline
    li $v0, 4         // Print string syscall
    la $a0, newline
    syscall

    addi $t0, $t0, 1  // Increment the counter

    // Compare counter to the upper limit
    bge $t0, $t1, end # If t0 >= t1, exit the loop

    j loop

end:
    li $v0, 10        // Exit syscall
    syscall
