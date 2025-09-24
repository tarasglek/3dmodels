include <BOSL2/std.scad>
include <dimensions.scad>

wall_size=1.2;
rounding=10;

nozzle_size=0.4;
support_od=10;
rounding_offset=rounding+3;
support_l=(inside_l-rounding_offset*1.5);
support_w=(inside_w-rounding_offset*1.5);
count_x=support_l/support_od;
gap=(support_l - (count_x*support_od))/count_x;

x=-support_l/2;
y=-support_w/2;

union() {
    difference()
    {

            cuboid([inside_l,inside_w,pot_height], rounding=rounding, except=[TOP])
            {
                align(BOTTOM,RIGHT+FRONT, inset=rounding) cyl(l=wall_size, r=pot_height/10);
                align(BOTTOM,RIGHT+BACK, inset=rounding) cyl(l=wall_size, r=pot_height/10);
                align(BOTTOM,LEFT+FRONT, inset=rounding) cyl(l=wall_size, r=pot_height/10);
                align(BOTTOM,LEFT+BACK, inset=rounding) cyl(l=wall_size, r=pot_height/10);
                align(BOTTOM,LEFT+BACK, inset=rounding) rect_tube(size=[support_l,support_w], wall=nozzle_size, h=wall_size);//rect_tube(size=[support_l,support_w], h=wall_size);
                
            };
        translate([0,0, wall_size])
        cuboid([inside_l-wall_size*2,inside_w-wall_size*2,pot_height], rounding=20, except=[TOP]);
        cyl(l=pot_height*2, r=pot_height/10);
    }
    for (yi = [0:(support_w/support_od+1)]) {
        for (xi = [0:(count_x+1)]) {
            translate([x+(support_od+gap)*xi,y+(support_od*yi),-pot_height/2-wall_size/2])
                tube(od=support_od, wall=nozzle_size, h=wall_size,$fn=30);
        }
    }

};



