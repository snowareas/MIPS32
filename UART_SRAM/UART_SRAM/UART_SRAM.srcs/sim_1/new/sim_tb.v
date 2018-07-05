`timescale 1ns/1ps
module sram_test_tb();

reg sysclk;
reg reset;

initial begin
	sysclk = 1;
	reset = 1;
	#24 reset = 0;
	#50 reset = 1;
end

always begin
	#5 sysclk = ~sysclk;
end


   wire read_finish;
   wire compare_result;
   wire UART_end_flag;
   wire [15:0]sram_data;
   wire [15:0]sram_data_w;
   reg [15:0]sram_data_r;
   wire [18:0]sram_addr;
   wire sram_wr_en;
   wire OE;
   wire CE;
   wire UB;
  wire LB;
//assign sram_data_w = sram_data;
//assign sram_data = sram_data_r;
wire test_mode;
wire [7:0]test_addr;
assign test_mode = 0;
assign test_addr = 8'd0;
wire UART_RX;
reg [7:0]TX_data;
reg TX_EN;



UART_SRAM sram_test_m(
.sysclk(sysclk),
.reset(reset),
.test_mode(test_mode),
.test_addr(test_addr),
.UART_RX(UART_RX),
.UART_TX(UART_TX),
.read_finish(read_finish),
.compare_result(compare_result),
.UART_end_flag(UART_end_flag),
.sram_data(sram_data),
.sram_addr(sram_addr),
.sram_wr_en(sram_wr_en),
.OE(OE),
.CE(CE),
.UB(UB),
.LB(LB));

UART_sender UART_sender_m(
.clk(clk9600),
.reset(reset),
.TX_EN(TX_EN),
.TX_data(TX_data),
.UART_TX(UART_RX),
.TX_status(TX_status));

//assign sram_data_w = ~sram_wr_en?sram_data:sram_data_r;
assign sram_data =  ~sram_wr_en?16'bzzzzzzzzzzzzzzzz:sram_data_r;

reg [15:0]mem[2048-1:0];
always @(posedge sysclk)begin
    if(~sram_wr_en) begin
        sram_data_r <= 8'd0;
        mem[sram_addr] <= sram_data;
    end else begin
        sram_data_r <= mem[sram_addr];
    end   

end

UART_brgenerator UART_brgenerator_m(
.sysclk(sysclk),
.clk9600(clk9600),
.brclk16(BRclk16));

reg [18:0]input_count;
reg flag;

always @(posedge clk9600)begin
    if(TX_status & input_count<19'd1024 & ~flag) begin
        TX_data <= input_count[7:0];
        TX_EN<=1;
        flag <=1;
    end else begin
        flag <=0;
        TX_EN<=0;
    end   
end

always @(posedge clk9600 or negedge reset)begin
    if(~reset)begin
        input_count<=0;
    end
    else if(flag) begin
        input_count<=input_count+1;
    end else begin
    end   
end

endmodule



module UART_sender(
  input clk,reset,TX_EN,
  input [7:0] TX_data,
  output reg UART_TX,
  output wire TX_status);
  
  reg [3:0] cnt;
  reg [9:0] data;
  
  assign TX_status=(cnt==0)?1:0;

  always @(posedge clk or negedge reset)
  begin
    if(~reset)begin
        cnt<=0;
        UART_TX<=1;
    end
    else if (TX_EN)
        begin
            cnt<=1;
            data[8:1]<=TX_data;
            data[0]<=0;
            UART_TX<=0;
        end
    else if (cnt!=0 & cnt!=9)
        begin
            UART_TX<=data[cnt];
            cnt<=cnt+1;
        end
    else if (cnt==9)
        begin
            cnt<=0;
            UART_TX<=1;
        end
  end
endmodule    
    
