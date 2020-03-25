///@desc Wiggles an object by increments, and to a certain angle limit. 
//		 Returns -1 if wiggled to the left, and +1 if wiggled to the right. 

///@arg angle_incremet
///@arg angle_limit

var sprite_angle	 = 0;			// 1 is right, -1 is left
var sprite_angle_was = 0;			// Decides where the angle was. (used to avoid issues increments to settling on 0)
var angle_increment  = argument0;
var angle_limit		 = argument1;

switch(sprite_angle){
	case -1:
		if(image_angle < angle_limit)
			image_angle += angle_increment;
		else {
			sprite_angle	 = 1;
			sprite_angle_was = 1;
		}
	break;
	case  1:
		if(image_angle < angle_limit)
			image_angle -= angle_increment;
		else {
			sprite_angle	 =  1;
			sprite_angle_was = -1;
		}
	break;
	case  0:
		switch(sprite_angle_was){
			case  1: image_angle -= angle_increment; break;
			case -1: image_angle += angle_increment; break;
			default: image_angle += angle_increment; break;
		}
	break;
}
return sprite_angle;