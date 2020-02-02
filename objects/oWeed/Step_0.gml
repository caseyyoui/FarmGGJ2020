

if (grown =false){
	//make loading bar if none yet
	if (loadingBar == -1){
		var inst = instance_create_depth(x-20,y-32,-1,oLoadingBar);
		loadingBar = inst;
		loadingBar.owner = id;
		loadingBar.maxProgress = timeToGrow
		loadingBar.color =c_purple
		
	}
	var deltatime = delta_time / 1000000

	growTime += deltatime;
	loadingBar.progress += deltatime;
	if(growTime >= timeToGrow)
	{
		growTime = timeToGrow;
		image_speed = 1;
		grown = true;
	}


}