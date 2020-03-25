if(surface_exists(surf)){
	surface_set_target(surf);
	
	//set the dark overlay
	draw_set_color(c_black);
	draw_set_alpha(1);
	draw_rectangle(0, 0, room_width, room_height, false);
	
	// set circles
	gpu_set_blendmode(bm_subtract);
	draw_set_color(c_black);
	draw_set_alpha(0.2);
	
	//Draw Circles
	with (obj_cube){
		draw_circle(x + random_range(-1,1), y + random_range(-1, 1), 100 + random_range(-1, 1), false);
		
	}
	
	draw_set_alpha(c_white);
	draw_set_alpha(1);
	
	with (obj_cube){
		draw_circle(x + random_range(-1,1), y + random_range(-1, 1), 45 + random_range(-1, 1), false);
		
	}
	// Reset all of the set draws
	gpu_set_blendmode(bm_normal);
	draw_set_alpha(1);
	
	surface_reset_target();
} else {
	surf = surface_create(room_width, room_height);
	surface_set_target(surf);
	draw_clear_alpha(c_black, 0);
	surface_reset_target();
}