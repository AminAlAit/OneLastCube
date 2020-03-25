// Actual collision checks + movement
var i;

// Vertical
for (i = 0; i < abs(v); ++i) {
    if (!place_meeting(x, y + sign(v), obj_par_solid))
        y += sign(v);
    else {
        v = 0;
        break;
    }
}

// Horizontal
for (i = 0; i < abs(h); ++i) {
    // UP slope
    if (place_meeting(x + sign(h), y, obj_par_solid) && !place_meeting(x + sign(h), y - 1, obj_par_solid))
        --y;
    
    // DOWN slope
    if (!place_meeting(x + sign(h), y, obj_par_solid) && !place_meeting(x + sign(h), y + 1, obj_par_solid) && place_meeting(x + sign(h), y + 2, obj_par_solid))
        ++y;      
        
    if (!place_meeting(x + sign(h), y, obj_par_solid))
        x += sign(h); 
    else {
        // Push block
        if (place_meeting(x + sign(h), y, obj_push_block)) {
            with (instance_place(x + sign(h), y, obj_push_block))
                h = other.h
        } else
            h = 0;
        break;
    }
}

///////////////////////////////////////////////////////////////////////////////


// Update particle trail
y_drift = -sign(v);
x_drift = -sign(h);

if (abs(h) > abs(v)) {
    x_scatter = 0;
    y_scatter = 4;
} else {
    x_scatter = 4;
    y_scatter = 0;
}

// Standing
if (abs(v) < jump_height * 0.5)
if (h == 0) {
    x_drift = -sign(facing) * 5;
    y_drift = 0;
    if (v != 0)
        x_drift = -sign(facing) * 2;    
    x_scatter = 0;
    y_scatter = 2;
}

//// for creating the tail, trail effect
//TrailUpdate(trail, x + facing, y + 2);
//TrailDrift(trail, x_drift, y_drift);
//TrailScatter(trail, x_scatter, y_scatter);