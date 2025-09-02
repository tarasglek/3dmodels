thickness=10;
width=160;
depth=62;

steering_width=120;
steering_depth=25;
//rotate([0,180,0])
difference()
{
    union(){
        rotate([90,0,0])
            import("teslashim.stl");


        translate([-width/2+steering_width/2+30,-55-thickness,-depth+steering_depth+1])
        cube([width, thickness, depth]);
    }
    union()
    {
        translate([30-10,-58,-20+5])
        rotate([0,90,0])
            cylinder(h=steering_width+20,d=8);


        translate([30-10,-58,-30])
        rotate([0,90,0])
            cylinder(h=steering_width+20,d=8);
    }
}

/*
// tesla part size [120,1,25]
color("red")
translate([30,-55,-35])
cube([120,1,25]);
*/