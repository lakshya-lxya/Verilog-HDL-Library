module half_adder (
    input a,
    input b,
    output sum,
    output carry
);
    assign sum = a ^ b;   // XOR logic for addition
    assign carry = a & b; // AND logic for carry-over
endmodule