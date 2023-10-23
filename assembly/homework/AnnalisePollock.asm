//==========================================================================================
// PROBLEM 1: Counting Up From 1 to 10 in Little Man Assembly
//==========================================================================================

// You can develop your code via the online emulator and then paste it in here
// Please use a jump in your solution
// Please use the OUT instruction to print values

 IN        // Read a number into the accumulator
       STO COUNT // Store the initial value (1) in memory location COUNT
LOOP   LDA COUNT // Load the value from memory location COUNT
       OUT       // Output the current value
       ADD ONE   // Add 1 to the accumulator
       STO COUNT // Store the updated value back in memory location COUNT
       SUB TEN   // Subtract 10 from the accumulator
       BRP LOOP  // If the result is positive or zero, jump back to LOOP
HALT   HLT       // Halt the program

COUNT  DAT 001   // Memory location to store the count (initialize to 1)
ONE    DAT 001   // Constant 1
TEN    DAT 010   // Constant 10

//==========================================================================================
// PROBLEM 2: Counting Up From 1 to 10 in MIPS Assembly
//==========================================================================================

// You can develop your code via the MARS emulator and then paste it in here
// Please use a jump in your solution
// Please use sys-calls to output the value

main:
    li $t0, 1         # Initialize $t0 to 1 (start value)
loop:
    li $v0, 1         # System call code for printing an integer
    move $a0, $t0     # Load the current value into $a0
    syscall

    addi $t0, $t0, 1  # Increment $t0 by 1

    li $t1, 11        # Load 11 (end value) into $t1
    beq $t0, $t1, end # If $t0 equals 11, exit the loop

    j loop            # Jump back to loop

end:
    li $v0, 10        # System call code for program exit
    syscall
