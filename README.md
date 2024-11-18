# Assignment 2: Classify

## Part A: Mathematical Functions
### Task 1: ReLU
- The functionality of `relu.s` is to apply ReLU operation in-place. For each element x in array:$$ReLU(x) = max(x,0)$$ 
- In this function, the input `a0` is the pointer to an integer array, `a1` is the number of elements in the array. 
- The approach is to scan the whole array. For each element, if the value is greater than or equal to 0, its state remains, otherwise it will be set to 0 and stored back to the input array.

### Task 2: ArgMax
- The functionality of `argmax.s` is to find the maximum value in an array and return its index of its first occurrence.
- In this function, the input `a0` is the pointer to an integer array, `a1` is the number of elements in the array.
- The approach is to keep updating the maximum value and its index while scanning the input array. Finally, store the result index in `a0` then return.
### Task 3.1: Dot Product
- The functionality of `dot.s` is to handle a strided dot product of two input arrays.
- In this function, the input:
    - `a0` is the pointer to first integer array 
    - `a1` is the pointer to second integer array 
    - `a2` is the number of elements to process 
    - `a3` is the skip distance in first array 
    - `a4` is the skip distance in second array.
- The approach is to implement a loop to iterate both arrays, multiply the corresponding values and sum up the results. The main problem is to deal with the stride calculation and implement multiplication without using `mul` instruction.
- For the stride problem, carefully calculate the correct element address is essential. As for the multiplication problem, I rewrote a `multiply` function to deal with the restriction of no using `mul`.
### Task 3.2: Matrix Multiplication
- The functionality of `matmul.s` is to implement matrix multiplication.
- In this function, the input:
    - `a0` is the pointer to first integer array
    - `a1` is the row count to first integer array
    - `a2` is the column count to first integer array
    - `a3` is the pointer to second integer array
    - `a4` is the row count to second integer array
    - `a5` is the column count to second integer array
    - `a6` is the pointer for result storage
- The only modification is finishing the condition of `inner_loop_end`, so it can jump to the `outer_loop_start` successfully.
### Additional Task: Abs
- The functionality of `abs.s` is to implement an `Absolute Value Converter`
- In this function, the input `a0` is the pointer to an integer to be converted. 
- Assume the input is `x1`
    - If `x1` is positive, it remains its value
    - If `x1` is negative, the function implements `sub x1, zero, x1` to make `x1` positive


## Part B: File Operations and Main
### Task 1: Read Matrix
The only modification is replacing the `mul` instruction with a `multiply` function, which is format compatible with RV32I.
### Task 2: Write Matrix
The only modification is replacing the `mul` instruction with a `multiply` function, which is format compatible with RV32I.
### Task 3: Classification
The only modification is replacing the `mul` instruction with a `multiply` function, which is format compatible with RV32I.

## Others
### main:
The main function calls classify to complete the entire MNIST digit recognition process.
