///@desc Randomise which sound to play and then play it according to frame numbers taken as arguments
///@arg frame min_frame
///@arg frame max_frame
///@arg [steps_sounds] !!!! Make sure this is a One Direction Array of sounds !!!!

var _min		  = argument0;
var _max		  = argument1;
var _sound		  = 0;
var _flag		  = 0;
var _sounds		  = argument2;
var _sounds_size = array_length_1d(_sounds);

_sound			  = _sounds[irandom(_sounds_size - 1)];

if((image_index >= _min) && (image_index < _max) && !_flag){
	if(scr_detect_sound_in_sounds_array(_sounds)){
		return 1; 
		exit;
	}
	audio_play_sound(_sound, 1, 0);
	return 0;
}