if (grown =false){
	
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
		//make loading bar if none yet
		if (loadingBar == -1){
			var inst = instance_create_depth(x-20,y-32,3,oLoadingBar);
			loadingBar = inst;
			loadingBar.owner = id;
			loadingBar.maxProgress = timeToGrow
		
		}
		growTime += deltatime;
		loadingBar.progress += deltatime;
	
		if(growTime >= timeToGrow)
		{
			image_speed = 1;
			grown = true;
			growTime = timeToGrow;
		}
	}

}