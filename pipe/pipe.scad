// Function to create a rectangular frame with Z-height
module rectangular_frame(outer_width, outer_height, frame_width, z_height) {
    // Calculate inner dimensions
    inner_width = outer_width - 2 * frame_width;
    inner_height = outer_height - 2 * frame_width;

    // Extrude the 2D frame into 3D
    linear_extrude(height = z_height) {
        difference() {
            square([outer_width, outer_height]);
            translate([frame_width, frame_width])
                square([inner_width, inner_height]);
        }
    }
}

module rounded_rect(width, height, corner_radius, extrude_height) {
    linear_extrude(extrude_height)
    minkowski() {
        square([width - 2*corner_radius, height - 2*corner_radius], center=true);
        circle(r=corner_radius);
    }
}
    
// Example usage
//rectangular_frame(100, 60, 3, 10); // 100x60mm outer size, 3mm frame width, 5mm Z-height
