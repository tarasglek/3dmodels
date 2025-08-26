include <BOSL2/std.scad>

width = 50;
height = 20;
depth = 2;
wall_thickness = 1.5;
inner_width = width - 2 * wall_thickness;
first_insert_thickness=2;
cuboid([width, height, depth], chamfer = 1.5, trimcorners = false, edges = BOTTOM, anchor = BOTTOM) {
  ymove(1+wall_thickness+1)
    position(TOP + FRONT)
      cuboid([inner_width, first_insert_thickness, depth * 2.5], chamfer = depth / 2, anchor = FRONT + BOTTOM, edges = TOP);
  ymove(1+wall_thickness + first_insert_thickness + 4.5)
    position(TOP + FRONT)
      cuboid([inner_width, 3, depth * 2.5], chamfer = depth / 2, anchor = FRONT + BOTTOM, edges = TOP);
}

