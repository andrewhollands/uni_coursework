//  3-to-8 decoder design code
module Dec3to8(in, en, out);
  input wire [2:0] in;
  input wire en;
  output reg [7:0] out;
  always@(in,en)
    begin
      if (en == 1)
        case (in)
          3'b000: out = 8'b00000001;
          3'b001: out = 8'b00000010;
          3'b010: out = 8'b00000100;
          3'b011: out = 8'b00001000;
          3'b100: out = 8'b00010000;
          3'b101: out = 8'b00100000;
          3'b110: out = 8'b01000000;
          3'b111: out = 8'b10000000;
        endcase
      else if (en == 0)
        begin
          out = 8'b00000000;
        end
    end
endmodule

module Decoder(
  input [3:0] A,
  output [15:0] D
  );
  Dec3to8 dec1(.in(A[2:0]), .en(A[3]), .out(D[15:8]));
  Dec3to8 dec2(.in(A[2:0]), .en(~A[3]), .out(D[7:0]));
endmodule

//  3-to-8 decoder simulation code
module Decoder_Sim();
  reg [3:0] A_t;
  wire [15:0] D_t;
  
  Decoder UUT(
    .A(A_t),
    .D(D_t)
  );
  
  initial begin
    A_t = 4'b0000;
  end
  
  always #10 A_t[0] = ~A_t[0];
  always #20 A_t[1] = ~A_t[1];
  always #40 A_t[2] = ~A_t[2];
  always #80 A_t[3] = ~A_t[3];
endmodule
