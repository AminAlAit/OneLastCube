/////////////////////////////////////////////////////////////////////////////////////////////////////////
//// This is a mixbreed code between one from Heartbeast video about Tile Collisions (~40 mins)        //
//// and another from Shaun Spalding about Rope Swing and has Worm swinging from a rope as a thumbnail //
//// all that is left to do is to deal with magic numbers and optimize functions                       //
//// and solve the mystery behind the variable "canjump"                                               //
/////////////////////////////////////////////////////////////////////////////////////////////////////////
///// @description Movement & Tile Collision Logic
//// Get the input
//var key_jump = (keyboard_check_pressed(vk_space));
//var x_input = (((keyboard_check(vk_right)) || (keyboard_check(ord("D")))) - ((keyboard_check(vk_left))  || (keyboard_check(ord("A")))));
//var y_input = (((keyboard_check(vk_down))  || (keyboard_check(ord("S")))) - ((keyboard_check(vk_up))    || (keyboard_check(ord("W")))));

//var on_ground = tile_collide_at_points(collision_tile_map_id_, [bbox_left, bbox_bottom], [bbox_right-1, bbox_bottom]);

//// Vector variables
//var vector2_x = 0;
//var vector2_y = 1;

////// Control jump height
////if velocity_[vector2_y] <= maxJumpHeight {
////	hfriction            = hFrictionAir;
////	velocity_[vector2_y] = maxJumpHeight;
////}

//switch (state)
//{
//	case pState.normal:
//	{
//		velocity_[vector2_x] += x_input * acceleration_;
		
//		// If No Movement 
//		if(x_input == 0){
//			var hfriction        = hFrictionGround;
//			velocity_[vector2_x] = Approach(velocity_[vector2_x], 0, hfriction);
//		}
//		// Maxing Horizontal movement
//		velocity_[vector2_x] = clamp(velocity_[vector2_x]+x_input, -max_velocity_[vector2_x], max_velocity_[vector2_x]);
	
//		// Gravity
//		velocity_[vector2_y] += gravity_;
		
//		canjump = -1;
//		if(on_ground){
//			canjump = 10;
//			if (key_jump) && (canjump > 0){
//				velocity_[vector2_y] = -jump_speed_;
//				vspFraction          = 0;
//				canjump              = 0;
//			}
//		} 
//		else {
//			// Control jump height
//			if (key_jump) && velocity_[vector2_y] <= maxJumpHeight {
//				hfriction            = hFrictionAir;
//				velocity_[vector2_y] = maxJumpHeight;
//			}
//		}
	
//		if(mouse_check_button_pressed(mb_left))
//		{
//			grappleX          = mouse_x;
//			grappleY          = mouse_y;
//			ropeX             = x;
//			ropeY             = y;
//			ropeAngleVelocity = 0;
//			ropeAngle         = point_direction(grappleX, grappleY, x, y);
//			ropeLength        = point_distance(grappleX, grappleY, x, y);
//			state             = pState.swing;
//			audio_play_sound(soWhip, 10, false);
//		}
//	}break;
//	/////////////////////////////SECOND STATE///////////////////////////////////
//	case pState.swing:
//	{
//		var _ropeAngleAcceleration = - 0.2 * dcos(ropeAngle);
//		_ropeAngleAcceleration    += x_input * 0.08;
//		ropeLength                += y_input * 2;
//		ropeLength                 = max(ropeLength, 5);
		
//		ropeAngleVelocity         += _ropeAngleAcceleration;
//		ropeAngle                 += ropeAngleVelocity;
//		ropeAngleVelocity         *= 0.99;
		
//		ropeX                      = grappleX + lengthdir_x(ropeLength, ropeAngle);
//		ropeY                      = grappleY + lengthdir_y(ropeLength, ropeAngle);
		
//		velocity_[vector2_x]       = ropeX - x;
//		velocity_[vector2_y]       = ropeY - y;
		
//		canjump = 10;
//		if (key_jump) && (canjump > 0)
//		{
//			velocity_[vector2_y] = -jump_speed_;
//			vspFraction          = 0;
//			canjump              = 0;
//			state                = pState.normal;
//			vspFraction          = 0;
//		}
//	}
//	break;
//}

////////////////////////////// FRACTIONING ///////////////////////////////////////////////
//// Previous script: Fractioning - Combined with velocity_[vector2_x/y] 
//// (Which previously was: dir = key_right + key_left)
//// (EDITED: Added velocity_[vector2_x] instead of hsp)
//velocity_[vector2_x] += hspFraction;
//hspFraction           = frac(velocity_[vector2_x]);
//velocity_[vector2_x] -= hspFraction;
//// Previous Script: Vertical Fraction (EDITED: Added velocity_[vector2_y] instead of vsp)
//velocity_[vector2_y] += vspFraction;
//vspFraction           = frac(velocity_[vector2_y]);
//velocity_[vector2_y] -= vspFraction;
//////////////////////////////////////////////////////////////////////////////////////////

//// Move and contact tiles
//move_and_contact_tiles(collision_tile_map_id_, 16, velocity_);

// A NEW START
/// @description Movement logic
// Get the input
var x_input = (keyboard_check(vk_right) - keyboard_check(vk_left)) * acceleration_;

// Vector variables
var vector2_x = 0;
var vector2_y = 1;

// Horizontal movement
velocity_[vector2_x] = clamp(velocity_[vector2_x]+x_input, -max_velocity_[vector2_x], max_velocity_[vector2_x]);

// Friction
if x_input == 0 {
	velocity_[vector2_x] = lerp(velocity_[vector2_x], 0, .2);
}

// Gravity
//velocity_[vector2_y] += gravity_;

// Move and contact tiles
//move_and_contact_tiles(collision_tile_map_id_, 64, velocity_);

// Jumping
//var on_ground = tile_collide_at_points(collision_tile_map_id_, [bbox_left, bbox_bottom], [bbox_right-1, bbox_bottom]);
if on_ground {
	// Jumping
	if keyboard_check_pressed(vk_up) {
		velocity_[vector2_y] = -jump_speed_;
	}
} else {
	// Control jump height
	if keyboard_check_released(vk_up) && velocity_[vector2_y] <= -(jump_speed_/3) {
		velocity_[vector2_y] = -(jump_speed_/3);
	}
}

