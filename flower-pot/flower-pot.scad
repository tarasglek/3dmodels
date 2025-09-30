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

foot_inset=rounding*1.3;
canal_size=3;
canal_with_spacing=canal_size+1.2;
canals=inside_l/canal_with_spacing;
difference() {

    union() {
        difference()
        {

            diff()
                cuboid([inside_l,inside_w,pot_height], rounding=rounding, except=[BOTTOM,TOP])
                    attach(BOTTOM,BOTTOM,inside=true) 
                        cyl(d1=7,d2=10,h=wall_size*3)
                            attach(BOTTOM,BACK,inside=true) 
                                yrot(90)
                                    zcopies(canal_with_spacing,canals)
                                    cyl(d=canal_size, h=inside_w, $fn=20);
            translate([0,0, wall_size*2])
            cuboid([inside_l-wall_size*2,inside_w-wall_size*2,pot_height], rounding=rounding*2, except=[TOP]);
        }

    };
    translate([0,0,-pot_height/2])
    yrot(90)
    cyl(d=canal_size, h=inside_l, $fn=20);
}


