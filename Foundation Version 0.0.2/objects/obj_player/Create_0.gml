physics_world_update_speed(60);

// do not allow the player's physics object to rotate
phy_fixed_rotation = 1; // 0/false means that this object will be affected by forces/collision and will rotate

// this tells gamemaker to pay extra attention to this object when doing physics calcs
phy_bullet = true; 

// these variables are used to determine the player's states in the step event
walk			   = 0;	 // used to tell if the user input walk commands
ground			   = 0;	 // used to tell if we are on solid ground or not
falling			   = 0;	 // used to tell if we are falling or not: 0 flat, 1: yes, -1: no
tap_ceiling		   = 0;	 // used to tell if we hit (our head) with any ceiling (obj_wall)
action			   = 0;  // 0: no actions | 1: rope initiated | 2: rope hit target 
						 //	3: swinging	  | 4: landed		  | 5: rope got hit

foot_stepped	   = 0; // everytime the player's feet hit the floor

max_speed		   = 3;
max_walk_speed	   = 2;
min_walk_speed	   = 1;	 // Less than 1 means the object turns to idle state (stand)
acc				   = 0.1;
movement_right	   = 1;	 // Force applied when Right button is pressed
movement_left	   = 1;	 // Force applied when Left button is pressed
normal_force	   = -5;	 // I guess they meant Normal.. Search this variable to see where it is used

facing			   = 1;	 // which direction are we facing (used for image_xscale later)
slide			   = 0;	 // wall slide flag

flip			   = 0;	 // for the tripple jump
flip_mode		   = 0;	 // for the tripple jump
flip_of_jump_2	   = 0.3;
flip_of_jump_3	   = 0.3;

jump			   = 0;	 // for double jump
jump_timer		   = 0;	 // for double jump
jump_1_height	   = -3;
jump_2_height	   = -4;
jump_3_height	   = -6;
after_grab_jump	   = 2.5;

after_slide_jump_y = -2.5;
after_slide_jump_x = 4;	 // 

dir				   = 0;	 // used for grabbing vines
dis				   = 0;	 // used for grabbing vines
grab_x			   = 0;	 // used for grabbing vines
grab_y			   = 0;	 // used for grabbing vines
grab_distance	   = 16;
grab_target		   = 0;	 // used for grabbing vines
grab_joint		   = 0;	 // used for grabbing vines
grab_timer		   = 0;	 // used for grabbing vines

footsteps_sounds   = [snd_step];
jumping_sounds	   = [snd_jump1, snd_jump2, snd_jump3];
tap_ceiling_snd	   = snd_land; // plays when player hits his top with obj_wall
landing_sound	   = snd_land;
grabbing_sound	   = snd_grab1;

state			   = 0;	 // 0 for idle | 1 for walking | 2 for running