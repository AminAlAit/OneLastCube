timer += 1;
instance = layer

if( timer == 30)
{
	instance_create_layer(x, y, "Walls_Blocks", oGhostPlatform2);
	instance_destroy();
}
