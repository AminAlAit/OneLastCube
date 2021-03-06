distance_to_player = distance_to_object(oPlayer);

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

pointdir     = point_direction(x, y, xPointOfInterest, yPointOfInterest);
image_angle += sin(degtorad(pointdir - image_angle - 90)) * rspeed;