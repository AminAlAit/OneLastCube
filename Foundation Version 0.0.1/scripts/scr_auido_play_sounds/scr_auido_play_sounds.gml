///@desc Plays one sound from an array of sounds and returns it's ID.
///@arg sounds_array
///@arg priority
///@arg loop

var _sounds		 = argument0;
var _sounds_size = array_length_1d(_sounds);
var _priority	 = argument1;
var _loop		 = argument2;
var _sound		 = irandom(_sounds_size - 1);

return audio_play_sound(_sound, _priority, _loop);