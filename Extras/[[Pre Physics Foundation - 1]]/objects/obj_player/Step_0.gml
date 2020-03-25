// Declare Temp Variables /////////////////////////////////////////////////////
var key_left, key_right, key_up, key_down, key_jump, key_jump_release, temp_acc, temp_fric;
///////////////////////////////////////////////////////////////////////////////

// Input //////////////////////////////////////////////////////////////////////

key_left         = keyboard_check(vk_left);
key_right        = keyboard_check(vk_right);
key_up           = keyboard_check(vk_up);
key_down         = keyboard_check(vk_down);
key_jump         = keyboard_check_pressed(ord("Z"));
key_jump_release = keyboard_check_released(ord("Z"));

///////////////////////////////////////////////////////////////////////////////

// Which form of accel/fric to apply
if (on_ground) {
    temp_acc = ground_acc;
    temp_fric  = ground_fric;
} else {
    temp_acc  = air_acc;
    temp_fric = air_fric;
}

// Stick to wall //////////////////////////////////////////////////////////////
if ((!c_right && !c_left) || on_ground) {
    can_stick = true;
    sticking = false;
}   

// Cling to wall
if (((key_right && c_left) || (key_left && c_right)) && can_stick && !on_ground) {
    alarm[0] = cling_time;
    sticking = true; 
    can_stick = false;       
}
///////////////////////////////////////////////////////////////////////////////

// Gravity ////////////////////////////////////////////////////////////////////
if (!on_ground) {
    state = JUMP;
    if ((c_left || c_right) && v >= 0) {
        // Wall slide
        v = scr_approach(v, max_v, grav_slide);
    } else {
        
        // Fall normally
        if (v < 0)
            v = scr_approach(v, max_v, grav_rise);
        else
            v = scr_approach(v, max_v, grav_fall);
    }
}
///////////////////////////////////////////////////////////////////////////////

// Left 
if (key_left && !key_right && !sticking) {
    facing = LEFT;

    // Apply acceleration left
    if (h > 0)
        h = scr_approach(h, 0, temp_fric);  
		
    h = scr_approach(h, -max_h, temp_acc);
        
    if (on_ground /*&& !c_left*/)
        state = RUN;
    else {
        if (on_ground)
            state = IDLE;
    }
}

// Right 
if (key_right && !key_left && !sticking) {
    facing = RIGHT;

    // Apply acceleration right
    if (h < 0)
        h = scr_approach(h, 0, temp_fric); 
		
    h = scr_approach(h, max_h, temp_acc);
        
    if (on_ground /*&& !c_right*/)
        state = RUN;
    else {
        if (on_ground)
            state = IDLE;
    }
}

// Friction
if (!key_right && !key_left)
    h = scr_approach(h, 0, temp_fric);

if (on_ground && h == 0)
    state = IDLE;    
       
// Wall jump
if (key_jump && c_left && !on_ground) {
    // Stretch sprite
    x_scale = 0.66;
    y_scale = 1.33;     
    
    // Particles
    var i;
    for (i = 0; i < 4; ++i)
		var inst_1 = instance_create_layer(x + random_range(-8, 8), bbox_bottom, "Effects", obj_particle);
        with (inst_1) {
			direction = random_range(-45, 45);
		}
	
    // Wall jump is different when pushing off/towards the wall        
    if (key_left) {
        v = -jump_height * 1.1;
        h = jump_height * .75  * 1.2;
    } else {
        v = -jump_height * 1.1;
        h = max_h;
    }  
}

if (key_jump && c_right && !on_ground) {
    // Stretch sprite
    x_scale = 0.66;
    y_scale = 1.33;              
     
    // Particles
    var i;
    for (i = 0; i < 4; ++i)
		var inst_2 = instance_create_layer(x + random_range(-8, 8), bbox_bottom, "Effects", obj_particle);
        with (inst_2) {
			direction = 180 + random_range(-45, 45);     
		}
	   
    // Wall jump is different when pushing off/towards the wall  
    if (key_right) {
        v = -jump_height * 1.1;
        h = -jump_height * .75 * 1.2;
    } else {
        v = -jump_height * 1.1;
        h = -max_h;
    }  
}
  
// Jump
if (key_jump && on_ground) {
    if (on_ground || (!c_right && !c_left)) {
        // Stretch sprite 
        x_scale = 0.66;
        y_scale = 1.33;
        
        // Particles
        var i;
        for (i = 0; i < 4; ++i)
		var inst_3 = instance_create_layer(x + random_range(-8, 8), bbox_bottom, "Effects", obj_particle);
        with (inst_3) {
			direction = 90 + random_range(-45, 45);        
		}
		
        v = -jump_height;
        state = JUMP;
    }
} else {
    // Variable hop
    if (key_jump_release) {
        if (v < 0 && v >= -jump_height)
            v *= 0.25; 
    }
}

// Swap facing on walls
if (!on_ground) {
    if (c_left)
        facing = RIGHT;
    if (c_right)
        facing = LEFT;
}

/* */
if (state == RUN)
    if (random(100) > 80)
        with (instance_create_layer(x + random_range(-8, 8), bbox_bottom, "Effects", obj_particle)) {
			direction = 90 + random_range(-45, 45);
		}

// Adjust scaling after squash + stretch
x_scale = scr_approach(x_scale, 1, 0.05);
y_scale = scr_approach(y_scale, 1, 0.05);



/* */
/*  */
