include <dimensions.scad>
include <BOSL2/std.scad>;


difference(){
cube([w,drip_height,l]);
translate([wall_size, 0,wall_size])
cube([w-wall_size*2,drip_height-wall_size,l-wall_size*2]);
}


translate([w,drip_height,l])
rotate([0,90,180])
linear_extrude(w)
 right_triangle([drip_height,drip_height]);