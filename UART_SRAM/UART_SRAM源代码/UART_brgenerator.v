module UART_brgenerator(
  input sysclk,
  output reg clk9600,
  output reg brclk16);
reg [13:0] cnt9600;
reg [9:0] cnt16;

initial
begin
    clk9600=0;
    brclk16=0;
    cnt9600=0;
    cnt16=0;
end

always @(posedge sysclk)
begin
  cnt9600<=cnt9600+1;
  cnt16<=cnt16+1;
  if (cnt9600==5208)
    begin
      clk9600<=~clk9600;
      cnt9600<=0;
    end
  if (cnt16==324)
    begin
      brclk16<=~brclk16;
      cnt16<=0;
    end
  end
  
endmodule