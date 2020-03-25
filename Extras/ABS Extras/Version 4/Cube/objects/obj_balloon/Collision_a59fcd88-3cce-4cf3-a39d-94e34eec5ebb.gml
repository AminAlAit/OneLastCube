/// @description Insert description here
// You can write your code in this editor


if (!die) {
	alarm[0] = 120;
}
if (!party && !die) {
	audio_sound_pitch(balloonTake, random_range(0.8, 1.2));
	var snd = audio_play_sound(balloonTake, 0, 0);
	audio_sound_set_track_position(snd, 0.3);
}
die = true;