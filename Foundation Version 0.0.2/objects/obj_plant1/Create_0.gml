// this object is the "grass" you see ontop of the walls
// it simply makes another object, and creates a joint to connect them
// which allows the grass to sway back and forth
height = 3;
p	   = instance_create_layer(x, y - height, "Vines", obj_plant_part);
j	   = physics_joint_revolute_create(id, p, x, y, 80, 110, false, 0, 0, false, false);