module inner() {
  height = 40;
  depth = 70;
  width = 80;
  audiojack_r = 10/2;
  port_depth= 10;
  audiojack_x=25;
  audiojack_y=7;
  cube([width,depth,height]);
  // audio jack
  translate([width-audiojack_r-audiojack_x,depth,audiojack_r+audiojack_y])
  rotate([-90,0,0]) {
    cylinder(port_depth,audiojack_r, audiojack_r, center=false);
  }
  //power jack
  translate([audiojack_x,-port_depth,height])
  rotate([-90,180,0])
  dc_jack();
}

module dc_jack() {
  rubber_r = 11/2;
  rubber_r_depth = 8;
  rubber_depth = 30;
  rubber_back = 15;
  rubber_back_depth = 10;
  terminal_depth = 7;
  terminal_width = 11;
  //female side
  cylinder(rubber_r_depth, rubber_r, rubber_r);

  hull() {
  translate([0,0,rubber_r_depth])
  cylinder(rubber_r_depth, rubber_r, rubber_r);

  translate([-rubber_back/2, -rubber_back/2,rubber_r_depth*3])
  cube([rubber_back, rubber_back, rubber_back_depth]);
  }
  //terminals
  translate([-terminal_width/2, (rubber_back-terminal_width*2)/2,rubber_r_depth*3+rubber_back_depth])
    cube([terminal_width, terminal_width, terminal_depth]);

}

//dc_jack();
inner();
