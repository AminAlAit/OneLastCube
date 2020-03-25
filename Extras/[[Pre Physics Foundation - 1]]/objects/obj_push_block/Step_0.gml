// Gravity
if (!place_meeting(x, y + 1, obj_par_solid))
    v += 0.5;

// MaxV    
if (v >= 12)
    v = 12;

// Friction 
if (scr_on_ground())   
    h = scr_approach(h, 0, 0.66);
else
    h = scr_approach(h, 0, 0.1);

