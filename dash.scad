module dash(){
    module dash_cm(){
        total_area_dims = [23, 14.5];
        
        // total dash
        color("LightBlue")translate([0,0,-1])linear_extrude(height=1)square(total_area_dims, center=true);
        
        // screen
        screen_dims = [12, 7.5];
        screen_center = [0.5, 0.5, 0];
        color("Blue")translate(screen_center)linear_extrude(height=.01)square(screen_dims, center=true);
        
        // buttons
        button_height = 0.2;
        
        radio_button_dims = [screen_dims[0], 0.5];
        radio_button_center = screen_center + [0, -((screen_dims[1]/2)+radio_button_dims[1]/2)];
        color("DodgerBlue")translate(radio_button_center)linear_extrude(height=button_height)square(radio_button_dims, center=true);
        
        // cd player
        cd_player_dims = [13, 0.5];
        cd_player_center = screen_center + [0, screen_dims[1]/2 + 1];
        color("DodgerBlue")translate(cd_player_center)linear_extrude(height=button_height)square(cd_player_dims, center=true);
        
        module side_buttons() {
            color("DeepSkyBlue")translate([0,1,0])linear_extrude(height=button_height)square([2,1], center=true);
            color("DeepSkyBlue")translate([0,-1.75/2,0])linear_extrude(height=button_height)square([2,1.75], center=true);
            color("blue")translate([0,-1.75 * 3/2,0])linear_extrude(height=button_height)square([2,1.75], center=true);
            
            color("CornflowerBlue")translate([0,-5.75,0])linear_extrude(height=2)circle(1.25, $fn=50);
            color("DeepSkyBlue")translate([1.5/2,-5.75 - 2.5 + (1.75/2),0])linear_extrude(height=button_height)square([1.5,1.75], center=true);
            color("blue")translate([-1.5/2,-5.75 - 2.5 + (1.75/2),0])linear_extrude(height=button_height)square([1.5,1.75], center=true);
        }
        for(i=[-1,1]) translate(screen_center + [i*(screen_dims[0]/2+2), screen_dims[1]/2, 0])side_buttons();
    }
    scale([10,10,10])dash_cm();
}
dash();