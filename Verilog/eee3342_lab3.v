//  3-bit binary adder design code
module Full_Adder_1bit(
  input wire X,
  input wire Y,
  input wire Cin,
  output wire S,
  output wire Cout
  );
  assign S = X ^ Y ^ Cin;
  assign Cout = (X & Y) | ((X | Y) & Cin);
endmodule

module Part_1(
  input wire [2:0] X,
  input wire [2:0] Y,
  output wire [2:0] S,
  output wire C1, C2, Cout
  );
  
  Full_Adder_1bit FA1 (X[0], Y[0], 0, S[0], C1);
  Full_Adder_1bit FA2 (X[1], Y[1], C1, S[1], C2);
  Full_Adder_1bit FA3 (X[2], Y[2], C2, S[0], Cout);
endmodule

//  3-bit binary adder simulation code
module Part_1_Sim(
  );
  reg [2:0] X_t;
  reg [2:0] Y_t;
  wire [2:0] S_t;
  wire C1_t;
  wire C2_t;
  wire Cout_t;
  integer i;
  integer j;
  
  Part_1 UUT(
    .X(X_t),
    .Y(Y_t),
    .S(S_t),
    .C1(C1_t),
    .C2(C2_t),
    .Cout(Cout_t)
  );
  
  initial begin
    X_t = 1'd0;
    Y_t = 1'd0;
    for (i = 0; i <= 7; i = i + 1) begin
      for (j = 0; j <= 7; j = j + 1) begin
        #10 X_t = i;
        Y_t = j;
      end
    end
endmodule
