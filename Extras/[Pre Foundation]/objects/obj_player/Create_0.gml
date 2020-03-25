
physics_world_update_speed(60)// set physics calcs to run 60 times a second
phy_fixed_rotation=1 // do not allow the player's physics object ro rotate
phy_bullet=true// this tells gamemaker to pay extra attention to this object when doing physics calcs
int=instance_create(x,y,obj_player_interactor)//create our interactor object, and save it to the variable "int"


// these variables are used to determine the player's states in the step event
walk=0 //used to tell if he user input walk commands
ground=0 // used to tell if we are on solid ground or not
face=1 // which direction are we facing (used for image_xscale later)
slide=0// wall slide flag
flip=0//for the tripple jump
flip_mode=0//for the tripple jump
jump=0//for double jumo
jump_timer=0//for double jumo
animate_speed=0.75// the speed at which we index sub images
step_sound_timer=0//used for making the sounds for stepping
dir=0//used for grabbing vines
dis=0//used for grabbing vines
grab_x=0//used for grabbing vines
grab_y=0//used for grabbing vines
grab_target=0//used for grabbing vines
grab_joint=0//used for grabbing vines
grab_timer=0//used for grabbing vines




