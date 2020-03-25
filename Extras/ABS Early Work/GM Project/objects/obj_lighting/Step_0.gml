/// @description Insert description here
// You can write your code in this editor

count++;

randomize();
if (count % 10 == 0)
	r = ceil(random_range(0, 6));;
if (r == 1)
	color = c_ltgray;
if (r == 2)
	color = c_ltgray;
if (r == 3)
	color = c_ltgray;
if (r == 4)
	color = c_gray;
if (r == 5)
	color = c_gray;
if (r == 6)
	color = c_white;


surface_set_target(light);
draw_set_color(color); // make color lighter for darker effect
draw_rectangle(0, 0, cameraX, cameraY, false);
surface_reset_target();



/*
o_player:
end step:
size = 360;
gpu_set_blendmode(bm_subtract);
surface_set_target(light);
draw_ellipse_color(x-size/2-camera_get_view_x(view_camera[0]),y-size/2-camera_get_view_y(view_camera[0]),x+size/2-camera_get_view_x(view_camera[0]),y+size/2-camera_get_view_y(view_camera[0]),c_white,c_black,false);
surface_reset_target();
gpu_set_blendmode(bm_normal);
*/