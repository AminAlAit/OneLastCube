///@desc angle_rotate(angle, target, speed)
///@arg angle
///@arg target
///@arg speed

var _angle	= argument0;
var _target = argument1;
var _speed	= argument2;
var diff;

// 180 is to be replaced by "pi" for radians
diff = scr_cycle(_target - _angle, -180, 180);

// clamp rotations by speed:
if (diff < -_speed) 
	return _angle - _speed;
if (diff > _speed)
	return _angle + _speed;

// if difference within speed, rotation's done:
return _target;