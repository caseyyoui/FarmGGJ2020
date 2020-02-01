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

if (place_meeting(x,y,oInteractable) && gamepad_button_check_pressed(controllerID, gp_face1)){
	var inst = instance_place(x,y,oInteractable)
	inst.owner = id;
	inventory = inst;
}
else if (place_meeting(x,y,oShopItem) && gamepad_button_check_pressed(controllerID, gp_face1)){
	var shopItem = instance_place(x,y,oShopItem);
	var currency = 0;
	if (currency >= shopItem.price){
		var inst = instance_create_depth(x,y,0,shopItem.item)
		inst.owner = id;
		inventory = inst;
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


