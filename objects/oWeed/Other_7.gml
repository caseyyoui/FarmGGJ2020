if(sprite_index == ESoil)
{
	for(var dir = 0; dir < 4; dir++)
	{
		var plot = noone;
		if(dir == 0)
		{
			plot = instance_position(x - 64,y,oPlot);
		}else if(dir == 1)
		{
			plot = instance_position(x + 64,y,oPlot);
		}else if(dir == 2)
		{
			plot = instance_position(x,y - 64,oPlot);
		}else if(dir == 3)
		{
			plot = instance_position(x,y + y,oPlot);
		}

		if(plot != noone && plot.plant == -1)
		{
			plot.plant = plot.plant = instance_create_depth(plot.x + 32, plot.y + 32, -plot.y-32, oWeed);
			break;
		}
	}
	sprite_index = sPlant;
}
