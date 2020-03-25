//////////////////////////////////////////////////////////////////////////////////////////
///// @description Movement variables
//velocity_ = [0, 0];
//gravity_ = 0.1;
//jump_speed_ = 16;
//// Setting max jump heigh
//maxJumpHeight = -(jump_speed_/3);

//max_velocity_ = [8, 32];
//acceleration_ = 1.5;
//// Get the tilemap id
//var layer_id = layer_get_id("CollisionTiles");
//collision_tile_map_id_ = layer_tilemap_get_id(layer_id);
//////////////////////////////////////////////////////////////////////////////////////////
//// Previous script variables
//hFrictionGround = 0.5;
//hFrictionAir = 0;

#region The FIX
state						= "move";
rope_acceleration_rate		= -0.2;
rope_manual_accelerate_rate = 0.08;
rope_damping				= 0.99; // air friction
h_speed						= 0;
v_speed						= 0;
gravity_					= 0.5;
walk_speed					= 10;
walk_acceleration			= 2.1; // 2.1
h_friction_ground			= 0.9;
h_friction_air				= 0;
h_speed_fraction			= 0.0;
v_speed_fraction			= 0.0;
jump_speed					= 10;
rope_length					= 0;
rope_angle_velocity			= 0;
rope_angle					= 0;
grapple_x					= 0;
grapple_y					= 0;
rope_width					= 2;
min_rope_length				= 10;
max_rope_length				= 510;
rope_lengthing_rate			= 2;
//max_ratio					= 0.01 // max rope length to velocity friction ration (chosen as 0.5)
//rope_delta					= max_rope_length - min_rope_length;
#endregion


/// @description Movement variables
//hspFraction = 0.0;
//vspFraction = 0.0;
//velocity_ = [0, 0];
//gravity_ = 0.5;
//jump_speed_ = 28;
//max_velocity_ = [8, 32];
//acceleration_ = 2.1;

//// Get the tilemap id
//var layer_id = layer_get_id("CollisionTiles");
//collision_tile_map_id_ = layer_tilemap_get_id(layer_id);
