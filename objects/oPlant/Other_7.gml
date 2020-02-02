/// @description Insert description here
// You can write your code in this editor
if (sprite_index == ESoil)
{
	audio_play_sound(snd_grow,0,false);
	sprite_index = SunFlower;
}
	
if(sprite_index == SunFlower)
{
	sprite_index = IdleSunflower;
	if(x > 484)
	{
		for(var i = 0; i < instance_number(oPlayer); i++)
		{
			var inst = instance_find(oPlayer,i);
			if(inst.controllerID == 1)
			{
				inst.playerScore++;
			}
		}
	}
	else
	{
		for(var i = 0; i < instance_number(oPlayer); i++)
		{
			var inst = instance_find(oPlayer,i);
			if(inst.controllerID == 0)
			{
				inst.playerScore++;
			}
		}
	}
}
