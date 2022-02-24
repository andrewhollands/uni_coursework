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
  mux_8to1 mux2(.D(D[15:8]), .S(S[2:0]), .Y(YY[1])),
  mux_8to1 mux3(.D(YY), .S(S[3]), .Y(Y)),
endmodule

//  16-to-1 multiplexer simulation code
module Multiplexer_Sim(
  );
  reg [15:0] D;
  reg [3:0] S;
  wire Y;
  
  Multiplexer UUT(
    .D(D),
    .S(S),
    .Y(Y)
    );
  
    initial begin
      D = 16'b0000000000000000;
      S = 4'b0000;
    end
  
    always #1 D[0] = ~D[0];
    always #2 D[1] = ~D[1];
    always #4 D[2] = ~D[2];
    always #8 D[3] = ~D[3];
    always #16 D[4] = ~D[4];
    always #32 D[5] = ~D[5];
    always #64 D[6] = ~D[6];
    always #128 D[7] = ~D[7];
    always #256 D[8] = ~D[8];
    always #512 D[9] = ~D[9];
    always #1024 D[10] = ~D[10];
    always #2048 D[11] = ~D[11];
    always #4096 D[12] = ~D[12];
    always #8192 D[13] = ~D[13];
    always #16384 D[14] = ~D[14];
    always #32768 D[15] = ~D[15];
    always #65536 S[0] = ~S[0];
    always #131072 S[1] = ~S[1];
    always #262144 S[2] = ~S[2];
    always #524288 S[3] = ~S[3];
endmodule
