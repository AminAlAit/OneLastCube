draw_set_halign(fa_center);
draw_set_valign(fa_center);

draw_self();

if(active == true)
{
	draw_text_color(x, y-80, string(distance_to_player), c_red, c_red, c_red, c_red, 1);
	
	if (can_shoot == true)
	{
		draw_line_color(x, y, oPlayer.x, oPlayer.y, c_red, c_red);
		draw_text_color(x, y-60, string(ANG), c_red, c_red, c_red, c_red, 1);
	}
	else
	{
		draw_line_color(x, y, oPlayer.x, oPlayer.y, c_black, c_black);
		draw_text_color(x, y-60, string(ANG), c_black, c_black, c_black, c_black, 1);
	}
}
else
{
	draw_text_color(x, y-80, string(distance_to_player), c_black, c_black, c_black, c_black, 1);
}

draw_set_color(c_black);
draw_circle(x, y, los + (los/2), true);