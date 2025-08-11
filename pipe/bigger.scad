// Include the rectangular_frame module
include <pipe.scad>;

// Define the hole size
hole_width = 100;
hole_height = 60;
frame_width = 5; // Thickness of the rectangle around the hole

// Calculate outer dimensions
outer_width = hole_width + 2 * frame_width;
outer_height = hole_height + 2 * frame_width;

// Render the rectangle with a hole
rectangular_frame(outer_width, outer_height, frame_width, 5); // Z-height = 5mm
