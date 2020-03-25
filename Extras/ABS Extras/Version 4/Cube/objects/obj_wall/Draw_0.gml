/// @description Insert description here
// You can write your code in this editor

draw_self();
if (selected) {
	with (obj_wall)
		selected = false;
	selected = true;
	if (count == 0)
		with(obj_cube) {
			other.selectedX = grappleX - grappleX % 32 ;
			other.selectedY = grappleY - grappleY % 32 ;
		}
	draw_sprite(spr_selectedSad, 0, selectedX, selectedY);
	count++;
}
else
	count = 0;