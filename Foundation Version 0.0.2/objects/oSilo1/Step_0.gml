//with (obj_saucer)
//{
//	if(selected)
//	{
//		other.target = id;
//	}
//}

/////////////////////////////// TORRET CODE //////////////////
distance_to_player = distance_to_object(obj_player);

//player_width  = sprite_get_width(obj_player.sprite_index);
//player_height = sprite_get_height(obj_player.sprite_index);
//player_average_size = (player_width + player_width) /2;

if(distance_to_player <= los) && rocketsNum >0//&& (!collision_line(x, y, obj_player.x, obj_player.y, oWall, false, true))
{
	///////////////////////////////////////////////////
	var i = instance_create_layer(x, y, "Rockets", oMissile);
	i.image_angle = image_angle;
	i.direction = i.image_angle;
	i.target = target;
	rocketsNum --;
	///////////////////////////////////////////////////
	xPointOfInterest = obj_player.x;
	yPointOfInterest = obj_player.y;
	
	active = true;
}
else
{
	active = false;
}
//ANG = point_direction(x, y, obj_player.x, obj_player.y) - image_angle;

if (ANG >= 360)
{
	ANG = ANG mod 360;
}

//if (active == true)
//{
//	if (ANG < (player_average_size / 4) || ANG > (360 - player_average_size / 4))
//	{
//		can_shoot = true;
//		image_speed = spd;
//	}
//	else
//	{
//		can_shoot = false;
//	}
//}
//else
//{
//	can_shoot = false;
//}

if(can_shoot == false)
{
	if(image_speed  > 0)
	{
		image_speed -= 0.2;	
	}
}

pointdir = point_direction(x, y, xPointOfInterest, yPointOfInterest);
image_angle += sin(degtorad(pointdir - image_angle)) * rspeed;


if ((can_shoot == true) && (ammo > 0) && (cool_off = false))
{
	///////////////////////////////////////////////////
	var i = instance_create_layer(x, y, "Bullets", oMissile);
	i.image_angle = image_angle;
	i.direction = i.image_angle;
	i.target = target;
	///////////////////////////////////////////////////
	ammo--;
	var bullet_id;
	bullet_id = instance_create_layer(x + lengthdir_x(lenX, image_angle) - lengthdir_y(lenY, image_angle),
									  y + lengthdir_y(lenX, image_angle) + lengthdir_x(lenY, image_angle), 
									 "Bullets", oMissile)
						
	bullet_id.direction = image_angle + 90;
	bullet_id.image_angle = bullet_id.direction;
	bullet_id.speed = 25;
	cool_off = true;
	alarm[0] = room_speed * 0.2;
}
//////////////////////////////////////////////////////////