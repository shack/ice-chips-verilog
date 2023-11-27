// lookahead carry generator

module ttl_74182 #(parameter WIDTH = 4, DELAY_RISE = 0, DELAY_FALL = 0)
(
  input [WIDTH-1:0] G_Bar,
  input [WIDTH-1:0] P_Bar,
  input Cn,
  output Cnx, Cny, Cnz, P_Bar_Out, G_Out_Bar
);

wire [WIDTH-1:0] P;
wire [WIDTH-1:0] G;

assign P = ~P_Bar;
assign G = ~G_Bar;

assign #(DELAY_RISE, DELAY_FALL)
    Cnx = G[0] | (P[0] & Cn);
assign #(DELAY_RISE, DELAY_FALL)
    Cny = G[1]
        | (P[1] & G[0])
        | (P[1] & P[0] & Cn);
assign #(DELAY_RISE, DELAY_FALL)
    Cnz = G[2]
        | (P[2] & G[1])
        | (P[2] & P[1] & G[0])
        | (P[2] & P[1] & P[0] & Cn);
assign #(DELAY_RISE, DELAY_FALL)
    G_Out = G[3]
        | (P[3] & G[2])
        | (P[3] & P[2] & G[1])
        | (P[3] & P[2] & P[1] & G[0]);
assign #(DELAY_RISE, DELAY_FALL)
    G_Bar_Out = ~G_Bar;
assign #(DELAY_RISE, DELAY_FALL)
    P_Bar_Out = |P_Bar;

endmodule