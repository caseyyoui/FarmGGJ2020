/// @description Insert description here
// You can write your code in this editor
time_update -= delta_time / 1000000

if(time_update < 0)
{
	time_out--;
	if (time_out <= 0 ) {
		owner.alert=-1
		instance_destroy();
	}
	
		
	
	
	time_update += 1;
}

