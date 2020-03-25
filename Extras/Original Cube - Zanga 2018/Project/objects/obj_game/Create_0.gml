#region MACROs & ENUMs
	#macro RESOLUTION_W 640
	#macro RESOLUTION_H 256
	#macro FRAME_RATE	60
	#macro VIEWPORT_W	1024
	#macro VIEWPORT_H	768
	#macro CAMERA_0_W	1024
	#macro CAMERA_0_H	768
#endregion
#region Font : Converting Sprite to Font
//global.FONT = font_add_sprite(spr_font, ord(" "), 0, 1);

//draw_set_color(c_white);
//draw_set_font(global.FONT);

//fontAng = 0;
//fontDir = 1;
#endregion

view_w = camera_get_view_width(view_camera[0]);
view_h = camera_get_view_height(view_camera[0]);

// GIF
//surface_resize(application_surface, RESOLUTION_W, RESOLUTION_H);
gif_recording = 0;
gif_alpha	  = 0;