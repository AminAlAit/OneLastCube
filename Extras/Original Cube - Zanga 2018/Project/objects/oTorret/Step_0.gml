distance_to_player = distance_to_object(oPlayer);

if(distance_to_player <= los)
{
	pointdir = point_direction(x, y, oPlayer.x, oPlayer.y);
	image_angle += sin(degtorad(pointdir - image_angle - 90)) * rspeed;
	
	active = true;
}
else
{
	active = false;
}