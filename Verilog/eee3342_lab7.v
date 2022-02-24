//  Asynchronous SR flip-flop design code
module Asy_SRFF(
  input wire s,
  input wire r,
  output reg q
  );
  
  always @(s,r) begin
    if (s == 1'b0 && r == 1'b0)
      q <= q;
    else if (s == 1'b1 && r == 1'b0)
      q <= 1'b1;
    else if (s == 1'b0 && r == 1'b1)
      q <= 1'b0;
    else if (s == 1'b1 && r == 1'b1)
      q <= 1'bx;
  end
endmodule

//  Asynchronous SR flip-flop simulation code
module Asy_SRFF_Sim(
  );
  reg s_t;
  reg r_t;
  wire q_t;
  
  Asy_SRFF UUT(
    .s(s_t),
    .r(r_t),
    .q(q_t)
  );
  initial begin
    s_t = 2'b00;
    r_t = 2'b00;
  end
  
  always #10 s_t = ~s_t;
  always #15 r_t = ~r_t;
endmodule

//  Clocked SR flip-flop design code
module Clk_SRFF(
  input wire s,
  input wire r,
  input wire clk,
  output reg q
  );
  
  always @ (posedge clk) begin
    if (clk == 1'b1) begin
      case ({s,r})
        {1'b0, 1'b0}: begin q = q; end
        {1'b0, 1'b1}: begin q = 1'b0; end
        {1'b1, 1'b0}: begin q = 1'b1; end
        {1'b1, 1'b1}: begin q = 1'bx; end
      endcase
    end
  end
endmodule

//  Clocked SR flip-flop simulation code
module Clk_SRFF_Sim(
  );
  reg s_t;
  reg r_t;
  reg clk_t;
  wire q_t;
  
  Clk_SRFF UUT(
    .s(s_t),
    .r(r_t),
    .clk(clk_t)
    .q(q_t)
    );
  
  initial begin
    s_t = 1'b0;
    r_t = 1'b0;
    clk_t = 1'b0;
  end
  
  always #30 clk_t = ~clk_t;
  always #20 s_t = ~s_t;
  always #40 r_t = ~r_t;
endmodule

//  D flip-flop design code
module DFF(
  input d,
  input CLK,
  output reg q,
  output q_prime
  );
  
  always @ (posedge CLK) begin
    if (d == 1'b0)
      q <= 1'b0;
    else
      q <= 1'b1;
  end
  
  assign q_prime = ~q;
endmodule

//  D flip-flop simulation code
module DFF_Sim(
  );
  reg CLK_t;
  reg d_t;
  wire q_t;
  wire q_prime_t;
  
  DFF UUT(
    .CLK(CLK_t),
    .d(d_t),
    .q(q_t),
    .q_prime(q_prime_t)
    );
  
  initial begin CLK_t = 1'b0;
    d_t = 1'b0;
  end
  
  always #10 CLK_t = ~CLK_t;
  always #20 d_t = ~d_t;
endmodule
