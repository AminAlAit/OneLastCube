// Movement speed
h = 0;
v = 0;

// Collision below
on_ground = false;

// Adjust THIS to adjust overall player speed
m = 1;

// Acceleration + friction
ground_acc = 1.0  * m;
ground_fric  = 2.0  * m;
air_acc    = 0.75 * m;
air_fric     = 0.10 * m;

// Max movement speeds
max_h        = 5.5  * m;
max_v        = 9.0  * m;

jump_height  = 7.0  * m;
grav_rise    = 0.5  * m;
grav_fall    = 0.5  * m;
grav_slide   = 0.25 * m;

// Frames prior to being able to push off of wall slide with arrow keys (doesn't affect wall jump)
cling_time   = 4.0  * m;
///////////////////////////////////////////////////////////////////////////////

// State Info /////////////////////////////////////////////////////////////////
// States
IDLE     = 10;
RUN      = 11;
JUMP     = 12;

// Facings
RIGHT =  1;
LEFT  = -1;

// Initialize properties
state  = IDLE;
facing = image_xscale; // Change x_scale in editor to adjust initial facing

// For squash + stretch
x_scale = 1;
y_scale = 1;
///////////////////////////////////////////////////////////////////////////////

// Misc ///////////////////////////////////////////////////////////////////////

// Relative collision checks
c_left  = 0;
c_right = 0;
c_above = 0;

// Wall slide
can_stick = true;
sticking = false;

///////////////////////////////////////////////////////////////////////////////

length = 6; //4;
w1 = 3;
w2 = 5; //0;
c1 = c_white
c2 = c_white
a1 = 1;
a2 = 1;
x_scatter = 0//6;
y_scatter = 1;
x_drift = 0;
y_drift = 5;

//// for creating the tail, trail effect
//trail = TrailCreate(length, x, y);