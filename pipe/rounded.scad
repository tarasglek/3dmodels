// Define the size of the rectangle
rect_full_width = 76-1;
rect_straight_width= 65;
rect_full_height = 66-1;
rect_straight_height = 55;
corner_radius=(rect_full_width-rect_straight_width)/2;
// Define the radius of the rounded corners


include <BOSL2/std.scad>
rect_tube(size=[rect_full_width, rect_full_height], wall=1, rounding=corner_radius, h=3);