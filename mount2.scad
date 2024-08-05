use <dash.scad>
use <monitor.scad>

hinge_radius = 4;

module mount2_base() {
    module _mount() {
        hinge_depth = 20;
        //hinge_radius = 4;
        module arm() {
            for(i=[-1,1]) translate([i*62.5,07.5,plate_depth/2])cube([12.5, 120, plate_depth], center=true);
        }
        arm();
        module hinge_base_top() {
            for(i=[-1,1]) translate([i*103.5,60,hinge_depth/2])cube([12.5, 12.5, hinge_depth], center=true);
        }
        module hinge_inner_top() {
            for(i=[-1,1]) translate([i*103.5,60,hinge_depth/2 + plate_depth/2])rotate([0,90,0])cylinder(hinge_depth+0.1, r=hinge_radius, center=true);
        }
        difference(){
            hinge_base_top();
            hinge_inner_top();
        }
        module hinge_base_bottom() {
            for(i=[-1,1]) translate([i*103.5,-50,hinge_depth/2])cube([12.5, 12.5, hinge_depth], center=true);
        }
        module hinge_inner_bottom() {
            for(i=[-1,1]) translate([i*103.5,-50,hinge_depth/2 + plate_depth/2])rotate([0,90,0])cylinder(hinge_depth+0.1, r=hinge_radius, center=true);
        }
        difference(){
            hinge_base_bottom();
            hinge_inner_bottom();
        }
        
        plate_depth = 05;
        translate([0,-60,plate_depth/2])cube([219, 35, plate_depth], center=true);
        translate([0,60,plate_depth/2])cube([219, 15, plate_depth], center=true);
    }
    difference() {
        translate([0,0,-01])_mount();
        translate([-05,-05,0])dash();
    }
}
mount2_base();

module mount2_top() {
    plate_depth = 05;
    module _mount() {
        translate([-103.5-15-20, 0,plate_depth/2+20])cube([15, 218.44, plate_depth], center=true);
        translate([-103.5-15-27.5, 218.44/2-5, 20])cube([15, 15, 20]);
        translate([-103.5-15-27.5, -1*(218.44/2-5)-15, 20])cube([15, 15, 20]);
        translate([103.5+15+20, 0,plate_depth/2+20])cube([15, 218.44, plate_depth], center=true);
        translate([-1*(-103.5-27.5), 218.44/2-5, 20])cube([15, 15, 20]);
        translate([-1*(-103.5-27.5), -1*(218.44/2-5)-15, 20])cube([15, 15, 20]);
        
        module left_hinge_base() {
            difference() {
                translate([-103.5-15-27.5, -1*(218.44/2-5)-15, 5])cube([15, 15, 15]);
                translate([-103.5-15-27.5+(15/2), -1*(218.44/2-5)-(15/2), 12.5])rotate([0,90,0])cylinder(15+0.1, r=hinge_radius, center=true);
            }
        }
        left_hinge_base();
        translate([0, 110, 0])left_hinge_base();
        module right_hinge_base() {
            difference() {
                translate([-1*(-103.5-27.5), -1*(218.44/2-5)-15, 5])cube([15, 15, 15]);
                translate([-1*(-103.5-27.5-(15/2)), -1*(218.44/2-5)-(15/2), 12.5])rotate([0,90,0])cylinder(15+0.1, r=hinge_radius, center=true);
            }
        }
        right_hinge_base();
        translate([0, 110, 0])right_hinge_base();
    }
    translate([0, 0,plate_depth/2+20])cube([2*(103.5+15+20), 15, plate_depth], center=true);
    difference() {
        _mount();
        rotate([0, 0, 90])translate([0,0,30])monitor();
    }
}
mount2_top();

module arm_lower_left() {
    translate([-130.25, -117.5, 5])cube([20, 75, 15]);
    translate([-130.25, -107.5, 0])cube([20, 50, 15]);
    translate([-146, -111.75, 12.5])rotate([0,90,0])cylinder(h=20, r = hinge_radius-0.25,        centered=true);
    translate([-117.25, -50, 11.5])rotate([0,90,0])cylinder(h=20, r = hinge_radius-0.25,        centered=true);
}
arm_lower_left();


module arm_upper_left() {
    translate([0, 110, 0])arm_lower_left();
}
arm_upper_left();



module arm_lower_right() {
    translate([110.25, -117.5, 5])cube([20, 75, 15]);
    translate([110.25, -107.5, 0])cube([20, 50, 15]);
    translate([126, -111.75, 12.5])rotate([0,90,0])cylinder(h=20, r = hinge_radius-0.25,        centered=true);
    translate([117.25-20, -50, 11.5])rotate([0,90,0])cylinder(h=20, r = hinge_radius-0.25,        centered=true);
}
arm_lower_right();


module arm_upper_right() {
    translate([0, 110, 0])arm_lower_right();
}
arm_upper_right();


