/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if(dropped)
{
	var inst = instance_place(x,y,oPlot);
	if(inst != noone && inst.plant == -1)
	{
		inst.plant = instance_create_depth(inst.x + 32, inst.y + 32, depth, oPlant);
		instance_destroy();
	}
}


