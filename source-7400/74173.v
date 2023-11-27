// Quad D flip-flop with enable, asynchronous clear, and three-state output

module ttl_74377 #(parameter WIDTH = 4, DELAY_RISE = 0, DELAY_FALL = 0)
(
  input M_Bar, N_Bar,
  input G1_Bar, G2_Bar,
  input [WIDTH-1:0] D,
  input Clk, Rst,
  output [WIDTH-1:0] Q
);

//------------------------------------------------//
reg [WIDTH-1:0] Q_current;

always @(posedge Clk, posedge Rst)
begin
  if (Rst)
    Q_current <= {WIDTH{1'b0}};
  else if (!G1_Bar && !G2_Bar)
    Q_current <= D;
end
//------------------------------------------------//

assign #(DELAY_RISE, DELAY_FALL) Q =
  !M_Bar && !N_Bar ? Q_current : {WIDTH{1'bZ}};

endmodule
