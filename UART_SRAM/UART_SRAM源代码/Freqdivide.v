module Freqdivide(
   input wire sysclk,
   input wire reset,
   output reg clk50M
);

always@(posedge sysclk or negedge reset)begin
    if(~reset) clk50M<=0;
    else clk50M<=~clk50M;
end


endmodule