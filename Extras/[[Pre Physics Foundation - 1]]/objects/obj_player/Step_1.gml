// Check if you were onGround previous frame
var temp = on_ground;
on_ground = scr_on_ground();

// Squash sprite during jump landing
if (!temp && on_ground) {
    if (v >= 0) {        
        y_scale = 0.66;
        x_scale = 1.33;  
    }
}

// Update relative collision
c_left  = place_meeting(x - 1, y, obj_block); 
c_right = place_meeting(x + 1, y, obj_block); 
c_above = place_meeting(x, y - 1, obj_par_solid);

