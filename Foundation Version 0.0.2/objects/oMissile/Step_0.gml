#region Old
////speed = min(speed + 0.5, 10);

//// Distance to player
//dist_player = distance_to_object(obj_player);
//x_sign		= sign(x - obj_player.x);
//y_sign		= sign(y - obj_player.y);

//phy_speed_x = min(phy_speed_x + 0.001 * x_sign, 10 * x_sign);
//phy_speed_y = min(phy_speed_y + 0.001 * y_sign, 10 * y_sign);

//if((homing) && (stillAlive)){
//	var pointdir = point_direction(x, y, obj_player.x, obj_player.y);
//	image_angle += sin(degtorad(pointdir - image_angle)) * rspeed;
//	direction	 = image_angle;
//}
//timer --;

////if(timer <= 0) instance_destroy();
#endregion
#region New
if (instance_exists(obj_player)) {
    direction = scr_angle_rotate(direction, point_direction(x, y, obj_player.x, obj_player.y), 3);
}
speed = min(speed + 0.01, 10);
image_angle = direction;
#endregion