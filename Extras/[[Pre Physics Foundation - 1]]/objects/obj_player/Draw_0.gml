// Draw sprite depending on player state
switch (state) {
    case IDLE: 
        image_speed = 0.1;
        sprite_index = spr_player_idle;
    break;
    
    case RUN: 
        image_speed = 0.5; 
        sprite_index = spr_player_run;
    break;
    
    case JUMP:
        // Mid jump   
        if (!(place_meeting(x, y + 2, obj_par_solid) && v != 0) && v >= -1.0 && v <= 1.0) {  
            sprite_index = spr_player_jump_mid;  
       } else { 
            // Rise + fall
            if (v <= 0)  
                sprite_index = spr_player_jump_up;  
            else
                sprite_index = spr_player_jump_down;
        }
         
        // When against a wall   
        if (c_right || c_left)
            sprite_index = spr_player_slide;  
    break;
}

//// for creating the tail, trail effect
// Draw particle trail
//TrailDraw(trail,w1,w2,c1,c2,image_alpha, image_alpha);

// Draw player
if (on_ground)
    draw_sprite_ext(sprite_index, image_index, x, y + (16 - 16 * y_scale) * 0.25, facing * x_scale, y_scale, 0, c_white, image_alpha);    
else
    draw_sprite_ext(sprite_index, image_index, x, y, facing * x_scale, y_scale, 0, c_white, image_alpha);

