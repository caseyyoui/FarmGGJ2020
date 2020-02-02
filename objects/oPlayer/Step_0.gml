/// @description Insert description here
// You can write your code in this editor
depth=-y

if(stunTimer >= 0)
{
	stunTimer += delta_time / 1000000;
	if(stunTimer > 1.0)
		stunTimer = -1;

	return;
}

var dx = gamepad_axis_value(controllerID, gp_axislh);
var dy = gamepad_axis_value(controllerID, gp_axislv);

//temporary:
if (keyboard_check_pressed(vk_left)){
	x -= movementSpeed*5;
}
if (keyboard_check_pressed(vk_right)){
	x += movementSpeed*5;
}
if (keyboard_check_pressed(vk_up)){
	y -= movementSpeed*5;
}
if (keyboard_check_pressed(vk_down)){
	y += movementSpeed*5;
}
adx = gamepad_axis_value(controllerID, gp_axisrh);
ady = gamepad_axis_value(controllerID, gp_axisrv);

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
px = x;
x += dx * movementSpeed;
y += dy * movementSpeed;

if(controllerID == 0 && x > 484)
	x = px;
else if (controllerID == 1 && x < 484)
	x = px;

if (alert>-1){
	alert.anchor_x = x+alert_offset_x
	alert.anchor_y = y+alert_offset_y
}
if (inventory !=-1){
	if (inventory.name == "Bucket"){
		if (place_meeting(inventory.x, inventory.y, oWell)&& gamepad_button_check_pressed(controllerID, gp_face1)){
			inventory.filled = true
		} 
		
	}
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


else if (place_meeting(x,y,oInteractable)
&& (keyboard_check_pressed(vk_enter) || gamepad_button_check_pressed(controllerID, gp_face1))){
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
if (place_meeting(x,y,oShopItem) && (keyboard_check_pressed(vk_enter) || gamepad_button_check_pressed(controllerID, gp_face1))){
	if (inventory==-1)// hand is empty
	{
		var shopItem = instance_place(x,y,oShopItem);

		if (availableCurrency >= shopItem.price){
			if (shopItem.limit != -1){
				if (shopItem.numLeft > 0){
					availableCurrency -= shopItem.price;
					var inst = instance_create_depth(x,y,0,shopItem.item)
					inst.owner = id;
					inventory = inst;
					inst.spawnRef = shopItem;
					shopItem.numLeft--;
				}
			}else{
				availableCurrency -= shopItem.price;
					var inst = instance_create_depth(x,y,0,shopItem.item)
					inst.owner = id;
					inventory = inst;
					inst.spawnRef = shopItem;
			}
			
		}else{
			alertMessage = "Not enough money!"
		}
	}else{
		alertMessage="You already have an item!"
	}
}

// throwing
var throwPower = sqrt(adx*adx + ady*ady) ;
if (inventory != -1 && gamepad_button_check_pressed(controllerID, gp_shoulderrb) && throwPower > .25)
{
	inventory.xvel = adx * 30;
	inventory.yvel = ady * 30;
	inventory.thrown = true;
	inventory.owner = -1;
	inventory = -1;
}

// dropping
if (inventory != -1 &&  (keyboard_check_pressed(vk_backspace) || gamepad_button_check_pressed(controllerID, gp_face3))) {
	inventory.dropped = true;
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
