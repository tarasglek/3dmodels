// Include the rectangular_frame module
include <pipe.scad>;

// Define the hole size
incoming_hole_width = 100;
incoming_hole_height = 60;
outgoing_hole_width = 76;
outgoing_hole_height = 66;

margin = 1;
wall_thickness = 2; // Thickness of the rectangle around the hole
overlap_depth=10;
// Calculate outer dimensions
incoming_outer_width = margin + incoming_hole_width + 2 * wall_thickness;
incoming_outer_height = margin + incoming_hole_height + 2 * wall_thickness;

union() {
    //incoming rect
    rectangular_frame(incoming_outer_width, incoming_outer_height, wall_thickness, overlap_depth);

    outgoing_inner_width = outgoing_hole_width - margin;
    outgoing_inner_height = outgoing_hole_height - margin;
    // outgoing rect
    translate([(incoming_outer_width-outgoing_inner_width)/2, -margin*2, overlap_depth])
        rotate([90, 0, 0])
            rectangular_frame(outgoing_inner_width, outgoing_inner_height, wall_thickness, overlap_depth);
    
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
        translate([(incoming_outer_width-outgoing_inner_width)/2+wall_thickness, -margin, overlap_depth+wall_thickness ])
            rotate([90, 0, 0])
                cube([outgoing_inner_width-wall_thickness*2, outgoing_inner_height-wall_thickness*2, margin]);
    }
    }
}
