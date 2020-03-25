target = obj_player.id;

/////////////////////// TORRET CODE /////////////////////
if(room != room0)
{
	x = room_width / 2;
	y = room_height / 2 + 15;
}
rocketsNum = 3;
los = 300;
rspeed = 2;
distance_to_player = 10000;
active = false;
can_shoot = false;
ANG = 0;

xPointOfInterest = x + 1;
yPointOfInterest = y;

ammo     = 1;
lenX     = 165;
lenY     = 0;
cool_off = false;
spd      = 1;
//////////////////////////////////////////////////////////