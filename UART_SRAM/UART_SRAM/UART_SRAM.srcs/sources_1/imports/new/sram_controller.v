module sram_controller(
  input wire sysclk,
  input wire reset,
  input [7:0] RX_data,
  input wire test_mode,
  input wire [7:0]test_addr,
  input wire UART_read_en,
  input wire [18:0]sram_addr_r,
  input wire sram_rd_en,
  output wire [15:0]sram_wdata,
  output wire [18:0]sram_addr,
  output reg sram_wr_en,
  output wire OE,
  output wire CE,
  output wire WE,
  output wire UB,
  output wire LB);

 assign OE = test_mode?1'b0: ~sram_wr_en;
 assign CE =0;
 assign WE = test_mode?1'b1: sram_wr_en;
 assign UB = test_mode?1'b0: ~(sram_rd_en |  ~sram_wr_en);
 assign LB = test_mode?1'b0: ~(sram_rd_en |  ~sram_wr_en);
  
  reg [1:0]byte_count;
  reg [18:0]sram_addr_w;
  reg [15:0]sram_wdata_t;
  assign sram_wdata = (~sram_wr_en)?sram_wdata_t:16'bzzzzzzzzzzzzzzzz;
  
  assign sram_addr = test_mode? {11'd0,test_addr}: ((~sram_wr_en)? sram_addr_w:sram_addr_r);
  

always @(posedge sysclk or negedge reset)begin
    if(~reset)begin
        byte_count<=2'd0;
        sram_wr_en<=1;
    end
    else if (UART_read_en)begin
        if(byte_count<2'd1)begin
            byte_count<=byte_count+1;
            sram_wr_en<=1;
        end
        else begin
            byte_count<=0;
            
            sram_wr_en<=0;
        end
    end
    else begin
        if(~sram_wr_en)begin
            sram_wr_en<=1;
        end
    end
end

always @(posedge sysclk or negedge reset)begin
    if(~reset)begin
        sram_addr_w<=19'd0;
    end
    else if (~sram_wr_en)begin
            sram_addr_w<=sram_addr_w+1;
    end
    else begin
        
    end
end  
  
always @(posedge sysclk)
    begin
      if (UART_read_en)begin
          case(byte_count)
              2'd0:sram_wdata_t[7:0]<=RX_data;
              2'd1:sram_wdata_t[15:8]<=RX_data;
              default:begin end
          endcase
      end
      else begin
      end
end
endmodule