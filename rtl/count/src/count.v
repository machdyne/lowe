`timescale 1ns / 1ps

module count(
		input wire clk,
		output wire led,
		output wire pmoda1,
		output wire pmoda2,
		output wire pmoda3,
		output wire pmoda4,
		output wire pmoda7,
		output wire pmoda8,
		output wire pmoda9,
		output wire pmoda10,
		output wire pmodb1,
		output wire pmodb2,
		output wire pmodb3,
		output wire pmodb4,
		output wire pmodb7,
		output wire pmodb8,
		output wire pmodb9,
		output wire pmodb10,
		output wire pmodc1,
		output wire pmodc2,
		output wire pmodc3,
		output wire pmodc4,
		output wire pmodc7,
		output wire pmodc8,
		output wire pmodc9,
		output wire pmodc10,
		output wire pmodd1,
		output wire pmodd2,
		output wire pmodd3,
		output wire pmodd4,
		output wire pmodd7,
		output wire pmodd8,
		output wire pmodd9,
		output wire pmodd10
	);

	reg [31:0] counter;

	wire clk270, clk180, clk90, clk0, usr_ref_out;
	wire usr_pll_lock_stdy, usr_pll_lock;

   CC_PLL #(
      .REF_CLK("48.0"),    // reference input in MHz
      .OUT_CLK("200.0"),   // pll output frequency in MHz
      .PERF_MD("ECONOMY"), // LOWPOWER, ECONOMY, SPEED
      .LOW_JITTER(1),      // 0: disable, 1: enable low jitter mode
      .CI_FILTER_CONST(2), // optional CI filter constant
      .CP_FILTER_CONST(4)  // optional CP filter constant
   ) pll_inst (
      .CLK_REF(clk), .CLK_FEEDBACK(1'b0), .USR_CLK_REF(1'b0),
      .USR_LOCKED_STDY_RST(1'b0), .USR_PLL_LOCKED_STDY(usr_pll_lock_stdy), .USR_PLL_LOCKED(usr_pll_lock),
      .CLK270(clk270), .CLK180(clk180), .CLK90(clk90), .CLK0(clk0), .CLK_REF_OUT(usr_ref_out)
   );

	assign led = counter[24];

	assign pmoda1 = counter[31];
	assign pmoda2 = counter[30];
	assign pmoda3 = counter[29];
	assign pmoda4 = counter[28];
	assign pmoda7 = counter[27];
	assign pmoda8 = counter[26];
	assign pmoda9 = counter[25];
	assign pmoda10 = counter[24];

	assign pmodb1 = counter[31];
	assign pmodb2 = counter[30];
	assign pmodb3 = counter[29];
	assign pmodb4 = counter[28];
	assign pmodb7 = counter[27];
	assign pmodb8 = counter[26];
	assign pmodb9 = counter[25];
	assign pmodb10 = counter[24];

	assign pmodc1 = counter[31];
	assign pmodc2 = counter[30];
	assign pmodc3 = counter[29];
	assign pmodc4 = counter[28];
	assign pmodc7 = counter[27];
	assign pmodc8 = counter[26];
	assign pmodc9 = counter[25];
	assign pmodc10 = counter[24];

	assign pmodd1 = counter[31];
	assign pmodd2 = counter[30];
	assign pmodd3 = counter[29];
	assign pmodd4 = counter[28];
	assign pmodd7 = counter[27];
	assign pmodd8 = counter[26];
	assign pmodd9 = counter[25];
	assign pmodd10 = counter[24];

	always @(posedge clk0)
	begin
		counter <= counter + 1;
	end

endmodule
