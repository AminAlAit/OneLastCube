// sets the hiehgt of the vine we are about to create
height = irandom_range(20, 30);

// index variable
i = 0;

// current y placment for new vine parts
yy = 0;

// creates the first part of our vine. this has a higher density than the rest of the parts
// this part of the vine, is also parented to "obj_grabable"
part  = instance_create_layer(x, y + height, "Vines", obj_vine_part);						

// creates the first joint
// joint = physics_joint_distance_create(id, part, x, y, part.x, part.y, 0);
joint = physics_joint_rope_create(id, part, x, y, part.x, part.y, height, 0);

// this creates 1 vine section every 4 pixels
repeat(height / 4) {
	// this object has a very low density
	p[i] = instance_create_layer(x, y + yy, "Vines", obj_vine_part2);						
	yy	+= 4;
	i	+= 1;
}

// reset index to 0
i = 0;																		
repeat(height / 4) {
    if (i == 0)
		// create our connection to the first part of the vine
		j[i] = physics_joint_rope_create(id, p[i], x, y, p[i].x, p[i].y, 4, 0);
	else
		// all non-first sections connect to the previous section
		j[i] = physics_joint_rope_create(p[i - 1], p[i], p[i - 1].x, p[i - 1].y, p[i].x, p[i].y, 4, 0);
	
	yy += 4;
	i  += 1;
}
    
// create the final joint
j[i] = physics_joint_rope_create(part, p[i - 1], part.x, part.y, p[i - 1].x, p[i - 1].y, 1, 0);