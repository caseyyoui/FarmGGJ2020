/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if(thrown)
{
	var vel = sqrt(xvel*xvel + yvel*yvel);
	if(vel < 1)
	{
		var inst = instance_place(x,y,oPlot);
		if(inst != noone && inst.plant == -1)
		{
			inst.plant = instance_create_depth(inst.x + 32, inst.y + 32, depth, oWeed);
			instance_destroy();
		}
	}
}