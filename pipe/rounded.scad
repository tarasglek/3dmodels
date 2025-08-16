// Define the size of the rectangle
rect_full_width = 76-1;
rect_straight_width= 65;
rect_full_height = 66-1;
rect_straight_height = 55;
corner_radius=(rect_full_width-rect_straight_width)/2;
// Define the radius of the rounded corners


include <BOSL2/std.scad>
/*
rect_tube(size=[rect_full_width, rect_full_height], wall=1, rounding=corner_radius, h=3) {
position(TOP)  cube([rect_full_width,rect_full_width,rect_full_width], anchor=BOTTOM);
}*/
/*
         xrot(90)
         rotate_extrude($fn = 10,angle=90)
         right(7)
         circle(r=7);
 */
 
 //prismoid(size1=[40,90], size2=[30,40], h=20) /*show_anchors()*/;
//  i have a square pipe 10x10 horizontally and i want to join it with a 9x9 pipe that goes down from it. Generate triangular polyhedron with one side that's 10x10 and one that's 9x9 in openscad.
 //cube([rect_full_width,rect_full_width,rect_full_width]) show_anchors();

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
