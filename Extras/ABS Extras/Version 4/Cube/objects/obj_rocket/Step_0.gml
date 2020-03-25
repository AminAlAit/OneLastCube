/// @description Insert description here
// You can write your code in this editor

speed = min(speed + 0.1, rSpd);

if(homing) {
	var pointDir = point_direction(x, y, target.x, target.y);
	image_angle += sin(degtorad(pointDir - image_angle)) * rSpd;
	direction = image_angle;
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