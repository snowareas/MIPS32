module UART_SRAM(
  input wire sysclk,
  input wire reset,
  input wire test_mode,
  input wire [7:0]test_addr,
  input wire data_choose,
  input wire UART_RX,
  output wire UART_TX,
  output wire [3:0]show_addr,
  output wire read_finish,
  output wire compare_result,
  output wire UART_end_flag,
  inout wire [15:0]sram_data,
  //input wire [15:0]sram_data_r,
  //output wire [15:0]sram_data_w,
  output wire [7:0]test_data,
  output wire [18:0]sram_addr,
  output wire sram_wr_en,
  output wire WE,
  output wire OE,
  output wire CE,
  output wire UB,
  output wire LB);
  
assign  test_data = data_choose?sram_data[15:8]:sram_data[7:0];
assign show_addr = sram_addr[3:0];

wire [7:0]RX_data;
wire UART_read_en;
wire sram_rd_en;
wire [18:0]sram_addr_r;
wire clk9600;
wire BRclk16;

Freqdivide Freqdivide_m(
   .sysclk(sysclk),
   .reset(reset),
   .clk50M(clk50M)
);

UART_brgenerator UART_brgenerator_m(
.sysclk(sysclk),
.clk9600(clk9600),
.brclk16(BRclk16));


UART_receiver UART_receiver_m(
.BRclk16(BRclk16),
.reset(reset),
.RX_data(RX_data),
.UART_RX(UART_RX),
.UART_TX(UART_TX),
.UART_read_en(UART_read_en),
.UART_end_flag(UART_end_flag)
);


sram_controller sram_controller_m(
  .sysclk(BRclk16),
  .reset(reset),
  .RX_data(RX_data),
  .test_mode(test_mode),
  .test_addr(test_addr),
  .UART_read_en(UART_read_en),
  .sram_addr_r(sram_addr_r),
  .sram_rd_en(sram_rd_en),
  .sram_wdata(sram_data),
  //.sram_wdata(sram_data_w),
  .sram_addr(sram_addr),
  .sram_wr_en(sram_wr_en),
  .OE(OE),
  .CE(CE),
  .WE(WE),
  .UB(UB),
  .LB(LB));

sram_read_test sram_read_test_m(
  .sysclk(clk50M),
  .reset(reset),
  .UART_end_flag(UART_end_flag),
  .sram_rdata(sram_data),
  //.sram_rdata(sram_data_r),
  .compare_result(compare_result),
  .sram_addr_r(sram_addr_r),
  .sram_rd_en(sram_rd_en),
  .read_finish(read_finish)
  );

endmodule