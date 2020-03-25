distance_to_player = distance_to_object(oPlayer);

player_width  = sprite_get_width(oPlayer.sprite_index);
player_height = sprite_get_height(oPlayer.sprite_index);
player_average_size = (player_width + player_width) /2;

if(distance_to_player <= los) && (!collision_line(x, y, oPlayer.x, oPlayer.y, oWall, false, true))
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
		image_speed = spd;
	}
	else
	{
		can_shoot = false;
	}
}
else
{
	can_shoot = false;
}

if(can_shoot == false)
{
	if(image_speed  > 0)
	{
		image_speed -= 0.2;	
	}
}

pointdir = point_direction(x, y, xPointOfInterest, yPointOfInterest);
image_angle += sin(degtorad(pointdir - image_angle - 90)) * rspeed;


if ((can_shoot == true) && (ammo > 0) && (cool_off = false))
{
	ammo--;
	var bullet_id;
	bullet_id = instance_create_layer(x + lengthdir_x(lenX, image_angle) - lengthdir_y(lenY, image_angle),
						y + lengthdir_y(lenX, image_angle) + lengthdir_x(lenY, image_angle), "Bullets", oBullet)
						
	bullet_id.direction = image_angle + 90;
	bullet_id.image_angle = bullet_id.direction;
	bullet_id.speed = 25;
	cool_off = true;
	alarm[0] = room_speed * 0.2;
}