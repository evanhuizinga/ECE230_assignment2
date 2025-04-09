module siso_5bit (
    input clk,
    input reset,
    input data_in,
    output data_out
);
    wire [4:0] q;       
    wire [4:0] Dmux;    
    wire nreset;

    not (nreset, reset);

    wire a0, b0;
    and (a0, reset, data_in);
    and (b0, nreset, q[0]);
    or  (Dmux[0], a0, b0);

    wire a1, b1;
    and (a1, reset, q[0]);
    and (b1, nreset, q[1]);
    or  (Dmux[1], a1, b1);

    wire a2, b2;
    and (a2, reset, q[1]);
    and (b2, nreset, q[2]);
    or  (Dmux[2], a2, b2);

    wire a3, b3;
    and (a3, reset, q[2]);
    and (b3, nreset, q[3]);
    or  (Dmux[3], a3, b3);

    wire a4, b4;
    and (a4, reset, q[3]);
    and (b4, nreset, q[4]);
    or  (Dmux[4], a4, b4);

    mux eq1 (.D0(q[0]), .D1(data_in), .Sel(reset), .clk(clk), .Q(q[0]));
    mux eq2 (.D0(q[1]), .D1(q[0]),    .Sel(reset), .clk(clk), .Q(q[1]));
    mux eq3 (.D0(q[2]), .D1(q[1]),    .Sel(reset), .clk(clk), .Q(q[2]));
    mux eq4 (.D0(q[3]), .D1(q[2]),    .Sel(reset), .clk(clk), .Q(q[3]));
    mux eq5 (.D0(q[4]), .D1(q[3]),    .Sel(reset), .clk(clk), .Q(q[4]));

    assign data_out = q[4];

endmodule
