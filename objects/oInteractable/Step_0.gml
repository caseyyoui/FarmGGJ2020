if(owner > -1)
{
	x = owner.x
	y = owner.y-20
	depth = owner.depth-1
	dropped_time = 0 //picked up, so dropped_time should be 0
}



time_update -= delta_time / 1000000

if(time_update < 0)
{
	// currently dropped, tick up dropped_time
	if (owner == -1){
		if (dropped_time == despawn_time ) {
			instance_destroy();
		}
		dropped_time++;

	}

	time_update += 1;
}

if (thrown)
{
	x += xvel;
	y += yvel;
	xvel *= 0.95;
	yvel *= 0.95;
}
