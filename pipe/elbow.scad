// Include the rectangular_frame module
include <pipe.scad>
include <BOSL2/std.scad>;
// TODO: adjust size of incoming
// fix strength of top and bottom of incoming hole

// Define the hole size
incoming_hole_width = 101;
incoming_hole_height = 63;
outgoing_hole_width = 76;
outgoing_hole_height = 66;
outgoing_hole_straight_width = 65;
outgoing_hole_straight_height = 55;
corner_radius = (outgoing_hole_width - outgoing_hole_straight_width) / 2;

margin = 1;
wall_thickness = 2; // Thickness of the rectangle around the hole
overlap_depth = 15;
outgoing_overlap_depth = overlap_depth * 1.1;
// Calculate outer dimensions
incoming_outer_width = margin + incoming_hole_width + 2 * wall_thickness;
incoming_outer_height = margin + incoming_hole_height + 2 * wall_thickness;

outgoing_inner_hole_width = outgoing_hole_width - wall_thickness * 2;
outgoing_inner_hole_height = outgoing_hole_height - wall_thickness * 2;

// opposite = outgoing_hole_height
// adjacent=  incoming_outer_width
degrees = 0;



rotate([degrees, 0, 0])
  union() {

    //incoming rect
    rectangular_frame(incoming_outer_width, incoming_outer_height, wall_thickness, overlap_depth);
    //cube under frame
    translate([0, -wall_thickness, 0])
      cube([incoming_outer_width, wall_thickness, overlap_depth+wall_thickness]);

    // outgoing rect
    translate([(incoming_outer_width) / 2, -margin * 2, overlap_depth + outgoing_hole_height / 2])
      rotate([90, 0, 0])
        difference() {
          rounded_rect(outgoing_hole_width, outgoing_hole_height, corner_radius, outgoing_overlap_depth);
          scale([outgoing_inner_hole_width, outgoing_inner_hole_height, 1])
            cylinder(h = outgoing_overlap_depth, d = 1, $fn = 40);
        }
    difference() {
      // Hull connecting the two openings for smooth water flow
      hull() {
        difference() {
          translate([incoming_outer_width / 2, incoming_outer_height, overlap_depth])
            rotate([90, 0, 0])
              scale([incoming_outer_width, incoming_outer_height / 4, 1])
                cylinder(d = 1, h = 1, $fn = 100);
          translate([0, incoming_outer_height - wall_thickness, overlap_depth - incoming_outer_height / 8])
            cube([incoming_outer_width, wall_thickness, incoming_outer_height / 8]);
        }
        // margin-sized rect for incoming
        translate([0, 0, overlap_depth])
          cube([incoming_outer_width, incoming_outer_height, margin]);


        // Margin-sized rect for outgoing
        translate([(incoming_outer_width - outgoing_hole_width) / 2, -margin, overlap_depth])
          rotate([90, 0, 0])
            cube([outgoing_hole_width, outgoing_hole_height, margin]);
        color("red")
          translate([(incoming_outer_width) / 2, -margin, overlap_depth + outgoing_hole_height])
            rotate([90, 0, 0])
              scale([outgoing_hole_width + wall_thickness * 2, outgoing_hole_height / 4, 1])
                cylinder(d = 1, h = 1, $fn = 100);
      }
      // hole
      hull() {
        difference() {
          translate([incoming_outer_width / 2, incoming_outer_height - wall_thickness, overlap_depth])
            rotate([90, 0, 0])
              scale([incoming_outer_width - wall_thickness, incoming_outer_height / 4 - wall_thickness, 1])
                cylinder(d = 1, h = 1, $fn = 100);
          // subtract rect to halve the cylinder
          translate([0, incoming_outer_height - wall_thickness * 2, overlap_depth - incoming_outer_height / 8])
            cube([incoming_outer_width, wall_thickness, incoming_outer_height / 8]);
        }
        translate([wall_thickness, wall_thickness / 2 + margin / 2, overlap_depth])
          cube([incoming_hole_width + margin * 2, incoming_hole_height + margin, margin]);
        translate([incoming_outer_width / 2, -margin, overlap_depth + outgoing_hole_height / 2])
          rotate([90, 0, 0])
            // diameter is 1, we use scale to  set size...however radio for 1 is 0.5
            scale([outgoing_inner_hole_width, outgoing_inner_hole_height, 1])
              cylinder(h = margin, d = 1, $fn = 40);
      }
    }

  }
nozzle_size=0.4;
gap = nozzle_size/2;
support_od=outgoing_overlap_depth/1.1;
support_left = incoming_hole_width/2-outgoing_hole_straight_width/2+support_od/2 + (outgoing_hole_straight_width-support_od*4)/4;
for (i = [0:3]) {
    translate([support_left + i * outgoing_overlap_depth, -outgoing_overlap_depth + support_od/2 - margin*2, (overlap_depth)/2-gap/2 ])
        tube(od=support_od, wall=nozzle_size, h=(overlap_depth-gap));
}
