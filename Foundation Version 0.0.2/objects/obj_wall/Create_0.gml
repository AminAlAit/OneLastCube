if (random(100) < 50) exit; // 50% of the walls will spawn grass if possible
xx   = 0;
if (physics_test_overlap(x, y - 17, 0, obj_wall) == false){
    // make some grass
	var rand = irandom_range(5, 8);
	repeat(rand) {
        instance_create_layer(x - xx, y - 8, "Grass_Behind_Player", obj_plant1);
        instance_create_layer(x + xx, y - 8, "Grass_Behind_Player", obj_plant1);
        xx += 2;
	}
}

