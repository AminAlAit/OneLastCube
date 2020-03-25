if (instance_exists(oPlayer)) {
    switch (aim) {
        case FORWARD:
            x            = oPlayer.x;
            y            = oPlayer.y;
            image_xscale = oPlayer.facing;
        break;
        
        case UP:
            x            = oPlayer.x;
            y            = oPlayer.y;
            image_angle  = 90;            
        break;
        
        case DOWN:
            x            = oPlayer.x;
            y            = oPlayer.y;
            image_angle  = 270;  
        break;
    }  
} else {
    instance_destroy();
}

