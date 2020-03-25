/// @description Insert description here
// You can write your code in this editor

sleep = room_speed * 1;
homing = false;
rSpd = 4;
target = obj_cube;
lazer = false;
flagFirstTime = true;


Orbit = 150; // Orbit distance
Angle = 0; // Current orbital angle
Speed = 5; // Orbital speed
Center_X = room_width / 2; // x of orbital center
Center_Y = room_height / 2; // y of orbital center

image_xscale = -1