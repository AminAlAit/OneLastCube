/// @description Insert description here
// You can write your code in this editor

if (glow) {
	size = 64;
	gpu_set_blendmode(bm_subtract);
	surface_set_target(light);
	draw_ellipse_color(x - size / 2 - camera_get_view_x(view_camera[0]), y - size / 2 - camera_get_view_y(view_camera[0]), x + size / 2 - camera_get_view_x(view_camera[0]), y + size / 2 - camera_get_view_y(view_camera[0]), c_white, c_black, false);
	surface_reset_target();
	gpu_set_blendmode(bm_normal);
	
	// draw cursor
	var _dirTmp = point_direction(x, y, mouse_x, mouse_y);
	var _disTmp = min(ropeExtent, point_distance(x, y, mouse_x, mouse_y));
	var _XTmp = x + lengthdir_x(_disTmp, _dirTmp);
	var _YTmp = y + lengthdir_y(_disTmp, _dirTmp);

	gpu_set_blendmode(bm_subtract);
	surface_set_target(light);
	draw_circle_color(_XTmp, _YTmp, 2, c_white, c_white, 2);
	draw_circle_color(mouse_x, mouse_y, 5, c_white, c_white, 5);
	surface_reset_target();
	gpu_set_blendmode(bm_normal);
}

if (glow && ropeColor = ropeDraw.spooderSwingGreen) {
	//sizeX = abs(grappleX - x);
	//sizeY = abs(grappleY - y)
	size = 16;
	gpu_set_blendmode(bm_subtract);
	surface_set_target(light);
	//draw_line_width_color(x * 3 / 4 + grappleX / 4, y * 3 / 4 + grappleY / 4, x / 4 + grappleX * 3 / 4, y / 4 + grappleY * 3 / 4, 8, c_white, c_black);
	draw_line_width_color(x, y, grappleX, grappleY, 4, c_white, c_black);
	draw_line_width_color(x , y, x / 4 + grappleX * 3 / 4, y / 4 + grappleY * 3 / 4, 8, c_white, c_black);
	//draw_ellipse_color((x + grappleX) / 2 - size / 2 - camera_get_view_x(view_camera[0]), (y + grappleY) / 2 - size / 2 - camera_get_view_y(view_camera[0]), (x + grappleX) / 2  + size / 2 - camera_get_view_x(view_camera[0]), (y + grappleY) / 2 + size / 2 - camera_get_view_y(view_camera[0]), c_white, c_black, false);
	surface_reset_target();
	gpu_set_blendmode(bm_normal);
}


if (y > 1000) {
	x = floor(x / 1080) * 1080 + 100;
	y = 400;
}