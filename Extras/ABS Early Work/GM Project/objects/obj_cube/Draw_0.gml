/// @description Insert description here
// You can write your code in this editor
/*
if (state == playerState.swing)
	draw_line_width(grappleX, grappleY, x, y, 2);
*/

if (ropeColor == ropeDraw.spooderSwingGreen)
	draw_line_width_color(grappleX, grappleY, x, y, 2, c_green, c_green);
	
if (ropeColor == ropeDraw.illegalRed)
	draw_line_width_color(_pressedX, _pressedY, x, y, 2, c_red, c_red);
	


//draw_text(100, 100, "hello " + string(ropeLength));
var _dirTmp = point_direction(x, y, mouse_x, mouse_y);
var _disTmp = min(ropeExtent, point_distance(x, y, mouse_x, mouse_y));
var _XTmp = x + lengthdir_x(_disTmp, _dirTmp);
var _YTmp = y + lengthdir_y(_disTmp, _dirTmp);

/*
if (glow){
	gpu_set_blendmode(bm_subtract);
	surface_set_target(light);
	draw_circle(_XTmp, _YTmp, 2, 2);
	draw_circle(mouse_x, mouse_y, 5, 5);
	surface_reset_target();
	gpu_set_blendmode(bm_normal);
	
}
else {
	draw_circle(_XTmp, _YTmp, 2, 2);
	draw_circle(mouse_x, mouse_y, 5, 5);
}
*/
if(!glow) {	
	draw_circle_color(_XTmp, _YTmp, 2, c_white, c_white, 2);
	draw_circle_color(mouse_x, mouse_y, 5, c_white, c_white, 5);
}
draw_self();

draw_sprite(spr_flies, spriteIndex, x, y);
if (spriteIncrement) {
	spriteIndex = (spriteIndex + 1) % 12;
	spriteIncrement = false;
}
else
	spriteIncrement = true;
