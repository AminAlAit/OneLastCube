///@desc Record GIF

if(global.gif_pressed){
	gif_recording = !gif_recording;
	
	switch(gif_recording){
		#region Recording
		case 1:
			gif = gif_open(CAMERA_0_W, CAMERA_0_H);
		break;#endregion
		#region Not Recording: Save Gif
		case 0:
			gif_save(gif, "capture.gif");
		break;#endregion
	}
}

if(gif_recording)
	gif_add_surface(gif, application_surface, 2, 0, 0, 2);