if (grab_joint > 0){
	grab_timer	= 10;
	physics_joint_delete(grab_joint);
	grab_joint	= 0;
	grab_target = 0;
	scr_auido_play_sounds(jumping_sounds, 1, 0);
}
else {
	switch(slide){
		#region NotSliding
		case 0:
			switch(kick_mode){
				#region 0
				case 0:
					switch(kick){
						#region No Kick
						case 0:
							phy_speed_x += (4 * facing);
				            kick_mode = 1;
				            kick	  = 0.3;
				            audio_play_sound(snd_slash1, 1, 0);
						break;#endregion
						#region Kick
						case 1:
						
						break;#endregion
					}
				break;#endregion
				#region 1
				case 1:
					
				break;#endregion
			}
		break;#endregion
		#region Sliding
		case 1:
			phy_speed_x -= (2 * facing);
			slide = 0;
		break;#endregion
	}
}