
int.phy_position_x = phy_position_x
int.phy_position_y = phy_position_y // these lines make our interaction object follow us 
int.phy_speed_x	   = phy_speed_x
int.phy_speed_y	   = phy_speed_y

walk=0// set this to zero, it gets ste when a player presses a move key


if jump_timer>0
    {
    jump_timer-=1
    } // simple timer
else
    {
    jump=0
    }
    
if grab_timer>0 // more simple timer
    {
    grab_timer-=1
    }


if physics_test_overlap(x-(2*face),y+1,0,obj_wall)
    {
    if ground=0
        {
        ground=1
        jump_timer=5 // this block sets "ground" to 1 if there is a wall below us
        audio_play_sound(snd_land,1,0)
        }
    }
else
    {
    ground=0
    jump_timer=5
    }



if global.left_held=1 // from obj_game_controls
    {
    walk=1
    face=-1
    if phy_speed_x>-6{phy_speed_x-=0.5}
    physics_apply_force(x,y,0,-5)
    if keyboard_check_pressed(vk_left)
        {
        phy_speed_x-=1
        }
    }
    
if global.right_held=1 // from obj_game_controls
    {
    walk=1
    face=1
    if phy_speed_x<6{phy_speed_x+=0.5}
    physics_apply_force(x,y,0,-5)
    if keyboard_check_pressed(vk_right)
        {
        phy_speed_x+=1
        }
    }
    

if global.jump_pressed=1// from obj_game_controls
    {
    action_key()
    }
    
    


if ground=1 // if we are on teh ground
    {
    if walk=0// and not walking
        {
        phy_speed_x=phy_speed_x*0.9// air friction
        }
    else
        {
        if face=1{if phy_speed_x<0{phy_speed_x=phy_speed_x*0.9}} // more friction
        if face=-1{if phy_speed_x>0{phy_speed_x=phy_speed_x*0.9}} // more friction
        }
    }
    

    
sprites_step() // set our sprite based on the flags set before this

