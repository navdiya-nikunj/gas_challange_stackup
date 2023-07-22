// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract gasChallenge {
    //Implement Fixed-Size Array Technique Here
    // To make it a fixed-size array, we can specify a fixed size, and the array will be automatically filled with zeros for any unused slots. Let's set it to a fixed size of 10
    uint[10] numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    
    //Function to check for sum of array
    //No changes required in this function
    function getSumOfArray() public view returns (uint256) {
        uint sum = 0;
        for (uint i = 0; i < numbers.length; i++) {
            sum += numbers[i];
        }
        return sum;
    }
    
    function notOptimizedFunction() public {
        for (uint i = 0; i < numbers.length; i++) {
            numbers[i] = 0;
        }
    }
    
    //Implement Remaining Gas Optimization Techniques Here
    // 1) Different for loop syntax:-  Specifically, employing a decrementing for loop can be more gas-efficient than an incrementing one. This is because the decrementing loop can save one comparison operation that would be necessary in the incrementing loop.
    // 2) Caching of State Variables:- When working with state variables (those declared outside of functions), using local variables to cache values temporarily can save gas. This is because accessing state variables multiple times incurs additional gas costs, whereas accessing local variables (memory) is less expensive.
    // 3) unchecked :- In some situations, you may want to skip certain checks to reduce gas consumption. The unchecked keyword can be used to tell the compiler to skip certain checks.
    //Sum of elements in the numbers array should equal 0
    function optimizedFunction() public {
        uint256 length = numbers.length; // Cache the length in a local variable
        for (uint256 i = length; i > 0; i--) { // Use a decrementing loop
            unchecked {
                numbers[i - 1] = 0; // Since arrays are 0-indexed
            }
        }
    }
 }
