//  Left-right shift register design code
module Shift_Register(
  input wire CLK,
  input wire LOAD,
  input wire LR_Shift,
  input wire [3:0] D,
  output reg [3:0] O
  );
  always @ (posedge CLK) begin
    if (LOAD == 1) begin
      O = D;
    end else begin
      if (LR_Shift == 0) begin
        O[3] <= O[2];
        O[2] <= O[1];
        O[1] <= O[0];
        O[0] <= D[0];
      end
      if (LR_Shift == 1) begin
        O[3] <= D[3];
        O[2] <= O[3];
        O[1] <= O[2];
        O[0] <= O[1];
      end
    end
  end
endmodule

//  Left-shift register simulation code
module Shift_Register_Sim(
  );
  reg CLK_t;
  reg LOAD_t;
  reg LR_Shift_t;
  reg [3:0] D_t;
  wire [3:0] O_t;
  
  Shift_Register UUT(
    .CLK(CLK_t),
    .LOAD(LOAD_t),
    .LR_Shift(LR_Shift_t),
    .D(D_t),
    .O(O_t)
    );
  initial begin
    CLK_t = 0;
    LOAD_t = 0;
    LR_Shift_t = 0;
    D_t = 0;
    #20 D_t = 4'b0001;
      LOAD_t = 1;
    #20 D_t = 4'b0000;
      LOAD_t = 0;
    #100 D_t = 4'b1000;
      LOAD_t = 1;
      LR_Shift_t = 1;
    #20 D_t = 4'b0000;
      LOAD_t = 0;
  end
  always #10 CLK_t = ~CLK_t;
endmodule

//  Sequence counter design code
module DFF(
  input D,
  input CLK,
  output reg q,
  output q_prime
  );
  
  always @ (posedge CLK) begin
    if (D == 1'b0)
      q <= 1'b0;
    else
      q <= 1'b1;
  end
  
  assign q_prime = ~q;
endmodule

module Sequence_Counter(
  input wire CLK,
  output wire [3:0]
  );
  
  wire [3:0] D;
  
  assign D[3] = O[3] ^ O[2];
  assign D[2] = (O[1] & O[0]) | (O[3] & ~O[2]);
  assign D[1] = (O[1] & ~O[0]) | (~O[3] & ~O[2] & ~O[1]);
  assign D[0] = O[3] | O[1];
  
  DFF ff3(.D(D[3]), .CLK(CLK), .q(O[3]));
  DFF ff2(.D(D[2]), .CLK(CLK), .q(O[2]));
  DFF ff1(.D(D[1]), .CLK(CLK), .q(O[1]));
  DFF ff0(.D(D[0]), .CLK(CLK), .q(O[0]));
endmodule
