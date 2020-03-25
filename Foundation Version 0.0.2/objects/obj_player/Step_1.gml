#region Variable Reset
walk = 0; // set this to zero, it gets set when a player presses a move key
#endregion
#region Simple Timers
if (jump_timer > 0) jump_timer --;
else jump = 0;

if (grab_timer > 0) grab_timer --;
#endregion
#region Ground Detection & Sounds
if(scr_phy_move_collide((-(2 * facing)), 1, 0, obj_wall)){
	switch(ground){
		#region Landing
		case 0:
			ground	   = 1;
			jump_timer = 5; 
			audio_play_sound(landing_sound, 1, 0);
		break;#endregion
	}
}
// Still in the air
else {
	ground	   = 0;
	jump_timer = 5;
}
#endregion
#region Left | Right | Jump
#region Left
if (global.left_held) {
    walk   =  1;
    facing = -1;
	
	// Applying acceleration till reaching maximum speed
    if (phy_speed_x > -max_speed) phy_speed_x -= acc;
	
	// Applying forces for movement
    physics_apply_force(x, y, 0, normal_force);
    if (global.left_pressed) phy_speed_x -= movement_left;
}
#endregion
#region Right
if (global.right_held) {
    walk   = 1;
    facing = 1;
    
	// Applying acceleration till reaching maximum speed
	if (phy_speed_x < max_speed) phy_speed_x += acc;
    
	// Applying forces for movement
	physics_apply_force(x, y, 0, normal_force);
	if (global.right_pressed) phy_speed_x += movement_right;
}
#endregion
#region Jump
if (global.jump_pressed) 
	scr_interact_key();
#endregion
#endregion
#region Friction: Decelaration | Stepping Sounds 
switch(ground){
	#region On Ground
	case 1:
		switch(walk){
			#region No Input (right or left) => Decelarate
			case 0:
				phy_speed_x = phy_speed_x * 0.9;
			break;#endregion
			#region While there is input (right or left) => apply friction and play step sound
			case 1:
				#region Footsteps Sounds
				foot_stepped = scr_footsteps(3, 4, footsteps_sounds);
				foot_stepped = scr_footsteps(7, 7.999999, footsteps_sounds);
				#endregion
				switch(facing) {
					#region Facing Right
					case 1: 
						// Apply friction
						if (phy_speed_x < 0) phy_speed_x = phy_speed_x * 0.9;
						
						// Play step sound according to the state
						switch(state){
							case 0: // Standing (Idle)
							
							break;
							case 1: // Walking
							case 2: // Running
							break;
						}
					break;#endregion
					#region Facing Left
					case -1:
						// Apply friction
						if (phy_speed_x > 0) phy_speed_x = phy_speed_x * 0.9;
						
						// Play step sound according to the state
						switch(state){
							case 0: // Standing (Idle)
							
							break;
							case 1: // Walking
							case 2: // Running
							break;
						}
					break;#endregion
				}
			break;#endregion
		}
	break;#endregion
	#region Off Ground: Air Friction?
	case 0:
		#region Falling Calculation
		if	   (phy_speed_y >=  1) falling =  1; //we can also use phy_linear_velocity_y... meh.
		else if(phy_speed_y ==  0) falling =  0;
		else if(phy_speed_y <= -1) falling = -1;
		#endregion
		#region Falling
		switch(falling){
			#region Flat
			case 0:
			
			break;#endregion
			#region Ascending
			case -1:
				#region Ceiling Detection & Sounds
				if(scr_phy_move_collide((-(2 * facing)), - 1, 0, obj_wall)){
					audio_play_sound(tap_ceiling_snd, 1, 0);
					tap_ceiling = 1;
				}
				else 
					tap_ceiling = 0;
				#endregion
			break;#endregion
			#region Descending
			case 1:
				
			break;#endregion
		}#endregion
	break;#endregion
}
#endregion
// Set sprite based on the flags set before this
sprites_step(); 