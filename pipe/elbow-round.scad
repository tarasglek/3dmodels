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

outgoing_inner_width = outgoing_hole_width - margin;
outgoing_inner_height = outgoing_hole_height - margin;
outgoing_inner_hole_width = outgoing_inner_width-wall_thickness*2;
outgoing_inner_hole_height = outgoing_inner_height-wall_thickness*2;
diameter = outgoing_hole_width;
length = diameter;

union() {
    hull()
    {
        cube([incoming_outer_width, incoming_outer_height, 1]);
        translate([incoming_outer_width/2, incoming_outer_height/2+overlap_depth, diameter/2])
            sphere(d=diameter, $fn=40);
    

    // translate([0,0, 130])
    // rotate([0, 90, 0])


        translate([incoming_outer_width/2-outgoing_inner_width/2, diameter+overlap_depth,overlap_depth])
        rotate([90, 0, 0])
            cube([outgoing_inner_width, outgoing_inner_height, 1]);
        translate([incoming_outer_width/2, incoming_outer_height/2+overlap_depth, diameter/2])
            sphere(d=diameter, $fn=40);

    }
}

