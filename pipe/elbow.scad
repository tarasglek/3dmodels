// Include the rectangular_frame module
include <pipe.scad>;

// Define the hole size
incoming_hole_width = 100;
incoming_hole_height = 60;
margin = 1;
frame_width = 2; // Thickness of the rectangle around the hole

// Calculate outer dimensions
outer_width = margin + incoming_hole_width + 2 * frame_width;
outer_height = margin + incoming_hole_height + 2 * frame_width;

// Render the rectangle with a hole
rectangular_frame(outer_width, outer_height, frame_width, 10); // Z-height = 5mm

rotate([90, 0, 0])
    rectangular_frame(outer_width, outer_height, frame_width, 10);
