module monitor(){
    module monitor_cm(){
        total_dims = [21.844, 35.56, 0.9906];
        screen_dims = [total_dims[0]-1, total_dims[1]-1];
        color("LightBlue", 1.0)cube(total_dims, center=true);
        color("blue", 1.0)translate([0,0, total_dims[2]/2])linear_extrude(height=0.01)square(screen_dims, center=true);   
    }
    scale([10,10,10])monitor_cm();
}
monitor();