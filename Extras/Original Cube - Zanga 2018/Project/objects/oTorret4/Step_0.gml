distance_to_player = distance_to_object(oPlayer);

player_width  = sprite_get_width(oPlayer.sprite_index);
player_height = sprite_get_height(oPlayer.sprite_index);
player_average_size = (player_width + player_width) /2;

if(distance_to_player <= los) && (!collision_line(x, y, oPlayer.x, oPlayer.y, oWall, false, true) 
							   || !collision_line(x, y, oPlayer.x, oPlayer.y, oGhostPlatform1, false, true) 
							   || !collision_line(x, y, oPlayer.x, oPlayer.y, oGhostPlatform2, false, true))
{
	xPointOfInterest = oPlayer.x;
	yPointOfInterest = oPlayer.y;
	
	active = true;
}
else
{
	active = false;
}
ANG = point_direction(x, y, oPlayer.x, oPlayer.y) - image_angle;

if (ANG >= 360)
{
	ANG = ANG mod 360;
}

if (active == true)
{
	if (ANG < (player_average_size / 4) || ANG > (360 - player_average_size / 4))
	{
		can_shoot = true;
	}
	else
	{
		can_shoot = false;
	}
}

pointdir = point_direction(x, y, xPointOfInterest, yPointOfInterest);
image_angle += sin(degtorad(pointdir - image_angle - 90)) * rspeed;