// Include the rectangular_frame module
include <pipe.scad>;

// Define the hole size
incoming_hole_width = 100;
incoming_hole_height = 60;
outgoing_hole_width = 76-1;
outgoing_hole_height = 66-1;
outgoing_hole_straight_width= 65;
outgoing_hole_straight_height = 55;
corner_radius = (outgoing_hole_width - outgoing_hole_straight_width)/2;

margin = 1;
wall_thickness = 2; // Thickness of the rectangle around the hole
overlap_depth=10;
// Calculate outer dimensions
incoming_outer_width = margin + incoming_hole_width + 2 * wall_thickness;
incoming_outer_height = margin + incoming_hole_height + 2 * wall_thickness;

outgoing_inner_width = outgoing_hole_width - margin;
outgoing_inner_height = outgoing_hole_height - margin;
outgoing_inner_hole_width = outgoing_inner_width-wall_thickness*2;
outgoing_inner_hole_height = outgoing_inner_height-wall_thickness*2;

union() {
    //incoming rect
    rectangular_frame(incoming_outer_width, incoming_outer_height, wall_thickness, overlap_depth);

    
    // outgoing rect
    translate([(incoming_outer_width)/2, -margin*2, overlap_depth + outgoing_hole_height/2 ])
        rotate([90, 0, 0])
            difference(){
                rounded_rect(outgoing_hole_width, outgoing_hole_height, corner_radius, overlap_depth);
                // ai, put a cylinder hole that's sized same as ^ AI!
            }
   difference() {
    // Hull connecting the two openings for smooth water flow
        hull() {
            // margin-sized rect for incoming
            translate([0, 0, overlap_depth])
                cube([incoming_outer_width, incoming_outer_height, margin]);


            // Margin-sized rect for outgoing
            translate([(incoming_outer_width-outgoing_inner_width)/2, -margin, overlap_depth ])
                rotate([90, 0, 0])
                    cube([outgoing_inner_width, outgoing_inner_height, margin]);
        }
        // hole
        hull() {
            translate([wall_thickness, wall_thickness/2+margin/2, overlap_depth])
               cube([incoming_hole_width+margin*2, incoming_hole_height+margin*2, margin]);
            translate([incoming_outer_width/2,-margin,overlap_depth+outgoing_inner_height/2])
                rotate([90, 0, 0])
                    // diameter is 1, we use scale to  set size...however radio for 1 is 0.5
                    linear_extrude(height = margin)
                        scale([outgoing_inner_hole_width, outgoing_inner_hole_height, margin]) circle(d=1, $fn=40);
        }
   }
}

