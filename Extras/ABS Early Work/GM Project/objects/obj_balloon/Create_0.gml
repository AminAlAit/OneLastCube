/// @description Insert description here
// You can write your code in this editor
count = 0;
timer = 0;
deathCounter = 0.0;
party = false;
die = false;
randomize();

frequency = random_range(0.01, 0.06);
amplitude = random_range(0.02, 0.1);
scale = random_range(1, 1.5);

red = 0.0;
green = 0.0;
blue = 0.0;

randomize();
r = random_range(1.0, 12.0);
maxR = 13.0;// 15.0;
minR = 7.0;// 1.0;
k = random_range(1.0, 12.0);
if (r <= 3.0)
	red = 30.0;
else
	if (r <= 7.0)
		green = 30.0;
	else
		blue = 30.0;
if (r <= 2.0 || r >= 8.0)
	party = true;