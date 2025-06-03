# Arithmetic Logic Unit

The ***ALU (Arithmetic Logic Unit)*** is a component of computer hardware that resides in the CPU and performs all arithmetical and logical operations.

## Parameters of this ALU

This ALU has been designed to perform 64-bit operations. It will take two 64-bit input values, along with a 4 bit selection input to decide what operation will be performed.

This is a table that demonstrates what operations will be performed based on the operation selection value.
<p align="center">
<img width="817" alt="Screenshot 2024-11-29 at 4 32 16 PM" src="https://github.com/user-attachments/assets/bf69bb24-cf81-4fb2-b5e9-34a3ef311b65">
</p>

## Features of this ALU

This ALU provides a range of fundamental arithmetic and logical operations, designed for basic computation. It utilizes two registers, A and B, to perform these operations.

**1. Transfer Reg A**

*   **Description:** This feature simply outputs the current value stored in register A to the output port. It's a basic read operation.
*   **Implementation:**  A direct output signal is generated based on the value stored in register A.
*   **Purpose:**  Used for observing the state of register A.

**2. Increment Reg A**

*   **Description:** This operation increments the value in register A by 1. Crucially, it handles carry propagation from the most significant bit (MSB).
*   **Implementation:**
    *   Adds 1 to the current value of A.
    *   If the addition results in a carry from the MSB, the MSB of A is set to 1.
*   **Purpose:**  Essential for loop counters, incrementing values, and basic counting.

**3. Decrement Reg A**

*   **Description:** This operation decrements the value in register A by 1. It also handles the borrow propagation from the MSB.
*   **Implementation:**
    *   Subtracts 1 from the current value of A.
    *   If the subtraction results in a borrow from the MSB, the MSB of A is set to 0.
*   **Purpose:**  Used for decrementing counters, implementing decrementing logic, and basic subtraction.

**4. Perform Addition**

*   **Description:** This operation performs binary addition between the values stored in register A and register B.
*   **Implementation:**
    *   Performs a full binary addition of A and B, including carry propagation.
    *   The result is stored in register A (or potentially a designated result register, depending on the ALU design).
*   **Purpose:**  Fundamental arithmetic operation for addition.

**5. Negate Reg A**

*   **Description:** This operation logically inverts the bits of register A. It's equivalent to the one's complement.
*   **Implementation:**
    *   Performs a bitwise NOT operation on the bits of A.
*   **Purpose:**  Used for two's complement representation, negation, and bit manipulation.

**6. Perform AND operation between A and B registers**

*   **Description:** This operation performs a bitwise AND operation between the values stored in register A and register B.
*   **Implementation:**
    *   Each bit of A is ANDed with the corresponding bit of B.
    *   The result is stored in register A (or a result register).
*   **Purpose:**  Used for masking, filtering, and logical comparisons.

**7. Perform OR operation between A and B registers**

*   **Description:** This operation performs a bitwise OR operation between the values 
stored in register A and register B.
*   **Implementation:**
    *   Each bit of A is ORed with the corresponding bit of B.
    *   The result is stored in register A (or a result register).
*   **Purpose:**  Used for combining bits, setting flags, and logical comparisons.

**8. Perform XOR operation between A and B registers**

*   **Description:** This operation performs a bitwise XOR (exclusive OR) operation between the values stored in register A and register B.
*   **Implementation:**
    *   Each bit of A is XORed with the corresponding bit of B.
    *   The result is stored in register A (or a result register).
*   **Purpose:**  Used for detecting differences, error detection, and logical comparisons.

**9. Perform Arithmetic Shift (Left or Right)**

*   **Description:** This operation performs a bitwise shift of the value in register A.  It can be either a left shift (arithmetic) or a right shift (arithmetic).
*   **Implementation:**
    *   **Arithmetic Shift Right:**  Bits are shifted to the right, and the MSB is filled with the sign bit (most significant bit) of the original value.
    *   **Arithmetic Shift Left:** Bits are shifted to the left, and the LSB (least significant bit) is filled with the sign bit.
*   **Purpose:**  Used for multiplying or dividing by powers of 2, and for bit manipulation.

**10. Perform Logical Shift (Left or Right)**

*   **Description:** This operation performs a bitwise shift of the value in register A. It can be either a left shift (logical) or a right shift (logical).
*   **Implementation:**
    *   **Logical Shift Left:** Bits are shifted to the left, and the LSB is filled with 0.
    *   **Logical Shift Right:** Bits are shifted to the right, and the MSB is filled with 0.
*   **Purpose:**  Used for bit manipulation, data conversion, and masking.

**Further Considerations & Potential Enhancements:**

*   **Control Signals:**  This ALU needs control signals to select which operation is performed. These signals would likely be based on a control word.
*   **Result Register:**  Consider adding a dedicated result register to store the output of operations like addition, subtraction, and logical operations.
*   **Flags:**  Implement status flags (e.g., Carry, Zero, Sign) to indicate the outcome of operations.
*   **Data Width:**  Specify the bit width of the registers (e.g., 8-bit, 16-bit, 32-bit) to define the range of values that can be processed.
*   **Memory Interface:**  Consider how the ALU will interact with memory.
