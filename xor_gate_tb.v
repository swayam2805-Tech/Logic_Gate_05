module tb_xor_gate();
    // Declare signals for the inputs as 'reg' because the testbench
    // will drive their values in a procedural block
    reg a, b;

    // Declare signals for the output as 'wire' because
    // it will be connected to the output port of the DUT
    wire c;

    // Instantiate the Design Under Test (DUT)
    // Connect testbench signals (a, b, c) to DUT ports (.a, .b, .c)
    xor_gate uut (.a(a), .b(b), .c(c));

    // Initial block to apply stimulus
    initial begin
        // Initialize inputs at time 0
        a = 0;
        b = 0;
        #10; // Wait for 10 time units

        // Apply all input combinations with delays
        a = 0;
        b = 1;
        #10;
        a = 1;
        b = 0;
        #10;
        a = 1;
        b = 1;
        #10;

        // Stop the simulation
        $finish;
    end

    // Initial block to display the simulation results
    initial begin
        // Display header
        $display("Time\tA\tB\tC");
        $display("-----------------------");

        // Use $monitor to display values whenever any of the arguments change
        $monitor("%0t\t%0b\t%0b\t%0b", $time, a, b, c);
    end
