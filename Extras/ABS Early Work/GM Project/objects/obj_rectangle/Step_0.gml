/// @description Insert description here
// You can write your code in this editor

key_left =  (keyboard_check(ord("A")) || keyboard_check(vk_left)) && woke;
key_right = (keyboard_check(ord("D")) || keyboard_check(vk_right)) && woke;
key_down =  (keyboard_check(ord("S")) ||  keyboard_check(vk_down)) && woke;
key_up =    (keyboard_check(ord("W")) || keyboard_check(vk_up)) && woke;
key_jump =  (keyboard_check(ord("W")) ||  keyboard_check(vk_up)) && woke;

grounded = place_meeting(x, y + 1, obj_wall);

// Calculate Movement
var moveHor = (key_right - key_left) * walkSpd;
var moveVer = (key_down - key_up) * walkSpd;
var moveJump = - key_jump * jumpSpd;

hSpd = moveHor;
vSpd += grv;

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
	
