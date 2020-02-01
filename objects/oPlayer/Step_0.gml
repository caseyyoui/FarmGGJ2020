/// @description Insert description here
// You can write your code in this editor
depth=-y
var dx = gamepad_axis_value(controllerID, gp_axislh);
var dy = gamepad_axis_value(controllerID, gp_axislv);

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

x += dx;
y += dy;

if (place_meeting(x,y,oInteractable) && gamepad_button_check_pressed(controllerID, gp_face1)){
	var inst = instance_place(x,y,oInteractable)
	inst.owner = id;
	inventory = inst;
}

if (inventory != -1 &&  gamepad_button_check_pressed(controllerID, gp_face3)) {
	inventory.owner = -1;
	inventory = -1;
}

