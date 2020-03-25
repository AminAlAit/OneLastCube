/// @description Insert description here
// You can write your code in this editor

cameraX = 7600; // camera_get_view_width(view_camera[0]) + 100; // add 100 cz shiiiiit
cameraY = 750; // camera_get_view_height(view_camera[0]);

globalvar light;
light = surface_create(cameraX, cameraY);
//depth = -999;

randomize();
count = 0;
r = ceil(random_range(0, 6));

color = c_blue;