speed = min(speed + 0.5, 10);

if((homing) && (stillAlive)){
	var pointdir = point_direction(x, y, oPlayer.x, oPlayer.y);
	image_angle += sin(degtorad(pointdir - image_angle)) * rspeed;
	direction	 = image_angle;
}
timer --;

if(timer <= 0) instance_destroy();