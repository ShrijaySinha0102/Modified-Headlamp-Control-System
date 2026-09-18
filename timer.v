`include "D_ff.v"

module timer(q,clk,rst);
  
  input clk,rst;
  output [3:0]q;
  
  wire w1,w2,w3,w4;
  
  assign w1=(q[3]&(~q[1]))|(q[2]&q[1]&q[0]);
  assign w2=(q[2]&(~q[1]))|((~q[3])&q[2]&(~q[0]))|((~q[2])&q[1]&q[0]);
  assign w3=((~q[1])&q[0])|((~q[3])&q[1]&(~q[0]));
  assign w4=((~q[1])&(~q[0]))|((~q[3])&(~q[0]));
  
  D_ff m0(clk,rst,w1,q[3]);
  D_ff m1(clk,rst,w2,q[2]);
  D_ff m2(clk,rst,w3,q[1]);
  D_ff m3(clk,rst,w4,q[0]);
  
endmodule

module tb_timer();
  
  reg clk,rst;
  wire [3:0]q;
  
  timer mm0(q,clk,rst);
  
  always
  begin
    #10 clk=~clk;
  end
  
  initial
  begin
    clk=0;rst=0;
    #10 rst=1;
    #10 rst=0;
  end
  
endmodule
