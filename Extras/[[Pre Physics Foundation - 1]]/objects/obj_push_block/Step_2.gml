// Actual collision checks + movement
var i;

// Vertical
for (i = 0; i < abs(v); ++i) {
    with (obj_player) {
        if (place_meeting(x, y + 1, other.id)) {
            if (!scr_place_meeting_exception(x, y + sign(other.v), obj_par_solid, other.id))
                y += sign(other.v);
        }
        
        if (place_meeting(x, y - 1, other.id))
            y += sign(other.v);
    }

    if (!place_meeting(x, y + sign(v), obj_par_solid))
        y += sign(v);
    else {
        v = 0;
        break;
    }
}

// Push stacks of blocks
with (obj_push_block) {
    if (instance_place(x, y + 1, obj_push_block))
       h = (instance_place(x, y + 1, obj_push_block).h);
}

// Horizontal
for (i = 0; i < abs(h); ++i) {      // Move stacks 
    // UP slope
    if (place_meeting(x + sign(h), y, obj_par_solid) && !place_meeting(x + sign(h), y - 1, obj_par_solid))
        --y;
    
    // DOWN slope
    if (!place_meeting(x + sign(h), y, obj_par_solid) && !place_meeting(x + sign(h), y + 1, obj_par_solid) && place_meeting(x + sign(h), y + 2, obj_par_solid))
        ++y;       
        
    if (!place_meeting(x + sign(h), y, obj_par_solid))
        x += sign(h);
    else { 
        // Push other push blocks
        if (place_meeting(x + sign(h), y, obj_push_block)) {
            with (instance_place(x + sign(h), y, obj_push_block))
                if (instance_exists(oPlayer))
                    h = oPlayer.h
        } else
            h = 0;
        break;
    }
}

///////////////////////////////////////////////////////////////////////////////


