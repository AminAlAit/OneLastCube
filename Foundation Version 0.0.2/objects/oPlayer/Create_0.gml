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

//hspFraction = 0.0;
//vspFraction = 0.0;

//canjump = 0;

//state = pState.normal;

//enum pState
//{
//	normal,
//	swing
//}

// A new start...

/// @description Movement variables
velocity_ = [0, 0];
gravity_ = 1.5;
jump_speed_ = 28;
max_velocity_ = [8, 32];
acceleration_ = 2.1;

// Get the tilemap id
var layer_id = layer_get_id("CollisionTiles");
collision_tile_map_id_ = layer_tilemap_get_id(layer_id);
