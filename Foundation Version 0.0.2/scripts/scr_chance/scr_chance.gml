/// @description Chance(percent)
/// @param percent

// Returns true or false depending on RNG
// ex: 
//		Chance(0.7);	-> Returns true 70% of the time

var _percent = argument0;

return _percent > random(1);