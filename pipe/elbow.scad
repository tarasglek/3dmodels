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

// Render the rectangle with a hole
rectangular_frame(incoming_outer_width, incoming_outer_height, wall_thickness, overlap_depth);

outgoing_inner_width = outgoing_hole_width - margin;
outogoing_inner_height = outgoing_hole_height - margin;
rotate([90, 0, 0])
    rectangular_frame(outgoing_inner_width, outogoing_inner_height, wall_thickness, overlap_depth);
// center ^ rect agaist thefirst one AI!