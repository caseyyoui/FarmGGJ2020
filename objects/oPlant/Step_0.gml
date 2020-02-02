var deltatime = delta_time / 1000000
watered= false;
if(place_meeting(x,y, oBucket)){
	var inst = instance_place(floor(x), floor(y), oBucket)
	if (inst.filled = true){
		watered=true
	}
	
}
if (watered)
{
	growTime += deltatime;
	if(growTime >= timeToGrow)
	{
		image_speed = 1;
		growTime = timeToGrow;
	}
}