/// @description Insert description here
// You can write your code in this editor

if (party) {	
	audio_sound_pitch(balloonPop, random_range(0.8, 1.2));
	audio_play_sound(balloonPop, 0, 0);
}
instance_destroy();
