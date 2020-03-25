/// @desc ScreenShake(magnitude, frames)
/// @arg Magnitude sets the strength of the shake (radius in pixels)
/// @arg Frames sets the length of the frames (60 = 1 second at 60 fps)

with (oCamera)
{
	if(argument0 > shake_remain)
	{
		shake_magnitude = argument0;
		shake_remain    = argument0;
		shake_length    = argument1;
	}
}