/// @description Wrap(value, min, max)
/// @function Wrap
/// @param value
/// @param min
/// @param max
// Returns the value wrapped, values over or under will be wrapped around

var _value = argument0 mod 1;
var _min   = argument1;
var _max   = argument2;

switch(_value){ 
	case 0:
		while (_value > _max || _value < _min){
		if (_value > _max)
			_value += _min - _max - 1;
		else if (_value < _min)
			_value += _max - _min + 1;
		}
	return(_value);
	break;
	default:
		var vOld = _value + 1;
		while (_value != vOld)
		{
			vOld = _value;
			if (_value < _min)
				_value = _max - (_min - _value);
			else if (_value > _max)
				_value = _min + (_value - _max);
		}
		return(_value);
	break;
}