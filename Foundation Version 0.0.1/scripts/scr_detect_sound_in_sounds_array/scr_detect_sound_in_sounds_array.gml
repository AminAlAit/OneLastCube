///@desc this script will be used to detect which audio is playing among an array of audios
///@arg [sounds]

var _sounds		 = argument0;
var _sounds_size = array_length_1d(_sounds);

var i = 0;
repeat(_sounds_size){
	if(audio_is_playing(_sounds[i])){
		return 1;
	}
	i++;
}
return 0;