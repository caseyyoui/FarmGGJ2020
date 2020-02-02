var deltatime = delta_time / 1000000

if (watered)
{
	growTime += deltatime;
	if(growTime >= timeToGrow)
	{
		image_speed = 1;
		growTime = timeToGrow;
	}
}