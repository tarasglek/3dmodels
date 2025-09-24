include <BOSL2/std.scad>
include <dimensions.scad>

wall_size=1.2;
rounding=10;

nozzle_size=0.4;
support_od=5;

difference()
{

    cuboid([inside_l,inside_w,pot_height], rounding=rounding, except=[TOP])
    {
        align(BOTTOM,RIGHT+FRONT, inset=rounding) cyl(l=wall_size, r=pot_height/10);
        align(BOTTOM,RIGHT+BACK, inset=rounding) cyl(l=wall_size, r=pot_height/10);
        align(BOTTOM,LEFT+FRONT, inset=rounding) cyl(l=wall_size, r=pot_height/10);
        align(BOTTOM,LEFT+BACK, inset=rounding) cyl(l=wall_size, r=pot_height/10);
        
    };
    translate([0,0, wall_size])
    cuboid([inside_l-wall_size*2,inside_w-wall_size*2,pot_height], rounding=20, except=[TOP]);
    cyl(l=pot_height*2, r=pot_height/10);
}

rounding_offset=rounding+3;
support_l=(inside_l-rounding_offset*2);
support_y=(inside_w-rounding_offset*2);
count_x=support_l/support_od;
gap=(support_l - (count_x*support_od))/count_x;

x=-support_l/2;
y=-support_y/2;
for (yi = [0:(support_y/support_od)]) {
    for (xi = [0:(count_x+1)]) {
        translate([x+(support_od+gap)*xi,y+(support_od*yi),-pot_height/2])
            tube(od=support_od, wall=nozzle_size, h=wall_size);
    }
}

