//  3-to-8 decoder design code
module Dec3to8

module Decoder(
  input [3:0] A,
  output [15:0] D
  );
  Dec3to8 dec1(.in(A[2:0]), .en(A[3]), .out(D[15:8]));
  Dec3to8 dec2(.in(A[2:0]), .en(~A[3]), .out(D[7:0]));
endmodule

