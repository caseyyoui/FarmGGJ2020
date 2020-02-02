var deltatime = delta_time / 1000000

growTime += deltatime;
if(growTime >= timeToGrow)
{
	growTime = timeToGrow;
	image_speed = 1;
}
