/// @description Insert description here
// You can write your code in this editor
time_update -= delta_time / 1000000

if(time_update < 0)
{
	
	if (time_out == 0 ) {
		instance_destroy();
	}
	time_out--;
		
	
	
	time_update += 1;
}

