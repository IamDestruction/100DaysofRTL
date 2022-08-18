module muxverif;
  logic [3:0] a;
  logic [3:0] b;
  logic  sel;
  logic [3:0] c;
  
  covergroup togcov;
    coverpoint a{
      option.auto_bin_max = 16;
    }
    coverpoint b{
      option.auto_bin_max = 16;
    }
    coverpoint sel{
      option.auto_bin_max = 2;
    }
  endgroup
  
  
  muxdesign mux_design(.*);
  togcov cg = new();
   
  initial begin
    for(int i=0; i <50; i++) begin
      a 	= $urandom_range(0,4'hF);
      b 	= $urandom_range(0,4'hF);
      sel     = $urandom%2;
      cg.sample();
    end
    $display("coverage is %0.2f %%",cg.get_coverage);
  end
  
endmodule 
