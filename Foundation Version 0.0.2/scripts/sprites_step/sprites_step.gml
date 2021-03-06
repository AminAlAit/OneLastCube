#region Walk / Run / Walk Sprites | Animation Speed
	// standing
	if (abs(phy_speed_x) <= min_walk_speed) {	
		sprite_index = spr_stand;
		state = 0;
	}
	
	// walking
	if (abs(phy_speed_x) > min_walk_speed) {
		sprite_index = spr_walk;
		state = 1;
	}
	
	// Running
	if (abs(phy_speed_x) > max_walk_speed) {
		sprite_index = spr_run;
		state = 2;
	}
#endregion
#region Jump Sprite | Animation Speed
switch(ground){
	case 0:
	    sprite_index = spr_jump;
		image_speed  = 1;
	
	    if (phy_speed_y < -4) image_speed = 0;
	    if (phy_speed_y > -2) image_speed = 1;
	    if (phy_speed_y >  2) image_speed = 2;
	break;
	default:
		image_speed = -1;
	break;
}
#endregion
#region Sprite animation speed adjusting in accordance to phy_speed_x
	switch(walk){
	case 0:
		image_speed = 1;
	break;
	default:
		image_speed = (phy_speed_x / max_speed);
	break;
}
#endregion
#region Double Jump
if (flip > 0) {
    flip += 0.2;
	switch(flip_mode){
		case 1: 
	        if (flip > 6){ 
				flip	  = 0;
				flip_mode = 0;
			}
	        sprite_index  = spr_flip2;
	        flip		 += 0.3;
	        image_single  = flip;
		break;
		case 2:
	        if (flip > 3){
				flip	  = 0; 
				flip_mode = 0; 
				jump	  = 0;
			}
	        sprite_index = spr_flip1;
	        image_single = flip;
		break;
	}
}
#endregion   
#region Wall Slides | Hanging
slide = 0;
switch(ground){
	case 0:
		switch(facing){
			#region Facing Right
			case 1:
				if physics_test_overlap(x + 1, y - 4, 0, obj_wall) {
		            if (physics_test_overlap(x - 1, y - 4, 0, obj_wall) == false) {
		                sprite_index = spr_slide;
		                image_single = 1;
		                slide = 1;
					}
				}
			break;#endregion
			#region Facing Left
			case -1:
				if physics_test_overlap(x - 1, y - 4, 0, obj_wall) {
		            if (physics_test_overlap(x + 1, y - 4, 0, obj_wall) == false) {
		                sprite_index = spr_slide;
		                image_single = 1;
		                slide = 1;
					}
				}
			break;#endregion
		}
	break;
}

// y drag while sliding
switch(slide){
	case 1:
		if (phy_speed_y > 0.5) phy_speed_y = 0.5; 
	break;
}
    
// hanging sprites 
if (grab_joint > 0) 
	sprite_index = spr_hang; 
#endregion
image_xscale = facing;