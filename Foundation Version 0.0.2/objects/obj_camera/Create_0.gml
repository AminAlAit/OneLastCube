enum cammode {
	follow_object,
	follow_mouse_drag,
	follow_mouse_border,
	follow_mouse_peek,
	move_to_target,
	move_to_follow_object
}

mode	  = cammode.follow_object;
following = obj_player;
boundless = 0;

global.view_w = camera_get_view_width(view_camera[0]);
global.view_h = camera_get_view_height(view_camera[0]);

global.cx = camera_get_view_x(view_camera[0]);
global.cy = camera_get_view_y(view_camera[0]);

once = 1;