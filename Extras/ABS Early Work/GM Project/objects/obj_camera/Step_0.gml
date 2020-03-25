/// @description Insert description here
// You can write your code in this editor

x += (xTo - x) / 25;
y += (yTo - y) / 25;

if (follow != noone) {
	xTo = floor(follow.x / 1080) * 1080 + 1080 / 2;
	yTo = 720 / 2;
}

// wooo var vm = matrix_build_lookat(x, y, -10, xTo, yTo, 0, 0, 1, 0);
var vm = matrix_build_lookat(x, y, -10, x, y, 0, 0, 1, 0);

camera_set_view_mat(camera, vm);