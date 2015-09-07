`timescale 1ns/1ns

// A serial FIR filter

module SerialFIR(input wire               clk,
                 input wire               clk_25x,
                 input wire 			  rst,
                 input wire signed [7:0]  x,
                 output reg signed [17:0] y,
                 output reg 		      clk_out);
               
       reg signed [7:0] d1, d2, d3, d4, d5, d6, d7, d8, d9, d10,
						d11, d12, d13, d14, d15, d16, d17, d18, d19, d20, d21;
       
       reg signed [7:0] d_mux_out;
       reg signed [7:0] h_mux_out;
       reg signed [17:0] mult_out, sum_out;
       
       reg [15:0] select;
       
       reg sum_clr;
       
       reg [15:0] state;
       parameter S0 = 0, S1 = 1, S2 = 2, S3 = 3, S4 = 4;
       
       `include "coeff.vh"
       
       always @(posedge clk)
       begin
			if (rst)
			begin
			    d1 <= 8'b0;
			    d2 <= 8'b0;
			    d3 <= 8'b0;
			    d4 <= 8'b0;
			    d5 <= 8'b0;
			    d6 <= 8'b0;
			    d7 <= 8'b0;
			    d8 <= 8'b0;
			    d9 <= 8'b0;
			    d10 <= 8'b0;
			    d11 <= 8'b0;
			    d12 <= 8'b0;
			    d13 <= 8'b0;
			    d14 <= 8'b0;
			    d15 <= 8'b0;
			    d16 <= 8'b0;
			    d17 <= 8'b0;
			    d18 <= 8'b0;
			    d19 <= 8'b0;
			    d20 <= 8'b0;
			end else
			begin
                d1 <= x;
                d2 <= d1;
                d3 <= d2;
                d4 <= d3;
                d5 <= d4;
                d6 <= d5;
                d7 <= d6;
                d8 <= d7;
                d9 <= d8;
                d10 <= d9;
                d11 <= d10;
                d12 <= d11;
                d13 <= d12;
                d14 <= d13;
                d15 <= d14;
                d16 <= d15;
                d17 <= d16;
                d18 <= d17;
                d19 <= d18;
                d20 <= d19;
                d21 <= d20;
             end
	   end
	   
	   // Mux selector state machine
	   always @(posedge clk_25x)
	   begin
			if (rst)
				state <= S0;
			else
				case (state)
					S0: state <= S1;
					S1: if (select == 16'd20)
							state <= S2;
						else
							state <= S1;
					S2: state <= S3;
					S3: state <= S4;
					S4: state <= S0;
					default: state <= S0;
				endcase
		end
		
		always @(posedge clk_25x)
		begin
			case (state)
				S0: begin
						select <= 16'd0;
						sum_clr <= 1'd1;
						y <= sum_out;
					end
				S1: begin
						select <= select + 1;
						sum_clr <= 16'd0;
					end
			endcase
		end
	   
	   always @(posedge clk_25x)
	   begin
			clk_out <= ~clk;
			if (rst)
			begin
				mult_out <= 16'b0;
				sum_out <= 16'b0;
			end else
			begin
				case (select)
					16'd0: begin
							  d_mux_out <= d1;
							  h_mux_out <= mem[0];
						   end
					16'd1: begin
							  d_mux_out <= d2;
							  h_mux_out <= mem[1];
						   end
					16'd2: begin
							  d_mux_out <= d3;
							  h_mux_out <= mem[2];
						   end
					16'd3: begin
							  d_mux_out <= d4;
							  h_mux_out <= mem[3];
						   end
					16'd4: begin
							  d_mux_out <= d5;
							  h_mux_out <= mem[4];
						   end
					16'd5: begin
							  d_mux_out <= d6;
							  h_mux_out <= mem[5];
						   end
					16'd6: begin
							  d_mux_out <= d7;
							  h_mux_out <= mem[6];
						   end
					16'd7: begin
							  d_mux_out <= d8;
							  h_mux_out <= mem[7];
						   end
					16'd8: begin
							  d_mux_out <= d9;
							  h_mux_out <= mem[8];
						   end
					16'd9: begin
							  d_mux_out <= d10;
							  h_mux_out <= mem[9];
						   end
				    16'd10: begin
							  d_mux_out <= d11;
							  h_mux_out <= mem[10];
						   end
					16'd11: begin
							  d_mux_out <= d12;
							  h_mux_out <= mem[11];
						   end
					16'd12: begin
							  d_mux_out <= d13;
							  h_mux_out <= mem[12];
						   end
					16'd13: begin
							  d_mux_out <= d14;
							  h_mux_out <= mem[13];
						   end
					16'd14: begin
							  d_mux_out <= d15;
							  h_mux_out <= mem[14];
						   end
					16'd15: begin
							  d_mux_out <= d16;
							  h_mux_out <= mem[15];
						   end
					16'd16: begin
							  d_mux_out <= d17;
							  h_mux_out <= mem[16];
						   end
					16'd17: begin
							  d_mux_out <= d18;
							  h_mux_out <= mem[17];
						   end
					16'd18: begin
							  d_mux_out <= d19;
							  h_mux_out <= mem[18];
						   end
					16'd19: begin
							  d_mux_out <= d20;
							  h_mux_out <= mem[19];
						   end
				    16'd20: begin
							  d_mux_out <= d21;
							  h_mux_out <= mem[20];
						   end
					default: begin
								d_mux_out <= 8'b0;
								h_mux_out <= 8'b0;
							 end
					
				endcase
				
				if (sum_clr)
				begin
					sum_out  <= 16'd0;
					mult_out <= 16'd0;
				end else
				begin	
					sum_out  <= sum_out + mult_out;
					mult_out <= d_mux_out * h_mux_out;
				end
			end
		end
endmodule
			
			
