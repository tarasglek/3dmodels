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
length = 100;
union() {
    hull() 
    {
        cube([incoming_outer_width, incoming_outer_height, 1]);
        translate([incoming_outer_width/2, incoming_outer_height/2+overlap_depth, length])
            cylinder(d=outgoing_hole_height, h=1, $fn=40);
    }
    
    // translate([0,0, 130])
    // rotate([0, 90, 0])
    
    //  hull()
     {
        translate([incoming_outer_width/2, incoming_outer_height/2+overlap_depth, length]) //factor this out into a func with no params AI!
        rotate([0, 90, 90])
        sphere(d=outgoing_hole_height, $fn=40);
        translate([0, 0,100 ])
        cube([outgoing_hole_width, outgoing_hole_height, 1]);
    }
}

