module muxdesign(
  input bit [3:0] a,
  input bit [3:0] b,
  input bit sel,
  output bit [3:0] c
  );
  
  assign c = sel ? a : b ;
  
endmodule
