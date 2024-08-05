use <dash.scad>
use <monitor.scad>
use <mount2.scad>

mount2_base();
mount2_top();
arm_lower_left();
arm_upper_left();
arm_lower_right();
arm_upper_right();
translate([-05,-05,0])dash();
rotate([0, 0, 90])translate([0,0,30])monitor();