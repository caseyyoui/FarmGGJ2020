/// @description Insert description here
// You can write your code in this editor
depth=-y
var dx = gamepad_axis_value(controllerID, gp_axislh);
var dy = gamepad_axis_value(controllerID, gp_axislv);

// deadzone
if(abs(dx) < .1)
	dx = 0;
if(abs(dy) < .1)
	dy = 0;

if(dx < -0.5)
{
	sprite_index = sCaseyLeft
}
else if (dx > 0.5)
{
	sprite_index = sCaseyRight
}

if(dy < -0.5)
{
	sprite_index = sCaseyBack
}
else if (dy > 0.5)
{
	sprite_index = sCaseyFront
}

x += dx * movementSpeed;
y += dy * movementSpeed;



if (alert>-1){
	alert.anchor_x = x+alert_offset_x
	alert.anchor_y = y+alert_offset_y
}

if(inventory != -1 && gamepad_button_check_pressed(controllerID, gp_face1))
{
	if(inventory.object_index == oSeed)
	{
	
		if(place_meeting(x, y, oDarkPlot) || place_meeting(x, y, oLightPlot))
		{
			//we are on a square, and have our item.
			//Get current square.
			var inst = instance_place(floor(x), floor(y), oDarkPlot)
		
			if(inst == noone)
			{
				inst = instance_place(floor(x),floor(y), oLightPlot)
			}
		
			inventory.owner = -1
			inventory.x = inst.x + inst.sprite_width / 2
			inventory.y = inst.y + inst.sprite_height / 2
			inventory = -1
		}
	}
}

//picks up a non-shop item
else if (place_meeting(x,y,oInteractable) && gamepad_button_check_pressed(controllerID, gp_face1)){
	if (inventory==-1)// hand is empty
	{
		var inst = instance_place(x,y,oInteractable)
		inst.owner = id;
		inventory = inst;
	}else {
		var inst = instance_place(x,y,oInteractable)
		if (inst != inventory){
			alertMessage="You already have an item!"
		}
		
	}
}

// picks up from shop
if (place_meeting(x,y,oShopItem) && gamepad_button_check_pressed(controllerID, gp_face1)){
	if (inventory==-1)// hand is empty
	{
		var shopItem = instance_place(x,y,oShopItem);
	
		if (availableCurrency >= shopItem.price){
			availableCurrency -= shopItem.price;
			var inst = instance_create_depth(x,y,0,shopItem.item)
			inst.owner = id;
			inventory = inst;
		}else{
			alertMessage = "Not enough money!"
		}
	}else{
		alertMessage="You already have an item!"
	}
	
	
}



if (inventory != -1 &&  gamepad_button_check_pressed(controllerID, gp_face3)) {
	inventory.owner = -1;
	inventory = -1;
}


//Money stuff

currencyUpdate -= delta_time / 1000000

if(currencyUpdate < 0)
{
	availableCurrency++;
	currencyUpdate += currencyRate;
}
if (alertMessage != "" && alert==-1){
	var alert_x = x+alert_offset_x
	var alert_y = y+alert_offset_y
	var inst = instance_create_depth(alert_x,alert_y,0,oAlert)
	inst.anchor_x = alert_x
	inst.anchor_y = alert_y
	inst.owner = id;
	inst.msg = alertMessage
	alert= inst;
	alertMessage = ""
}else if(alertMessage != "" && alert!=-1){
	instance_destroy(alert);
	var alert_x = x+alert_offset_x
	var alert_y = y+alert_offset_y
	var inst = instance_create_depth(alert_x,alert_y,0,oAlert)
	inst.anchor_x = alert_x
	inst.anchor_y = alert_y
	inst.owner = id;
	inst.msg = alertMessage
	alert= inst;
	alertMessage = ""
}

