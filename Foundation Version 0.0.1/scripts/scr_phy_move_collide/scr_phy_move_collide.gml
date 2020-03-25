///@desc Detects collision upon movement
///@arg x
///@arg y
///@arg angle
///@arg obj

var _x	   = argument0;
var _y	   = argument1;
var _angle = argument2;
var _obj   = argument3;

if (physics_test_overlap(x + _x, y + _y, _angle, _obj))
	return true;
else
	return false;