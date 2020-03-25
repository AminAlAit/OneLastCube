image_x_scale = random_range(1, 2);
image_y_scale = image_x_scale;

image_angle = random(360);

speed     = 4 + (image_index * 2) + random_range(-1, 4);
direction = choose(-1, 1, 1) * random(180);

alarm[0] = random_range(10, 20);

fade = false;


