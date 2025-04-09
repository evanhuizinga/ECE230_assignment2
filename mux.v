module mux_dff (
    input D0,
    input D1,
    input Sel,
    input clk,
    output reg Q
);
    reg D;

    always @(*) begin
        if (Sel == 1'b1)
            D = D1;
        else
            D = D0;
    end

    always @(posedge clk) begin
        Q <= D;
    end
endmodule
