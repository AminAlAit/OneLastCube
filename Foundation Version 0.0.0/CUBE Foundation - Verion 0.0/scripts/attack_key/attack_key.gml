

        if grab_joint>0
            {
            grab_timer=10
            physics_joint_delete(grab_joint)
            grab_joint=0
            grab_target=0
            audio_play_sound(snd_jump1,1,0)
            }
        else
        {
        if slide=0
            {
            if kick_mode=0
                {
                if kick=0
                    {
                    phy_speed_x+=(4*face)
                    kick_mode=1
                    kick=0.3
                    audio_play_sound(snd_slash1,1,0)
                    }
                }
            }
        else
            {
            phy_speed_x-=2*face
            slide=0
            }
        }
