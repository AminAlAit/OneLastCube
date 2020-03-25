// On or Off The Ground
switch(ground){
	#region On The Ground
	case 1:
		switch(jump){
			#region Jump
			case 0:
				phy_speed_y =- jump_1_height;
				audio_play_sound(snd_jump1, 1, 0);
			break;#endregion
			#region Jump with some flip
			case 1:
				phy_speed_y =- jump_2_height;
				flip		= 0.3;
				flip_mode	= 1;
				audio_play_sound(snd_jump2, 1, 0);
			break;#endregion
			#region Jump with good flip
			case 2:
				phy_speed_y =- jump_3_height;
				flip		= 0.3;
				flip_mode	= 2;
				audio_play_sound(snd_jump3, 1, 0);
			break;#endregion
		}
		// 
		if (jump_timer > 0) {
			jump += 1;
			if (jump > 2) jump = 2;
			if (jump == 2)
				if (abs(phy_speed_x) < 3)
				jump = 1;
		}
	break;#endregion
	#region Off The Ground
	case 0:
	if (grab_joint > 0) {
		grab_timer	= 10;
		physics_joint_delete(grab_joint);
		grab_joint	=  0;
		grab_target =  0;
		phy_speed_y	=- 6;
		audio_play_sound(snd_jump1, 1, 0);
	}
	break;#endregion
}

// Sliding or Not Sliding
switch(slide){
	#region Sliding
	case 1:
		phy_speed_y =- 6;
		phy_speed_x =- (4 * facing); 
		facing =- facing;
		flip = 0;
	break;#endregion
	#region Not Sliding
	case 0:
		
	break;#endregion
}

// Grabbing or Not Grabbing Anything
switch(grab_joint){
	#region Not Grabbing
	case 0:
		switch(grab_timer){
		#region Timer = ZERO
		case 0:
			if instance_exists(obj_grabable) {
				grab_target = instance_nearest(x, y, obj_grabable);
				if (grab_target > 0) {
					if (point_distance(phy_position_x, phy_position_y, grab_target.phy_position_x, grab_target.phy_position_y) < grab_distance) {
						grab_x = grab_target.phy_position_x;
						grab_y = grab_target.phy_position_y;
			
						phy_position_x = grab_target.phy_position_x;
						phy_position_y = grab_target.phy_position_y;
			
						audio_play_sound(snd_grab1, 1, 0);
			
						dir = point_direction(phy_position_x, phy_position_y, grab_target.phy_position_x, grab_target.phy_position_y);
						dis = point_distance(phy_position_x, phy_position_y, grab_target.phy_position_x, grab_target.phy_position_y);
						//grab_joint = physics_joint_prismatic_create(self, grab_target, grab_target.phy_position_x, grab_target.phy_position_y, lengthdir_x(1, dir), lengthdir_y(1, dir), -dis, 0, true, 10000, -10, true, false);
						//grab_joint = physics_joint_weld_create(self, grab_target, grab_target.phy_position_x, grab_target.phy_position_y, 90, 10, 1, 0);
						grab_joint = physics_joint_distance_create(self, grab_target, phy_position_x, phy_position_y, grab_target.phy_position_x, grab_target.phy_position_y, 0);
					} else grab_target = 0;
				}
			}
		break;#endregion
		}
	break;#endregion
	#region Grabbing
	case 1:
		
	break;#endregion
}