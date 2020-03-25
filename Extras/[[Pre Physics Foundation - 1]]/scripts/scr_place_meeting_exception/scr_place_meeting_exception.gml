///@arg x
///@arg y
///@arg with(?)
///@arg exception

var _x			= argument0;
var _y			= argument1;
var calling_obj = argument2;
var exception   = argument3;

var exception = argument3;

with (calling_obj) {
    var callingObj_id = id;
    
    if (callingObj_id == exception)
        continue;
    else
        with (other)
            if (place_meeting(_x, _y, callingObj_id))
            return true;
}

return false;