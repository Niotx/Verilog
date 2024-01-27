module tb_GrantLogic;

  reg [3:0] i_request;
  reg Resetn, Clock;
  wire [1:3] o_grant;

  GrantLogic uu (i_request, Resetn, Clock, o_grant);

  always #5 Clock = ~Clock;

  initial begin
    Resetn = 0;
    Clock = 0;
    i_request = 4'b0000;
    #50;

    Resetn = 1;
    i_request = 4'b0010;
    #50;

    Resetn = 0;
    #50;

    Resetn = 1;
    i_request = 4'b0010;
    #50;


    $stop();

  end

endmodule
