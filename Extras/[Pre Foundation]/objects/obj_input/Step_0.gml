global.joy_in_use=0
if global.joy=1
{
    joystick_controls();
    if global.joy_in_use=1{exit}
    // this gets joystick input, and if there was input this step, ends the step event to ingore keyboard input
}



//keyboard_input
global.jump_released=0
if keyboard_check(vk_left)
    {
    global.left_held=1
    }
else
    {
    global.left_held=0
    }

if keyboard_check(vk_right)
    {
    global.right_held=1
    }
else
    {
    global.right_held=0
    }
    
if keyboard_check(vk_up)
    {
    global.up_held=1
    }
else
    {
    global.up_held=0
    }
    
if keyboard_check(vk_down)
    {
    global.down_held=1
    }
else
    {
    global.down_held=0
    }
    
    
if keyboard_check_pressed(ord("Z"))
    {
    global.jump_pressed=1
    }
else
    {
    if keyboard_check(ord("Z"))
        {
        global.jump_pressed=0
        global.jump_held=1
        }
    else
        {
        global.jump_pressed=0
        global.jump_released=1
        global.jump_held=0
        }
    }


