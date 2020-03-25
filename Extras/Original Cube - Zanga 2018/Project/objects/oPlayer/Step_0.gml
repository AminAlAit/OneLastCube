// Flags
on_ground = (place_meeting(x, y + 1, oWall));

switch (state) {
	#region Move State
	case "move":
		var dir  = global.right_held - global.left_held;
		h_speed += dir * walk_acceleration;
		
		switch(dir){
			case 0:
				var h_friction = h_friction_ground;
				if(!on_ground)
					h_friction = h_friction_air;
				h_speed = scr_approach(h_speed, 0, h_friction);
			break;
		}
		
		h_speed	 = clamp(h_speed, -walk_speed, walk_speed);
		v_speed += gravity_;
		
		if(global.jump_held && on_ground){
			on_ground		 = 0;
			v_speed_fraction = 0;
			v_speed			 = -jump_speed;
		}
		
		// State Transition
		if(global.mouse_left_pressed) {
			grapple_x			= mouse_x;
			grapple_y			= mouse_y;
			rope_x				= x;
			rope_y				= y;
			//rope_angle_velocity = h_speed * 0.5;
			rope_angle_velocity = 0;
			rope_angle			= point_direction(grapple_x, grapple_y, x, y);
			rope_length			= point_distance(grapple_x, grapple_y, x, y);
			state				= "swing";
			audio_play_sound(soWhip, 10, false);
		}
	break;#endregion
	#region Swing State
	case "swing":
		var _rope_angle_acceleration = rope_acceleration_rate * dcos(rope_angle);
		_rope_angle_acceleration    += (global.right_held - global.left_held) * rope_manual_accelerate_rate;
		
		rope_length					+= (global.down_held  - global.up_held) * rope_lengthing_rate;
		rope_length					 = max(rope_length, min_rope_length);
		rope_length					 = min(rope_length, max_rope_length);
		
		rope_angle_velocity			+= _rope_angle_acceleration;
		rope_angle					+= rope_angle_velocity;
		rope_angle_velocity			*= rope_damping; // slowly reaches a speed of zero if there is no input from the player
		// Rope length should affect rope_angle_velocity: long ropes cause more resistance. short ropes cause less resistance
		//rope_length_percent			 = ((rope_length - min_rope_length) / rope_delta) * 100;
		//rope_angle_velocity			*= (rope_length_percent * max_ratio) / 100;
		
		rope_x						 = grapple_x + lengthdir_x(rope_length, rope_angle);
		rope_y						 = grapple_y + lengthdir_y(rope_length, rope_angle);
		
		h_speed						 = rope_x - x;
		v_speed						 = rope_y - y;
		
		// State Transition
		if (global.jump_pressed) {
			state	= "move";
			v_speed = -jump_speed;
			
		}
	break;#endregion
}
#region FRACTIONING
h_speed			 += h_speed_fraction;
h_speed_fraction  = frac(h_speed);
h_speed			 -= h_speed_fraction;
v_speed			 += v_speed_fraction;
v_speed_fraction  = frac(v_speed);
v_speed			 -= v_speed_fraction;
#endregion
#region Collision
if(place_meeting(x + h_speed, y, oWall)){
	var _h_step		 = sign(h_speed);
	h_speed			 = 0;
	h_speed_fraction = 0;
	
	while(!place_meeting(x + _h_step, y, oWall))
		x += _h_step;
	switch(state){
		case "swing":
			rope_angle			= point_direction(grapple_x, grapple_y, x, y);
			rope_angle_velocity = 0;
		break;
	}
}
x += h_speed;

if(place_meeting(x, y + v_speed, oWall)){
	var _v_step		 = sign(v_speed);
	v_speed			 = 0;
	v_speed_fraction = 0;
	
	while(!place_meeting(x, y + _v_step, oWall))
		y += _v_step;
	switch(state){
		case "swing":
			rope_angle			= point_direction(grapple_x, grapple_y, x, y);
			rope_angle_velocity = 0;
		break;
	}
}
y += v_speed;
#endregion