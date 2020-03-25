if(wiggleLeft)
{
	if(image_angle < 3)
	{
		image_angle += 0.25;
	}
	else
	{
		wiggleLeft = !wiggleLeft;
	}
}
else
{
	if(image_angle > -3)
	{
		image_angle -= 0.25;
	}
	else
	{
		wiggleLeft = !wiggleLeft;
	}
}