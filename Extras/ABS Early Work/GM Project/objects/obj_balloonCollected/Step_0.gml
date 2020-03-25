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
if (hspeed != 0)
	hspeed = hspeed - sign(hspeed);
if (vspeed != 0)
	vspeed = vspeed - sign(vspeed);

if (timer % 60 == 0) {
	image_xscale = scale + cos(timer*frequency)*amplitude;
	image_yscale = scale + sin(timer*frequency)*amplitude;
}
else
	timer++;

