
/* [Size and thickness] */
// fan size in mm
fan_size = 80; // [40:20:200]

tab_width_outer=88.1;
tab_height=13.5;
tab_width=12.5;
tab_offset=5.5;
heater_size=61.5;
heater_straight=52;
heater_depth=4.5;
space_after_depth=3;
fan_depth=heater_depth+space_after_depth;

// fan grill thickness in mm
grill_thickness = fan_depth;

// plastic thickness around the fan hole in mm
vent_wall_thickness = 1;

fan_duct_chamfer = false;

// screw hole type
screw_hole_type = "t"; // [s:Straight, t:Tapered, i:Inset]

/* [Vent grill bars] */
// number of horzontal grill bars
horizontal_bar_count = 1;
// number of vertical grill bars
vertical_bar_count = 1;

// grill bars thickness
bars_thickness = 1;

// grill bars width
bars_width = 1.2;

/* [Hidden] */
$fn = 64;

screw_hole_diameter = 3.5;
screw_hole_radius = screw_hole_diameter / 2;
screw_hole_radius_wider = screw_hole_radius + 1;
screw_support_thickness = 1;
screw_center_distance_from_edge = 4;

module PrimeShape() {
        union() {
        difference() {
            cube([fan_size, fan_size, grill_thickness]);
            
            // corner chamfer
            translate([3,0,-1])
            rotate([0,0,135])
            cube([5, 5, grill_thickness + 2]);

            translate([fan_size-3,0,-1])
            rotate([0,0,-45])
            cube([5, 5, grill_thickness + 2]);

            translate([fan_size,fan_size-3,-1])
            rotate([0,0,45])
            cube([5, 5, grill_thickness + 2]);

            translate([0,fan_size-3,-1])
            rotate([0,0,45])
            cube([5, 5, grill_thickness + 2]);
        }

        // corner roundness
        translate([3,3,grill_thickness/2])
        cylinder(r=3, h=grill_thickness, center=true);

        translate([fan_size-3,3,grill_thickness/2])
        cylinder(r=3, h=grill_thickness, center=true);

        translate([fan_size-3,fan_size-3,grill_thickness/2])
        cylinder(r=3, h=grill_thickness, center=true);

        translate([3,fan_size-3,grill_thickness/2])
        cylinder(r=3, h=grill_thickness, center=true);
    }
}

module PrimeShapeWithScrewHoles() {
    difference() {
        PrimeShape();

        // screw holes
        ScrewHole(screw_center_distance_from_edge, screw_center_distance_from_edge);
        ScrewHole(screw_center_distance_from_edge, fan_size - screw_center_distance_from_edge);
        ScrewHole(fan_size - screw_center_distance_from_edge, screw_center_distance_from_edge);
        ScrewHole(fan_size - screw_center_distance_from_edge, fan_size - screw_center_distance_from_edge);
    }
}

module ScrewHole(x, y) {
    translate([x, y, grill_thickness / 2])
    cylinder(r=screw_hole_diameter / 2, h=grill_thickness + 2, center=true);

    if (screw_hole_type == "i") {
        //inset
        translate([x, y, grill_thickness / 2 + screw_support_thickness])
        cylinder(r=screw_hole_radius + 1, h=grill_thickness, center=true);
    }

    if (screw_hole_type == "t") {
        // tapered
        translate([x, y, grill_thickness])
        cylinder(r1=0, r2=screw_hole_radius_wider * 2, h=4, center=true);
    }
}


module rounded_rect(width, height, corner_radius, extrude_height) {
    linear_extrude(extrude_height)
    minkowski() {
        square([width - 2*corner_radius, height - 2*corner_radius], center=true);
        circle(r=corner_radius,$fn=20);
    }
}

difference(){
    PrimeShapeWithScrewHoles();
    translate([(fan_size)/2,(fan_size)/2,0])
    rounded_rect(heater_size, heater_size, (heater_size-heater_straight)/2,grill_thickness );
    // translate([(fan_size-heater_size)/2,(fan_size-heater_size)/2,0])
    
    // cube([heater_size, heater_size, grill_thickness+1]);

    translate([(fan_size-heater_size)/2+tab_offset,(fan_size-heater_size)/2+heater_size,0])
    cube([tab_width,tab_height,tab_offset]);
    translate([(fan_size-heater_size)/2+heater_size-tab_width-tab_offset,0,0])
    cube([tab_width,tab_height,tab_offset]);

}


