module tablet(){
    module tablet_cm(){
        total_dims = [12.51, 21, 0.8736];
        screen_dims = [11, 17.5];
        color("LightBlue")cube(total_dims, center=true);
        color("Blue")translate([0,0, total_dims[2]/2])linear_extrude(height=0.01)square(screen_dims, center=true);   
    }
    scale([10,10,10])tablet_cm();
}
tablet();