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

//incoming rect
rectangular_frame(incoming_outer_width, incoming_outer_height, wall_thickness, overlap_depth);

outgoing_inner_width = outgoing_hole_width - margin;
outgoing_inner_height = outgoing_hole_height - margin;
// outgoing rect
translate([(incoming_outer_width-outgoing_inner_width)/2, 0, overlap_depth])
    rotate([90, 0, 0])
        rectangular_frame(outgoing_inner_width, outgoing_inner_height, wall_thickness, overlap_depth);
// incoming outer edge and outgoing inner edge touch...hull them together to form an elbow AI!