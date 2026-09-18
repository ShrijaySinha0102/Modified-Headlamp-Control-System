`include "timer.v"

module headlight(q,h,s,i,clk);
  
  input s,i,clk;
  output reg h;
  output [3:0]q;

  reg rst;
  
  timer m0(q,clk,rst);
  
  always@(*)
  begin
    if(s==1 && i==0)
      rst=0;
    else
      rst=1;
  end
  
  always@(posedge clk or posedge rst)
  begin
    if(i==1)
      h=s;
    else if(s==1 && i==0)
      begin
        h=1;
        if(q==4'b1010)
          rst=1;
      end
    if(rst==1 && i==0)
      h=0;
  end
  
endmodule

module tb_headlight();
  
  reg s,i,clk;
  wire h;
  wire [3:0]q;
  
  always
  begin
    #10 clk=~clk;
  end
  
  headlight mm0(q,h,s,i,clk);
  
  initial
  begin
    clk=0;s=0;i=0;
    #10 s=0;i=1;
    #10 s=1;i=0;
    #10 s=1;i=0;
    #10 s=1;i=1;
    #10 s=1;i=0;
    #10 s=1;i=0;
    #10 s=0;i=1;
    #10 s=0;i=1;
    #10 s=1;i=0;
    #10 s=1;i=0;
    #10 s=1;i=0;
    #10 s=1;i=0;
    #10 s=1;i=0;
    #10 s=1;i=0;
    #10 s=1;i=0;
    #10 s=1;i=0;
    #10 s=1;i=0;
    #10 s=1;i=0;
    #10 s=1;i=0;
    #10 s=1;i=0;
    #10 s=1;i=0;
    #10 s=1;i=0;
    #10 s=1;i=0;
    #10 s=1;i=0;
    #10 s=1;i=0;
    #10 s=1;i=0;
    #10 s=1;i=0;
    #10 s=1;i=0;
    #10 s=1;i=0;
    #10 s=1;i=0;
    #10 s=1;i=0;
    #10 s=1;i=0;
    #10 s=1;i=0;
    #10 s=1;i=0;
    #10 s=1;i=1;
  end
  
endmodule
