/// @description Insert description here
// You can write your code in this editor
/*
speed = min(speed + 0.5, 10);


var pointDir = point_direction(x, y, target.x, target.y);
image_angle += sin(degtorad(pointDir - image_angle)) * rSpd;
direction = image_angle;
*/
// Orbital motion
Angle += Speed;
if(Angle >= 360) Angle -= 360;

// Update position
x = lengthdir_x(Orbit, Angle) + Center_X;
y = lengthdir_y(Orbit, Angle) + Center_Y;

var pointDir = point_direction(x, y, Center_X, Center_Y);
image_angle += sin(degtorad(image_angle - pointDir)) * Speed ;
direction = image_angle;

if (Speed >= 15 && flagFirstTime) {
	flagFirstTime = false;
	audio_play_sound(snd_MissleLaunch, 0, 0);
	sprite_index = spr_rocketFIRE;
	image_xscale = -1
}

//Check if rocket can cut the rope by seeing if xy or rocket intercept with rope
Rslope = 0;
Ryint  = 0;
with(obj_cube){
	other.Rslope = slope;
	other.Ryint  = yint;
}
if((y - Rslope*x + Ryint) == 0){
	with(obj_grapple)
		selected = false;
	with(obj_cube)
		state = playerState.normal;
}