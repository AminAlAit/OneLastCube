wall = 1;// this tells obj_input to draw this object in its draw event
xx   = 0;

if random(100) < 50 { exit }//50% of the walls will spawn grass if possible

if (physics_test_overlap(x,y-17,0,obj_wall) = false){
	
    // makes some grass
	repeat(random(8)){
        instance_create(x-xx,y-8,obj_plant1);
        instance_create(x+xx,y-8,obj_plant1);
        xx += 2;
	}
}

