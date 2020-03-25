/// @description Update Camera
//Update Destination
//if(instance_exists(follow))
//{
//	xTo = follow.x;
//	yTo = follow.y;
//}

//// update object position
//x += (xTo - x) / 25;
//y += (yTo - y) / 25;

////Update camera view
//camera_set_view_pos(cam, x - view_w_half, y - view_h_half);

x += (xTo - x)/25;
y += (yTo - y)/25;

if( follow != noone)
{
	xTo = follow.x;
	yTo = follow.y;
	
	if((follow).object_index == oDead)
	{
		x = xTo;
		y = yTo;
	}
}
/////////////SCREEN SHAKE
x += random_range(-shake_remain, shake_remain);
y += random_range(-shake_remain, shake_remain);
shake_remain = max(0, shake_remain-((1/shake_length)*shake_magnitude));

var vm = matrix_build_lookat(x, y, -10, x, y, 0, 0, 1, 0);
camera_set_view_mat(camera, vm);

