/* $Author: karu $ */
/* $LastChangedDate: 2009-03-04 23:09:45 -0600 (Wed, 04 Mar 2009) $ */
/* $Rev: 45 $ */
// D-flipflop
`default_nettype none
module victimway (data_out, dirty, tag_out, valid, hit,
                    data_out_0, dirty_0, tag_out_0, valid_0, hit_0,
                    data_out_1, dirty_1, tag_out_1, valid_1, hit_1
                    );

    output  wire [15:0]  data_out;
    output  wire [4:0]   tag_out;
    output  wire         hit, valid, dirty;
    input   wire [15:0]  data_out_0;
    input   wire [4:0]   tag_out_0;
    input   wire         hit_0, valid_0, dirty_0;
    input   wire [15:0]  data_out_1;
    input   wire [4:0]   tag_out_1;
    input   wire         hit_1, valid_1, dirty_1;

    
    assign hit = (hit_1)? hit_1: hit_0;
    assign data_out = (hit_1)? data_out_1: data_out_0;

endmodule
`default_nettype wire
// DUMMY LINE FOR REV CONTROL :0:
