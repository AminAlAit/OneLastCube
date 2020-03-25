/// @description Insert description here
// You can write your code in this editor

if (!lighting) {
	lighting = true;
	instance_create_layer(0, 0, "lighting", obj_lighting);
	glow = true;
}
else {
	lighting = false;
	glow = false;
	instance_destroy(obj_lighting);
}