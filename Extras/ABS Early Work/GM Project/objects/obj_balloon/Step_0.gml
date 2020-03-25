/// @description Insert description here
// You can write your code in this editor

if (count % 30 == 0)
	if (count < 60)
		x -= 1;
	else
		x += 1;
count++;
if(count = 30 * 4)
	count = 0;

if (die && !party) {
	image_xscale = 0.9 * image_xscale;
	image_yscale = 0.9 * image_yscale;
	direction = point_direction(x, y, obj_cube.x, obj_cube.y);
	speed = 20;
}
else {
	image_xscale = scale + cos(timer*frequency)*amplitude;
	image_yscale = scale + sin(timer*frequency)*amplitude;
}
timer++;

