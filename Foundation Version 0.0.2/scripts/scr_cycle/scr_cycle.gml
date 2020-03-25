///@desc cycle(value, min, max)
///@arg value
///@arg min
///@arg max

var _value = argument0;
var _min   = argument1;
var _max   = argument2;
var result, delta;

delta  = (_max - _min);
result = (_value - _min) mod delta;

if (result < 0) 
	result += delta;

return result + _min;