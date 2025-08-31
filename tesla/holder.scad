rotate([90,0,0])
    import("teslashim.stl");
translate([0,-54,-20])
    cube([200,4,4]);

// tesla part size [120,1,25]
color("red")
translate([30,-55,-35])
cube([120,1,25]);
steering_width=120;
steering_depth=25;

thickness=10;
width=160;
depth=62;

translate([-width/2+steering_width/2+30,-55-thickness,-35-depth+steering_depth])
cube([width, thickness, depth]);