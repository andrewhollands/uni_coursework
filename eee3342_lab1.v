//  AND gate design and simulation code
module Part_1(
  input wire Inp 1,
  input wire Inp 2,
  output wire Outp
  );
  wire Inp_1, Inp 2, Outp;
  assign Outp = Inp_1 & Inp_2;
endmodule

module Part_1_Sim(
  );
  reg Inp_1_t;
  reg Inp_2_t;
  
  wire Outp_t;
  
  Part_1 UUT(
    .Inp_1(Inp_1_t),
    .Inp_2(Inp_2_t),
    .Outp(Outp_t)
  );
  
  inital begin
    Inp_1_t = 1'b0;
    Inp_2_t = 1'b0;
  end
  always #10 Inp_1_t = ~Inp_1_t;
  always #20 Inp_2_t = ~Inp_2_t;
endmodule

//  NAND design and simulation code
module Part_2(
  input wire Inp_1,
  input wire Inp_2,
  output wire Outp
  );
  wire Inp_1, Inp_2, Outp;
  assign Outp = ~(Inp_1 & Inp_2);
endmodule

module Part_2_Sim(
  );
  reg Inp_1_t;
  reg Inp_2_t;
  
  wire Outp_t;
  
  Part_2 UUT(
    .Inp_1(Inp_1_t),
    .Inp_2(Inp_2_t),
    .Outp(Outp_t)
  );
  
  inital begin
    Inp_1_t = 1'b0;
    Inp_2_t = 1'b0;
  end
  always #10 Inp_1_t = ~Inp_1_t;
  always #20 Inp_2_t = ~Inp_2_t;
endmodule

//  OR design and simulation code
module Part_2_1(
  input wire Inp_1,
  input wire Inp_2,
  output wire Outp
  );  
  wire Inp_1, Inp_2, Outp;
  assign Outp = Inp_1 | Inp_2;
endmodule

module Part_2_1_Sim(
  );
  reg Inp_1_t;
  reg Inp_2_t;
  
  wire Outp_t;
  
  Part_2_1 UUT(
    .Inp_1(Inp_1_t),
    .Inp_2(Inp_2_t),
    .Outp(Outp_t)
  );
  
  inital begin
    Inp_1_t = 1'b0;
    Inp_2_t = 1'b0;
  end
  always #10 Inp_1_t = ~Inp_1_t;
  always #20 Inp_2_t = ~Inp_2_t;
endmodule

//  XOR design and simulation code
module Part_2_2(
  input wire Inp_1,
  input wire Inp_2,
  output wire Outp
  );  
  wire Inp_1, Inp_2, Outp;
  assign Outp = Inp_1 ^ Inp_2;
endmodule

module Part_2_2_Sim(
  );  
  reg Inp_1_t;
  reg Inp_2_t;
  
  wire Outp_t;
  
  Part_2_2 UUT(
    .Inp_1(Inp_1_t),
    .Inp_2(Inp_2_t),
    .Outp(Outp_t)
  );
  
  inital begin
    Inp_1_t = 1'b0;
    Inp_2_t = 1'b0;
  end
  always #10 Inp_1_t = ~Inp_1_t;
  always #20 Inp_2_t = ~Inp_2_t;
endmodule

//  NOT design and simulation code
module Part_2_3(
  input wire Inp_1,
  output wire Outp
  );
  wire Inp_1, Outp;
  assign Outp = ~Inp_1;
endmodule

module Part_2_3_Sim(
  );
  reg Inp_1_t;
  
  wire Outp_t;
  
  Part_2_2 UUT(
    .Inp_1(Inp_1_t),
    .Outp(Outp_t)
  );
  
  inital begin
    Inp_1_t = 1'b0;
  end
  always #10 Inp_1_t = ~Inp_1_t;
endmodule

//  Two-input, five-output circuit
module Part_3(
  input Inp_1,
  input Inp_2,
  output Outp_1,
  output Outp_2,
  output Outp_3,
  output Outp_4,
  output Outp_5
  );
  wire Inp_1, Inp_2, Outp_1, Outp_2, Outp_3, Outp_4, Outp_5;
  assign Outp_1 = ~Inp_1;
  assign Outp_2 = Inp_1 & Inp_2;
  assign Outp_3 = Inp_1 | Inp_2;
  assign Outp_4 = ~(Inp_1 & Inp_2);
  assign Outp_5 = Inp_1 ^ Inp_2;
endmodule

module Part_3_Sim(
  );
  reg Inp_1_t;
  reg Inp_2_t;
  
  wire Outp_1_t;
  wire Outp_2_t;
  wire Outp_3_t;
  wire Outp_4_t;
  wire Outp_5_t;
  
  Part_3 UUT(
    .Inp_1(Inp_1_t),
    .Inp_2(Inp_2_t),
    .Outp_1(Outp_1_t),
    .Outp_2(Outp_2_t),
    .Outp_3(Outp_3_t),
    .Outp_4(Outp_4_t),
    .Outp_5(Outp_5_t)
  );
  
  inital begin
    Inp_1_t = 1'b0;
    Inp_2_t = 1'b0;
  end
  always #10 Inp_1_t = ~Inp_1_t;
  always #20 Inp_2_t = ~Inp_2_t;
endmodule
