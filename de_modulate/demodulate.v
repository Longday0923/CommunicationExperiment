module demodulate(now_signal, output_data, clk);
  input now_signal, clk;
  output reg output_data;
  
  reg former_signal;
  reg[3:0] count;
  
  initial
    begin
      count <= 4'b0;
      output_data <= 1'b0;
      former_signal <= 1'b0;
    end
  
  always @(posedge clk)
    begin
      if(now_signal == 1 && former_signal == 0)
        begin
          count <= 4'b0;
        end
      else if(now_signal == 0 && former_signal == 1)
        begin
          output_data <= (count <= 4'b1011)? 1:0;
          count <=4'b0;
        end
      else 
        begin
          count <= count+1;
        end
      former_signal <= now_signal;
    end
endmodule         
            
          