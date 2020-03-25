/// @description Insert description here
// You can write your code in this editor

speed = min(speed + 0.1, rSpd);

if(homing) {
	var pointDir = point_direction(x, y, target.x, target.y);
	image_angle += sin(degtorad(pointDir - image_angle)) * rSpd;
	direction = image_angle;
}