module mux2 (
    input a, b, sel,
    output out
);
    wire nsel, a1, b1;

    not (nsel, sel);
    and (a1, a, nsel);
    and (b1, b, sel);
    or  (out, a1, b1);
endmodule
