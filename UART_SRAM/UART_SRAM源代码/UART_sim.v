module UART_receiver(
  input wire BRclk16,
  input wire reset,
  input wire UART_RX,
  output wire UART_TX,
  output reg[7:0] RX_data,
  output reg UART_read_en,
  output reg UART_end_flag);

parameter sram_write_num = 19'd1024;

assign UART_TX = 1;

reg [3:0]UART_cycle_count;
reg [18:0]write_num_count;

reg [2:0] cnt;
reg [8:0] clkcnt;
reg RX_STATUS;

always @(posedge BRclk16 or negedge reset)begin
  if(~reset)begin
        clkcnt<=9'd0;
        cnt<=3'd0;
        UART_read_en<=0;
        RX_STATUS <= 0;
  end
  else if (clkcnt==0 && UART_RX==1)begin
     clkcnt <= 0;
     UART_read_en<=0;
  end
  else
    begin
      clkcnt <= clkcnt + 1;
      if (clkcnt==144) begin RX_STATUS <= 1; end
      else if (clkcnt==146) begin
           RX_STATUS <= 0;
           clkcnt<=0;
      end
      else if (clkcnt==24 || clkcnt==40 || clkcnt==56 || clkcnt==72 || clkcnt==88 || clkcnt==104 || clkcnt==120 || clkcnt==136)begin
          cnt <= cnt+1;
          case (cnt)
            0: RX_data[0]<=UART_RX;
            1: RX_data[1]<=UART_RX;
            2: RX_data[2]<=UART_RX;
            3: RX_data[3]<=UART_RX;
            4: RX_data[4]<=UART_RX;
            5: RX_data[5]<=UART_RX;
            6: RX_data[6]<=UART_RX;
            7:  begin
                  RX_data[7]<=UART_RX;
                  UART_read_en<=1;
                  cnt<=0;
            end
          endcase
        end
        else begin
            UART_read_en<=0;
        end
    end
end

reg UART_end_flag_t;

 always @(posedge BRclk16 or negedge reset)begin
    if(~reset)begin
        write_num_count<=19'd0;
        UART_end_flag_t<=0;
    end
    else if(write_num_count==sram_write_num)begin
        UART_end_flag_t<=1;
    end
    else if (clkcnt==136)begin
        write_num_count<=write_num_count+1;
    end
    else begin
    end
  end
  
   always @(posedge BRclk16 or negedge reset)begin
     if(~reset)begin
         UART_end_flag<=0;
     end
     else begin
         UART_end_flag<=UART_end_flag_t;
     end
   end 
  
endmodule