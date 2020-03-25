draw_set_color(c_white);
draw_text(10, 10, grab_timer);
switch(facing){
	case 1:
		draw_text(10, 20, "Right");
	break;
	case -1:
		draw_text(10, 20, "Left");
	break;
}
switch(state){
	case 0:
		draw_text(10, 30, "Stand");
	break;
	case 1:
		draw_text(10, 30, "Walk");
	break;
	case 2:
		draw_text(10, 30, "Run");
	break;
}

draw_text(10, 50, "Vertical Speed: " + string(phy_speed_y));

//draw_text(10, 70,  "Distance from rocket to player: " + string(oMissile.dist_player));
//draw_text(10, 90,  "Horizontal Sign: "				  + string(oMissile.x_sign));
//draw_text(10, 110, "Vertical Sign: "				  + string(oMissile.y_sign));

//var frame_range = image_speed * sprite_get_speed(sprite_index) / game_get_speed(gamespeed_fps);
//draw_text(frame_range, 50, 60);