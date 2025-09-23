include <dimensions.scad>;      
include <BOSL2/std.scad>;

depth=pot_height;
module shape(size) {
    cut_off=size/10;

        // difference()
        {
    hull()
     {
        
        translate([0,0,size/4])

        // half-sphere
        difference()
        {
            sphere(d=size,$fn=30);
            translate([0,0,-size/4])
                cube([size,size,size/2],center=true);

        };
            
        
        cube([size,size,depth],center=true);
    }

            translate([0,0,size/2+cut_off*2])
                cube([size/8,size/8,cut_off], center=true);
        }

}

module section(size) {

    wall_size=1.2;
    difference(){
        shape(size);
        shape(size-wall_size*2);
    }


}

for (i = [0]) {
    translate([i*inside_w,0,0])
    section(inside_w);
}