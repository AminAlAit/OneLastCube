/// @description Insert description here
// You can write your code in this editor

x = floor(x / 1080) * 1080 + 100;
y = 400;
instance_create_layer(floor(x / 1080) * 1080 + 100, y, "player", obj_cube);
with (obj_grapple)
	selected = false;
instance_destroy();