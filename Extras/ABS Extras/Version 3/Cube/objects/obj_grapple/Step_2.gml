/// @description Insert description here
// You can write your code in this editor

if (lighting) {
	size = 128;
	gpu_set_blendmode(bm_subtract);
	surface_set_target(light);
	draw_ellipse_color(x + 16 - size / 2 - camera_get_view_x(view_camera[0]), y + 16  - size / 2 - camera_get_view_y(view_camera[0]), x + 16 + size / 2 - camera_get_view_x(view_camera[0]), y + 16 + size / 2 - camera_get_view_y(view_camera[0]), c_white, c_black, false);
	surface_reset_target();
	gpu_set_blendmode(bm_normal);
}