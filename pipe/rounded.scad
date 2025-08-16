// Define the size of the rectangle
outgoing_rect_full_width = 76-1;
outgoing_rect_straight_width= 65;
outgoing_rect_full_height = 66-1;
outgoing_rect_straight_height = 55;
corner_radius=(outgoing_rect_full_width-outgoing_rect_straight_width)/2;
// Define the radius of the rounded corners


include <BOSL2/std.scad>

incoming_hole_width = 100;
incoming_hole_height = 60;
wall_thickness = 2;
overlap_depth=10;

// hole
hull() {
        cube([incoming_hole_width+wall_thickness*2, incoming_hole_height+wall_thickness*2,1],anchor=CENTER) {
                position([0,-1,1]) ymove(-overlap_depth) xrot(90)                 
                        cylinder(h=5,d=outgoing_rect_straight_width, anchor=[0,-1,-1]);
        };
}

minkowski() {
    square([rect_width - 2*corner_radius, rect_height - 2*corner_radius], center=true);
    circle(r=corner_radius);
}
/*
rect_tube(size=[outgoing_rect_full_width, outgoing_rect_full_height], wall=1, rounding=corner_radius, h=3) {
position(TOP)  cube([outgoing_rect_full_width,outgoing_rect_full_width,outgoing_rect_full_width], anchor=BOTTOM);
}*/
/*
         xrot(90)
         rotate_extrude($fn = 10,angle=90)
         right(7)
         circle(r=7);
 */
 
 //prismoid(size1=[40,90], size2=[30,40], h=20) /*show_anchors()*/;
//  i have a square pipe 10x10 horizontally and i want to join it with a 9x9 pipe that goes down from it. Generate triangular polyhedron with one side that's 10x10 and one that's 9x9 in openscad.
 //cube([outgoing_rect_full_width,outgoing_rect_full_width,outgoing_rect_full_width]) show_anchors();

/*
 polyhedron(
  points = [
    // 10x10 square (Z=0 plane)
    [0, 0, 0],    // 0
    [10, 0, 0],   // 1
    [10, 10, 0],  // 2
    [0, 10, 0],   // 3
    
    // 9x9 square (Y=0 plane, offset downward)
    [0.5, 0, 0.5],  // 4
    [9.5, 0, 0.5],  // 5
    [9.5, 0, 9.5],  // 6
    [0.5, 0, 9.5]   // 7
  ],
  faces = [
    // Horizontal face (10x10)
    [0, 1, 2, 3],
    
    // Vertical face (9x9)
    [4, 5, 6, 7],
    
    // Connection faces (all triangles)
    [0, 1, 5], [0, 5, 4],

    [3, 0, 4], [3, 4, 7]
  ]
);*/
