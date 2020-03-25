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