// Include the rectangular_frame module
include <pipe.scad>
include <BOSL2/std.scad>;
// TODO: adjust size of incoming
// fix strength of top and bottom of incoming hole

margin = 1;
wall_thickness = 2.4;
overlap_depth = 50;
outgoing_overlap_depth = 20;

// Define the hole size

outgoing_hole_width = 76;
outgoing_hole_height = 66;
outgoing_hole_straight_width = 65;
outgoing_hole_straight_height = 55;
outgoing_corner_radius = (outgoing_hole_width - outgoing_hole_straight_width) / 2;





  union() {


    // ID rect

    difference(){
          rounded_rect(outgoing_hole_width, outgoing_hole_height, outgoing_corner_radius, outgoing_overlap_depth);
          translate([0,outgoing_hole_height/2-wall_thickness,overlap_depth/2-wall_thickness*2])
            rotate([90,0,0])
            scale([outgoing_hole_straight_width,outgoing_overlap_depth*2,1])
            cylinder(h = outgoing_hole_straight_width-wall_thickness*2, d = 1, $fn = 40);
    }
        //   translate([-wall_thickness,-wall_thickness,0])
          rounded_rect(outgoing_hole_width+wall_thickness*2, outgoing_hole_height+wall_thickness*2, outgoing_corner_radius, wall_thickness);


  }
