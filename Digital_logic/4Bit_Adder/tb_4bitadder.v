`timescale 1ns / 1ps

module tb_adder;
    reg [3:0] A, B;
    reg Cin;
    wire [3:0] Sum;
    wire Cout;

    // Instantiate your 4-bit adder
    ripple_carry_adder_4bit uut (
        .A(A), .B(B), .Cin(Cin), 
        .Sum(Sum), .Cout(Cout)
    );

    initial begin
        // This is the CRITICAL part you were missing:
        $dumpfile("simulation.vcd"); // Creates the file for GTKWave
        $dumpvars(0, tb_adder);      // Dumps all variables in this module

        // Test Cases
        A = 4'b0001; B = 4'b0010; Cin = 0; #10; // 1 + 2 = 3
        A = 4'b0101; B = 4'b0101; Cin = 0; #10; // 5 + 5 = 10 (A in hex)
        A = 4'b1111; B = 4'b0001; Cin = 0; #10; // 15 + 1 = 16 (Sum 0, Cout 1)
        
        $finish; // Stop the simulation
    end
endmodule