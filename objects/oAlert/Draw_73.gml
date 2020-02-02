/// @description Insert description here
// You can write your code in this editor
if (anchor_x == -1 || anchor_y == -1)
{
	instance_destroy();
}
x = anchor_x
y = anchor_y

var your_string = msg;
draw_text(x - (string_width(your_string) / 2),y - (sprite_height / 2) - (string_height(your_string) / 2),your_string);