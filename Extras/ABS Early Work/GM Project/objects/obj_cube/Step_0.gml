/// @description Insert description here
// You can write your code in this editor

key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
key_down = keyboard_check(vk_down) || keyboard_check(ord("S"));
key_up = keyboard_check(vk_up) || keyboard_check(ord("W"));
key_jump = keyboard_check(vk_up) || keyboard_check(ord("W"));

grounded = place_meeting(x, y + 1, obj_wall);

// Calculate Movement
var moveHor = (key_right - key_left) * walkSpd;
var moveVer = (key_down - key_up) * walkSpd;
var moveJump = - key_jump * jumpSpd;

hSpd = moveHor;
vSpd += grv;

switch (state)
{

	case playerState.normal:
	{	
		// Horizonatal Movement
		if(place_meeting(x + hSpd, y, obj_wall)) {
			while (!place_meeting(x + sign(hSpd), y, obj_wall)) {
				x += sign(hSpd);
				hSpd--;
			}
			hSpd = 0;
		}
		else
			x += hSpd;

		// Vertical Movement
		if (grounded && key_jump)
			vSpd = moveJump;
		if (place_meeting(x, y + vSpd, obj_wall)) {
			while (!place_meeting(x, y + sign(vSpd), obj_wall)) {
				y += sign(vSpd);
				vSpd--;
			}
			vSpd = 0;
		}
		else
			y += vSpd;
		
		if (mouse_check_button(mb_left) || mouse_check_button(mb_right)) {
			var _dir = point_direction(x, y, mouse_x, mouse_y);
			var _dis = min(ropeExtent, point_distance(x, y, mouse_x, mouse_y));
			
			grappleX = x + lengthdir_x(_dis, _dir);
			grappleY = y + lengthdir_y(_dis, _dir);
			ropeX = x;
			ropeY = y;
			ropeAngleVelocity = 0;
			ropeAngle = point_direction(grappleX, grappleY, x, y);
			ropeLength = point_distance(grappleX, grappleY, x, y);
			
			if (_pressedX == noone) {
				_pressedWall = instance_position(grappleX, grappleY, obj_wall);
				_pressedGrapple = instance_position(grappleX, grappleY, obj_grapple);
			}
			if (_pressedX == noone && _pressedY == noone && (_pressedWall != noone || _pressedGrapple != noone)) {
				_pressedX = grappleX;
				_pressedY = grappleY;
			}
			if (_pressedWall != noone) {
				ropeColor = ropeDraw.illegalRed;
				with (_pressedWall) {
					selected = true;
				}
			}
			else {
				if(_pressedGrapple != noone) {
					ropeColor = ropeDraw.spooderSwingGreen;
					with (_pressedGrapple) {
						selected = true;
					}
					state = playerState.swing;
					_pressedX = noone;
					_pressedY = noone;
				}
				
			}
		}
		
		if (mouse_check_button_released(mb_left) || mouse_check_button_released(mb_right)) {
			_pressedWall = instance_position(_pressedX, _pressedY, obj_wall);
			_pressedGrapple = instance_position(_pressedX, _pressedY, obj_grapple);
			ropeColor = ropeDraw.none;
			_pressedX = noone;
			_pressedY = noone;
			// make script (1)
			/*
			if (_pressedWall != noone) {
				with (_pressedWall) {
					selected = false;
				}
			}
			if (_pressedGrapple != noone) {
				with (_pressedGrapple) {
					selected = false;
				}
			}
			*/
			with (obj_wall)
				selected = false;
				
			with (obj_grapple)
				selected = false;
		}
			
	} break;
	
	case playerState.swing:
	{
		
		_pressedWall = instance_position(grappleX, grappleY, obj_wall); // maybe make permanent var
		_pressedGrapple = instance_position(grappleX, grappleY, obj_grapple); // maybe make permanent var
			
		var _ropeAngleAcceleration = -0.2 * dcos(ropeAngle);
		_ropeAngleAcceleration += (key_right - key_left) * 0.1;
		ropeAngleVelocity += _ropeAngleAcceleration;
		ropeAngle += ropeAngleVelocity;
		ropeAngleVelocity *= 0.99;

		ropeX = grappleX + lengthdir_x(ropeLength, ropeAngle);
		ropeY = grappleY + lengthdir_y(ropeLength, ropeAngle);
		if (mouse_check_button(mb_left)) {
			hSpd = ropeX - x;
			vSpd = ropeY - y;
		}
		if (mouse_check_button(mb_right) && count < 20) { // spooderman stop before completly reaching && abs(grappleX - x) > 10 && abs(grappleY - y) > 10 ) {
			hSpd = (grappleX - x) * 0.1;
			vSpd = (grappleY - y) * 0.1;
			count++;
		}
		else if (mouse_check_button(mb_right)) {
			hSpd = 0;
			vSpd = 2;
		}
		
		if (mouse_check_button_released(mb_left) || mouse_check_button_released(mb_right)) {
			state = playerState.normal;
			ropeColor = ropeDraw.none;
			vSpd = 0;
			grv = 0.3;
			count = 0;
			// make script (1)
			/*
			if (_pressedWall != noone) {
				with (_pressedWall) {
					selected = false;
				}
			}
			if (_pressedGrapple != noone) {
				with (_pressedGrapple) {
					selected = false;
				}
			}
			*/
			with (obj_wall)
				selected = false;
				
			with (obj_grapple)
				selected = false;
		}
		// Horizonatal Movement
		if(place_meeting(x + hSpd, y, obj_wall)) {
			while (!place_meeting(x + sign(hSpd), y, obj_wall)) {
				x += sign(hSpd);
				hSpd--;
			}
			hSpd = 0;
			ropeAngle = point_direction(grappleX, grappleY, x, y);
			ropeAngleVelocity = 0;
		}
		else
			x += hSpd;

		// Vertical Movement
		if (grounded && key_jump)
			vSpd = moveJump;
		if (place_meeting(x, y + vSpd, obj_wall)) {
			while (!place_meeting(x, y + sign(vSpd), obj_wall)) {
				y += sign(vSpd);
				vSpd--;
			}
			vSpd = 0;
			ropeAngle = point_direction(grappleX, grappleY, x, y);
			ropeAngleVelocity = 0;
		}
		else
			y += vSpd;
	} break;
}

