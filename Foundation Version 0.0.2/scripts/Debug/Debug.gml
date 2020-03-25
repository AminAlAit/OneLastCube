///@desc Show debug message
///@arg calling_object
///@arg "event"

var obj	  = argument0;
var event = argument1;

show_message("Error: " + string(object_get_name(obj)) + event + ".");