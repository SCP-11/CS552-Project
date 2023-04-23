/* $Author: karu $ */
/* $LastChangedDate: 2009-04-24 09:28:13 -0500 (Fri, 24 Apr 2009) $ */
/* $Rev: 77 $ */

`default_nettype none
module mem_system(/*AUTOARG*/
   // Outputs
   DataOut, Done, Stall, CacheHit, err,
   // Inputs
   Addr, DataIn, Rd, Wr, createdump, clk, rst
   );
   
   input wire [15:0] Addr;
   input wire [15:0] DataIn;
   input wire        Rd;
   input wire        Wr;
   input wire        createdump;
   input wire        clk;
   input wire        rst;
   
   output reg [15:0] DataOut;
   output reg        Done;
   output reg        Stall;
   output reg        CacheHit;
   output reg        err;

   /* data_mem = 1, inst_mem = 0 *
    * needed for cache parameter */

   reg[4:0] tag;
   reg [7:0]  index;
   reg [2:0]  offset;

   wire [4:0] tag_out_cache; 
   reg enable_cache;
   reg [4:0]  tag_in_cache;
   reg[2:0]   offset_cache, offset_mem;
   wire[15:0]  data_out_cache, data_out_mem;
   reg [15:0] data_in_cache, data_in_mem, addr_mem;
   reg comp_cache,  write_cache,
               wr_mem, rd_mem;
   wire stall, err_mem, dirty_cache, valid_cache, err_cache, hit_cache;
   wire [3:0] busy;
   parameter memtype = 0;

   cache #(0 + memtype) c0(// Outputs
                          .tag_out              (tag_out_cache),
                          .data_out             (data_out_cache),
                          .hit                  (hit_cache),
                          .dirty                (dirty_cache),
                          .valid                (valid_cache),
                          .err                  (err_cache),
                          // Inputs
                          .enable               (enable_cache),
                          .clk                  (clk),
                          .rst                  (rst),
                          .createdump           (createdump),
                          .tag_in               (tag_in_cache),
                          .index                (Addr[10:3]),
                          .offset               (offset_cache),
                          .data_in              (data_in_cache),
                          .comp                 (comp_cache),
                          .write                (write_cache),
                          .valid_in             (1'b1));

   four_bank_mem mem(// Outputs
                     .data_out          (data_out_mem),
                     .stall             (stall),
                     .busy              (busy),
                     .err               (err_mem),
                     // Inputs
                     .clk               (clk),
                     .rst               (rst),
                     .createdump        (createdump),
                     .addr              (addr_mem),
                     .data_in           (data_in_mem),
                     .wr                (wr_mem),
                     .rd                (rd_mem));
   
   // your code here
   
   reg dirty;
   reg [3:0] next_state;
   wire [3:0] state;
   always @* begin
      tag = Addr[15:11];
      index = Addr[10:3];
      offset = Addr[2:0];
      err = err_cache | err_mem;
   end

   parameter Idle = 4'h0;
   parameter Compare_Write = 4'h1;
   parameter Compare_Read = 4'h2;
   parameter Write_Back_0 = 4'h3;
   parameter Write_Back_1 = 4'h4;
   parameter Write_Back_2 = 4'h5;
   parameter Write_Back_3 = 4'h6;
   parameter Allocate_0 = 4'h7;
   parameter Allocate_1 = 4'h8;
   parameter Allocate_2 = 4'h9;
   parameter Allocate_3 = 4'ha;
   parameter AccessWrite = 4'hb;
   parameter AccessRead = 4'hc;
   parameter Wait_1 = 4'hd;
   parameter Wait_2 = 4'he;
   always @* begin
      Done = 1'b0;
      comp_cache = 1'b0;
      enable_cache = 1'b1;
      Stall = 1'b1;
      write_cache = 1'b0;
      wr_mem = 1'b0;
      rd_mem = 1'b0;
      DataOut = data_out_cache;
      //CacheHit = 1'b0;
      case(state) 
         Idle: begin
            Stall = 1'b0;
            DataOut = 16'h0;

            next_state = (Wr)? Compare_Write: (Rd)? Compare_Read: Idle;
         end

         Compare_Write: begin
            CacheHit = (valid_cache & hit_cache);
            comp_cache = 1'b1;
            data_in_cache = DataIn;
            offset_cache = offset;
            tag_in_cache = tag;
            dirty = (CacheHit)? 1'b0:  dirty_cache;

            next_state = (CacheHit)? AccessWrite:  (dirty)? Write_Back_0:  Allocate_0;
         end

         Compare_Read: begin
            CacheHit = (valid_cache & hit_cache);
            comp_cache = 1'b1;
            DataOut = data_out_cache;
            offset_cache = offset;
            tag_in_cache = tag;
            dirty = (CacheHit)? 1'b0:  dirty_cache;
            
            next_state = (CacheHit)? AccessRead:  (dirty)? Write_Back_0:  Allocate_0;
         end


         Write_Back_0:  begin
            comp_cache = 1'b0;
            write_cache = 1'b0;
            offset_cache = 3'b000;
            wr_mem = 1'b1;
            rd_mem = 1'b0;
            addr_mem = {tag_out_cache, index, 3'b000};
            data_in_mem = data_out_cache;                                                                                                            
            next_state = (busy[0]|stall)? Write_Back_0:  Write_Back_1;
         end

         Write_Back_1:  begin
            comp_cache = 1'b0;
            write_cache = 1'b0;
            offset_cache = 3'b010;
            wr_mem = 1'b1;
            rd_mem = 1'b0;
            addr_mem = {tag_out_cache, index, 3'b010};
            data_in_mem = data_out_cache;
            next_state = (busy[1]|stall)? Write_Back_1:  Write_Back_2;
         end
         
         Write_Back_2:  begin
            comp_cache = 1'b0;
            write_cache = 1'b0;
            offset_cache = 3'b100;
            wr_mem = 1'b1;
            rd_mem = 1'b0;
            addr_mem = {tag_out_cache, index, 3'b100};
            data_in_mem = data_out_cache;
            next_state = (busy[2]|stall)? Write_Back_2:  Write_Back_3;
         end

         Write_Back_3:  begin
            comp_cache = 1'b0;
            write_cache = 1'b0;
            offset_cache = 3'b110;
            wr_mem = 1'b1;
            rd_mem = 1'b0;
            addr_mem = {tag_out_cache, index, 3'b110};
            data_in_mem = data_out_cache;
            next_state = (busy[3]|stall)? Write_Back_3:  Allocate_0;
         end


         Allocate_0: begin
            wr_mem = 1'b0;
            rd_mem = 1'b1;
            addr_mem = {tag, index, 3'b000};
            //data_in_mem = 16'h0000;///fix
            next_state = Allocate_1;
         end


         Allocate_1: begin
            wr_mem = 1'b0;
            rd_mem = 1'b1;
            addr_mem = {tag, index, 3'b010};
            next_state = Allocate_2;
         end

         Allocate_2: begin
            comp_cache = 1'b0;
            write_cache = 1'b1;
            offset_cache = 3'b000;
            wr_mem = 1'b0;
            rd_mem = 1'b1;
            addr_mem = {tag, index, 3'b100};
            data_in_cache = data_out_mem;
            next_state = Allocate_3;
         end

         Allocate_3: begin
            comp_cache = 1'b0;
            write_cache = 1'b1;
            offset_cache = 3'b010;
            wr_mem = 1'b0;
            rd_mem = 1'b1;
            addr_mem = {tag, index, 3'b110};
            data_in_cache = data_out_mem;
            next_state = Wait_1;  
         end

         Wait_1: begin
            comp_cache = 1'b0;
            write_cache = 1'b1;
            offset_cache = 3'b100;
            data_in_cache = data_out_mem;
            next_state = Wait_2;  
         end

         Wait_2: begin
            comp_cache = 1'b0;
            write_cache = 1'b1;
            offset_cache = 3'b110;
            wr_mem = 1'b0;
            rd_mem = 1'b1;
            addr_mem = {tag, index, 3'b110};
            data_in_cache = data_out_mem;
            next_state = (Wr)? AccessWrite: AccessRead;  
         end


         AccessWrite: begin
            comp_cache = 1'b1;
            write_cache = 1'b1;
            offset_cache = offset;
            data_in_cache = DataIn;
            next_state = Idle;
            Done = 1'b1;
         end

         AccessRead: begin
            comp_cache = 1'b0;
            offset_cache = offset;
            DataOut = data_out_cache;
            next_state = Idle;
            Done = 1'b1;
         end

      endcase
   end
   
   dff state_dff [3:0] (.q(state), .d(next_state), .clk(clk), .rst(rst));

endmodule // mem_system
`default_nettype wire
// DUMMY LINE FOR REV CONTROL :9:
