use <dash.scad>
use <tablet.scad>

module mount(){
    module _mount(){
        arm_depth = 20;
        module arm() {
            for(i=[-1,1]) translate([i*62.5,07.5,arm_depth/2])cube([12.5, 120, arm_depth], center=true);
        }
        difference(){
            arm();
            for(i=[-1,1]) translate([i*57.5,05,arm_depth/60-01])cube([5, 95, arm_depth/3], center=true);
        }
        
        plate_depth = 05;
        translate([0,-60,plate_depth/2])cube([137.5, 35, plate_depth], center=true);
        translate([0,60,plate_depth/2])cube([137.5, 15, plate_depth], center=true);
    }
    difference() {
        translate([0,0,-01])_mount();
        translate([-05,-05,0])dash();
        translate([0,67.5,13])tablet();
    }
}
mount();