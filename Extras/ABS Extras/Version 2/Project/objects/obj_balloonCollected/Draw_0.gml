/// @description Insert description here
// You can write your code in this editor


if (party == true && count % 40 == 0){
	
	r = random_range(minR, maxR);
	red = random_range(100, 255);
	green = random_range(100, 255);
	blue = random_range(100, 255);

	if (r <= 3.0)
		red = 0.0;
	else
		if (r <= 5.0)
			green = 0.0;
		else
			if (r <= 7.0)
				blue = 0.0;
			else
				if (r <= 9.0) {
					red = 0.0;
					green = 0.0;
				}
				else
					if (r <= 11.0) {
						red = 0.0;
						blue = 0.0;
					}
					else
						if (r <= 13.0) {
							green = 0.0;
							blue = 0.0;
						}
						else 
							if (r <= 14.0) {
								red = 0.0;
								green = 0.0;
								blue = 0.0;
							}
					
	
	/*
	r = ceil(random_range(1.0, 14.0));
	
	if (count % 20 == 0) {
		randomize();
		red = random_range(100, 255);
		green = random_range(100, 255);
		blue = random_range(100, 255);
		switch (r) {
			case 3.0 : {
				red = 0.0;
				break;
			}
			case 5.0 : {
				green = 0.0;
				break;
			}
			case 7.0 : {
				blue = 0.0;
				break;
			}
			case 9.0 : {
				red = 0.0;
				green = 0.0;
				break;
			}
			case 11.0 : {
				red = 0.0;
				blue = 0.0;
				break;
			}
			case 13.0 : {
				green = 0.0;
				blue = 0.0;
				break;
			}
		}
	}*/
}	

shader_set(shd_balloonColor);
shader_params = shader_get_uniform(shd_balloonColor, "balloonColor");
shader_set_uniform_f(shader_params, red, green, blue);
draw_self();
shader_reset();