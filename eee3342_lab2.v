//  Multi-function logic gate design and simulation code
module Part_1_1(
  input X,
  input Y,
  input A,
  input B,
  output F
  );
  wire X, Y, A, B, F;
  assign F = (X & ~A & ~B) | (Y & ~A & B) | (~X & A & B) | (Y & A & ~B);
endmodule

module Part_1_1_Sim(
  );
  reg X_t;
  reg Y_t;
  reg A_t;
  reg B_t;
  wire F_t;
  
  Part_1_1 UUT(
    .X(X_t),
    .Y(Y_t),
    .A(A_t),
    .B(B_t),
    .F(F_t)
    );
  initial begin
    X_t = 1'b0;
    Y_t = 1'b0;
    A_t = 1'b0;
    B_t = 1'b0;
  end
  
  always #200 X_t = ~X_t;
  always #100 Y_t = ~Y_t;
  always #50 A_t = ~A_t;
  always #25 B_t = ~B_t;
endmodule
