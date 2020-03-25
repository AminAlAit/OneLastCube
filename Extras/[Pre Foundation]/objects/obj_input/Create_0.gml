
//This object handles player input
//key bindings should be changed in this object's step event

global.left_held=0
global.right_held=0
global.down_held=0
global.up_held=0
global.jump_pressed=0
global.jump_held=0
global.jump_released=0


// Gamepad setup
global.joy=0
global.joy_in_use=0
if gamepad_is_connected(0)// Checking for a gamepad
    {
    gamepad_set_axis_deadzone(0,0.5)//set deadzone
    global.joy=1// flag that we are indeed, using a joystick
    }

