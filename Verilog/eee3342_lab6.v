//  32x4 RAM design code
module F1(
  input W,
  input X,
  input Y,
  input Z,
  output F1_out
  );
  
  assign F1_out = (W & X & Y & Z) | (W & ~X & ~Y & Z);
endmodule

module TwoBitAdder(
  input [1:0] X,
  input [1:0] Y,
  output [1:0] Sum,
  output Cout
  );
  
  assign Sum[0] = X[0] | Y[0];
  assign Sum[1] = X[1] | Y[1];
  assign Cout = (X[1] & Y[1]) | (X[0] & Y[0]);
endmodule

module RAM_1(
  input CLK,
  input WE,
  input [3:0] A,
  input W,
  input X,
  input Y,
  input Z,
  input [1:0] Xi,
  input [1:0] Yi,
  output [3:0] Do
  );
  
  wire [3:0] Di;
  reg [3:0] RAM [31:0];
  
  F1 f1(.W(W), .X(X), .Y(Y), .Z(Z), .F1_out(Di[0]));
  TwoBitAdder twoBitAdder(.X(Xi[1:0]), .Y(Yi[1:0]), .Sum(Di[2:1]), .Cout(Di[3]));
  
  always@(posedge CLK)
    begin
      if(WE)
        RAM[A] <= Di;
    end
  
  assign Do = RAM[A];
endmodule

//  32x4 RAM simulation code
module RAM_Sim(
  );
  reg CLK_t;
  reg WE_t;
  reg [3:0] A_t;
  reg W_t;
  reg X_t;
  reg Y_t;
  reg Z_t;
  reg [1:0] Xi_t;
  reg [1:0] Yi_t;
  wire [3:0] Do_t;
  
  RAM_1 UUT(
    .CLK(CLK_t),
    .WE(WE_t),
    .A(A_t),
    .W(W_t),
    .X(X_t),
    .Y(Y_t),
    .Z(Z_t),
    .Xi(Xi_t),
    .Yi(Yi_t),
    .Do(Do_t)
    );
  initial begin
    CLK_t = 1'b0;
    WE_t = 1'b1;
    A_t = 4'b0000;
    W_t = 1'b0;
    X_t = 1'b0;
    Y_t = 1'b0;
    Z_t = 1'b0;
    Xi_t = 2'b00;
    Yi_t = 2'b00;
  end
  
  always #5 CLK_t = ~CLK_t;
  always #15 A_t = A_t + 1;
  always #80 W_t = ~W_t;
  always #40 X_t = ~X_t;
  always #20 Y_t = ~Y_t;
  always #10 Z_t = ~Z_t;
  always #40 Xi_t = Xi_t + 1;
  always #10 Yi_t = Yi_t + 1;
endmodule
