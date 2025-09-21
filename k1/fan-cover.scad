size=100;
depth=70;

module shape(size) {
    hull()
     {
        translate([0,0,size/4])
        // half-sphere
        difference()
        {
            sphere(d=size,$fn=30);
            translate([0,0,-size/4])
                cube([size,size,size/2],center=true);
        
        }
        cube([size,size,depth],center=true);
    }
}

wall_size=1.2;

difference(){
    shape(size);
    shape(size-wall_size*2);
}



