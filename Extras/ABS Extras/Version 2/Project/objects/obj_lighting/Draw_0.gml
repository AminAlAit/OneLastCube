/// @description Insert description here
// You can write your code in this editor

gpu_set_blendmode(bm_subtract);
draw_surface(light, 0, 0); //camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]));
gpu_set_blendmode(bm_normal);


//draw_text(100, 100, "camera x " + string(cameraX));
//draw_text(100, 200, "camera y " + string(cameraY));

//draw_text(100, 300, "camera view x " + string(camera_get_view_x(view_camera[0])));
//draw_text(100, 400, "camera view y " + string(camera_get_view_y(view_camera[0])));