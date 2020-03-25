#region Make Interactor Follow obj_player
//int.phy_position_x = phy_position_x
//int.phy_position_y = phy_position_y 
//int.phy_speed_x	   = phy_speed_x
//int.phy_speed_y	   = phy_speed_y
#endregion
#region Variable Reset
walk = 0; // set this to zero, it gets set when a player presses a move key
#endregion
#region Simple Timers
if (jump_timer > 0) jump_timer --;
else jump = 0;

if (grab_timer > 0) grab_timer --;
#endregion
#region Sounds & Ground Detection: Landing
if (physics_test_overlap(x - (2 * facing), y + 1, 0, obj_wall)) {
	switch(ground){
		#region Landing
		case 0:
			ground = 1;
	        jump_timer = 5; 
	        //audio_play_sound(landing_sound, 1, 0);
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
/// Left
if (global.left_held) {
    walk   =  1;
    facing =- 1;
	
	// Applying acceleration till reaching maximum speed
    if (phy_speed_x > -max_speed) phy_speed_x -= acc;
	
	// Applying forces for movement
    physics_apply_force(x, y, 0, -5);
    if (global.left_pressed) phy_speed_x -= 1;
}
/// Right
if (global.right_held) {
    walk   = 1;
    facing = 1;
    
	// Applying acceleration till reaching maximum speed
	if (phy_speed_x < max_speed) phy_speed_x += acc;
    
	// Applying forces for movement
	physics_apply_force(x, y, 0, -5)
	if (global.right_pressed) phy_speed_x += 1;
}
/// Jump
if (global.jump_pressed) action_key();
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
								if(scr_animation_hit_frame(3) || scr_animation_hit_frame(7)) {
									audio_play_sound(walking_sound, 1, 0);
									//if(alarm[2] < 0) alarm[2] = 30;
								}
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
								if(scr_animation_hit_frame(3) || scr_animation_hit_frame(7)){
									audio_play_sound(walking_sound, 1, 0);
									if(alarm[0] < 0) alarm[0] = 30;
								}
								//if(alarm[1] < 0) alarm[1] = 30;
							break;
						}
					break;#endregion
				}
			break;#endregion
		}
	break;#endregion
	#region Off Ground: Air Friction?
	case 0:
	
	break;#endregion
}
#endregion
// Set sprite based on the flags set before this
sprites_step(); 