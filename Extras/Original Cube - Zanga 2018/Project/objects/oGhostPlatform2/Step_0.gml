timer += 1;

if( timer == 30)
{
	instance_create_layer(x, y, "Walls_Blocks", oGhostPlatform1);
	instance_destroy();
}

