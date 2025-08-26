include <BOSL2/std.scad>

width = 50;
height = 20;
depth = 2;
wall_thickness = 1;
inner_width = width - 2 * wall_thickness;
cuboid([width, height, depth], chamfer = 1.5, trimcorners = false, edges = BOTTOM, anchor = BOTTOM) {
  ymove(wall_thickness)
    position(TOP + FRONT)
      cuboid([inner_width, 3, depth * 2.5], chamfer = depth / 2, anchor = FRONT + BOTTOM, edges = TOP);
  ymove(wall_thickness + 3 + 3)
    position(TOP + FRONT)
      cuboid([inner_width, 3, depth * 2.5], chamfer = depth / 2, anchor = FRONT + BOTTOM, edges = TOP);
}

