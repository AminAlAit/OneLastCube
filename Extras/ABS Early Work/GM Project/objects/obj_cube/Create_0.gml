/// @description Insert description here
// You can write your code in this editor

//Global Variables
window_set_cursor(cr_none);
lighting = false;
glow = false;
_pressedX = noone;
_pressedY = noone;
//_pressedWall = noone;
//_pressedGrapple = noone;

// Player Variables
hps = 0; // hit points
vSpd = 0; // vertical speed
hSpd = 0; // horizontal speed
walkSpd = 4; // walk speed
jumpSpd = 8; // jump height
grv = 0.3; // gravity
ropeExtent = 250; // rope length
count = 0;
state = playerState.normal;
ropeColor = ropeDraw.none;

enum playerState {
	normal,
	swing
}

enum ropeDraw {
	illegalRed,
	swingWhite,
	spoodermanBlue,
	spooderSwingGreen,
	none
}

// gamejam
spriteIndex = 0;
spriteIncrement = false;