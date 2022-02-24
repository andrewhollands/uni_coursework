//  16-to-1 multiplexer design code
module mux_8to1(
  input wire [7:0] D,
  input wire E_N,
  input wire [2:0] S,
  output wire Y
  );
  reg [7:0] Y;
  always @(D or S or E_N)
    begin
      case (S)
        3'b000: Y = D[0];
        3'b001: Y = D[1];
        3'b010: Y = D[2];
        3'b011: Y = D[3];
        3'b100: Y = D[4];
        3'b101: Y = D[5];
        3'b110: Y = D[6];
        3'b111: Y = D[7];
        default: Y = 8'bx;
      endcase
    Y = ~E_N & Y;
    end
endmodule

module mux_2to1(
  input wire [1:0] D,
  input wire S,
  output wire Y
  );
  assign Y = (~S & D[0]) | (S & D[1]);
endmodule

module Multiplexer(
  input wire [15:0] D,
  input wire [3:0] S,
  output wire [1:0] YY,
  output wire Y
  );
  mux_8to1 mux1(.D(D[7:0]), .S(S[2:0]), .Y(YY[0])),
  mux_8to1 mux1(.D(D[15:8]), .S(S[2:0]), .Y(YY[1])),
  mux_8to1 mux1(.D(YY), .S(S[3]), .Y(Y)),
endmodule
