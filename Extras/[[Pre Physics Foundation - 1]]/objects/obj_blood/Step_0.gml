vspeed += 1;

if (fade)
    image_alpha -= 0.1;
    
if (image_alpha < 0.25)
    instance_destroy();

