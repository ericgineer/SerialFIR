`timescale 1ns/1ns

// A testbench to compare the Serial FIR filter with the Parallel FIR
// filter

module SerialFIR_tb;

	reg clk, rst, clk_25x, v;
	reg signed [7:0] x;
	wire signed [17:0] y_s, y_p;	
	
	integer x_in, x_read, count, s_out, p_out;


	SerialFIR SerialFIR(.clk(clk),
						.clk_25x(clk_25x),
                        .rst(rst),
					    .x(x),
                        .y(y_s),
						.clk_out(clk_out));
						
	ParallelFIR ParallelFIR(.clk(clk),
	                        .x(x),
	                        .y(y_p));
	                        
	 always #1 clk_25x = ~clk_25x;
	 always #25 clk = ~clk;
	 
	 initial
	 begin
	      clk <= 1'b0;
	      clk_25x <= 1'b0;
	      x <= 8'b0;
	      v <= 1'b0;
	      count <= 0;
	      x_in <= $fopen("rand.txt","r");
	      s_out <= $fopen("s_out.txt","w");
	      p_out <= $fopen("p_out.txt","w");
	 end
	 
	 // Compare output between both filters
	 always @(posedge clk)
	 begin
		if (v && (y_p != y_s))
			$display("ERROR: Output mismatch at sample %d\n",count);
	 end
	 
	 always @(posedge clk_out)
	 begin
		$fwrite(s_out,"%d\n",y_s);
	 end
	 
	 always @(posedge clk)
	 begin
		$fwrite(p_out,"%d\n",y_p);
	 end
	 
	 initial
	 begin
		repeat(5) @(posedge clk);
		rst <= 1'b1;
		@(posedge clk);
		rst <= 1'b0;
		repeat(5) @(posedge clk);
		while(!$feof(x_in))
		begin
			v <= 1'b1;
			x_read <= $fscanf(x_in,"%d\n",x);
			count <= count + 1;
			@(posedge clk);
		end
		v <= 1'b0;
		repeat(10) @(posedge clk);
		$stop;
	end 
endmodule
