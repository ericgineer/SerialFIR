// A simple 5 tap parallel FIR filter for comparison with the serial
// FIR filter

`timescale 1ns/1ns

module ParallelFIR(input wire       		clk,
				   input wire signed [7:0]  x,
				   output reg signed [17:0] y);

	reg signed [7:0] x1, x2, x3, x4, x5, x6, x7, x8, x9, x10,
					x11, x12, x13, x14, x15, x16, x17, x18, x19, x20, x21;
						
	`include "coeff.vh"

	always @(posedge clk)
	begin
		x1 <= x;
		x2 <= x1;
		x3 <= x2;
		x4 <= x3;
		x5 <= x4;
		x6 <= x5;
		x7 <= x6;
		x8 <= x7;
		x9 <= x8;
		x10 <= x9;
		x11 <= x10;
		x12 <= x11;
		x13 <= x12;
		x14 <= x13;
		x15 <= x14;
		x16 <= x15;
		x17 <= x16;
		x18 <= x17;
		x19 <= x18;
		x20 <= x19;
		x21 <= x20;

		y <= x1 * mem[0] + x2 * mem[1] + x3 * mem[2] + x4 * mem[3] + x5 * mem[4] +
			 x6 * mem[5] + x7 * mem[6] + x8 * mem[7] + x9 * mem[8] + x10 * mem[9] +
			 x11 * mem[10] + x12 * mem[11] + x13 * mem[12] + x14 * mem[13] + x15 * mem[14] +
			 x16 * mem[15] + x17 * mem[16] + x18 * mem[17] + x19 * mem[18] + x20 * mem[19] +
			 x21 * mem[20];
	end
endmodule

