physics_world_update_speed(60);

// do not allow the player's physics object to rotate
phy_fixed_rotation = 1; // 0/false means that this object will be affected by forces/collision and will rotate

// this tells gamemaker to pay extra attention to this object when doing physics calcs
phy_bullet = true; 

// these variables are used to determine the player's states in the step event
walk			 = 0;	 // used to tell if the user input walk commands
ground			 = 0;	 // used to tell if we are on solid ground or not

max_speed		 = 3;
max_walk_speed	 = 2;
min_walk_speed	 = 1;	 // Less than 1 means the object turns to idle state (stand)
acc				 = 0.1;

facing			 = 1;	 // which direction are we facing (used for image_xscale later)
slide			 = 0;	 // wall slide flag

flip			 = 0;	 // for the tripple jump
flip_mode		 = 0;	 // for the tripple jump

jump			 = 0;	 // for double jump
jump_timer		 = 0;	 // for double jump
jump_1_height	 = 3;
jump_2_height	 = 4;
jump_3_height	 = 6;

dir				 = 0;	 // used for grabbing vines
dis				 = 0;	 // used for grabbing vines
grab_x			 = 0;	 // used for grabbing vines
grab_y			 = 0;	 // used for grabbing vines
grab_distance	 = 16;
grab_target		 = 0;	 // used for grabbing vines
grab_joint		 = 0;	 // used for grabbing vines
grab_timer		 = 0;	 // used for grabbing vines

walking_sound	 = snd_step;
landing_sound	 = snd_land;

state			 = 0;	 // 0 for idle | 1 for walking | 2 for running