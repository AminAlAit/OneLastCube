//draw walls and outlines
with(obj_wall) {
	// this checks to make sure its a wall, not a box.
	// as boxes are parented to walls
    if (wall = 1) {
		draw_sprite(spr_wall_outline, image_single, x, y);
		draw_sprite(sprite_index, image_single, x, y);
	}
}