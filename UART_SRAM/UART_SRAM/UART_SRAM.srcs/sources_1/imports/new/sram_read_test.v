module sram_read_test(
  input wire sysclk,
  input wire reset,
  input wire UART_end_flag,
  input wire [15:0]sram_rdata,
  output reg compare_result,
  output reg [18:0]sram_addr_r,
  output reg sram_rd_en,
  output reg read_finish
  );

reg UART_end_flag_delay;
reg [31:0]read_data;
reg [31:0]read_data_standard;
wire [7:0]data_std,data_std0,data_std1,data_std2,data_std3;
assign data_std = {sram_addr_r[6:0],1'b0};
assign data_std0 = data_std +1;
assign data_std1 = data_std -0;
assign data_std2 = data_std -1;
assign data_std3 = data_std -2;


 always @(posedge sysclk or negedge reset)begin
    if(~reset)begin
        read_finish<=0;
        sram_rd_en<=0;
    end
    else if(UART_end_flag)begin
        if(sram_addr_r<19'd512)begin
            sram_rd_en<=1;
        end
        else begin
            read_finish<=1;
            sram_rd_en<=0;
        end
    end
    else begin
        
    end
  end 
  
 always @(posedge sysclk or negedge reset)begin
     if(~reset)begin
         sram_addr_r<=19'd0;
     end
     else if(sram_rd_en)begin
             sram_addr_r<=sram_addr_r+1;
     end
     else begin
     end
   end
  
reg [1:0] read_byte_count;
reg compare;
  
always @(posedge sysclk or negedge reset)begin
      if(~reset)begin
          compare <= 0;
          read_byte_count<=2'b00;
          read_data_standard<=32'd0;
      end
      else if(sram_rd_en)begin
          if(read_byte_count==2'b01)begin
              read_byte_count<=2'b00;
              read_data_standard<={data_std0,data_std1,data_std2,data_std3};
              compare <= 1;
              
          end
          else begin
              read_byte_count<=read_byte_count+1;
              compare <= 0;
          end
      end
      else begin
          
      end
end 

always @(posedge sysclk or negedge reset)begin
      if(~reset)begin
          read_data<=32'd0;
      end
      else if(sram_rd_en)begin
        case(read_byte_count)
          2'd0:read_data[15:0]<=sram_rdata;
          2'd1:read_data[31:16]<=sram_rdata;
          default:begin end
        endcase
      end
      else begin
          
      end
end 
  
always @(posedge sysclk or negedge reset)begin
      if(~reset)begin
          compare_result<=1;
      end
      else if(compare)begin
        if(read_data!=read_data_standard)begin
            compare_result<=0;
        end
      end
      else begin
      end
end
endmodule