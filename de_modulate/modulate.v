module modulate(input_data, output_signal, clk);
  
  input input_data, clk;
  output output_signal;
  
  reg freq1, freq2;
  reg[3:0] count;
  
  assign output_signal = (input_data == 1)? freq1:freq2;
  
  initial
    begin
      freq1 <= 1'b0;
      freq2 <= 1'b0;
      count <= 4'b0;
    end
    
  always @(posedge clk)
    begin
      begin
        if(count == 4'b0111)
          begin
            freq1 <= ~freq1;
          end
        if(count == 4'b1111)
          begin
            freq2 <= ~freq2;
            count2 <= 4'b0;
          end
        else
          begin
            count1 <= count1+4'b0001;
          end
      end
    end

endmodule
