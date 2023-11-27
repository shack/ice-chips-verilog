// Octal octal buffer, inverting three-state outputs

module ttl_74240 #(parameter WIDTH = 8, DELAY_RISE = 0, DELAY_FALL = 0)
(
  input G1_Bar, G2_Bar,
  input [WIDTH/2-1:0] A1,
  input [WIDTH/2-1:0] A2,
  output [WIDTH/2-1:0] Y1,
  output [WIDTH/2-1:0] Y2
);


assign #(DELAY_RISE, DELAY_FALL) Y1 = !G1_Bar ? ~A1 : {(WIDTH/2-1){1'bZ}};
assign #(DELAY_RISE, DELAY_FALL) Y2 = !G2_Bar ? ~A2 : {(WIDTH/2-1){1'bZ}};

endmodule